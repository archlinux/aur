#include "portfolio.h"
#include "curses_win.h"
#include "gtk_win.h"

int main(int argc, char* argv[]) {
    char* cmd = NULL, * sym = NULL;
    if (argc > 1) {
        cmd = malloc(strlen(argv[1]) + 1);
        pointer_alloc_check(cmd);
        strcpy(cmd, argv[1]);
        strtolower(cmd);
    }
    if (argc > 2) {
        sym = malloc(strlen(argv[2]) + 1);
        pointer_alloc_check(sym);
        strcpy(sym, argv[2]);
        strtoupper(sym);
    }

    // Init file paths
    portfolio_file_path_init();
    ref_cache_file_path_init();

    // Init cURL
    curl_global_init(CURL_GLOBAL_ALL);

    // Portfolio modify operation
    int modop = -1;

    // GTK+ window
    if (argc == 1)
        window_main();

    // News
    else if (streq(cmd, "news") && (argc == 3 || argc == 4)) {
        int num_articles = 3; // Default
        if (argc == 4)
            num_articles = (int) strtol(argv[3], NULL, 10);
        news_print(sym, num_articles);
    }

        //Encrypt/decrypt
    else if ((streq(cmd, "encrypt") || streq(cmd, "decrypt")) && argc == 2)
        portfolio_write_encrypt_decrypt(streq(cmd, "encrypt")); // 1 if encrypt, 0 if decrypt

        // Info
    else if (streq(cmd, "info") && argc == 3)
        interface_print(sym);

        // Graph
    else if (streq(cmd, "graph") && argc == 3)
        graph_print(sym, NULL);

        // Compare
    else if (streq(cmd, "cmp") && argc == 4) {
        char sym2[strlen(argv[3]) + 1];
        strcpy(sym2, argv[3]);
        strtoupper(sym2);
        graph_print(sym, sym2);
    }

        // Check
    else if (streq(cmd, "check") && (argc == 2 || argc == 3)) {
        if (argc == 2)
            portfolio_printw();
        else portfolio_print_stock(sym);
    }

        // Portfolio
    else if (streq(cmd, "add"))
        modop = ADD;
    else if (streq(cmd, "rm"))
        modop = REMOVE;
    else if (streq(cmd, "set"))
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

            portfolio_modify_write(sym, qty, usd, modop);
        }
    }
    free(portfolio_file_path);
    free(ref_cache_file_path);
    free(sym);
    free(cmd);
    curl_global_cleanup();
    return 0;
}