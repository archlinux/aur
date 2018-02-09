#include <ctype.h>
#include "api.h"
#include "portfolio.h"

int main(int argc, char* argv[]) {
    if (argc == 3 && strcmp(argv[1], "news") == 0) {
        if (strlen(argv[2]) <= 32 && strlen(argv[2]) > 1)
            news_print_top_three(argv[2]);
        else printf("Input invalid length.\n");
        return 0;
    }
    if (argc == 1 || argc == 4 || argc > 5) {
        printf("Invalid arguments. Type \"man tick\" for help.\n");
        return 0;
    }
    portfolio_file_init();
    FILE* fp = fopen(portfolio_file, "a+");
    if (fp == NULL) {
        printf("Could not open portfolio file\n");
        fclose(fp);
        free((void*) portfolio_file);
        return 0;
    }
    if (argc == 2 && strcmp(argv[1], "convert") == 0){
        portfolio_legacy_convert();
        free((void*) portfolio_file);
        fclose(fp);
        return 0;
    }
    for (int i = 0; argv[2][i] != '\0'; i++)
        argv[2][i] = (char) toupper(argv[2][i]);
    if (argc == 5) {
        if (strlen(argv[2]) > 16)
            printf("Invalid symbol.\n");
        else if (strlen(argv[3]) > 16 || strlen(argv[4]) > 16)
            printf("Value too large.\n");
        else if (strcmp(argv[1], "add") == 0)
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
            else free(portfolio_print_stock(argv[2], fp, NULL));
        } else printf("Invalid arguments.\n");
    }
    free((void*) portfolio_file);
    fclose(fp);
    return 0;
}