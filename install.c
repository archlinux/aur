#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>
#include <cjson/cJSON.h>
#include <string.h>

#include "color.h"


/*
 * Installation script for the caelestia-sessiongif package
 *
 *
 *  1. If not created yet, create environment variable CAELESTIA_GIFS_FOLDER
 *      by default pointing to $HOME/Pictures/CaelestiaGifs/
 *
 *  2. Backup shell.json
 *      - if shell.json does not exist, return
 *      - If shell.bak.json exists, do nothing (the aim is to keep the first backup only)
 *      - If shell.back.json does not exist, create it as a copy of shell.json
 *    
 *  3. Edit $HOME/.config/caelestia/shell.json
 *      - If the file does not exist, create it with default settings:
 *          {
 *              "paths": {
 *                  "sessionGif": "$HOME/$CAELESTIA_GIFS_FOLDER"
 *               }
 *          }
 *      - If the file exists, search for the "paths" section:
 *          - If "paths" section exists, search for "sessiongif" entry:
 *          - If "sessiongif" entry exists, edit its value to "$HOME/$CAELESTIA_GIFS_FOLDER/sessionGifs/"
 *          - Else add the entry with the value "$HOME/$CAELESTIA_GIFS_FOLDER/sessionGifs/"
 *      - Else add the "paths" section with the "sessiongif" entry and value "$HOME/$CAELESTIA_GIFS_FOLDER/sessiongifs/"
 *
 *  4. Print success message
 */

int create_env_variable(void) {
    const char *home = getenv("HOME");
    if (home == NULL) {
        fprintf(stderr, FG_RED "Error: HOME environment variable not set.\n" FG_DEFAULT);
        return -1;
    }

    const char *gif_folder = getenv("CAELESTIA_GIFS_FOLDER");
    if (gif_folder == NULL) {
        char path[512];
        snprintf(path, sizeof(path), "%s/Pictures/CaelestiaGifs", home);
        //printf("Setting CAELESTIA_GIFS_FOLDER to default: %s\n", path);
        setenv("CAELESTIA_GIFS_FOLDER", path, 1);
        //printf("Environment variable CAELESTIA_GIFS_FOLDER created successfully: %s\n", getenv("CAELESTIA_GIFS_FOLDER"));
    }

    return 0;
}

int backup_shell_json(void) {
    const char *home = getenv("HOME");
    if (home == NULL) {
        fprintf(stderr, FG_RED "Error: HOME environment variable not set.\n" FG_DEFAULT);
        return -1;
    }
    char shell_json_path[512];
    snprintf(shell_json_path, sizeof(shell_json_path), "%s/.config/caelestia/shell.json", home);
    //printf("Backing up shell.json from %s\n", shell_json_path);
    char backup_path[512];
    snprintf(backup_path, sizeof(backup_path), "%s/.config/caelestia/shell.bak.json", home);
    FILE *shell_file = fopen(shell_json_path, "r");
    if (shell_file == NULL) {
        // shell.json does not exist, nothing to backup
        printf("shell.json does not exist, skipping backup.\n");
    } else {
        fclose(shell_file);
        FILE *backup_file = fopen(backup_path, "r");
        if (backup_file != NULL) {
            // Backup already exists, do nothing
            fclose(backup_file);
            printf("Backup already exists, skipping backup creation.\n");
        } else {
            // Create backup
            char command[2048];
            snprintf(command, sizeof(command), "cp %s %s", shell_json_path, backup_path);
            int result = system(command);
            if (result != 0) {
                fprintf(stderr, FG_RED "Error creating backup of shell.json.\n" FG_DEFAULT);
                return -1;
            }
            printf("Backup created successfully.\n");
        }
    }
    return 0;
}

void sub_variables(char *dest, size_t size, const char *src) {
    const char *home = getenv("HOME");
    char buffer[1024] = {0};
    const char *p = src;
    char *b = buffer;

    while (*p && (b - buffer) < sizeof(buffer) - 1) {
        if (strncmp(p, "$HOME", 5) == 0) {
            strncpy(b, home, sizeof(buffer) - (b - buffer) - 1);
            b += strlen(home);
            p += 5;
        } else {
            *b++ = *p++;
        }
    }
    *b = '\0';
    strncpy(dest, buffer, size);
}

