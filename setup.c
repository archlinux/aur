    /*************************************
     Terminal Notes Utility written in C
    *************************************
    *  Simple: Create and manage notes from the terminal
    *************************************
    * Developed and engineered by 
    * Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
    * Computer Science Engineer
    * Chile
    *************************************
    *************************************
     * Instructions to create the setup binary:
     *
     * 1. Compile the source code:
     *    gcc -o setup setup.c
     *
     * 2. Run the compiled binary:
     *    ./setup
     *
     * Please make sure to have the necessary dependencies installed before compiling the code.
     * Refer to the documentation for more information.
     *************************************/


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

void printLogo() {
    printf("  ╔═══════════════════════════════════════╗\n");
    printf("  ║                                       ║\n");
    printf("  ║   ______   __     __  ________        ║\n");
    printf("  ║  /      \\ /  \\   /  |/        |       ║\n");
    printf("  ║ |  $$$$$$\\\\$$\\ /  $$|  $$$$$$$       ║\n");
    printf("  ║ | $$  | $$ \\$$\\  $$ | $$  | $$       ║\n");
    printf("  ║ | $$  | $$  \\$$\\$$  | $$  | $$       ║\n");
    printf("  ║ | $$ _| $$   \\$$$  _| $$  | $$       ║\n");
    printf("  ║ | $$/ \\ $$    \\$  /  | $$  | $$       ║\n");
    printf("  ║  \\$$ $$\\$$     \\_/   \\$$   \\$$       ║\n");
    printf("  ║    \\$$$  \\                          ║\n");
    printf("  ║                                       ║\n");
    printf("  ║   ~ Term Notes ~                      ║\n");
    printf("  ║   Developed with ❤️ by               ║\n");
    printf("  ║   Felipe Alfonso González L.         ║\n");
    printf("  ║   Computer Science Engineer          ║\n");
    printf("  ║   Chile                              ║\n");
    printf("  ║                                       ║\n");
    printf("  ║   Contact: f.alfonso@res-ear.ch       ║\n");
    printf("  ║   Licensed under GNU/GPL and MIT      ║\n");
    printf("  ║   GitHub: github.com/felipealfonsog   ║\n");
    printf("  ║   LinkedIn: linkedin.com/in/felipealfonsog  ║\n");
    printf("  ║                                       ║\n");
    printf("  ╚═══════════════════════════════════════╝\n");
    printf("\n");
}

void printBoxedText(const char* text) {
    int len = strlen(text);
    int borderSize = len + 4;

    printf(" ╔");
    for (int i = 0; i < borderSize; i++) {
        printf("═");
    }
    printf("╗\n");

    printf(" ║  %s  ║\n", text);

    printf(" ╚");
    for (int i = 0; i < borderSize; i++) {
        printf("═");
    }
    printf("╝\n\n");
}

void createDirectories() {
    const char* notesDir = "notes";
    const char* archiveDir = "archive";

    struct stat st = {0};

    if (stat(notesDir, &st) == -1) {
        if (mkdir(notesDir, 0700) != 0) {
            printf("Failed to create directory: %s\n", notesDir);
            exit(1);
        } else {
            printf("Created directory: %s\n", notesDir);
        }
    }

    if (stat(archiveDir, &st) == -1) {
        if (mkdir(archiveDir, 0700) != 0) {
            printf("Failed to create directory: %s\n", archiveDir);
            exit(1);
        } else {
            printf("Created directory: %s\n", archiveDir);
        }
    }
}

void installDependencies() {
    // Verificar e instalar dependencias (Vim, Nano)
    const char* vimCommand = "which vim > /dev/null";
    const char* nanoCommand = "which nano > /dev/null";

    if (system(vimCommand) != 0) {
        printf("Vim not found. Installing Vim...\n");

        #if defined(__linux__)
            #if defined(__arch__)
                system("sudo pacman -S vim");
            #else
                system("sudo apt-get install vim");
            #endif
        #elif defined(__APPLE__)
            system("brew install vim");
        #endif
    }

    if (system(nanoCommand) != 0) {
        printf("Nano not found. Installing Nano...\n");

        #if defined(__linux__)
            #if defined(__arch__)
                system("sudo pacman -S nano");
            #else
                system("sudo apt-get install nano");
            #endif
        #elif defined(__APPLE__)
            system("brew install nano");
        #endif
    }
}

void installTermNotes(char* destinationPath) {
    const char* termNotesFileName = "term_notes";

    char command[256];
    snprintf(command, sizeof(command), "cp %s/%s %s", "./", termNotesFileName, destinationPath);
    system(command);

    printf("Term Notes installed successfully!\n");
    printf("You can now run 'termnotes' command in the terminal to execute the program.\n");
}

int main() {
    printLogo();

    createDirectories();

    printf("Welcome to the Term Notes installer!\n");

    printf("Installing dependencies...\n");
    installDependencies();

    printf("Choose the installation directory:\n");
    printf("1. /usr/local/bin (System-wide)\n");
    printf("2. $HOME/bin (User-specific)\n");
    printf("0. Exit\n");
    printf("Enter your choice: ");
    
    int choice;
    scanf("%d", &choice);
    
    char destinationPath[256];
    switch (choice) {
        case 1:
            snprintf(destinationPath, sizeof(destinationPath), "/usr/local/bin");
            break;
        case 2:
            snprintf(destinationPath, sizeof(destinationPath), "%s/bin", getenv("HOME"));
            break;
        case 0:
            printf("Exiting installer...\n");
            return 0;
        default:
            printf("Invalid choice. Exiting installer...\n");
            return 0;
    }

    installTermNotes(destinationPath);

    printBoxedText("Please open a new shell or terminal session to use Term Notes.");

    return 0;
}
