#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_PACKAGES 30000
#define MAX_NAME_LEN 256
#define MAX_SUGGESTIONS 15

char packages[MAX_PACKAGES][MAX_NAME_LEN];
char suggestions[MAX_SUGGESTIONS][MAX_NAME_LEN];
int package_count = 0;
int sugg_count = 0;

int distance(const char *s1, const char *s2) {
    int len1 = strlen(s1), len2 = strlen(s2);
    int matrix[len1 + 1][len2 + 1];
    for (int i = 0; i <= len1; i++) matrix[i][0] = i;
    for (int j = 0; j <= len2; j++) matrix[0][j] = j;
    for (int i = 1; i <= len1; i++) {
        for (int j = 1; j <= len2; j++) {
            int cost = (s1[i-1] == s2[j-1]) ? 0 : 1;
            int a = matrix[i-1][j] + 1;
            int b = matrix[i][j-1] + 1;
            int c = matrix[i-1][j-1] + cost;
            matrix[i][j] = (a < b) ? (a < c ? a : c) : (b < c ? b : c);
        }
    }
    return matrix[len1][len2];
}

int main(int argc, char *argv[]) {
    FILE *fp = popen("pacman -Sql 2>/dev/null", "r");
    if (fp) {
        while (package_count < MAX_PACKAGES && fgets(packages[package_count], MAX_NAME_LEN, fp)) {
            packages[package_count][strcspn(packages[package_count], "\n")] = 0;
            package_count++;
        }
        pclose(fp);
    }

    if (argc >= 3 && strcmp(argv[1], "-S") == 0) {
        char *target = argv[argc-1];
        int found_exact = 0;
        for(int i = 0; i < package_count; i++) {
            if (strcmp(packages[i], target) == 0) { found_exact = 1; break; }
        }

        if (!found_exact) {
            printf("\n[Losy] Пакет '%s' не найден. Выберите вариант:\n", target);
            
            // 1. Собираем из репо
            for (int i = 0; i < package_count && sugg_count < 5; i++) {
                if (distance(target, packages[i]) <= 2) {
                    strcpy(suggestions[sugg_count], packages[i]);
                    printf(" %d) %s (repo)\n", sugg_count + 1, suggestions[sugg_count]);
                    sugg_count++;
                }
            }

            // 2. Собираем из AUR
            char aur_cmd[512];
            sprintf(aur_cmd, "yay -Ssq %s | head -n 5", target);
            FILE *afp = popen(aur_cmd, "r");
            if (afp) {
                while (sugg_count < MAX_SUGGESTIONS && fgets(suggestions[sugg_count], MAX_NAME_LEN, afp)) {
                    suggestions[sugg_count][strcspn(suggestions[sugg_count], "\n")] = 0;
                    printf(" %d) %s (aur)\n", sugg_count + 1, suggestions[sugg_count]);
                    sugg_count++;
                }
                pclose(afp);
            }

            if (sugg_count > 0) {
                printf("\nВведите номер (или 0 для отмены): ");
                int choice;
                if (scanf("%d", &choice) == 1 && choice > 0 && choice <= sugg_count) {
                    char install_cmd[512];
                    sprintf(install_cmd, "yay -S %s", suggestions[choice-1]);
                    system(install_cmd);
                }
            } else {
                printf("Ничего не найдено.\n");
            }
            return 0;
        }
    }

    char cmd[1024] = "/usr/bin/pacman";
    for (int i = 1; i < argc; i++) {
        strcat(cmd, " ");
        strcat(cmd, argv[i]);
    }
    return system(cmd);
}
