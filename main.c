#include <ctype.h>
#include "web.h"
#include "parse.h"
#include "portfolio.h"

int main(int argc, char* argv[]) {
    /**
     * No arguments -- display help
     */
    if (argc == 1) {
        printf("Usage:\n"
                       "To get info about a currency, run\n"
                       "$ getcrypt [currency]\n"
                       "To update your portfolio, use the options add, rm, or set\n"
                       "$ getcrypt [add/rm/set] [currency] [amount of currency] [amount of money spent]\n"
                       "To get info about your current holdings, run\n"
                       "$ getcrypt check [currency/all]\n"
                       "For more info, type 'man getcrypt'\n");
        return 0;
    }
    /**
     * Fails if no portfolio file is found
     */
    portfolio_file_init();
    FILE* fp = fopen(portfolio_file, "a+");
    if (fp == NULL) {
        printf("Could not open portfolio file\n");
        free((void*) portfolio_file);
        return 1;
    }
    /**
     * Add, rm, set portfolio
     */
    if (argc == 5) {
        for (int i = 0; argv[2][i] != '\0'; i++)
            argv[2][i] = (char) tolower(argv[2][i]);
        if (strcmp(argv[1], "add") == 0)
            portfolio_modify(argv[2], strtod(argv[3], NULL), strtod(argv[4], NULL), fp, ADD);
        else if (strcmp(argv[1], "rm") == 0)
            portfolio_modify(argv[2], strtod(argv[3], NULL), strtod(argv[4], NULL), fp, REMOVE);
        else if (strcmp(argv[1], "set") == 0)
            portfolio_modify(argv[2], strtod(argv[3], NULL), strtod(argv[4], NULL), fp, SET);
        else
            printf("Invalid argument.\n");
        /**
         * Check portfolio contents
         */
    } else {
        STRING api_data = string_init();
        JSON crypto_data = NULL;
        if (argc == 3 && strcmp(argv[1], "check") == 0 && strcmp(argv[2], "all") == 0)
            portfolio_print_all(api_data, crypto_data, fp);
        else {

            if (argc == 3 && strcmp(argv[1], "check") == 0) {
                string_write_data_cmc(api_data, argv[argc - 1]);
                crypto_data = json_init(api_data, 0);
                portfolio_print_currency(argv[2], json_get_data(crypto_data), fp);
            } else if (argc == 2) {
                long num = strtol(argv[1], NULL, 10);
                if (num > 0 && num < 1410) {
                    char* limit = (char*) calloc(12, sizeof(int));
                    memcpy(limit, "?limit=", 7);
                    memcpy(&limit[7], argv[1], 4);
                    string_write_data_cmc(api_data, limit);
                    free(limit);
                    crypto_data = json_init(api_data, 0);
                    json_print_all(crypto_data);
                    for (int i = 1; i < num; i++) {
                        printf("\n");
                        json_destroy(&crypto_data);
                        crypto_data = json_init(api_data, i);
                        json_print_all(crypto_data);
                    }
                } else {
                    string_write_data_cmc(api_data, argv[argc - 1]);
                    crypto_data = json_init(api_data, 0);
                    json_print_all(crypto_data);
                }
            } else printf("Invalid arguments\n");
            string_destroy(&api_data);
            json_destroy(&crypto_data);
        }
    }
    free((void*) portfolio_file);
    fclose(fp);
    return 0;
}