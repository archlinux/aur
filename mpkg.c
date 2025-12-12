#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void usage() {
    printf("Usage:\n");
    printf("  -i   Install package\n");
    printf("  -r   Remove package\n");
    printf("     example: mpkg -i <pkg>\n");
    printf("     example: mpkg -r <pkg>\n");
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        usage();
        return 1;
    }

    if (strcmp(argv[1], "-i") == 0) {
        char command[512];
        snprintf(command, sizeof(command),
                 "git clone https://aur.archlinux.org/cgit/aur.git/snapshot/%s.tar.gz",
                 argv[2]);

        int result = system(command);
        if (result != 0) {
            system("clear");
            printf("Package not found.\n");
            return 1;
        }

        snprintf(command, sizeof(command),
                 "tar -xvzf %s.tar.gz && cd %s && makepkg -si",
                 argv[2], argv[2]);
        result = system(command);
        if (result != 0) {
            printf("An error occurred while installing the package.\n");
            return 1;
        }
    } else if (strcmp(argv[1], "-r") == 0) {
        char command[256];
        snprintf(command, sizeof(command), "sudo pacman -Rns %s", argv[2]);
        int result = system(command);
        if (result != 0) {
            printf("An error occurred while removing the package.\n");
            return 1;
        }
    } else {
        usage();
        return 1;
    }

    return 0;
}

