#define _GNU_SOURCE
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <limits.h>
#include <dirent.h>
#include <sys/stat.h>
#include <unistd.h>
#include <errno.h>
#include <libgen.h>
#include <termios.h>
#include <signal.h>
#include <sys/ioctl.h>

#include "color.h"

#ifndef VERSION
#define VERSION "unknown"
#endif

#define MAX_PATH_LEN (PATH_MAX + 256)

// --- Used colors ---
// #define COLOR foreground background style
#define CTITLE FG_CYAN BG_DEFAULT STYLE_BOLD
#define CSUBTITLE FG_GREEN BG_DEFAULT STYLE_ITALIC
#define CNUMBER FG_YELLOW BG_DEFAULT STYLE_BOLD
#define CSELECTED FG_BLACK BG_BLUE STYLE_BOLD
#define CNORMAL FG_DEFAULT BG_DEFAULT STYLE_NORMAL

// --- Configs ---
// TO DO: change SessionGifs to CaelestiaGifs/sessiongifs
char* alloc_concat(const char **strings, size_t n);
char *GIF_DIR;
char *THUMB_CACHE_DIR;
char *THUMB_SESSION_DIR;
char *CURRENT_DIR;
static void init_paths() {
    const char *caelestia_gifs_folder = getenv("CAELESTIA_GIFS_FOLDER");
    const char *HOME = getenv("HOME");
    //const char *root = caelestia_gifs_folder ? caelestia_gifs_folder : snprintf(NULL, "%s/Pictures", HOME);
    
    const char *sessiongifs_folder;
    if (caelestia_gifs_folder) {
        sessiongifs_folder = caelestia_gifs_folder;
    } else {
        char *default_path = malloc(MAX_PATH_LEN);
        snprintf(default_path, MAX_PATH_LEN, "%s/Pictures", HOME);
        sessiongifs_folder = default_path;
    }

    //printf("Using GIF root directory: %s\n", sessiongifs_folder);

    const char *gifdirparts[] = {sessiongifs_folder,"/CaelestiaGifs/sessionGif"};
    const char *currentdirparts[] = {sessiongifs_folder,"/CaelestiaGifs/sessionGif/current"};
    const char *thumbcacheparts[] = {HOME,"/.cache/caelestia_gifs_thumb"};
    const char *thumbsessionparts[] = {HOME,"/.cache/caelestia_gifs_thumb/sessionGif"};

    GIF_DIR = alloc_concat(gifdirparts, sizeof(gifdirparts)/sizeof(gifdirparts[0]));
    CURRENT_DIR = alloc_concat(currentdirparts, sizeof(currentdirparts)/sizeof(currentdirparts[0]));
    THUMB_CACHE_DIR = alloc_concat(thumbcacheparts, sizeof(thumbcacheparts)/sizeof(thumbcacheparts[0]));
    THUMB_SESSION_DIR = alloc_concat(thumbsessionparts, sizeof(thumbsessionparts)/sizeof(thumbsessionparts[0]));

}
const int THUMB_SIZE = 48;

// --- Globals ---
int has_magick = 0;
volatile int is_kitty = 0;


// --- Utils ---
/**
 * @brief Allocate and concatenate an array of strings
 *
 * @param strings Array of strings to concatenate
 * @param n Number of strings
 * @return char* Concatenated string (must be freed by caller)
 */
char* alloc_concat(const char **strings, size_t n) {
    size_t total_len = 1; // for '\0'
    for (size_t i = 0; i < n; i++) {
        total_len += strlen(strings[i]);
    }
    if (total_len == 0) {
        char *buffer = malloc(1);
        if (buffer) buffer[0] = '\0';
        return buffer;
    }
    char *buffer = malloc(total_len);
    if (!buffer) return NULL;

    buffer[0] = '\0';
    for (size_t i = 0; i < n; i++) {
        strcat(buffer, strings[i]);
    }
    return buffer;
}

/**
 * @brief Ensure that a directory exists, create it if it doesn't.
 *
 * @param path The path to the directory.
 * @return int 0 on success, -1 on failure.
 */
static int ensure_dir(const char *path) {
    struct stat st;
    if (stat(path, &st) == 0) return S_ISDIR(st.st_mode) ? 0 : -1;
    return mkdir(path, 0700);
}

