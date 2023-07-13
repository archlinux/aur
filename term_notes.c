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

#define MAX_NOTES 100

typedef struct {
    int id;
    char content[100];
} Note;

void createFiles() {
    FILE *file = fopen("notes.txt", "r");
    if (file == NULL) {
        file = fopen("notes.txt", "w");
        if (file != NULL) {
            fclose(file);
            printf("Created notes.txt\n");
        } else {
            fprintf(stderr, "Unable to create notes.txt\n");
        }
    } else {
        fclose(file);
    }
}

void addNote() {
    fflush(stdin);

    printf("Enter the note content: ");
    char content[100];
    fgets(content, sizeof(content), stdin);

    printf("Choose the editor (1. Nano, 2. Vim): ");
    int editorChoice;
    scanf("%d", &editorChoice);

    char tempFileName[20];
    sprintf(tempFileName, "temp_note_%d.txt", getpid());

    FILE *tempFile = fopen(tempFileName, "w");
    if (tempFile == NULL) {
        fprintf(stderr, "Unable to create temporary file.\n");
        return;
    }
    fputs(content, tempFile);
    fclose(tempFile);

    char command[100];
    if (editorChoice == 1) {
        sprintf(command, "nano %s", tempFileName);
    } else if (editorChoice == 2) {
        sprintf(command, "vim %s", tempFileName);
    } else {
        fprintf(stderr, "Invalid editor choice.\n");
        remove(tempFileName);
        return;
    }

    system(command);

    FILE *file = fopen("notes.txt", "a");
    if (file != NULL) {
        fseek(file, 0, SEEK_END);
        int id = ftell(file) / sizeof(Note) + 1;

        Note newNote;
        newNote.id = id;
        memset(newNote.content, 0, sizeof(newNote.content));

        tempFile = fopen(tempFileName, "r");
        if (tempFile == NULL) {
            fprintf(stderr, "Unable to open temporary file.\n");
            fclose(file);
            remove(tempFileName);
            return;
        }
        fgets(newNote.content, sizeof(newNote.content), tempFile);
        fclose(tempFile);

        fwrite(&newNote, sizeof(Note), 1, file);
        fclose(file);
        printf("Note added successfully with ID: %d\n", id);

        remove(tempFileName);
    } else {
        fprintf(stderr, "Unable to open the notes file.\n");
        remove(tempFileName);
    }
}

void editNote() {
    fflush(stdin);

    FILE *file = fopen("notes.txt", "r+");
    if (file != NULL) {
        Note note;
        int count = 0;
        while (fread(&note, sizeof(Note), 1, file) == 1) {
            printf("%d. Note ID: %d\n", count + 1, note.id);
            count++;
        }
        fclose(file);

        if (count == 0) {
            printf("No notes found.\n");
            return;
        }

        int choice;
        printf("Enter the note number to edit: ");
        scanf("%d", &choice);

        if (choice < 1 || choice > count) {
            printf("Invalid note number.\n");
            return;
        }

        int selectedID = 0;
        file = fopen("notes.txt", "r");
        if (file != NULL) {
            int currentIndex = 0;
            while (fread(&note, sizeof(Note), 1, file) == 1) {
                currentIndex++;
                if (currentIndex == choice) {
                    selectedID = note.id;
                    break;
                }
            }
            fclose(file);
        } else {
            fprintf(stderr, "Unable to open the notes file.\n");
            return;
        }

        file = fopen("notes.txt", "r+");
        if (file != NULL) {
            Note currentNote;
            int found = 0;
            while (fread(&currentNote, sizeof(Note), 1, file) == 1) {
                if (currentNote.id == selectedID) {
                    found = 1;

                    printf("Choose the editor (1. Nano, 2. Vim): ");
                    int editorChoice;
                    scanf("%d", &editorChoice);

                    char tempFileName[20];
                    sprintf(tempFileName, "temp_note_%d.txt", getpid());

                    FILE *tempFile = fopen(tempFileName, "w");
                    if (tempFile == NULL) {
                        fprintf(stderr, "Unable to create temporary file.\n");
                        fclose(file);
                        return;
                    }
                    fputs(currentNote.content, tempFile);
                    fclose(tempFile);

                    char command[100];
                    if (editorChoice == 1) {
                        sprintf(command, "nano %s", tempFileName);
                    } else if (editorChoice == 2) {
                        sprintf(command, "vim %s", tempFileName);
                    } else {
                        fprintf(stderr, "Invalid editor choice.\n");
                        remove(tempFileName);
                        fclose(file);
                        return;
                    }

                    system(command);

                    fseek(file, -sizeof(Note), SEEK_CUR);
                    Note updatedNote;
                    updatedNote.id = currentNote.id;
                    memset(updatedNote.content, 0, sizeof(updatedNote.content));

                    tempFile = fopen(tempFileName, "r");
                    if (tempFile == NULL) {
                        fprintf(stderr, "Unable to open temporary file.\n");
                        fclose(file);
                        remove(tempFileName);
                        return;
                    }
                    fgets(updatedNote.content, sizeof(updatedNote.content), tempFile);
                    fclose(tempFile);

                    fwrite(&updatedNote, sizeof(Note), 1, file);
                    fclose(file);
                    printf("Note updated successfully.\n");

                    remove(tempFileName);
                    break;
                }
            }
            if (!found) {
                printf("Note with ID %d not found.\n", selectedID);
            }
        } else {
            fprintf(stderr, "Unable to open the notes file.\n");
        }
    } else {
        fprintf(stderr, "Unable to open the notes file.\n");
    }
}

