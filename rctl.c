#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void print_help() {
    printf("a small program to help systemd users switch to openrc by m1rkvl9\n");
    printf("\nUsage:\n");
    printf("  rctl start <service> [--user]\n");
    printf("  rctl stop <service> [--user]\n");
    printf("  rctl restart <service> [--user]\n");
    printf("  rctl info [--user]\n");
    printf("  rctl enable <service> [--now] [--user]\n");
    printf("  rctl disable <service> [--now] [--user]\n");
    printf("\nNote: Order of arguments does not matter!\n");
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        print_help();
        return 1;
    }

    char *command = NULL;
    char *service = NULL;
    int has_now = 0;
    int has_user = 0;

    // Проходим по абсолютно всем аргументам (начиная с argv[1])
    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--now") == 0) {
            has_now = 1;
        }
        else if (strcmp(argv[i], "--user") == 0) {
            has_user = 1;
        }
        else if (strcmp(argv[i], "help") == 0 || strcmp(argv[i], "--help") == 0) {
            print_help();
            return 0;
        }
        // Проверяем, является ли аргумент известной командой
        else if (strcmp(argv[i], "start") == 0 ||
                 strcmp(argv[i], "stop") == 0 ||
                 strcmp(argv[i], "restart") == 0 ||
                 strcmp(argv[i], "enable") == 0 ||
                 strcmp(argv[i], "disable") == 0 ||
                 strcmp(argv[i], "info") == 0) {
            command = argv[i];
        }
        else {
            // Если это не флаг и не команда, значит это имя сервиса
            service = argv[i];
        }
    }

    // Если команду так и не нашли
    if (command == NULL) {
        fprintf(stderr, "Error: No command specified (e.g., start, stop, enable).\n");
        print_help();
        return 1;
    }

    // Отдельная обработка для команды info (ей сервис не нужен)
    if (strcmp(command, "info") == 0) {
        if (has_user) {
            return system("rc-update --user");
        } else {
            return system("rc-update");
        }
    }

    // Для всех остальных команд имя сервиса обязательно
    if (service == NULL) {
        fprintf(stderr, "Error: Missing service name.\n");
        return 1;
    }

    char cmd_buffer[512];
    char svc_prefix[32] = "";
    char upd_prefix[32] = "";

    if (has_user) {
        strcpy(svc_prefix, "--user ");
        strcpy(upd_prefix, "--user ");
    }

    if (strcmp(command, "start") == 0) {
        snprintf(cmd_buffer, sizeof(cmd_buffer), "rc-service %s%s start", svc_prefix, service);
        return system(cmd_buffer);
    }
    else if (strcmp(command, "stop") == 0) {
        snprintf(cmd_buffer, sizeof(cmd_buffer), "rc-service %s%s stop", svc_prefix, service);
        return system(cmd_buffer);
    }
    else if (strcmp(command, "restart") == 0) {
        snprintf(cmd_buffer, sizeof(cmd_buffer), "rc-service %s%s restart", svc_prefix, service);
        return system(cmd_buffer);
    }
    else if (strcmp(command, "enable") == 0) {
        if (has_now) {
            snprintf(cmd_buffer, sizeof(cmd_buffer), "rc-update %sadd %s default && rc-service %s%s start",
                     upd_prefix, service, svc_prefix, service);
        } else {
            snprintf(cmd_buffer, sizeof(cmd_buffer), "rc-update %sadd %s default", upd_prefix, service);
        }
        return system(cmd_buffer);
    }
    else if (strcmp(command, "disable") == 0) {
        if (has_now) {
            snprintf(cmd_buffer, sizeof(cmd_buffer), "rc-service %s%s stop && rc-update %sdelete %s default",
                     svc_prefix, service, upd_prefix, service);
        } else {
            snprintf(cmd_buffer, sizeof(cmd_buffer), "rc-update %sdelete %s default", upd_prefix, service);
        }
        return system(cmd_buffer);
    }

    return 0;
}
