#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <ctype.h>
#include <libudev.h>
#include <libinput.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <dirent.h>
#include <SDL2/SDL.h>
#include <poll.h>
#include <time.h>
#include <libgen.h>

#define CONFIG_PATH_FMT "%s/.config/lscreensaver/config"
#define MAX_EXEMPTS    32
#define MAX_LINE      256

// Configurable globals
static int      inactivity_time = 600;    // normal mode idle timeout
static char   * exempts[MAX_EXEMPTS];
static int      exempt_count    = 0;

// Environment detection
static bool is_wayland   = false;
static bool is_tiling_wm = false;

// libinput context
static struct libinput *li = NULL;

// blank‐screen windows
static SDL_Window **wins     = NULL;
static int          win_count = 0;
static bool         blanked   = false;

// timing
static double t_last_activity = 0.0;
static double t_blank         = 0.0;

// forward
static void create_blank_windows(void);
static void destroy_blank_windows(void);

// trim leading/trailing whitespace in-place
static char *trim_whitespace(char *s) {
    char *end;
    while (*s && isspace((unsigned char)*s)) s++;
    if (*s == '\0') return s;
    end = s + strlen(s) - 1;
    while (end > s && isspace((unsigned char)*end)) end--;
    end[1] = '\0';
    return s;
}

// Monotonic now in seconds
static double now_sec(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return ts.tv_sec + ts.tv_nsec/1e9;
}

// Detect Wayland / tiling WM
static void detect_environment(void) {
    const char *wd = getenv("WAYLAND_DISPLAY");
    if (wd && *wd) {
        is_wayland = true;
        printf("Detected Wayland environment\n");
    }
    const char *desktop = getenv("XDG_CURRENT_DESKTOP");
    const char *hypr    = getenv("HYPRLAND_INSTANCE_SIGNATURE");
    if ((desktop && (strstr(desktop,"i3")||strstr(desktop,"sway")||
                     strstr(desktop,"awesome")||strstr(desktop,"bspwm")))
     || (hypr && *hypr)) {
        is_tiling_wm = true;
        printf("Detected tiling window manager\n");
    }
}

// Load ~/.config/lscreensaver/config
static void load_config(void) {
    char path[512];
    snprintf(path,sizeof(path),CONFIG_PATH_FMT,getenv("HOME"));
    FILE *f = fopen(path,"r");
    if (!f) return;
    char line[MAX_LINE];
    while (fgets(line,sizeof(line),f)) {
        char *p = line;
        while (*p==' '||*p=='\t') p++;
        if (*p=='\0'||*p=='#') continue;
        char *eq = strchr(p,'=');
        if (!eq) continue;
        *eq = '\0';
        char *key = trim_whitespace(p);
        char *val = trim_whitespace(eq+1);
        char *nl;
        if ((nl=strchr(val,'\n'))) *nl = '\0';

        if (strcmp(key,"inactivity_time")==0) {
            inactivity_time = atoi(val);
        }
        else if (strcmp(key,"exempt_processes")==0) {
            char *tok = strtok(val,",");
            while (tok && exempt_count<MAX_EXEMPTS) {
                char *t = trim_whitespace(tok);
                if (*t) exempts[exempt_count++] = strdup(t);
                tok = strtok(NULL,",");
            }
        }
    }
    fclose(f);
    for(int i=0;i<exempt_count;i++){
        printf("Exempt[%d] = '%s'\n", i, exempts[i]);
    }
}

// Return true if any exempt process is running (checks argv[0] via /proc/*/cmdline)
static bool any_exempt_running(void) {
    DIR *pd = opendir("/proc");
    if (!pd) return false;
    struct dirent *de;
    while ((de=readdir(pd))) {
        // skip non-numeric
        char *endptr;
        long pid = strtol(de->d_name,&endptr,10);
        if (*de->d_name=='\0' || *endptr!='\0' || pid<=0) continue;

        char cmdpath[64], buf[512];
        snprintf(cmdpath,sizeof(cmdpath),"/proc/%ld/cmdline",pid);
        FILE *c = fopen(cmdpath,"r");
        if (!c) continue;
        size_t n = fread(buf,1,sizeof(buf)-1,c);
        fclose(c);
        if (n==0) continue;
        buf[n]='\0';
        // argv[0] up to first '\0'
        char *cmd = buf;
        if (char *b = strrchr(cmd,'/')) cmd = b+1;
        for(int i=0;i<exempt_count;i++){
            if (strcmp(cmd,exempts[i])==0) {
                closedir(pd);
                return true;
            }
        }
    }
    closedir(pd);
    return false;
}

// libinput open/close
static int open_restricted(const char *path,int flags,void*u){ return open(path,flags); }
static void close_restricted(int fd,void*u){ close(fd); }
static const struct libinput_interface li_if = {
    .open_restricted  = open_restricted,
    .close_restricted = close_restricted,
};

static void init_libinput(void) {
    struct udev *udev = udev_new();
    if (!udev) exit(1);
    li = libinput_udev_create_context(&li_if,NULL,udev);
    libinput_udev_assign_seat(li,"seat0");
}

