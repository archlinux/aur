#include <stdio.h>
#include <stdbool.h>
#include <string.h>

#define NO_FORMAT "\033[0m"
#define BOLD "\033[1m"
#define GREEN "\033[38;5;10m"
#define RED "\033[38;5;203m"
#define YELLOW "\033[38;5;226m"

const char *authors_file_name = ".gitauthors";

const char *title =
"           _ _                 _\n"
"      __ _(_) |_   _ __   __ _(_)_ __\n"
"     / _` | | __| | '_ \\ / _` | | '__|\n"
"    | (_| | | |_  | |_) | (_| | | |\n"
"     \\__, |_|\\__| | .__/ \\__,_|_|_|\n"
"     |___/        |_|\n"
"   -------------------------------------\n\n"
;

int init();
int prompt_add_author(void);
int add_author();
int select_authors();
void print_help();
void print_title();

int main(int argc, char *argv[]) {
    if (argc < 2) {
        select_authors();
    } else {
        const char *param = argv[1];
        if (strcmp("add", param) == 0) {
            int added = prompt_add_author();
            printf("%sAuthors added: %d%s\n", GREEN, added, NO_FORMAT);
        } else if (strcmp("init", param) == 0) {
            init();
        } else if (strcmp("help", param) == 0) {
            print_help();
        } else {
            printf("%sInvalid input - run the help command to see parameter options.%s", RED, NO_FORMAT);
        }
    }
    return 0;
}

/**
 * 
 */
int init() {
    print_title();

    // Add authors.
    if (prompt_add_author() > 0) {
        // Select authors if any were added.
        return select_authors();
    }
    return -1;
}

/**
 * Asks the user if they want to add an author, until they explicitly exit.
 * @return The number of authors added. 
 */
int prompt_add_author(void) {
    int count = 1;
    while (add_author() == 0) {
        printf("%s\nPress enter to add an author, or q to exit:%s ", RED, NO_FORMAT);
        // Exit if the user only enters q.
        if (getchar() == 'q') {
            break;
        }
        count++;
    }
    return count;
}

/**
 * Adds an author entry to the authors file.
 * @return 0 if an author was added successfully.
 */
int add_author() {
    // Prompt for author name.
    char author_name[BUFSIZ];
    printf("%sEnter author's full name:%s ", GREEN, NO_FORMAT);
    fgets(author_name, BUFSIZ, stdin);
    author_name[strlen(author_name) - 1] = '\0';

    // Prompt for author email.
    char author_email[BUFSIZ];
    printf("\n%sEnter author's email:%s ", GREEN, NO_FORMAT);
    fgets(author_email, BUFSIZ, stdin);
    author_email[strlen(author_email) - 1] = '\0';

    if (author_name == NULL || author_email == NULL) {
        printf("%sNo author added - exiting.%s", RED, NO_FORMAT);
        return -1;
    }

    // Open authors file for appending.
    FILE *authors_file = fopen(authors_file_name, "a+");
    // TODO: Check if file was opened.

    // Create entry format.
    char *entry = strcat(author_name, " <");
    strcat(entry, author_email);
    strcat(entry,  ">\n");

    // Write entry to the file.
    fputs(entry, authors_file);

    // Close file on exit.
    return fclose(authors_file);
}

/**
 * Selects the author and (options) co-author of future commits.
 * @return 0 if an author was selected successfully.
 */
int select_authors() {
    FILE *authors_file = fopen(authors_file_name, "r");
    
    // Check if authors file exists.
    if (authors_file == NULL) {
        printf("%sFile %s not in directory.\n", RED, authors_file_name);
        printf("Run with the init parameter to create the file and add code authors.%s\n", NO_FORMAT);
        return -1;
    }

    // TODO: Display authors on each line to select for author, then co-author.
    fclose(authors_file);
    return -1;
}

void print_help() {
    printf("%s%sCommands:%s\n\n", RED, BOLD, NO_FORMAT);
    printf("   %s<no command>%s - Select an author and optional co-author which exists in %s\n", GREEN, NO_FORMAT, authors_file_name);
    printf("   %sinit%s         - Initiate the setup for git pair\n", GREEN, NO_FORMAT);
    printf("   %sadd%s          - Add an author to your %s file for selection\n", GREEN, NO_FORMAT, authors_file_name);
    printf("   %shelp%s         - Display this message\n", GREEN, NO_FORMAT);
}

void print_title() {
    printf("%s%s%s", YELLOW, title, NO_FORMAT);
}