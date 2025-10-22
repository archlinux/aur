#define _GNU_SOURCE
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <limits.h>
#include <dirent.h>
#include <sys/stat.h>
#include <unistd.h>
#include <ncurses.h>
#include <errno.h>
#include <libgen.h>
#include <fcntl.h>
#include <sys/types.h>

// Configs, you can change these
const char *GIF_DIR_DEFAULT = "/Pictures/SessionGifs"; // Default directory (~/Pictures/SessionGifs)
const char *THUMB_DIR_DEFAULT = "/.cache/sessiongif_thumbs"; // Default thumbnail cache directory (in home)
const char *CURRENT_DIR_DEFAULT = "/Pictures/SessionGifs/current"; // Default current GIF directory
const int THUMB_SIZE = 48; // Thumbnail size
const int COL_GAP = 4; // Gap between columns

// Globals
char GIF_DIR[PATH_MAX];
char THUMB_DIR[PATH_MAX];
char CURRENT_DIR[PATH_MAX];
char CURRENT_GIF[PATH_MAX];
int has_magick = 0;
int is_kitty = 0;

// Functions
/**
 * @brief Ensure that a directory exists, create it if it doesn't.
 *
 * @param path The path to the directory.
 * @return int 0 on success, -1 on failure.
 */
static int ensure_dir(const char *path) {
    struct stat st;
    if (stat(path, &st) == 0) {
        if (S_ISDIR(st.st_mode)) return 0;
        errno = ENOTDIR;
        return -1;
    }
    if (mkdir(path, 0700) == 0) return 0;
    return -1;
}

/**
 * @brief Function to copy files (for setting current)
 *
 * @param src Source file path
 * @param dst Destination file path
 * @return int 0 on success, -1 on failure
 */