// Create one black borderless window per display
static void create_blank_windows(void){
    if (blanked) return;
    SDL_ShowCursor(SDL_DISABLE);
    if (is_wayland)
        SDL_SetHint(SDL_HINT_VIDEODRIVER,"wayland,x11");
    SDL_SetHint(SDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS,"0");

    win_count = SDL_GetNumVideoDisplays();
    wins = calloc(win_count,sizeof(*wins));
    printf("Creating %d blank windows\n",win_count);
    for(int i=0;i<win_count;i++){
        SDL_Rect r; SDL_GetDisplayBounds(i,&r);
        char wtitle[64];
        snprintf(wtitle,sizeof(wtitle),"lscreensaver-%d",i);

        if (is_wayland||is_tiling_wm) {
            wins[i] = SDL_CreateWindow(
                wtitle,
                SDL_WINDOWPOS_UNDEFINED_DISPLAY(i),
                SDL_WINDOWPOS_UNDEFINED_DISPLAY(i),
                r.w,r.h,
                SDL_WINDOW_BORDERLESS|SDL_WINDOW_ALWAYS_ON_TOP
            );
        } else {
            wins[i] = SDL_CreateWindow(
                wtitle,
                r.x,r.y,
                r.w,r.h,
                SDL_WINDOW_BORDERLESS
            );
        }
        if (!wins[i]) {
            fprintf(stderr,"SDL_CreateWindow: %s\n",SDL_GetError());
            continue;
        }
        SDL_SetWindowSize(wins[i],r.w,r.h);
        SDL_SetWindowAlwaysOnTop(wins[i],SDL_TRUE);

        SDL_Renderer *ren = SDL_CreateRenderer(
            wins[i],-1,
            SDL_RENDERER_ACCELERATED|SDL_RENDERER_PRESENTVSYNC
        );
        SDL_SetRenderDrawColor(ren,0,0,0,255);
        SDL_RenderClear(ren);
        SDL_RenderPresent(ren);
        SDL_DestroyRenderer(ren);

        if (is_wayland) {
            if (SDL_SetWindowFullscreen(wins[i],SDL_WINDOW_FULLSCREEN_DESKTOP)!=0)
                if (SDL_SetWindowFullscreen(wins[i],SDL_WINDOW_FULLSCREEN)!=0)
                    SDL_MaximizeWindow(wins[i]);
        } else {
            if (SDL_SetWindowFullscreen(wins[i],SDL_WINDOW_FULLSCREEN)!=0)
                if (SDL_SetWindowFullscreen(wins[i],SDL_WINDOW_FULLSCREEN_DESKTOP)!=0)
                    SDL_MaximizeWindow(wins[i]);
        }
    }
    blanked = true;
    t_blank = now_sec();
    printf("Blank windows created and displayed\n");
}

// Destroy all blank windows
static void destroy_blank_windows(void){
    if (!blanked) return;
    printf("Destroying blank windows\n");
    for(int i=0;i<win_count;i++)
        if (wins[i]) SDL_DestroyWindow(wins[i]);
    free(wins);
    wins = NULL;
    win_count = 0;
    SDL_ShowCursor(SDL_ENABLE);
    blanked = false;
}

int main(int argc,char **argv){
    // see if we're in "lock" mode
    bool lock_mode = false;
    for(int i=1;i<argc;i++){
        if (strcmp(argv[i],"-l")==0) {
            lock_mode = true;
            break;
        }
    }

    detect_environment();

    if (!lock_mode) {
        // normal-daemon mode
        load_config();
    }

    if (SDL_Init(SDL_INIT_VIDEO|SDL_INIT_TIMER)!=0){
        fprintf(stderr,"SDL_Init failed: %s\n",SDL_GetError());
        return 1;
    }
    init_libinput();
    int li_fd = libinput_get_fd(li);

    struct pollfd pfd = { .fd = li_fd, .events = POLLIN };

    if (lock_mode) {
        // 0.5s delay, then immediate blank
        usleep(500000);
        create_blank_windows();
        double t_lock = now_sec();

        // Now wait for any input *after* 3s have passed
        for(;;) {
            if (poll(&pfd,1,200)>0) {
                libinput_dispatch(li);
                struct libinput_event *ev;
                while((ev=libinput_get_event(li))) {
                    enum libinput_event_type t = libinput_event_get_type(ev);
                    if ((t==LIBINPUT_EVENT_POINTER_MOTION ||
                         t==LIBINPUT_EVENT_KEYBOARD_KEY  ||
                         t==LIBINPUT_EVENT_POINTER_BUTTON||
                         t==LIBINPUT_EVENT_TOUCH_DOWN)
                        && (now_sec() - t_lock >= 3.0)) {
                        destroy_blank_windows();
                        SDL_Quit();
                        // this is the -l process, it exits now
                        return 0;
                    }
                    libinput_event_destroy(ev);
                }
            }
        }
    }
    else {
        // normal idle-screen mode
        t_last_activity = now_sec();
        bool exempt_prev = any_exempt_running();

        for(;;){
            if (poll(&pfd,1,200)>0){
                libinput_dispatch(li);
                struct libinput_event *ev;
                while((ev=libinput_get_event(li))){
                    enum libinput_event_type t = libinput_event_get_type(ev);
                    if (t==LIBINPUT_EVENT_POINTER_MOTION ||
                        t==LIBINPUT_EVENT_KEYBOARD_KEY  ||
                        t==LIBINPUT_EVENT_POINTER_BUTTON||
                        t==LIBINPUT_EVENT_TOUCH_DOWN) {
                        t_last_activity = now_sec();
                        if (blanked && (now_sec() - t_blank >= 3.0))
                            destroy_blank_windows();
                    }
                    libinput_event_destroy(ev);
                }
            }

            bool exempt_now = any_exempt_running();
            if (exempt_now != exempt_prev) {
                t_last_activity = now_sec();
                exempt_prev = exempt_now;
                if (blanked && exempt_now)
                    destroy_blank_windows();
            }

            if (!blanked && (now_sec() - t_last_activity) >= inactivity_time) {
                if (!exempt_now)
                    create_blank_windows();
            }
        }
    }

    // never reached
    SDL_Quit();
    return 0;
}