/**
 * @brief Check existence of executable
 *
 * @param name Command name to check
 * @return int 1 if exists, 0 if not
 */
static int has_cmd(const char *name) {
    char cmd[MAX_PATH_LEN];
    snprintf(cmd, sizeof(cmd), "command -v %s >/dev/null 2>&1", name);
    return system(cmd) == 0;
}

/**
 * @brief Run a shell command and return exit status
 *
 * @param cmd Command to run
 * @return int Exit status of command
 */
static int run_cmd(const char *cmd) {
    int rc = system(cmd);
    if(rc == -1) return -1;
    return WEXITSTATUS(rc);
}

static int is_term_kitty() {
    const char *term = getenv("TERM");
    if (term && strstr(term, "kitty")) return 1;
    return 0;
}

/**
 * @brief Build thumbnail pathname from gif path
 *
 * @param gifpath Path to the original gif
 * @param out Output buffer for thumbnail path
 * @param outlen Length of output buffer
 * @return void
 */
static char* thumb_path_for(const char *gifpath) {
    const char *base = strrchr(gifpath,'/');
    if (base) base++; else base=gifpath;

    const char *parts[] = {THUMB_SESSION_DIR,"/",base};
    return alloc_concat(parts, sizeof(parts)/sizeof(parts[0]));
}

// --- Thumbnail generation ---
/**
 * @brief Generate missing thumbnails (blocking), only when magick is available 
 * @param clean_thumbs If set, remove existing thumbnails before generating new ones
 */
static void generate_thumbnails(int clean_thumbs) {
    if (ensure_dir(THUMB_CACHE_DIR)!=0 && ensure_dir(THUMB_SESSION_DIR)) {
        fprintf(stderr,"Warning: cannot create thumb dir %s: %s\n",THUMB_SESSION_DIR,strerror(errno));
        return;
    }
    if (clean_thumbs) {
        char cmd[MAX_PATH_LEN*2];
        snprintf(cmd, sizeof(cmd), "rm -f \"%s\"/*.gif 2>/dev/null || true", THUMB_SESSION_DIR);
        run_cmd(cmd);
    } 

    DIR *d = opendir(GIF_DIR);
    if (!d) return;
    struct dirent *ent;
    while ((ent = readdir(d))) {
        if (ent->d_type!=DT_REG && ent->d_type!=DT_UNKNOWN) continue;
        const char *name=ent->d_name;
        size_t len=strlen(name);
        if (len<5 || strcasecmp(name+len-4,".gif")!=0) continue;

        const char *gifparts[] = {GIF_DIR,"/",name};
        char *gifpath = alloc_concat(gifparts, sizeof(gifparts)/sizeof(gifparts[0]));
        const char *thumbparts[] = {THUMB_SESSION_DIR,"/",name};
        char *thumbpath = alloc_concat(thumbparts, sizeof(thumbparts)/sizeof(thumbparts[0])); 
        thumb_path_for(gifpath);
        if (!gifpath || !thumbpath) {
            fprintf(stderr, "Error allocating memory for paths\n");
            free(gifpath);
            free(thumbpath);
            closedir(d);
            continue;
        }

        struct stat st;
        if (stat(thumbpath,&st)==0) {
            struct stat ssrc;
            if (stat(gifpath,&ssrc)==0 && ssrc.st_mtime>st.st_mtime) {
                if (has_magick) {
                    // convert size of thumbs (int) to char, so it can be used in cmd
                    char thumb_size_str[16];
                    snprintf(thumb_size_str, sizeof(thumb_size_str), "%d", THUMB_SIZE);

                    const char *parts[] = {
                        "magick \"",gifpath,
                        "\" -coalesce -resize ",thumb_size_str,"x",thumb_size_str,"\" \"",
                        thumbpath,"\" >/dev/null 2>&1"
                    };
                    char *cmd = alloc_concat(parts, sizeof(parts)/sizeof(parts[0]));
                    if (!cmd) {
                        fprintf(stderr, "Error allocating memory for command\n");
                        closedir(d);
                        continue;
                    }
                    run_cmd(cmd);
                    printf("Regenerated thumbnail for %s\n",basename((char*)gifpath));
                    free(cmd);
                }
            }
        } else if (access(thumbpath,F_OK)!=0) {
            if (has_magick) {
                char cmd[MAX_PATH_LEN*3];
                snprintf(cmd,sizeof(cmd),"magick \"%s\" -coalesce -resize %dx%d \"%s\" >/dev/null 2>&1",
                    gifpath,THUMB_SIZE,THUMB_SIZE,thumbpath);
                run_cmd(cmd);
                printf("Generated thumbnail for %s\n",basename((char*)gifpath));
            }
        }
        free(gifpath);
        free(thumbpath);
    }
    closedir(d);

    // Remove orphan thumbs
    DIR *td = opendir(THUMB_SESSION_DIR);
    if (!td) return;
    while ((ent=readdir(td))) {
        if (ent->d_name[0]=='.') continue;
        size_t len=strlen(ent->d_name);
        if (len<5 || strcasecmp(ent->d_name+len-4,".gif")!=0) continue;

        const char *src_parts[] = {GIF_DIR,"/",ent->d_name};
        char *srcpath = alloc_concat(src_parts, sizeof(src_parts)/sizeof(src_parts[0]));
        if (!srcpath) {
            fprintf(stderr, "Error allocating memory for source path\n");
            closedir(td);
            continue;
        }

        if (access(srcpath, F_OK) != 0) {
            const char *tpath_parts[] = {THUMB_SESSION_DIR,"/",ent->d_name};
            char *tpath = alloc_concat(tpath_parts, sizeof(tpath_parts)/sizeof(tpath_parts[0]));
            if (!tpath) {
                fprintf(stderr, "Error allocating memory for thumb path\n");
                free(srcpath);
                closedir(td);
                continue;
            }
            unlink(tpath);
            printf("Removed orphan thumbnail %s\n",basename(tpath));
            free(tpath);
        }
        free(srcpath);
    }
    closedir(td);
}

