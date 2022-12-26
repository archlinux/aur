#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <dirent.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/dir.h>
#include <time.h>
#include <sys/time.h>
#include <linux/input.h>
#include <linux/uinput.h>
#include <linux/kd.h>
#include <bsd/string.h>
#include <sys/ioctl.h>
#include <sys/syscall.h>

int lstat(const char *restrict path, struct stat *restrict buf);
int syncfs(int fd);

#define VERSION "1.0"
char leds[256] = "/sys/class/leds/";

void usage( const char* argv0 ) {
    printf( "NumLockL " VERSION "\n"
        "(C) 2022      Masato TOYOSHIMA <phoepsilonix@gmail.com>\n"
        "Usage : %s [on|off|toggle]\n"
        "default - display current NumLock state\n"
        "on      - turns NumLock on\n"
        "off     - turns NumLock off\n"
        "toggle  - toggles the NumLock on and off\n"
        "\n"
        , argv0 );
}

int get_state(char *leds){
        int retval;
        char buf[2]="";

        int fd = open(leds, O_RDONLY);
        if (fd < 0) { fprintf(stderr,"get_state %s\n",leds);exit(1); }
        retval = read(fd, buf, 1);
        if (retval < 0) {
            perror("\nRead failure");
            close(fd);
            return -1;
            }
        close(fd);
        return atoi(buf);
}

int get_led_path(char *leds, size_t size){
        int retval;
        char buf[2]="";
        DIR *dp;
        struct dirent *entry;
        struct stat statbuf;

        if ((dp = opendir(leds)) == NULL) {
                fprintf(stderr,"cannot open directory: %s\n", leds);
                return -1;
        }
        while((entry = readdir(dp)) != NULL) {
                lstat(entry->d_name, &statbuf);
                if(S_ISDIR(statbuf.st_mode)) {
                        if(strcmp(".",entry->d_name) == 0
                        || strcmp("..",entry->d_name) == 0) {
                                continue;
                        }
                        if(strstr(entry->d_name, "numlock")) {
                                strlcat(leds,entry->d_name,size);
                                strlcat(leds,"/brightness",size);
                                int fd = open(leds, O_RDONLY);
                                if (fd < 0) { perror(leds);closedir(dp);exit(1); }
                                retval = read(fd, buf, 1);
                                if (retval < 0) {
                                        perror("\nRead failure");
                                        close(fd);
                                        closedir(dp);
                                        return -1;
                                }
                                close(fd);
                        }
                }
        }
        closedir(dp);
        return retval;
}

void emit(int fd, int type, int code, int val)
{
    struct input_event ie;

    ie.type = type;
    ie.code = code;
    ie.value = val;
    /* timestamp values below are ignored */
    ie.time.tv_sec = 0;
    ie.time.tv_usec = 0;

    if(write(fd, &ie, sizeof(ie)) < 0) {
        fprintf(stderr, "NumLock can't change\n");
        return;
    }
    return;
}

int press_numlock(int state) {
    int fd;
    struct uinput_user_dev uidev;

    fd = open("/dev/uinput", O_WRONLY | O_NONBLOCK);
    if(fd < 0) return -1;
    
    if(ioctl(fd, UI_SET_EVBIT, EV_KEY) < 0) {
            close(fd);
            return -1;
    }
    if(ioctl(fd, UI_SET_EVBIT, EV_SYN) < 0) {
            close(fd);
            return -1;
    }
    if(ioctl(fd, UI_SET_KEYBIT, KEY_NUMLOCK) < 0) {
            close(fd);
            return -1;
    }

    memset(&uidev, 0, sizeof(uidev));
    snprintf(uidev.name, UINPUT_MAX_NAME_SIZE, "numlockl");
    uidev.id.bustype = BUS_USB;
    uidev.id.vendor  = 0x1;
    uidev.id.product = 0x1;
    uidev.id.version = 1;

    if(write(fd, &uidev, sizeof(uidev)) < 0) {
            close(fd);
            return -1;
    }
    if(ioctl(fd, UI_DEV_CREATE) < 0) {
            close(fd);
            return -1;
    }

    syncfs(fd);
    usleep(200000);
    emit(fd, EV_KEY, KEY_NUMLOCK, 1);
    usleep(200000);
    emit(fd, EV_KEY, KEY_NUMLOCK, 0);
    emit(fd, EV_SYN, SYN_REPORT, 0);
    syncfs(fd);

    if(ioctl(fd, UI_DEV_DESTROY) < 0) {
            close(fd);
            return -1;
    }
    close(fd);
    if (state == get_state(leds)) {
        fprintf(stderr, "NumLock can't change\n");
        return -1;
    }
    return 0;
}

void numlock_state(int state) {
        if (state == -1) {
                printf("NumLock state can not detected¥n");
        }
        else if(state==1) printf("NumLock On\n");
        else if(state==0) printf("NumLock Off\n");
}

void numlock_set_on(int state) {
        if (state == -1) {
                printf("NumLock state can not detected¥n");
        }
        else if(state==0) press_numlock(state);
}


void numlock_set_off(int state) {
        if (state == -1) {
                printf("NumLock state can not detected¥n");
        }
        else if(state==1) press_numlock(state);
}

void numlock_toggle(int state) {
        if (state == -1) {
                printf("NumLock state can not detected¥n");
        } else {
                press_numlock(state);
        }
}

int main( int argc, char* argv[] ) {
        if( argc > 2 ) {
                usage( argv[ 0 ] );
                return 1;
        }
        if(get_led_path(leds, sizeof(leds)) == -1) {
            perror(leds);exit(1);
        };
        int state = get_state(leds);
        if( argc == 1 ) {
                numlock_state(state);
        }
        else if( strcmp( argv[ 1 ], "on" ) == 0 )
                numlock_set_on(state);
        else if( strcmp( argv[ 1 ], "off" ) == 0 )
                numlock_set_off(state);
        else if( strcmp( argv[ 1 ], "toggle" ) == 0 )
                numlock_toggle(state);
        else {
                usage( argv[ 0 ] );
                return 2;
        }
        return 0;
}