void deleteNote() {
    fflush(stdin);

    int id;
    printf("Enter the note ID to delete: ");
    scanf("%d", &id);

    FILE *file = fopen("notes.txt", "r");
    if (file != NULL) {
        FILE *tempFile = fopen("temp_notes.txt", "w");
        if (tempFile != NULL) {
            Note note;
            int found = 0;
            while (fread(&note, sizeof(Note), 1, file) == 1) {
                if (note.id != id) {
                    fwrite(&note, sizeof(Note), 1, tempFile);
                } else {
                    found = 1;
                }
            }
            fclose(file);
            fclose(tempFile);
            remove("notes.txt");
            rename("temp_notes.txt", "notes.txt");
            if (found) {
                printf("Note deleted successfully.\n");
            } else {
                printf("Note with ID %d not found.\n", id);
            }
        } else {
            fclose(file);
            fprintf(stderr, "Unable to create the temporary file.\n");
        }
    } else {
        fprintf(stderr, "Unable to open the notes file.\n");
    }
}

void deleteAllNotes() {
    fflush(stdin);

    printf("Are you sure you want to delete all notes? (Y/N): ");
    char confirm;
    scanf(" %c", &confirm);

    if (confirm == 'Y' || confirm == 'y') {
        FILE *file = fopen("notes.txt", "w");
        if (file != NULL) {
            fclose(file);
            printf("All notes deleted successfully.\n");
        } else {
            fprintf(stderr, "Unable to open the notes file.\n");
        }
    } else {
        printf("Deletion canceled.\n");
    }
}

void showAllNotes() {
    FILE *file = fopen("notes.txt", "r");
    if (file != NULL) {
        Note note;
        while (fread(&note, sizeof(Note), 1, file) == 1) {
            printf("Note ID: %d\n", note.id);
        }
        fclose(file);
    } else {
        fprintf(stderr, "Unable to open the notes file.\n");
    }
}

void showNote() {
    fflush(stdin);

    int id;
    printf("Enter the note ID to show: ");
    scanf("%d", &id);

    FILE *file = fopen("notes.txt", "r");
    if (file != NULL) {
        Note note;
        int found = 0;
        while (fread(&note, sizeof(Note), 1, file) == 1) {
            if (note.id == id) {
                printf("Note ID: %d\nContent: %s\n", note.id, note.content);
                found = 1;
                break;
            }
        }
        fclose(file);
        if (!found) {
            printf("Note with ID %d not found.\n", id);
        }
    } else {
        fprintf(stderr, "Unable to open the notes file.\n");
    }
}

void showNotesMenu() {
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

void notesMenu() {
    int option;
    do {
        showNotesMenu();
        printf("Enter an option: ");
        scanf("%d", &option);

        switch (option) {
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

void mainMenu() {
    int option;
    do {
        printf("**** Main Menu ****\n");
        printf("1. Notes\n");
        printf("0. Exit\n");
        printf("******************\n");
        printf("Enter an option: ");
        scanf("%d", &option);

        switch (option) {
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

int main() {
    printf("Welcome to the Notes Manager.\n");

    createFiles();
    mainMenu();

    return 0;
}