// --- Scan directory ---
/**
 * @brief Scan directory for GIFs (return count and fill list). Caller must free list entries.
 *
 * @param dir Directory to scan
 * @param out_list Output list of GIF paths (allocated)
 * @return int Number of GIFs found
 */
static int scan_gifs(const char *dir, char ***out_list) {
    //printf("Scanning directory: %s\n", dir);
    DIR *d = opendir(dir);
    if (!d) { *out_list=NULL; return 0; }
    struct dirent *ent; char **list=NULL; size_t cap=0,n=0;
    while ((ent=readdir(d))) {
        if (ent->d_type!=DT_REG && ent->d_type!=DT_UNKNOWN) continue;
        const char *name=ent->d_name; size_t len=strlen(name);
        if (len<5 || strcasecmp(name+len-4,".gif")!=0) continue;
        if (n+1>cap) { cap=cap?cap*2:32; list=realloc(list,cap*sizeof(char*)); }
        char *fullpath=malloc(MAX_PATH_LEN);
        snprintf(fullpath,MAX_PATH_LEN,"%s/%s",dir,name); list[n++]=fullpath;
    }
    closedir(d); *out_list=list; return (int)n;
}

// --- Kitty display ---
/**
 * @brief Show image in terminal using Kitty graphics protocol
 *
 * @param path Path to the image file
 */
static void show_image_with_kitty(const char *path, int x, int y) {
    char cmd[MAX_PATH_LEN*2];
    snprintf(cmd,sizeof(cmd),"kitty +kitten icat --no-trailing-newline --silent --place 0x0@%dx%d \"%s\"",x,y,path);
    run_cmd(cmd);
}

/*
 * @brief Apply the selected GIF as the current session GIF and refresh Caelestia
 *
 * @param gifpath Path to the selected GIF
 * @param current_dir Path to the current GIF directory
 * @return void
 */
static void apply_gif(const char *gifpath, const char *current_dir) {
    char current_gif[MAX_PATH_LEN];
    snprintf(current_gif, sizeof(current_gif), "%s/current.gif", current_dir);

    // delete existing current gif
    unlink(current_gif);

    // copy selected gif to current
    char cmd[MAX_PATH_LEN * 2];
    snprintf(cmd, sizeof(cmd), "cp \"%s\" \"%s\"", gifpath, current_gif);
    run_cmd(cmd);

    // refresh Caelestia (assuming caelestia command is available)
    if (has_cmd("caelestia")) {
        run_cmd("caelestia shell -k");
        usleep(500000); // wait 0.5s to allow Caelestia to pick up change
        run_cmd("caelestia shell -d >/dev/null 2>&1");
    }
}