static int copy_file(const char *src, const char *dst) {
    FILE *fsrc = fopen(src, "rb");
    if (!src) return -1;
    FILE *fdst = fopen(dst, "wb");
    if (!dst) {
        fclose(fsrc);
        return -1;
    }
    char buf[8192];
    size_t r;
    while ((r = fread(buf, 1, sizeof(buf), fsrc)) > 0) {
        if (fwrite(buf, 1, r, fdst) != r) {
            fclose(fsrc);
            fclose(fdst);
            return -1;
        }
    }
    fclose(fsrc);
    fclose(fdst);
    return 0;
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

/**
 * @brief Check existence of executable
 *
 * @param name Command name to check
 * @return int 1 if exists, 0 if not
 */
static int has_cmd(const char *name) {
    char cmd[PATH_MAX];
    snprintf(cmd, sizeof(cmd), "command -v %s >/dev/null 2>&1", name);
    return (system(cmd) == 0);
}

/**
 * @brief Build thumbnail pathname from gif path
 *
 * @param gifpath Path to the original gif
 * @param out Output buffer for thumbnail path
 * @param outlen Length of output buffer
 * @return void
 */
static void thumb_path_for(const char *gifpath, char *out, size_t outlen) {
    const char *base = strrchr(gifpath, '/');
    if (base) base++;
    else base = gifpath;
    snprintf(out, outlen, "%s/%s", THUMB_DIR, base);
}

/**
 * @brief Generate missing thumbnails (blocking), only when magick is available 
 * @param clean_thumbs If set, remove existing thumbnails before generating new ones
 */
static void generate_thumbnails(int clean_thumbs) {
    // ensure dirs exist
    if (ensure_dir(THUMB_DIR) != 0) {
        fprintf(stderr, "Warning: cannont create thumb dir %s: %s\n", THUMB_DIR, strerror(errno));
        return;
    }
    if (clean_thumbs) {
        char pattern[PATH_MAX];
        snprintf(pattern, sizeof(pattern), "%s/*.gif", THUMB_DIR);
        // simple glob via system call to rm
        char cmd[PATH_MAX * 2];
        snprintf(cmd, sizeof(cmd), "rm -f %s/*.gif 2>/dev/null || true", THUMB_DIR);
        system(cmd);
    }

    // iterate GIF_DIR
    DIR *d = opendir(GIF_DIR);
    if (!d) return;
    struct dirent *ent;
    while ((ent = readdir(d))) {
        if (ent->d_type == DT_REG || ent->d_type == DT_UNKNOWN) {
            const char *name = ent->d_name;
            size_t len = strlen(name);
            if (len > 4 && strcasecmp(name + len - 4, ".gif") == 0) {
                char gifpath[PATH_MAX];
                snprintf(gifpath, sizeof(gifpath), "%s/%s", GIF_DIR, name);
                char thumbpath[PATH_MAX];
                thumb_path_for(gifpath, thumbpath, sizeof(thumbpath));
                struct stat st;
                if (stat(thumbpath, &st) == 0) {
                    // existing, skip if newer than source
                    struct stat ssrc;
                    if (stat(gifpath, &ssrc) == 0 && ssrc.st_mtime > st.st_mtime) {
                        // source is newer, regenerate
                        if (has_magick) {
                            char cmd[PATH_MAX * 3];
                            snprintf(cmd, sizeof(cmd),
                                    "magick \"%s\" -coalesce -resize %dx%d \"%s\" >/dev/null 2>&1",
                                    gifpath, THUMB_SIZE, THUMB_SIZE, thumbpath);
                            run_cmd(cmd);
                            printf("Regenerated thumbnail for %s (updated source)\n", basename((char *)gifpath));
                        } else {
                            fprintf(stderr, "Warning: cannot regenerate thumbnail for %s, ImageMagick not available\n", basename((char *)gifpath));
                        }
                    } else {
                        continue;
                    }
                } else {
                    // does not exist, generate
                    if (has_magick) {
                        char cmd[PATH_MAX * 3];
                        snprintf(cmd, sizeof(cmd),
                                "magick \"%s\" -coalesce -resize %dx%d \"%s\" >/dev/null 2>&1",
                                gifpath, THUMB_SIZE, THUMB_SIZE, thumbpath);
                        run_cmd(cmd);
                        printf("Generated thumbnail for %s\n", basename((char *)gifpath));
                    } else {
                        fprintf(stderr, "Warning: Skipping thumbnail for %s, ImageMagick not available\n", basename((char *)gifpath));
                    }
                }
            }
        }
        closedir(d);

        // Remove orphan thumbs (thumbs that no longer have source)
        DIR *td = opendir(THUMB_DIR);
        if (!td) return;
        while ((ent = readdir(td))) {
            const char *name = ent->d_name;
            if (name[0] == '.') continue;
            size_t len = strlen(name);
            if (len > 4 && strcasecmp(name + len - 4, ".gif") == 0) {
                char srcpath[PATH_MAX];
                snprintf(srcpath, sizeof(srcpath), "%s/%s", GIF_DIR, name);
                if (access(srcpath, F_OK) != 0) {
                    char tpath[PATH_MAX];
                    snprintf(tpath, sizeof(tpath), "%s/%s", THUMB_DIR, name);
                    unlink(tpath);
                }
            }
        }
        closedir(td);
    }
}

/**
 * @brief Scan directory for GIFs (return count and fill list). Caller must free list entries.
 *
 * @param dir Directory to scan
 * @param out_list Output list of GIF paths (allocated)
 * @return int Number of GIFs found
 */
static int scan_gifs(const char *dir, char ***out_list) {
    DIR *d = opendir(dir);
    if (!d) {
        *out_list = NULL;
        return 0;
    }
    struct dirent *ent;
    char **list = NULL;
    size_t cap = 0;
    size_t n = 0;
    while ((ent = readdir(d))) {
        if (ent->d_type == DT_REG || ent->d_type == DT_UNKNOWN) {
            const char *name = ent->d_name;
            size_t len = strlen(name);
            if (len > 4 && strcasecmp(name + len - 4, ".gif") == 0) {
                if (n+1 > cap) {
                    cap = cap ? cap*2 : 32;
                    list = realloc(list, cap * sizeof(char *));
                }
                char *fullpath = malloc(PATH_MAX);
                snprintf(fullpath, PATH_MAX, "%s/%s", dir, name);
                list[n++] = fullpath;
            }
        }
    }
    closedir(d);
    *out_list = list;
    return (int)n;
}

/**
 * @brief Show image in terminal using Kitty graphics protocol
 *
 * @param path Path to the image file
 */
static void show_image_with_kitty(const char *path) {
    // Ensure kitty exists, caller will ensure it

    // suspend ncurses
    endwin();
    // clear prior kitty images in terminal to avoid stacking
    char cmd[PATH_MAX * 2];
    // use --clear then show image (blocking). use --silent to reduce output.
    snprintf(cmd, sizeof(cmd), "kitty +kitten icat --silent \"%s\"", path);
    // system call is blocking until icat prints the image 
    run_cmd(cmd);
    // resume ncurses
    refresh();
    // redraw screen
}

static int run_ncurses_ui(char **thumbs, int nthumbs, char **gifs, int ngifs) {
    initscr();
    noecho();
    cbreak();
    keypad(stdscr, TRUE);
    curs_set(0);

    int rows, cols;
    getmaxyx(stdscr, rows, cols);

    int col_width = THUMB_SIZE / 2 + COL_GAP;
    if (col_width < 20) col_width = 20;
    int cols_per_row = cols / col_width;
    if (cols_per_row < 1) cols_per_row = 1;

    int selected = 0;
    int top = 0;

    while (1) {
        clear();
        mvprintw(0,0, "Available GIFs (%d). Use arrows to move, Enter to select, q to quit.", ngifs);
        // draw names in grid
        int i;
        int y = 2;
        for (i = 0; i < nthumbs; i++) {
            int col = i % cols_per_row;
            int row = 1 / cols_per_row;
            int x = col * col_width;
            y = 2 + row * 3;
            if (y >= rows - 2) break;
            // highlight selected
            if (i == selected) {
                attron(A_REVERSE);
            }
            const char *base = strrchr(thumbs[i], '/');
            if (base) base++;
            else base = thumbs[i];
            mvprintw(y, x, "[%2d] %s", i+1, base);
            if (i == selected) attroff(A_REVERSE);
        }
        refresh();

        // show thumbnail of selected (suspend ncurses and call kitty)
        if (is_kitty) {
            show_image_with_kitty(thumbs[selected]);
        }

        int ch = getch();
        if (ch == 'q' || ch == 'Q' || ch == 27) break;
        else if (ch == KEY_LEFT || ch == 'h') {
            if (selected > 0) selected--;
        } else if (ch == KEY_RIGHT || ch == 'l') {
            if (selected +1 < nthumbs) selected++;
        } else if (ch == KEY_UP || ch == 'k') {
            if (selected - cols_per_row >= 0) selected -= cols_per_row;
        } else if (ch == KEY_DOWN || ch == 'j') {
            if (selected + cols_per_row < nthumbs) selected += cols_per_row;
        } else if (ch == '\n' || ch == KEY_ENTER) {
            // user selected: map thumbnail index to gif path. 
            // we assume ordering of thumbs and gifs same basenames
            // find matching gif in gifs[] for thumbs[selected]
            char *thumb = thumbs[selected];
            const char *bn = strrchr(thumb, '/');
            if (bn) bn++;
            else bn = thumb;
            int gif_idx = -1;
            for (i = 0; i < ngifs; i++) {
                const char *gbase = strrchr(gifs[i], '/');
                if (gbase) gbase++;
                else gbase = gifs[i];
                if (strcmp(bn, gbase) == 0) {
                    gif_idx = i;
                    break;
                }
            }
            if (gif_idx >= 0) {
                // copy gif to current
                char dst[PATH_MAX];
                snprintf(dst, sizeof(dst), "%s/current.gif", CURRENT_DIR);
                if (copy_file(gifs[gif_idx], dst) != 0) {
                    // error
                    endwin();
                    fprintf(stderr, "Error: failed to copy %s to %s: %s\n", gifs[gif_idx], dst, strerror(errno));
                    return -1;
            }
                // success
                if (is_kitty) {
                    show_image_with_kitty(dst);
                }

                // restore ncurses and exit with selected index
                endwin();
                return gif_idx;
            }
        }
    }

    endwin();
    return -1;
}

/*
 * @brief Apply the selected GIF as the current session GIF and refresh Caelestia
 *
 * @param gifpath Path to the selected GIF
 * @param current_dir Path to the current GIF directory
 * @return void
 */
static void apply_gif(const char *gifpath, const char *current_dir) {
    char current_gif[PATH_MAX];
    snprintf(current_gif, sizeof(current_gif), "%s/current.gif", current_dir);

    // delete existing current gif
    unlink(current_gif);

    // copy selected gif to current
    char cmd[PATH_MAX * 2];
    snprintf(cmd, sizeof(cmd), "cp \"%s\" \"%s\"", gifpath, current_gif);
    run_cmd(cmd);

    // refresh Caelestia (assuming caelestia command is available)
    if (has_cmd("caelestia")) {
        run_cmd("caelestia shell -k");
        usleep(500000); // wait 0.5s to allow Caelestia to pick up change
        run_cmd("caelestia shell -d >/dev/null 2>&1");
    }
}

int main(int argc, char *argv[]) {
    // setup defaults
    const char *HOME = getenv("HOME");
    if (!HOME) {
        fprintf(stderr, "Error: HOME environment variable not set.\n");
        return 1;
    }

    char gif_dir[PATH_MAX];
    char thumb_dir[PATH_MAX];
    char current_dir[PATH_MAX];
    snprintf(gif_dir, sizeof(gif_dir), "%s%s", HOME, GIF_DIR_DEFAULT);
    snprintf(thumb_dir, sizeof(thumb_dir), "%s%s", HOME, THUMB_DIR_DEFAULT);
    snprintf(current_dir, sizeof(current_dir), "%s%s", HOME, CURRENT_DIR_DEFAULT);

    int clean_thumbs = 0;
    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--clean-thumbs") == 0) {
            clean_thumbs = 1;
        }
    }

    has_magick = has_cmd("magick");
    is_kitty = has_cmd("kitty");

    // create dirs
    ensure_dir(current_dir);
    ensure_dir(gif_dir);
    ensure_dir(thumb_dir);

    // generate thumbs (blocking)
    generate_thumbnails(clean_thumbs);

    // scan thumbs and gifs
    char **thumbs = NULL;
    char **gifs = NULL;
    int nthumbs = scan_gifs(thumb_dir, &thumbs);
    int ngifs = scan_gifs(gif_dir, &gifs);

    if (nthumbs == 0 || ngifs == 0) {
        fprintf(stderr, "Error: No GIFs found in %s\n", gif_dir);
        return 1;
    }

    // run ncurses UI
    int sel = run_ncurses_ui(thumbs, nthumbs, gifs, ngifs);

    if (sel >= 0) {
        apply_gif(gifs[sel], current_dir);
        printf("Selected GIF applied: %s\n", gifs[sel]);
        return 0;
    } else {
        printf("No GIF selected.\n");
        return 1;
    }


    // cleanup
    for (int i = 0; i < nthumbs; i++) {
        free(thumbs[i]);
    }
    free(thumbs);
    for (int i = 0; i < ngifs; i++) {
        free(gifs[i]);
    }
    free(gifs);
}
