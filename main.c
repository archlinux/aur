#include "curfblib.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <unistd.h>
#include <fcntl.h>

#define PID_FILE "/tmp/cursorfb.pid"

/* ---------- STOP DAEMON ---------- */

static void stop_daemon() {

    FILE *f = fopen(PID_FILE, "r");
    if (!f) {
        printf("cursorfb not running\n");
        return;
    }

    int pid;
    fscanf(f, "%d", &pid);
    fclose(f);

    if (kill(pid, SIGTERM) == 0) {
        printf("cursorfb stopped (pid %d)\n", pid);
        unlink(PID_FILE);
    } else {
        printf("failed to stop cursorfb\n");
    }
}

/* ---------- DAEMONIZE ---------- */

static void daemonize() {

    pid_t pid = fork();

    if (pid < 0) exit(1);
    if (pid > 0) exit(0);

    setsid();

    pid = fork();
    if (pid > 0) exit(0);

    FILE *f = fopen(PID_FILE, "w");
    fprintf(f, "%d", getpid());
    fclose(f);

    close(STDIN_FILENO);
    close(STDOUT_FILENO);
    close(STDERR_FILENO);
}

/* ---------- MAIN ---------- */

int main(int argc, char **argv) {

    if (argc > 1 && strcmp(argv[1], "--stop") == 0) {
        stop_daemon();
        return 0;
    } else if (argc == 1 || (argc > 1 && strcmp(argv[1], "--help") == 0)) {
        printf("usage: %s [options]\n", argv[0]);
        printf("options:\n");
        printf("  --stop    stop the cursorfb daemon\n");
        printf("  --help    show this help message\n");
        printf("  (no args) start cursor daemon\n");
        return 0;
    }

    if (curfb_init() != 0)
        return 1;

    curfb_loop();
    curfb_shutdown();

    unlink(PID_FILE);

    return 0;
}