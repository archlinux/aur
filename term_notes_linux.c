/*************************************

▀▀█▀▀ █▀▀ █▀▀█ █▀▄▀█ ░░ ▒█▄░▒█ █▀▀█ ▀▀█▀▀ █▀▀ █▀▀
░▒█░░ █▀▀ █▄▄▀ █░▀░█ ▀▀ ▒█▒█▒█ █░░█ ░░█░░ █▀▀ ▀▀█
░▒█░░ ▀▀▀ ▀░▀▀ ▀░░░▀ ░░ ▒█░░▀█ ▀▀▀▀ ░░▀░░ ▀▀▀ ▀▀▀


 Terminal Notes Utility written in C
 *************************************
 *  Simple: Create and manage notes from the terminal
 *************************************
 * Developed and engineered by
 * Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
 * Computer Science Engineer
 * Chile
 *************************************
 * To create the term_notes binary:
 *
 * 1. Extract the source code if needed:
 *    tar -xf term_notes.tar.gz
 *
 * 2. Compile the source code:
 *    gcc -o term_notes term_notes.c
 *
 * 3. Elevate to superuser (if necessary):
 *    sudo su
 *
 * 4. Move the binary to the system bin directory:
 *    mv term_notes /usr/local/bin/
 *    
 *     sudo cp term-notes-linux /usr/local/bin/term-notes
 * 
 *
 * 5. Exit superuser mode:
 *    exit
 *
 * 6. You can now run term_notes from the terminal:
 *    term_notes
 *
 *************************************
 * Please note that term_notes requires the following dependencies:
 * - Nano: A text editor (sudo apt-get install nano)
 * - Vim: A text editor (sudo apt-get install vim)
 *
 * If any of these dependencies are not installed, please install them
 * using the provided commands.
 *
 * For more information, please refer to the documentation.
 *************************************
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <ctype.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <libgen.h>
#include <errno.h>



#define PATH_MAX 4096

char* getBinaryPath() {
    static char binaryPath[PATH_MAX];
    ssize_t bytesRead = readlink("/proc/self/exe", binaryPath, PATH_MAX);
    if (bytesRead >= 0) {
        binaryPath[bytesRead] = '\0';
        return binaryPath;
    }
    return NULL;
}



#define MAX_NOTES 100

typedef struct
{
    int id;
    char content[100];
} Note;

char *getConfigPath()
{
    char *configPath = (char *)malloc(PATH_MAX);
    const char *homeDir = getenv("HOME");
    snprintf(configPath, PATH_MAX, "%s/.config", homeDir);
    return configPath;
}


void createFiles()
{
    char notesFilePath[PATH_MAX];
    snprintf(notesFilePath, sizeof(notesFilePath), "%s/notes.txt", getConfigPath());
    struct stat st;
    FILE *file = fopen(notesFilePath, "rb");
    if (file == NULL)
    {
        file = fopen(notesFilePath, "wb");
        if (file != NULL)
        {
            fclose(file);
            printf("Created notes file at %s\n", notesFilePath);
        }
        else
        {
            fprintf(stderr, "Error creating notes file: %s\n", strerror(errno));
            return;
        }
    }
    else
    {
        fclose(file);
    }
}




void moveBinaryToDestination() {
    char binaryPath[PATH_MAX];
    ssize_t len = readlink("/proc/self/exe", binaryPath, sizeof(binaryPath));
    if (len == -1) {
        fprintf(stderr, "Error retrieving binary path.\n");
        return;
    }
    binaryPath[len] = '\0';

    struct stat st;
    char destDirectory[PATH_MAX];

#if defined(__linux__)
    if (stat("/etc/arch-release", &st) == 0) {
        snprintf(destDirectory, sizeof(destDirectory), "/usr/local/bin/");
    } else if (stat("/etc/debian_version", &st) == 0) {
        snprintf(destDirectory, sizeof(destDirectory), "/usr/bin/");
    } else {
        snprintf(destDirectory, sizeof(destDirectory), "/usr/local/bin/");
    }
#elif defined(__APPLE__)
    snprintf(destDirectory, sizeof(destDirectory), "/usr/local/bin/");
#else
    snprintf(destDirectory, sizeof(destDirectory), ".");
#endif

    char destPath[PATH_MAX];
    snprintf(destPath, sizeof(destPath), "%s/term-notes", destDirectory);

    if (rename(binaryPath, destPath) == 0) {
        printf("term-notes binary moved to %s\n", destDirectory);
    } else {
        fprintf(stderr, "Failed to move term-notes binary to %s\n", destDirectory);
    }
}


void addNote()
{
    printf("Enter the note content: ");
    char content[100];
    fgets(content, sizeof(content), stdin);

    char notesFilePath[PATH_MAX];
    snprintf(notesFilePath, sizeof(notesFilePath), "%s/notes.txt", getConfigPath());

    FILE *file = fopen(notesFilePath, "r+");
    if (file != NULL)
    {
        Note note;
        int lastID = 0;

      
        while (fread(&note, sizeof(Note), 1, file) == 1)
        {
            lastID = note.id;
        }

        int id = lastID + 1;
        fseek(file, 0, SEEK_END);

        Note newNote;
        newNote.id = id;
        strncpy(newNote.content, content, sizeof(newNote.content) - 1);

        fwrite(&newNote, sizeof(Note), 1, file);
        fclose(file);
        printf("Note added successfully with ID: %d\n", id);

     
        char tempContentPath[PATH_MAX];
        snprintf(tempContentPath, sizeof(tempContentPath), "%s/%d.txt", getConfigPath(), id);
        FILE *tempContentFile = fopen(tempContentPath, "w");
        if (tempContentFile == NULL)
        {
            fprintf(stderr, "Unable to create temporary file for editing.\n");
            return;
        }

        fputs(newNote.content, tempContentFile);
        fclose(tempContentFile);

        int editorChoice;
        printf("Choose the editor (1. Nano, 2. Vim, 3. Neovim): ");
        while (scanf("%d", &editorChoice) != 1 || editorChoice < 1 || editorChoice > 3)
        {
            while (getchar() != '\n')
                ;
            printf("Invalid editor choice. Please enter a valid number (1, 2, or 3).\n");
            printf("Choose the editor (1. Nano, 2. Vim, 3. Neovim): ");
        }

        char command[100];
        if (editorChoice == 1)
        {
            if (!isatty(fileno(stdin)) || !isatty(fileno(stdout)))
            {
                fprintf(stderr, "Error: Cannot run Nano editor. Input or output is not a terminal.\n");
                remove(tempContentPath);
                return;
            }
            sprintf(command, "nano %s", tempContentPath);
        }
        else if (editorChoice == 2)
        {
            if (!isatty(fileno(stdin)) || !isatty(fileno(stdout)))
            {
                fprintf(stderr, "Error: Cannot run Vim editor. Input or output is not a terminal.\n");
                remove(tempContentPath);
                return;
            }
            sprintf(command, "vim %s", tempContentPath);
        }
        else if (editorChoice == 3)
        {
            if (!isatty(fileno(stdin)) || !isatty(fileno(stdout)))
            {
                fprintf(stderr, "Error: Cannot run Neovim editor. Input or output is not a terminal.\n");
                remove(tempContentPath);
                return;
            }
            sprintf(command, "nvim %s", tempContentPath);
        }
        else
        {
            fprintf(stderr, "Invalid editor choice.\n");
            remove(tempContentPath);
            return;
        }

        system(command);

        tempContentFile = fopen(tempContentPath, "r");
        if (tempContentFile == NULL)
        {
            fprintf(stderr, "Unable to read temporary file for editing.\n");
            remove(tempContentPath);
            return;
        }

        char editedContent[100];
        if (fgets(editedContent, sizeof(editedContent), tempContentFile) == NULL)
        {
            fprintf(stderr, "Error reading edited content.\n");
            fclose(tempContentFile);
            remove(tempContentPath);
            return;
        }
        fclose(tempContentFile);

        remove(tempContentPath);

        file = fopen(notesFilePath, "r+");
        if (file != NULL)
        {
            int currentIndex = 0;
            while (fread(&note, sizeof(Note), 1, file) == 1)
            {
                currentIndex++;
                if (currentIndex == id)
                {
                    fseek(file, -sizeof(Note), SEEK_CUR);
                    strcpy(note.content, editedContent); 
                    fwrite(&note, sizeof(Note), 1, file);
                    break;
                }
            }
            fclose(file);
            printf("Note edited successfully.\n");
        }
        else
        {
            fprintf(stderr, "Unable to open the notes file for editing.\n");
        }
    }
    else
    {
        fprintf(stderr, "Unable to open the notes file.\n");
    }
}


void editNote()
{
    fflush(stdin);

    char notesFilePath[PATH_MAX];
    snprintf(notesFilePath, sizeof(notesFilePath), "%s/notes.txt", getConfigPath());

    FILE *file = fopen(notesFilePath, "r+");
    if (file != NULL)
    {
        Note note;
        int count = 0;
        while (fread(&note, sizeof(Note), 1, file) == 1)
        {
            printf("%d. Note ID: %d\n", count + 1, note.id);
            count++;
        }
        rewind(file);

        if (count == 0)
        {
            printf("No notes found.\n");
            fclose(file);
            return;
        }

        int choice;
        printf("Enter the note number to edit: ");
        while (scanf("%d", &choice) != 1)
        {
            while (getchar() != '\n')
                ;
            printf("Invalid note number. Please enter a number.\n");
            printf("Enter the note number to edit: ");
        }

        if (choice < 1 || choice > count)
        {
            printf("Invalid note number.\n");
            fclose(file);
            return;
        }

        FILE *tempFile = tmpfile();
        if (tempFile == NULL)
        {
            fprintf(stderr, "Unable to create temporary file.\n");
            fclose(file);
            return;
        }

        int currentIndex = 0;
        while (fread(&note, sizeof(Note), 1, file) == 1)
        {
            currentIndex++;
            if (currentIndex != choice)
            {
                fwrite(&note, sizeof(Note), 1, tempFile);
            }
            else
            {
            
                Note selectedNote = note;

                char command[100];

           
                char tempNoteFilePath[PATH_MAX];
                snprintf(tempNoteFilePath, sizeof(tempNoteFilePath), "%s/temp_note.txt", getConfigPath());
                FILE *tempNoteFile = fopen(tempNoteFilePath, "w");
                if (tempNoteFile == NULL)
                {
                    fprintf(stderr, "Unable to create temporary file for editing.\n");
                    fclose(file);
                    fclose(tempFile);
                    return;
                }

                fputs(selectedNote.content, tempNoteFile);
                fclose(tempNoteFile);

      
                printf("Choose the editor (1. Nano, 2. Vim, 3. Neovim): ");
                int editorChoice;
                while (scanf("%d", &editorChoice) != 1 || editorChoice < 1 || editorChoice > 3)
                {
                    while (getchar() != '\n')
                        ;
                    printf("Invalid editor choice. Please enter a valid number (1, 2, or 3).\n");
                    printf("Choose the editor (1. Nano, 2. Vim, 3. Neovim): ");
                }

                if (editorChoice == 1)
                {
                    sprintf(command, "nano %s", tempNoteFilePath);
                }
                else if (editorChoice == 2)
                {
                    sprintf(command, "vim %s", tempNoteFilePath);
                }
                else if (editorChoice == 3)
                {
                    sprintf(command, "nvim %s", tempNoteFilePath);
                }
                else
                {
                    fprintf(stderr, "Invalid editor choice.\n");
                    fclose(file);
                    fclose(tempFile);
                    remove(tempNoteFilePath);
                    return;
                }

                system(command);


                FILE *editedNoteFile = fopen(tempNoteFilePath, "r");
                if (editedNoteFile == NULL)
                {
                    fprintf(stderr, "Unable to read the edited note file.\n");
                    fclose(file);
                    fclose(tempFile);
                    remove(tempNoteFilePath);
                    return;
                }

                fseek(editedNoteFile, 0, SEEK_END);
                long size = ftell(editedNoteFile);
                fseek(editedNoteFile, 0, SEEK_SET);

             
                char editedContent[size];
                fread(editedContent, 1, size, editedNoteFile);
                fclose(editedNoteFile);
                strncpy(selectedNote.content, editedContent, sizeof(selectedNote.content));

            
                fwrite(&selectedNote, sizeof(Note), 1, tempFile);

              
                remove(tempNoteFilePath);
            }
        }

        fclose(file);
        remove(notesFilePath);

        file = fopen(notesFilePath, "w");
        if (file == NULL)
        {
            fprintf(stderr, "Unable to create new notes file.\n");
            fclose(tempFile);
            return;
        }

        rewind(tempFile);
        while (fread(&note, sizeof(Note), 1, tempFile) == 1)
        {
            fwrite(&note, sizeof(Note), 1, file);
        }

        fclose(file);
        fclose(tempFile);
        printf("Note edited successfully.\n");
    }
    else
    {
        fprintf(stderr, "Unable to open the notes file.\n");
    }
}

void deleteNote()
{
    char notesFilePath[PATH_MAX];
    snprintf(notesFilePath, sizeof(notesFilePath), "%s/notes.txt", getConfigPath());

    fflush(stdin);

    FILE *file = fopen(notesFilePath, "r+");
    if (file != NULL)
    {
        Note note;
        int count = 0;
        while (fread(&note, sizeof(Note), 1, file) == 1)
        {
            printf("%d. Note ID: %d\n", count + 1, note.id);
            count++;
        }
        rewind(file);

        if (count == 0)
        {
            printf("No notes found.\n");
            fclose(file);
            return;
        }

        int choice;
        printf("Enter the note number to delete: ");
        while (scanf("%d", &choice) != 1)
        {
            while (getchar() != '\n')
                ;
            printf("Invalid note number. Please enter a number.\n");
            printf("Enter the note number to delete: ");
        }

        if (choice < 1 || choice > count)
        {
            printf("Invalid note number.\n");
            fclose(file);
            return;
        }

        FILE *tempFile = tmpfile();
        if (tempFile == NULL)
        {
            fprintf(stderr, "Unable to create temporary file.\n");
            fclose(file);
            return;
        }

        int currentIndex = 0;
        while (fread(&note, sizeof(Note), 1, file) == 1)
        {
            currentIndex++;
            if (currentIndex != choice)
            {
                fwrite(&note, sizeof(Note), 1, tempFile);
            }
        }

        fclose(file);
        remove(notesFilePath);

        file = fopen(notesFilePath, "w");
        if (file == NULL)
        {
            fprintf(stderr, "Unable to create new notes file.\n");
            fclose(tempFile);
            return;
        }

        rewind(tempFile);
        while (fread(&note, sizeof(Note), 1, tempFile) == 1)
        {
            fwrite(&note, sizeof(Note), 1, file);
        }

        fclose(file);
        fclose(tempFile);
        printf("Note deleted successfully.\n");
    }
    else
    {
        fprintf(stderr, "Unable to open the notes file.\n");
    }
}

void deleteAllNotes()
{
    char notesFilePath[PATH_MAX];
    snprintf(notesFilePath, sizeof(notesFilePath), "%s/notes.txt", getConfigPath());

    int confirm;
    printf("Are you sure you want to delete all notes? (1. Yes, 2. No): ");
    while (scanf("%d", &confirm) != 1 || (confirm != 1 && confirm != 2))
    {
        while (getchar() != '\n')
            ;
        printf("Invalid choice. Please enter 1 for Yes or 2 for No: ");
    }

    if (confirm == 1)
    {
        FILE *file = fopen(notesFilePath, "w");
        if (file != NULL)
        {
            fclose(file);
            printf("All notes deleted successfully.\n");
        }
        else
        {
            fprintf(stderr, "Unable to open the notes file.\n");
        }
    }
    else
    {
        printf("Delete all notes operation cancelled.\n");
    }
}

void showNote()
{
    char notesFilePath[PATH_MAX];
    snprintf(notesFilePath, sizeof(notesFilePath), "%s/notes.txt", getConfigPath());

    fflush(stdin);

    int id;
    printf("Enter the note ID to show: ");
    while (scanf("%d", &id) != 1)
    {
        while (getchar() != '\n')
            ;
        printf("Invalid note ID. Please enter a number.\n");
        printf("Enter the note ID to show: ");
    }

    FILE *file = fopen(notesFilePath, "r");
    if (file != NULL)
    {
        Note note;
        int found = 0;

        while (fread(&note, sizeof(Note), 1, file) == 1)
        {
            if (note.id == id)
            {
                printf("Note ID: %d\n", note.id);
                printf("Content: %s", note.content);
                found = 1;
                break;
            }
        }

        fclose(file);

        if (!found)
        {
            printf("Note with ID %d not found.\n", id);
        }
    }
    else
    {
        fprintf(stderr, "Unable to open the notes file.\n");
    }
}

void showAllNotes()
{
    char notesFilePath[PATH_MAX];
    snprintf(notesFilePath, sizeof(notesFilePath), "%s/notes.txt", getConfigPath());

    FILE *file = fopen(notesFilePath, "rb");
    if (file != NULL)
    {
        Note note;
        int noteCount = 0;

        while (fread(&note, sizeof(Note), 1, file) == 1)
        {
            printf("Note ID: %d\n", note.id);
            printf("Content: %s", note.content);
            noteCount++;
        }

        if (noteCount == 0)
        {
            printf("No notes found.\n");
        }

        fclose(file);
    }
    else
    {
        fprintf(stderr, "Unable to open the notes file.\n");
    }
}

void showNotesMenu()
{
    printf("**** Notes Menu ****\n");
    printf("1. Add a note\n");
    printf("2. Show all notes\n");
    printf("3. Show a note\n");
    printf("4. Edit a note\n");
    printf("5. Delete a note\n");
    printf("6. Delete all notes\n");
    printf("0. Back\n");
    printf("*******************\n");
}

void notesMenu()
{
    int option;
    do
    {
        showNotesMenu();
        printf("Enter an option: ");
        while (scanf("%d", &option) != 1)
        {
            while (getchar() != '\n')
                ;
            printf("Invalid option. Please enter a number.\n");
            printf("Enter an option: ");
        }

        switch (option)
        {
        case 1:
            addNote();
            break;
        case 2:
            showAllNotes();
            break;
        case 3:
            showNote();
            break;
        case 4:
            editNote();
            break;
        case 5:
            deleteNote();
            break;
        case 6:
            deleteAllNotes();
            break;
        case 0:
            printf("Returning to the main menu.\n");
            break;
        default:
            printf("Invalid option.\n");
            break;
        }
    } while (option != 0);
}

void mainMenu()
{
    int option;
    do
    {
        printf("**** Main Menu ****\n");
        printf("1. Notes\n");
        printf("0. Exit\n");
        printf("******************\n");
        printf("Enter an option: ");
        while (scanf("%d", &option) != 1)
        {
            while (getchar() != '\n')
                ;
            printf("Invalid option. Please enter a number.\n");
            printf("Enter an option: ");
        }

        switch (option)
        {
        case 1:
            notesMenu(); 
            break;
        case 0:
            printf("Goodbye.\n");
            break;
        default:
            printf("Invalid option.\n");
            break;
        }
    } while (option != 0);
}

void setFilePermissions(const char *filepath, mode_t permissions)
{
    if (chmod(filepath, permissions) == 0)
    {
        printf("File permissions changed successfully.\n");
    }
    else
    {
        fprintf(stderr, "Failed to change file permissions.\n");
    }
}

int main() {
    printf("\n\n"
           "▀▀█▀▀ █▀▀ █▀▀█ █▀▄▀█ ░░ ▒█▄░▒█ █▀▀█ ▀▀█▀▀ █▀▀ █▀▀ \n"
           "░▒█░░ █▀▀ █▄▄▀ █░▀░█ ▀▀ ▒█▒█▒█ █░░█ ░░█░░ █▀▀ ▀▀█ \n"
           "░▒█░░ ▀▀▀ ▀░▀▀ ▀░░░▀ ░░ ▒█░░▀█ ▀▀▀▀ ░░▀░░ ▀▀▀ ▀▀▀ \n"
           "\n");

    printf("\n\n"
           "╭────────────-----────── TERMS OF USE ──────────----------───╮\n"
           "│  This software is licensed under the MIT License.          │\n"
           "│  By Felipe Alfonso González - github.com/felipealfonsog    │\n"
           "│  Computer Science Engineer - Email: f.alfonso@res-ear.ch   │\n"
           "╰───────────────────────────────────────────────---------────╯\n"
           "\n");

    printf("Welcome to the Notes Manager.\n");

    createFiles();
    moveBinaryToDestination();

    char notesFilePath[PATH_MAX];
    snprintf(notesFilePath, sizeof(notesFilePath), "%s/notes.txt", getConfigPath());

    char binaryPath[PATH_MAX];
    ssize_t bufferSize = sizeof(binaryPath);
    if (readlink("/proc/self/exe", binaryPath, bufferSize) != -1)
    {
        printf("Binary path: %s\n", binaryPath);

        chmod(binaryPath, S_IRUSR | S_IXUSR);

        mainMenu();
    }
    else
    {
        fprintf(stderr, "Error retrieving binary path.\n");
        return 1;
    }

    return 0;
}
