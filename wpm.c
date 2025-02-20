#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MAX_PATH 1024
#define CONFIG_FILE "/.wpmrc"

// Path to the config file
void get_config_path(char *config_path) {
    char *home = getenv("HOME");
    if (home != NULL) {
        snprintf(config_path, MAX_PATH, "%s%s", home, CONFIG_FILE);
    } else {
        fprintf(stderr, "ERROR: HOME environment variable not set.\n");
        exit(1);
    }
}

// Add waypoint to the .wpmrc file
void set_waypoint(const char *name) {
    char current_path[MAX_PATH];
    char config_path[MAX_PATH];
    get_config_path(config_path);

    if (getcwd(current_path, sizeof(current_path)) != NULL) {
        FILE *file = fopen(config_path, "a");
        if (file == NULL) {
            perror("Failed to open file");
            return;
        }
        fprintf(file, "%s %s\n", name, current_path);
        fclose(file);
        printf("Waypoint '%s' set at %s\n", name, current_path);
    } else {
        perror("Failed to get current directory");
    }
}

void go_to_waypoint(const char *name) {
    char config_path[MAX_PATH];
    get_config_path(config_path);
    FILE *file = fopen(config_path, "r");
    if (file == NULL) {
        perror("Failed to open file");
        return;
    }

    char line[1024];
    char waypoint_name[256];
    char path[MAX_PATH];
    int found = 0;

    while (fgets(line, sizeof(line), file)) {
        sscanf(line, "%s %s", waypoint_name, path);
        if (strcmp(waypoint_name, name) == 0) {
            printf("%s\n", path);
            found = 1;
            break;
        }
    }

    fclose(file);

    if (!found) {
        fprintf(stderr, "Waypoint '%s' not found.\n", name);
    }
}

void list_waypoints() {
    char config_path[MAX_PATH];
    get_config_path(config_path);
    FILE *file = fopen(config_path, "r");
    if (file == NULL) {
        perror("Failed to open file");
        return;
    }

    char line[1024];
    while (fgets(line, sizeof(line), file)) {
        printf("%s", line);
    }

    fclose(file);
}

// Main function to handle command line arguments
int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s [set|go|list] [waypoint_name]\n", argv[0]);
        return 1;
    }

    if (strcmp(argv[1], "set") == 0 && argc == 3) {
        set_waypoint(argv[2]);
    } else if (strcmp(argv[1], "go") == 0 && argc == 3) {
        go_to_waypoint(argv[2]);
    } else if (strcmp(argv[1], "list") == 0 && argc == 2) {
        list_waypoints();
    } else {
        fprintf(stderr, "Invalid command or number of arguments\n");
        return 1;
    }

    return 0;
}