int edit_shell_json(void) {
    char shell_json_path[512];
    const char *home = getenv("HOME");
    if (!home) { fprintf(stderr, FG_RED "Error: HOME env not set\n" FG_DEFAULT); return -1; }
    snprintf(shell_json_path, sizeof(shell_json_path), "%s/.config/caelestia/shell.json", home);

    FILE *fp = fopen(shell_json_path, "r");
    //printf("if !fp? %s\n", fp ? "exists" : "does not exist");
    if (!fp) {
        //printf("Creating default shell.json at %s\n", shell_json_path);
        // file does not exist: create default JSON
        cJSON *root = cJSON_CreateObject();
        cJSON *paths = cJSON_CreateObject();
        cJSON_AddItemToObject(root, "paths", paths);

        // values to write
        const char *cae = getenv("CAELESTIA_GIFS_FOLDER");
        char defval[512];
        snprintf(defval, sizeof(defval), "%s/%s", home, cae ? cae : "SessionGifs");
        
        char val[512];
        // Préparer la chaîne avec variables
        const char *raw_str = "$HOME/$CAELESTIA_GIFS_FOLDER/sessionGifs";
        sub_variables(val, sizeof(val), raw_str);
        //printf("val=%s\n", val);
        // Ensuite l’insérer dans JSON
        cJSON_AddStringToObject(paths, "sessionGif", val);

        char *string = cJSON_Print(root);
        fp = fopen(shell_json_path, "w");
        fputs(string, fp);
        fclose(fp);
        cJSON_free(string);
        cJSON_Delete(root);
        return 0;
    }
    // file exists
    fseek(fp, 0, SEEK_END);
    long fsize = ftell(fp);
    rewind(fp);

    char *buffer = malloc(fsize + 1);
    if (!buffer) {
        fprintf(stderr, FG_RED "Memory allocation failed.\n" FG_DEFAULT);
        fclose(fp);
        return -1;
    }

    size_t len = fread(buffer, 1, fsize, fp);
    buffer[len] = '\0';
    fclose(fp);

    if (len != fsize) {
        fprintf(stderr, FG_YELLOW "Warning: expected %ld bytes, read %zu bytes\n" FG_DEFAULT, fsize, len);
    }

    cJSON *json = cJSON_Parse(buffer);
    if (!json) {
        const char *err = cJSON_GetErrorPtr();
        fprintf(stderr, FG_RED "Error parsing JSON before: %.40s\n" FG_DEFAULT, err ? err : "(unknown location)");
        free(buffer);
        return -1;
    }

    free(buffer);

    cJSON *paths = cJSON_GetObjectItem(json, "paths");
    if (!paths) {
        // create paths object
        paths = cJSON_CreateObject();
        cJSON_AddItemToObject(json, "paths", paths);
    }

    // set sessiongif value
    const char *cae = getenv("CAELESTIA_GIFS_FOLDER");
    char value[512];
    snprintf(value, sizeof(value), "%s/sessionGif/current/current.gif", cae ? cae : "sessionGif");

    cJSON *sessiongif = cJSON_GetObjectItem(paths, "sessionGif");
    if (sessiongif)
        cJSON_ReplaceItemInObject(paths, "sessionGif", cJSON_CreateString(value));
    else
        cJSON_AddStringToObject(paths, "sessionGif", value);

    // save
    char *string = cJSON_Print(json);
    fp = fopen(shell_json_path, "w");
    fputs(string, fp);
    fclose(fp);
    cJSON_free(string);
    cJSON_Delete(json);
    return 0;
}

int main(void) {
    const char *home = getenv("HOME");
    if (home == NULL) {
        fprintf(stderr, FG_RED "Error: HOME environment variable not set.\n" FG_DEFAULT);
        return EXIT_FAILURE;
    }

    if (access("/usr/bin/caelestia-gif", X_OK) != 0) {
        fprintf(stderr, FG_RED "Error: caelestia-gif executable not found in /usr/bin/. Please install caelestia-sessiongif package first.\n" FG_DEFAULT);
        return EXIT_FAILURE;
    }

    if (create_env_variable() != 0) {
        return EXIT_FAILURE;
    }
    if (backup_shell_json() != 0) {
        return EXIT_FAILURE;
    }
    if (edit_shell_json() != 0) {
        return EXIT_FAILURE;
    }


    // Further steps would be implemented here...

    printf("Installation completed successfully.\n");
    return EXIT_SUCCESS;
}