static void open_gif(const char *gifname) {
    char gifpath[MAX_PATH_LEN];
    snprintf(gifpath, sizeof(gifpath), "%s/%s", GIF_DIR, gifname);
    char cmd[MAX_PATH_LEN * 2];
    snprintf(cmd, sizeof(cmd), "xdg-open \"%s\" >/dev/null 2>&1 &", gifpath);
    system(cmd);
}

// --- Terminal input (without ncurses) ---
/**
 * @brief Get a single character from terminal without echo
 *
 * @return int The character read
 */
static int getch(void) {
    struct termios oldt,newt; int ch;
    tcgetattr(STDIN_FILENO,&oldt);
    newt=oldt; newt.c_lflag&=~(ICANON|ECHO);
    tcsetattr(STDIN_FILENO,TCSANOW,&newt);
    ch=getchar(); tcsetattr(STDIN_FILENO,TCSANOW,&oldt);
    return ch;
}


// Signals
/**
 * @brief Cleanup function on exit
 *
 * @param signo Signal number
 */
void cleanup() {
    //(void)signo;
    if (is_kitty) run_cmd("kitty +kitten icat --clear");
    system("tput rmcup"); // restore screen
    struct termios t;
    tcgetattr(STDIN_FILENO, &t);
    t.c_lflag |= (ICANON | ECHO);
    tcsetattr(STDIN_FILENO, TCSANOW, &t);
    printf("\033[?25h"); // show cursor
    fflush(stdout);
    exit(0);
}

// --- Helps functions ---
void print_version() {
    printf("caelestia-gif version %s\n", VERSION);
}
void print_help_main() {
    printf("usage: caelestia-gif [-h] [-v] COMMAND ...\n");
    printf("\n");
    printf("Main control script for Caelestia GIFs\n");
    printf("\n");
    printf("options:\n");
    printf("  -h, --help     show this help message and exit\n");
    printf("  -v, --version  print the current version\n");
    printf("\n");
    printf("subcommands:\n");
    printf("  valid commands\n");
    printf("\n");
    printf("COMMAND          the subcommand to run\n");
    printf("session          run in session mode (to change sessionGif)\n");
    //printf("media            run in media mode (to change mediaGif)\n");
    printf("media            NOT IMPLEMENTED YET\n");
    printf("cli              NOT IMPLEMENTED YET\n");
}

void print_help_session() {
    printf("usage: caelestia-gif session [-h] [-r]\n");
    printf("\n");
    printf("options:\n");
    printf("  -h, --help        show this help message and exit\n");
    printf("  -r, --regenerate  regenerate all thumbnails\n");
}

void print_help_media() {
    printf("usage: caelestia-gif media [-h] [-r]\n");
    printf("\n");
    printf("options:\n");
    printf("  -h, --help        show this help message and exit\n");
    printf("  -r, --regenerate  regenerate all thumbnails\n");
}

