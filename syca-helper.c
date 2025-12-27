// syca-helper.c
#define _GNU_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "syca-helper: no command provided\n");
        return 1;
    }

    // Elevate to root (setuid binary makes this safe)
    if (setuid(0) != 0) {
        perror("setuid");
        return 1;
    }

    // Execute the command
    execvp(argv[1], &argv[1]);

    perror("execvp");
    return 1;
}
