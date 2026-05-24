#include "curfblib.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include "lwarnlib.h"
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
        printf("");
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
    if (f) {
        fprintf(f, "%d", getpid());
        fclose(f);
    }

    close(STDIN_FILENO);
    close(STDOUT_FILENO);
    close(STDERR_FILENO);
}

/* ---------- MAIN ---------- */

int main(int argc, char **argv) {
    if (geteuid() != 0) {
        fprintf(stderr, "cursorfb: restarting with sudo...\n");

        char **args = malloc(sizeof(char*) * (argc + 3));

        args[0] = "sudo";
        args[1] = "-E";

        for (int i = 0; i < argc; i++) {
            args[i + 2] = argv[i];
        }

        args[argc + 2] = NULL;

        execvp("sudo", args);

        perror("cursorfb: failed to run sudo");
        return 1;
    }

    if (argc > 1 && strcmp(argv[1], "--clear") == 0) {
        if (curfb_init() != 0)
        return 1;

        curfb_clear(); 
        curfb_shutdown();
        return 0;
    }

    if (argc > 1 && strcmp(argv[1], "--stop") == 0) {
        stop_daemon();
        return 0;
    }

    if (argc > 1 && strcmp(argv[1], "--help") == 0) {
        printf("usage: cursorfb [options]\n");
        printf("options:\n");
        printf("  --stop                     stop daemon\n");
        printf("  --help                     show help\n");
        printf("  --clear                    clear cursor\n");
        printf(" to start, just run with no options\n");
        return 0;
    }

    /* DEFAULT: start daemon */
    daemonize();

    if (curfb_init() != 0) {
        fbwarn("initialization failed");
        return 1;
    }

    curfb_loop();
    curfb_shutdown();

    unlink(PID_FILE);

    return 0;
}