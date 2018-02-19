#include <ctype.h>
#include "api.h"
#include "portfolio.h"

void strtolower(char* str) {
    for (int i = 0; str[i] != '\0'; i++)
        str[i] = (char) tolower(str[i]);
}

void strtoupper(char* str) {
    for (int i = 0; str[i] != '\0'; i++)
        str[i] = (char) toupper(str[i]);
}

int main(int argc, char* argv[]) {
    if (argc < 2) {
        printf("Invalid arguments. Type \"man tick\" for help.\n");
        return 0;
    }
    char cmd[strlen(argv[1]) + 1];
    strcpy(cmd, argv[1]);
    strtolower(cmd);

    // Init/open portfolio
    portfolio_file_init();
    FILE* fp = fopen(portfolio_file, "a+");
    if (fp == NULL) {
        printf("Could not open portfolio file\n");
        free((void*) portfolio_file);
        return 0;
    }

    // Portfolio modify operation
    int modop = -1;

    // News
    if (strcmp(cmd, "news") == 0) {
        if (argc == 3 && strlen(argv[2]) <= 32 && strlen(argv[2]) > 1)
            news_print_top_three(argv[2]);
        else printf("Invalid symbol.\n");
    }
        //Convert
    else if (strcmp(cmd, "convert") == 0 && argc == 2)
        portfolio_legacy_convert();
        //Encrypt/decrypt
    else if (strcmp(argv[1], "encrypt") == 0 && argc == 2)
        portfolio_encrypt_decrypt(ENCRYPT, fp);
    else if (strcmp(argv[1], "decrypt") == 0 && argc == 2)
        portfolio_encrypt_decrypt(DECRYPT, fp);
        // Check
    else if (strcmp(cmd, "check") == 0) {
        if (argc < 3) {
            portfolio_print_all(fp);
        } else {
            char sym[strlen(argv[2]) + 1];
            strcpy(sym, argv[2]);
            strtoupper(sym);
            if (strcmp(sym, "ALL") == 0)
                portfolio_print_all(fp);
            else {
                double* data = portfolio_print_stock(sym, fp, NULL);
                if (data != NULL)
                    free(data);
            }
        }
    }

        // Portfolio
    else if (strcmp(cmd, "add") == 0)
        modop = ADD;
    else if (strcmp(cmd, "rm") == 0)
        modop = REMOVE;
    else if (strcmp(cmd, "set") == 0)
        modop = SET;

    else printf("Invalid arguments. Type \"man tick\" for help.\n");

    // Portfolio Operations
    if (modop > -1) {
        if (argc != 5)
            printf("Invalid arguments. Type \"man tick\" for help.\n");
        else if (strlen(argv[2]) > 16)
            printf("Invalid symbol.\n");
        else if (strlen(argv[3]) > 16 || strlen(argv[4]) > 16)
            printf("Value too large.\n");
        else {
            char sym[strlen(argv[2]) + 1];
            strcpy(sym, argv[2]);
            strtoupper(sym);

            double qty = strtod(argv[3], NULL);

            size_t ulen = strlen(argv[4]);
            char susd[ulen + 1];
            strcpy(susd, argv[4]);
            strtoupper(susd);

            // If last two characters of price are "EA", calculate
            // total price with number of units
            char ea = 0;
            if (ulen > 2 && susd[ulen - 2] == 'E' && susd[ulen - 1] == 'A') {
                ea = 1;
                susd[ulen - 2] = '\0';
            }

            double usd = strtod(susd, NULL);
            if (ea)
                usd *= qty;

            switch (modop) {
                case ADD:
                    portfolio_modify(sym, qty, usd, fp, ADD);
                    break;
                case REMOVE:
                    portfolio_modify(sym, qty, usd, fp, REMOVE);
                    break;
                case SET:
                    portfolio_modify(sym, qty, usd, fp, SET);
                    break;
                default:
                    break;
            }
        }
    }
    free((void*) portfolio_file);
    fclose(fp);
    return 0;
}