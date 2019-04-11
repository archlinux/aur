#include <stdio.h>
#include <stdlib.h>
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
char **read_authors();
int set_author(char *name, char *email);
int set_co_author(char *name, char *email);
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
        printf("\n");
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
    author_name[strcspn(author_name, "\n")] = '\0';

    // Prompt for author email.
    char author_email[BUFSIZ];
    printf("%sEnter author's email:%s ", GREEN, NO_FORMAT);
    fgets(author_email, BUFSIZ, stdin);
    author_email[strcspn(author_email, "\n")] = '\0';

    if (author_name == NULL || author_email == NULL) {
        printf("%sNo author added - exiting.%s", RED, NO_FORMAT);
        return -1;
    }

    // Open authors file for appending.
    FILE *authors_file = fopen(authors_file_name, "a+");

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
    // Read info and parse.
    int length = 0;
    char **authors = read_authors(&length);

    // Display authors on each line to select for author, then co-author.
    for (int i = 0; i < length; i++) {
        printf("%s[%d]%s: %s\n", GREEN, i, NO_FORMAT, authors[i]);
    }

    printf("%sSelect the author:%s ", GREEN, NO_FORMAT);

    char *input;
    char *ptr;
    fgets(input, 255, stdin);
    // TODO: Seg fault here.
    long index = strtol(input, &ptr, 10);

    char *name = authors[index];
    char *email = authors[index];

    printf("Selected: %s", name);

    /*

    if (set_author(name, email) != 0) {
        return -1;
    }

    // TODO: Set co-author via commit-template

    */

   free(authors);
   return 0;
}

/**
 * @return All author entries in the authors file.
 */
char **read_authors(int *length) {
    FILE *authors_file = fopen(authors_file_name, "r");
    // Check if authors file exists.
    if (authors_file == NULL) {
        printf("%sFile %s not in directory.\n", RED, authors_file_name);
        printf("Run with the init parameter to create the file and add code authors.%s\n", NO_FORMAT);
        exit(1);
    }

    // Store all authors in array.
    char **authors = malloc(255 * sizeof(char*));
    char buff[255];
    int i;
    for (i = 0; fgets(buff, 255, authors_file); i++) {
        buff[strcspn(buff, "\n")] = '\0';
        authors[i] = malloc(strlen(buff) + 1);
        strcpy(authors[i], buff);
        
        // TODO: If i >= 255, realloc authors to be size + 255.
    }
    *length = i;
    fclose(authors_file);
    return authors;
}

int set_author(char *name, char *email) {
    // TODO: Set author via git config user.name and git config user.email
    return 0;
}

int set_co_author(char *name, char *email) {
    // TODO: Set co-author via commit.template
    return 0;
}

void print_help() {
    printf("%s%sCommands:%s\n\n", RED, BOLD, NO_FORMAT);
    printf("   %s<no command>%s - Select an author and optional co-author which exists in %s\n", GREEN, NO_FORMAT, authors_file_name);
    printf("   %sinit%s         - Initiate the setup for git pair\n", GREEN, NO_FORMAT);
    printf("   %sadd%s          - Add an author to your %s file for selection\n", GREEN, NO_FORMAT, authors_file_name);
    printf("   %shelp%s         - Display this message\n", GREEN, NO_FORMAT);
    printf("\n");
}

void print_title() {
    printf("%s%s%s", YELLOW, title, NO_FORMAT);
}