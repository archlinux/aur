#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void print_help() {
    printf("a small program to help systemd users switch to openrc by m1rkvl9\n");
    printf("\nUsage:\n");
    printf("  rctl start <service>\n");
    printf("  rctl stop <service>\n");
    printf("  rctl info\n");
    printf("  rctl enable <service> [--now]\n");
    printf("  rctl disable <service> [--now]\n");
    printf("  rctl enable --now <service>\n");
    printf("  rctl disable --now <service>\n");
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        print_help();
        return 1;
    }

    char *command = argv[1];

    if (strcmp(command, "help") == 0 || strcmp(command, "--help") == 0) {
        print_help();
        return 0;
    }

    if (strcmp(command, "info") == 0) {
        return system("rc-update");
    }

    // Для остальных команд нужно как минимум 3 аргумента (rctl + команда + имя_сервиса)
    if (argc < 3) {
        fprintf(stderr, "Error: Missing arguments.\n");
        return 1;
    }

    char *service = NULL;
    int has_now = 0;

    // Проходим по всем аргументам начиная с argv[2] (после rctl и команды)
    for (int i = 2; i < argc; i++) {
        if (strcmp(argv[i], "--now") == 0) {
            has_now = 1;
        } else {
            // Если это не --now, значит это имя сервиса
            service = argv[i];
        }
    }

    // Если обошли все аргументы, а имя сервиса так и не нашли
    if (service == NULL) {
        fprintf(stderr, "Error: Missing service name.\n");
        return 1;
    }

    char cmd_buffer[512];

    if (strcmp(command, "start") == 0) {
        snprintf(cmd_buffer, sizeof(cmd_buffer), "rc-service %s start", service);
        return system(cmd_buffer);
    }
    else if (strcmp(command, "stop") == 0) {
        snprintf(cmd_buffer, sizeof(cmd_buffer), "rc-service %s stop", service);
        return system(cmd_buffer);
    }
    else if (strcmp(command, "enable") == 0) {
        if (has_now) {
            snprintf(cmd_buffer, sizeof(cmd_buffer), "rc-update add %s default && rc-service %s start", service, service);
        } else {
            snprintf(cmd_buffer, sizeof(cmd_buffer), "rc-update add %s default", service);
        }
        return system(cmd_buffer);
    }
    else if (strcmp(command, "disable") == 0) {
        if (has_now) {
            snprintf(cmd_buffer, sizeof(cmd_buffer), "rc-service %s stop && rc-update delete %s default", service, service);
        } else {
            snprintf(cmd_buffer, sizeof(cmd_buffer), "rc-update delete %s default", service);
        }
        return system(cmd_buffer);
    }
    else {
        fprintf(stderr, "Unknown command: %s\n", command);
        print_help();
        return 1;
    }
}
