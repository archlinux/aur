#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <ctype.h>

#define MAX_PATH 512
#define MAX_LINE 256

char* expand_path(const char* path) {
    static char expanded[MAX_PATH];
    if (strncmp(path, "~/", 2) == 0) {
        const char* home = getenv("HOME");
        if (home) {
            snprintf(expanded, MAX_PATH, "%s%s", home, path + 1);
            return expanded;
        }
    }
    strncpy(expanded, path, MAX_PATH - 1);
    return expanded;
}

char ascii_color[32] = "\033[1;37m";
char default_distro[64] = "";

void parse_color(const char* color_str, char* output) {
    int r, g, b;
    if (sscanf(color_str, "%d,%d,%d", &r, &g, &b) == 3) {
        snprintf(output, 32, "\033[38;2;%d;%d;%dm", r, g, b);
    } else if (strcmp(color_str, "red") == 0) {
        strcpy(output, "\033[1;31m");
    } else if (strcmp(color_str, "green") == 0) {
        strcpy(output, "\033[1;32m");
    } else if (strcmp(color_str, "yellow") == 0) {
        strcpy(output, "\033[1;33m");
    } else if (strcmp(color_str, "blue") == 0) {
        strcpy(output, "\033[1;34m");
    } else if (strcmp(color_str, "magenta") == 0) {
        strcpy(output, "\033[1;35m");
    } else if (strcmp(color_str, "cyan") == 0) {
        strcpy(output, "\033[1;36m");
    } else if (strcmp(color_str, "white") == 0) {
        strcpy(output, "\033[1;37m");
    } else {
        strcpy(output, "\033[1;37m");
    }
}

void create_default_config(const char* config_path) {
    FILE *fp = fopen(config_path, "w");
    if (!fp) return;
    
    fprintf(fp, "# ASCII art color (RGB format: 255,255,255 or name: red, green, blue, etc)\n");
    fprintf(fp, "ascii_color=255,255,255\n");
    fprintf(fp, "# Default distribution name (set this to your distro name)\n");
    fprintf(fp, "# default_distro=artix\n");
    
    fclose(fp);
}

void load_config() {
    char config_path[MAX_PATH];
    snprintf(config_path, MAX_PATH, "%s/.config/wefetch/wefetch.conf", getenv("HOME"));
    
    FILE *fp = fopen(config_path, "r");
    if (!fp) {
        create_default_config(config_path);
        fp = fopen(config_path, "r");
        if (!fp) return;
    }
    
    char line[MAX_LINE];
    while (fgets(line, sizeof(line), fp)) {
        line[strcspn(line, "\n")] = 0;
        if (line[0] == '#' || line[0] == '\0') continue;
        
        char *key = strtok(line, "=");
        char *value = strtok(NULL, "=");
        
        if (key && value) {
            if (strcmp(key, "ascii_color") == 0) {
                parse_color(value, ascii_color);
            } else if (strcmp(key, "default_distro") == 0) {
                strncpy(default_distro, value, sizeof(default_distro) - 1);
            }
        }
    }
    fclose(fp);
}

char* get_init_system() {
    static char init[64] = "Unknown";
    FILE *fp = popen("ps -p 1 -o comm= 2>/dev/null", "r");
    if (!fp) return init;
    
    char buffer[128];
    if (fgets(buffer, sizeof(buffer), fp)) {
        buffer[strcspn(buffer, "\n")] = 0;
        if (strcmp(buffer, "systemd") == 0) strcpy(init, "systemd");
        else if (strcmp(buffer, "dinit") == 0) strcpy(init, "dinit");
        else if (strcmp(buffer, "runit") == 0) strcpy(init, "runit");
        else if (strstr(buffer, "openrc") != NULL) strcpy(init, "OpenRC");
        else if (strcmp(buffer, "s6-svscan") == 0) strcpy(init, "s6");
        else strcpy(init, buffer);
    }
    pclose(fp);
    return init;
}

void get_package_info(char* packages, size_t size) {
    FILE *fp;
    
    fp = popen("pacman -Q 2>/dev/null | wc -l", "r");
    if (fp) {
        if (fgets(packages, size, fp)) {
            packages[strcspn(packages, "\n")] = 0;
            pclose(fp);
            return;
        }
        pclose(fp);
    }
    
    fp = popen("dpkg -l 2>/dev/null | wc -l", "r");
    if (fp) {
        if (fgets(packages, size, fp)) {
            packages[strcspn(packages, "\n")] = 0;
            pclose(fp);
            return;
        }
        pclose(fp);
    }
    
    fp = popen("rpm -qa 2>/dev/null | wc -l", "r");
    if (fp) {
        if (fgets(packages, size, fp)) {
            packages[strcspn(packages, "\n")] = 0;
            pclose(fp);
            return;
        }
        pclose(fp);
    }
    
    fp = popen("xbps-query -l 2>/dev/null | wc -l", "r");
    if (fp) {
        if (fgets(packages, size, fp)) {
            packages[strcspn(packages, "\n")] = 0;
            pclose(fp);
            return;
        }
        pclose(fp);
    }
    
    fp = popen("apk list -I 2>/dev/null | wc -l", "r");
    if (fp) {
        if (fgets(packages, size, fp)) {
            packages[strcspn(packages, "\n")] = 0;
            pclose(fp);
            return;
        }
        pclose(fp);
    }
    
    fp = popen("nix-store -q --requisites /run/current-system/sw 2>/dev/null | wc -l", "r");
    if (fp) {
        if (fgets(packages, size, fp)) {
            packages[strcspn(packages, "\n")] = 0;
            pclose(fp);
            return;
        }
        pclose(fp);
    }
    
    fp = popen("emerge -ep world 2>/dev/null | grep -c \"^\\[*\\]\"", "r");
    if (fp) {
        if (fgets(packages, size, fp)) {
            packages[strcspn(packages, "\n")] = 0;
            pclose(fp);
            return;
        }
        pclose(fp);
    }
    
    strcpy(packages, "Unknown");
}

