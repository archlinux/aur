#include <ctype.h>
#include "iex.h"
#include "portfolio.h"

int main(int argc, char* argv[]) {
    if (argc == 1) {
        printf("No arguments used.\n");
        return 0;
    }
    portfolio_file_init();
    FILE* fp = fopen(portfolio_file, "a+");
    if (fp == NULL) {
        printf("Could not open portfolio file\n");
        free((void*) portfolio_file);
        return 1;
    }
    for (int i = 0; argv[2][i] != '\0'; i++)
        argv[2][i] = (char) toupper(argv[2][i]);
    if (argc == 5) {
        if (strcmp(argv[1], "add") == 0)
            portfolio_modify(argv[2], strtod(argv[3], NULL), strtod(argv[4], NULL), fp, ADD);
        else if (strcmp(argv[1], "rm") == 0)
            portfolio_modify(argv[2], strtod(argv[3], NULL), strtod(argv[4], NULL), fp, REMOVE);
        else if (strcmp(argv[1], "set") == 0)
            portfolio_modify(argv[2], strtod(argv[3], NULL), strtod(argv[4], NULL), fp, SET);
        else
            printf("Invalid argument.\n");
    } else {
        if (argc == 3 && strcmp(argv[1], "check") == 0) {
            if (strcmp(argv[2], "ALL") == 0)
                portfolio_print_all(fp);
            else portfolio_print_stock(argv[2], fp);
        } else printf("Invalid arguments\n");
    }

    free((void*) portfolio_file);
    fclose(fp);
    return 0;
}