// --- Main selection UI ---
int main(int argc,char *argv[]) {

    // Parse args
    int regenerate=0;
    int session=0;
    int media=0;
    if (argc==1) {
        print_help_main();
        return 0;
    }
    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i],"--help")==0 || strcmp(argv[i],"-h")==0) {
            print_help_main();
            return 0;
        } else if (strcmp(argv[i],"--version")==0 || strcmp(argv[i],"-v")==0) {
            print_version();
            return 0;
        } else if (strcmp(argv[i],"session")==0) {
            session=1;
            for (int j = i + 1; j < argc; j++) {
                if (strcmp(argv[j], "-h")==0 || strcmp(argv[j], "--help")==0) {
                    print_help_session();
                    return 0;
                } else if (strcmp(argv[j], "-r")==0 || strcmp(argv[j], "--regenerate")==0) {
                    regenerate=1;
                } else {
                    fprintf(stderr, "Unknown argument for session mode: %s\n", argv[j]);
                    return 1;
                }
            }
        } else if (strcmp(argv[i],"media")==0) {
            media=0;
            for (int j = i + 1; j < argc; j++) {
                if (strcmp(argv[j], "-h")==0 || strcmp(argv[j], "--help")==0) {
                    print_help_media();
                    return 0;
                } else if (strcmp(argv[j], "-r")==0 || strcmp(argv[j], "--regenerate")==0) {
                    regenerate=1;
                } else {
                    fprintf(stderr, "Unknown argument for media mode: %s\n", argv[j]);
                    return 1;
                }
                fprintf(stderr, "Error: media mode not implemented yet.\n");
                return 1;
            }
        } else if (strcmp(argv[i], "cli")==0) {
            // future CLI mode
            // TODO: Think about CLI mode implementation (arguments, options, etc.)
            fprintf(stderr, "Error: CLI mode not implemented yet.\n");
            return 1;
        }
    }

    if (session && media) {
        fprintf(stderr, "Error: Cannot use both session and media modes simultaneously.\n");
        return 1;
    }


    const char *HOME=getenv("HOME"); if (!HOME) { fprintf(stderr,"$HOME not set\n"); return 1; }

    init_paths();

    // add more lines if you want, it will adjust dynamically (if it works)
    const char *header_lines[] = {
        CTITLE "Available GIFs:" CNORMAL,
        CSUBTITLE "Use Up/Down to navigate, Enter to select, o to open the selected file, q to quit." CNORMAL
    };
    int n_header_lines = sizeof(header_lines) / sizeof(header_lines[0]);
    int margin = 1;

    struct winsize ws;
    ioctl(STDOUT_FILENO, TIOCGWINSZ, &ws);
    int term_rows = ws.ws_row;
    //int term_cols = ws.ws_col;




    has_magick=has_cmd("magick");
    is_kitty=is_term_kitty();

    atexit(cleanup);
    signal(SIGINT,cleanup);
    signal(SIGTERM,cleanup);



    // Ensure directories exist
    ensure_dir(CURRENT_DIR); 
    ensure_dir(GIF_DIR); 
    if (is_kitty){
        // if kitty isn't available, it's useless to create thumb dirs
        // so if the script is executed in kitty, the thumb dirs have to be present
        // TODO: change system mkdir -p call to a recursive ensure_dir function
        char command[1024];
        snprintf(command, sizeof(command), "mkdir -p \"%s\"", THUMB_SESSION_DIR);
        run_cmd(command);
        ensure_dir(THUMB_CACHE_DIR); 
        ensure_dir(THUMB_SESSION_DIR);
    }

    // thumbnail generation (only if kitty is used)
    generate_thumbnails(regenerate);

    char **thumbs=NULL; char **gifs=NULL;
    int nthumbs=scan_gifs(THUMB_SESSION_DIR,&thumbs);
    int ngifs=scan_gifs(GIF_DIR,&gifs);
    if (ngifs==0) { 
        fprintf(stderr,"No GIFs found\n");
        printf("Please add GIF files to the directory: %s\n",GIF_DIR);
        return 1; 
    }


    // TODO: si nthumbs==0 && is_kitty, generate thumbs for all gifs

    //if (is_kitty) {
    //    for (int i=0;i<nthumbs;i++) {
    //        show_image_with_kitty(thumbs[i],margin+2,i*3+n_header_lines+1);
    //    }
    //}

    //int max_lines = term_rows - n_header_lines - margin - 1;
    
    const char *term = getenv("TERM");
    if (term && strcmp(term, "xterm-kitty") == 0) {
        if (system("infocmp xterm-kitty >/dev/null 2>&1") != 0) {
            setenv("TERM", "xterm-256color", 1);
            term = "xterm-256color";
        }
    }

    system("tput smcup"); // save screen
    printf("tput called smcup (normally)\n");
    printf("\033[?25l"); // hide cursor
    fflush(stdout);


    if (session) {
        int sel=0;
        int prev_sel = 0;
        int top = 0;
        int prev_top = -1;
        int need_full_redraw = 1;

        const int LINES_PER_ITEM = is_kitty ? 4 : 2;
        int available_rows = term_rows - n_header_lines - margin - 2;
        int max_lines = available_rows / LINES_PER_ITEM;

        char **display_list = nthumbs ? thumbs : gifs;
        int display_count = nthumbs ? nthumbs : ngifs;

        while (1) {
            //int old_top = top; 

            int current_page = sel / max_lines;
            int new_top = current_page * max_lines;

            if (is_kitty && new_top + max_lines > display_count) {
                new_top = nthumbs - max_lines;
                if (new_top < 0) new_top = 0;
            } 

            top = new_top;

            int viewport_changed = (top != prev_top);
            int only_selection_changed = !viewport_changed;

            if (viewport_changed || need_full_redraw) {
                // Clear screen
                printf("\033[2J\033[H");
                fflush(stdout);

                if (is_kitty) run_cmd("kitty +kitten icat --clear");
        
                int current_row = margin + 1;
                for (int l = 0; l < n_header_lines; l++) {
                    printf("\033[%d;1H", current_row++);
                    for (int m = 0; m < margin; m++) printf(" ");
                    printf("%s\n", header_lines[l]);
                }

                int items_start_row = current_row + 2;

                int visible_count = 0;
                for (int i = top; i < display_count && visible_count < max_lines; i++, visible_count++) {
                    const char *base = strrchr(display_list[i], '/');
                    if (base) base++; else base = display_list[i];

                    int item_base_row = items_start_row + (visible_count * LINES_PER_ITEM);
    
                    if (is_kitty) {
                        show_image_with_kitty(display_list[i], margin + 5, item_base_row - 1);
                    }

                    int text_row = item_base_row + (is_kitty ? 1 : 0);
                    printf("\033[%d;1H", text_row);

                    if (i == sel) {
                        printf(" > ");
                        printf(CNUMBER "%d" CNORMAL, i+1);
                        if (!is_kitty) printf(" ");
                    } else {
                        printf("   ");
                        printf("%d", i+1);
                        if (!is_kitty) printf(" ");
                    }

                    if (is_kitty) {
                        printf("         ");
                        if (i == sel) printf(CSELECTED); else printf(CNORMAL);
                        printf("%s", base);
                    } else {
                        if (i == sel) printf(CSELECTED); else printf(CNORMAL);
                        printf("%s", base);
                    }
                    printf(CNORMAL);
                }
                prev_top = top;
                need_full_redraw = 0;

            
            } else if (only_selection_changed) {
                int items_start_row = margin + n_header_lines + 3;

                if (prev_sel >= top && prev_sel < top + max_lines) {
                    int text_row = items_start_row + ((prev_sel - top) * LINES_PER_ITEM) + (is_kitty ? 1 : 0);
                    printf("\033[%d;1H\033[K", text_row);
            
                    const char *base = strrchr(display_list[prev_sel], '/');
                    if (base) base++; else base = display_list[prev_sel];
            
                    printf("   " CNORMAL "%d", prev_sel + 1);
                    if (is_kitty) printf("         ");
                    else printf(" ");
                    printf(CNORMAL "%s", base);
                }

                // Dessiner le nouveau curseur
                if (sel >= top && sel < top + max_lines) {
                    int text_row = items_start_row + ((sel - top) * LINES_PER_ITEM) + (is_kitty ? 1 : 0);
                    printf("\033[%d;1H\033[K", text_row);
            
                    const char *base = strrchr(display_list[sel], '/');
                    if (base) base++; else base = display_list[sel];
            
                    printf(" > " CNUMBER "%d" CNORMAL, sel + 1);
                    if (is_kitty) printf("         ");
                    else printf(" ");
                    printf(CSELECTED "%s" CNORMAL, base);
                }
            }
        
     

            fflush(stdout);

            prev_sel = sel;

            // Input handling
            int c = getch();
            if (c == 'q') break;
            else if (c == 27) {
                int c2 = getch();
                if (c2 == '[') {
                    int c3 = getch();
                    if (c3 == 'A' && sel > 0) sel--;
                    else if (c3 == 'B' && sel < display_count - 1) sel++;
                }
            } else if (c == 'o') {
                char command[1024];
                //snprintf(command, sizeof(command), "xdg-open \"%s\" >/dev/null 2>&1 &", gifs[sel]);
                //printf("%s\n", command);
                open_gif(gifs[sel]);
                system(command);
            } else if (c == '\n' || c == '\r') {
                apply_gif(gifs[sel], CURRENT_DIR);
                break;
            }
        }
        //free(display_list);
    }

    printf("\033[?25h"); // show cursor
    fflush(stdout);
    if (is_kitty) {
        printf("CALLED????");
        run_cmd("kitty +kitten icat --clear");
    }
    system("tput rmcup"); // restore screen
    //printf("tput called rmcup (normally)\n");

    for (int i=0;i<nthumbs;i++) free(thumbs[i]);
    for (int i=0;i<ngifs;i++) free(gifs[i]);
    free(thumbs); free(gifs);
    return 0;
}


