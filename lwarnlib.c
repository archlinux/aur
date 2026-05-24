#include "lwarnlib.h"

#include <stdio.h>
#include <time.h>

/* get HH:MM:SS only */
void warn_time(char *buf, size_t len) {
    time_t now = time(NULL);
    struct tm *t = localtime(&now);

    strftime(buf, len, "%H:%M:%S", t);
}

/* framebuffer warning */
void fbwarn(const char *msg) {
    char ts[16];
    warn_time(ts, sizeof(ts));

    fprintf(stderr,
        "[ WARN ] %s: framebuffer (fb0) %s\n",
        ts,
        msg
    );
}