void capitalize(char *str) {
    if (str[0]) str[0] = toupper(str[0]);
    for (int i = 1; str[i]; i++) {
        if (str[i-1] == ' ') str[i] = toupper(str[i]);
    }
}

int display_logo(const char* distro_name) {
    char logo_path[MAX_PATH];
    char distro_lower[64];
    strncpy(distro_lower, distro_name, sizeof(distro_lower));
    for (int i = 0; distro_lower[i]; i++) distro_lower[i] = tolower(distro_lower[i]);
    
    snprintf(logo_path, MAX_PATH, "%s/.config/wefetch/logos/%s.txt", getenv("HOME"), distro_lower);
    
    FILE *fp = fopen(logo_path, "r");
    if (!fp) {
        snprintf(logo_path, MAX_PATH, "/usr/share/wefetch/logos/%s.txt", distro_lower);
        fp = fopen(logo_path, "r");
    }
    
    if (!fp) return 0;
    
    char line[256];
    int line_count = 0;
    while (fgets(line, sizeof(line), fp)) {
        line[strcspn(line, "\n")] = 0;
        printf("%s%s\033[0m\n", ascii_color, line);
        line_count++;
    }
    fclose(fp);
    return line_count;
}

void display_info(const char* distro_name) {
    char* init_system = get_init_system();
    
    char distro_display[64];
    strncpy(distro_display, distro_name, sizeof(distro_display));
    capitalize(distro_display);
    
    char kernel[128] = "Unknown";
    char username[64] = "Unknown";
    char packages[64] = "Unknown";
    char shell[64] = "Unknown";
    
    FILE *fp = popen("uname -r", "r");
    if (fp) {
        fgets(kernel, sizeof(kernel), fp);
        kernel[strcspn(kernel, "\n")] = 0;
        pclose(fp);
    }
    
    char* user = getenv("USER");
    if (user) strcpy(username, user);
    
    get_package_info(packages, sizeof(packages));
    
    char* shell_path = getenv("SHELL");
    if (shell_path) {
        char* slash = strrchr(shell_path, '/');
        if (slash) strcpy(shell, slash + 1);
        else strcpy(shell, shell_path);
    }
    
    int logo_lines = display_logo(distro_name);
    if (logo_lines > 0) {
        for (int i = logo_lines; i < 6; i++) printf("\n");
        
        printf("\033[1;34m\033[0m  %s%s\033[0m\n", ascii_color, distro_display);
        printf("\033[1;33m\033[0m  \033[1;37m%s\033[0m\n", kernel);
        printf("\033[1;35m\033[0m  \033[1;37m%s\033[0m\n", username);
        printf("\033[1;31m󰏗\033[0m  \033[1;37m%s\033[0m\n", packages);
        printf("\033[1;32m󰒍\033[0m  \033[1;37m%s\033[0m\n", init_system);
        printf("\033[1;36m\033[0m  \033[1;37m%s\033[0m\n", shell);
    } else {
        printf("Logo for %s not found\n", distro_display);
    }
}

void create_dirs() {
    char logos_dir[MAX_PATH];
    snprintf(logos_dir, MAX_PATH, "%s/.config/wefetch/logos", getenv("HOME"));
    
    struct stat st = {0};
    if (stat(logos_dir, &st) == -1) {
        char config_dir[MAX_PATH];
        snprintf(config_dir, MAX_PATH, "%s/.config", getenv("HOME"));
        mkdir(config_dir, 0755);
        
        char wefetch_dir[MAX_PATH];
        snprintf(wefetch_dir, MAX_PATH, "%s/.config/wefetch", getenv("HOME"));
        mkdir(wefetch_dir, 0755);
        
        mkdir(logos_dir, 0755);
    }
}

int main(int argc, char *argv[]) {
    create_dirs();
    load_config();
    
    char* distro_name = NULL;
    
    if (argc == 3 && strcmp(argv[1], "--distro") == 0) {
        distro_name = argv[2];
    } else if (argc == 1) {
        if (strlen(default_distro) > 0) {
            distro_name = default_distro;
        } else {
            printf("Set default distribution in ~/.config/wefetch/wefetch.conf\n");
            printf("Example: default_distro=artix\n");
            printf("Or use: %s --distro <distro_name>\n", argv[0]);
            return 1;
        }
    } else {
        printf("Usage: %s [--distro <distro_name>]\n", argv[0]);
        return 1;
    }
    
    display_info(distro_name);
    return 0;
}
