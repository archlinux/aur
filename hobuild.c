#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MAX_VARS 20
#define MAX_CMDS 10
#define MAX_LINE 256

typedef struct {
    char name[50];
    char value[200];
} Variable;

typedef struct {
    char name[50];
    char action[200];
} Command;

Variable vars[MAX_VARS];
Command cmds[MAX_CMDS];
int var_count = 0;
int cmd_count = 0;

void parse_var(char* line) {
    char name[50], value[200];
    if (sscanf(line, "p %49s = \"%199[^\"]\"", name, value) == 2) {
        strcpy(vars[var_count].name, name);
        strcpy(vars[var_count].value, value);
        var_count++;
    }
}

void expand_vars(char* line) {
    char result[MAX_LINE] = {0};
    char* pos = line;
    while (*pos) {
        if (*pos == '!' && *(pos + 1) == '(') {
            char var_name[50];
            pos += 2;
            char* end = strchr(pos, ')');
            if (!end) break;
            strncpy(var_name, pos, end - pos);
            var_name[end - pos] = '\0';

            for (int i = 0; i < var_count; i++) {
                if (strcmp(vars[i].name, var_name) == 0) {
                    strcat(result, vars[i].value);
                    break;
                }
            }
            pos = end + 1;
        } else {
            strncat(result, pos, 1);
            pos++;
        }
    }
    strcpy(line, result);
}

void parse_file(const char* filename) {
    FILE* file = fopen(filename, "r");
    if (!file) {
        fprintf(stderr, "Error: Cannot open %s\n", filename);
        exit(1);
    }

    char line[MAX_LINE];
    char current_cmd[50] = {0};
    char current_action[200] = {0};
    int in_command = 0;

    while (fgets(line, sizeof(line), file)) {
        line[strcspn(line, "\n")] = 0;

        if (line[0] == '\0' || line[0] == '#') continue;

        if (line[0] == 'p') {
            parse_var(line);
            continue;
        }

        char* semicolon = strchr(line, ';');
        if (semicolon) {
            if (in_command) {
                expand_vars(current_action);
                strcpy(cmds[cmd_count].name, current_cmd);
                strcpy(cmds[cmd_count].action, current_action);
                cmd_count++;
            }

            *semicolon = '\0';
            strcpy(current_cmd, line);
            current_action[0] = '\0';
            in_command = 1;
            continue;
        }

        if (in_command) {
            strcat(current_action, line);
            strcat(current_action, "\n");
        }
    }

    if (in_command) {
        expand_vars(current_action);
        strcpy(cmds[cmd_count].name, current_cmd);
        strcpy(cmds[cmd_count].action, current_action);
        cmd_count++;
    }

    fclose(file);
}

void execute_cmd(const char* name) {
    for (int i = 0; i < cmd_count; i++) {
        if (strcmp(cmds[i].name, name) == 0) {
            printf("> Executing: %s\n", cmds[i].action);
            system(cmds[i].action);
            return;
        }
    }
    fprintf(stderr, "Error: command '%s' not found\n", name);
}

int main(int argc, char** argv) {
    if (argc < 2) {
        printf("Usage: %s [command]\n", argv[0]);
        return 1;
    }

    parse_file("build.hob");
    execute_cmd(argv[1]);

    return 0;
}
