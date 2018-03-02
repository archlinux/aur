#include "portfolio.h"

int main(int argc, char* argv[]) {
    if (argc < 2) {
        printf("Invalid arguments. Type \"man tick\" for help.\n");
        return 0;
    }
    char cmd[strlen(argv[1]) + 1];
    strcpy(cmd, argv[1]);
    strtolower(cmd);

    char* sym = NULL;
    if (argc > 2) {
        char* s = malloc(strlen(argv[2]) + 1);
        if (s == NULL) {
            fprintf(stderr, "malloc() failed\n");
            exit(EXIT_FAILURE);
        }
        strcpy(s, argv[2]);
        strtoupper(s);
        sym = s;
    }

    // Init portfolio path
    portfolio_file_init();

    // Portfolio modify operation
    int modop = -1, cryptopt;

    // News
    if (strcmp(cmd, "news") == 0) {
        if (argc == 3 && strlen(argv[2]) <= 32 && strlen(argv[2]) > 1)
            news_print_top_three(argv[2]);
        else printf("Invalid symbol.\n");
    }

        //Encrypt/decrypt
    else if ((strcmp(cmd, "encrypt") == 0 || strcmp(cmd, "decrypt") == 0) && argc == 2) {
        cryptopt = strcmp(cmd, "encrypt") == 0; // 1 if encrypting, 0 if decrypting
        String* pString = portfolio_file_get_string();
        if (pString != NULL) { // NULL if error opening portfolio
            String* crypted = rc4_get_crypted_string(pString, NULL, cryptopt);
            string_destroy(&pString);
            if (crypted != NULL) { // NULL if password error
                string_write_portfolio(crypted);
                string_destroy(&crypted);
            }
        }
    }
        // Info
    else if (strcmp(cmd, "info") == 0 && argc == 3)
        api_print_info(sym);

        // Check
    else if (strcmp(cmd, "check") == 0) {
        if (argc < 3) {
            portfolio_print_all();
        } else {
            if (strcmp(sym, "ALL") == 0)
                portfolio_print_all();
            else {
                double* data = portfolio_print_stock(sym, NULL);
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

            if (modop == REMOVE)
                portfolio_modify(sym, qty, usd, REMOVE);
            else if (modop == ADD)
                portfolio_modify(sym, qty, usd, ADD);
            else portfolio_modify(sym, qty, usd, SET);
        }
    }
    free(portfolio_file);
    free(sym);
    return 0;
}