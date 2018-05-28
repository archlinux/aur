#include "portfolio.h"
#include "graph.h"

int main(int argc, char* argv[]) {
    if (argc < 2) {
        puts("Invalid arguments. Type \"man tick\" for help.");
        return 0;
    }
    char cmd[strlen(argv[1]) + 1];
    strcpy(cmd, argv[1]);
    strtolower(cmd);

    char* sym = NULL;
    if (argc > 2) {
        sym = malloc(strlen(argv[2]) + 1);
        pointer_alloc_check(sym);
        strcpy(sym, argv[2]);
        strtoupper(sym);
    }

    // Init portfolio path
    portfolio_file_init();

    // Init cURL
    curl_global_init(CURL_GLOBAL_ALL);

    // Portfolio modify operation
    int modop = -1;

        // News
    if (strcmp(cmd, "news") == 0 && (argc == 3 || argc == 4)) {
        int num_articles = 3; // Default
        if (argc == 4)
            num_articles = (int) strtol(argv[3], NULL, 10);
        iex_print_news(sym, num_articles);
    }

        //Encrypt/decrypt
    else if ((strcmp(cmd, "encrypt") == 0 || strcmp(cmd, "decrypt") == 0) && argc == 2)
        portfolio_encrypt_decrypt(strcmp(cmd, "encrypt") == 0); // 1 if encrypt, 0 if decrypt

        // Info
    else if (strcmp(cmd, "info") == 0 && argc == 3)
        api_print_info(sym);

        // Graph
    else if (strcmp(cmd, "graph") == 0 && argc == 3)
        graph_main(sym, NULL, NULL);

        // Compare
    else if (strcmp(cmd, "cmp") == 0 && argc == 4) {
        char sym2[strlen(argv[3]) + 1];
        strcpy(sym2, argv[3]);
        strtoupper(sym2);
        graph_main(sym, sym2, NULL);
    }

        // Check
    else if (strcmp(cmd, "check") == 0 && (argc == 2 || argc == 3)) {
        if (argc == 2)
            portfolio_print_all();
        else portfolio_print_stock(sym);
    }

        // Portfolio
    else if (strcmp(cmd, "add") == 0)
        modop = ADD;
    else if (strcmp(cmd, "rm") == 0)
        modop = REMOVE;
    else if (strcmp(cmd, "set") == 0)
        modop = SET;
    else puts("Invalid arguments. Type \"man tick\" for help.");

    // Portfolio Operations
    if (modop > -1) {
        if (argc != 5)
            puts("Invalid arguments. Type \"man tick\" for help.");
        else if (strlen(sym) > 16)
            puts("Invalid symbol.");
        else if (strlen(argv[3]) > 16 || strlen(argv[4]) > 16)
            puts("Value too large.");
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

            portfolio_modify(sym, qty, usd, modop);
        }
    }
    free(portfolio_file);
    free(sym);
    curl_global_cleanup();
    return 0;
}