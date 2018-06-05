#include "portfolio.h"

char* portfolio_file;

void portfolio_file_init(void) {
    char* home = getenv("HOME");
    char* path = malloc(strlen(home) + 30);
    pointer_alloc_check(path);
    sprintf(path, "%s/.tick_portfolio.json", home);
    portfolio_file = path;
}

String* portfolio_file_get_string(char** password_ref) {
    struct stat file_info;
    if (stat(portfolio_file, &file_info)) // If called from portfolio_modify, file should exist (possibly size 0)
        RETNULL_MSG("Portfolio file doesn't exist.");

    if (file_info.st_size == 0) // Return new String if new file
        return string_init();

    FILE* fp = fopen(portfolio_file, "r");
    if (fp == NULL) // If file exists, but cannot be opened, usually because of permissions
        RETNULL_MSG("Error opening portfolio.")

    String* pString = string_init();
    pString->len = (size_t) file_info.st_size;
    pString->data = realloc(pString->data, pString->len + 1); // Alloc with file size
    pointer_alloc_check(pString->data);
    pString->data[pString->len] = '\0';
    if (fread(pString->data, sizeof(char), pString->len, fp) != pString->len) { // read file and return NULL if error
        fclose(fp);
        string_destroy(&pString);
        RETNULL_MSG("Error reading file.")
    }

    fclose(fp);
    Json* jobj = json_tokener_parse(pString->data); // Make sure portfolio is JSON formatted
    if (jobj == NULL || !json_object_is_type(jobj, json_type_array)) { // Decrypt if not a JSON array
        char* password = rc4_getPassword();
        puts("Decrypting portfolio...");
        rc4_encode_string(pString, password); // Decode using password
        jobj = json_tokener_parse(pString->data);
        if (jobj == NULL || !json_object_is_type(jobj, json_type_array)) { // Wrong pw if not JSON array after decrypt
            free(password);
            json_object_put(jobj);
            string_destroy(&pString);
            RETNULL_MSG("Wrong password!")
        }

        if (password_ref != NULL) // If provided a string reference, set pointer to malloc'ed password_ref
            *password_ref = password;   // This is used for re-encrypting the portfolio when modifying
        else free(password);
    }
    json_object_put(jobj);
    return pString;
}

void portfolio_modify(const char* symbol, double quantity_shares, double usd_spent, int mod_option) {
    if (quantity_shares < 0 || usd_spent < 0) // Negative numbers
        RET_MSG("You must use positive values.")

    if (mod_option != SET && quantity_shares == 0 && usd_spent == 0) // Adding or removing 0
        RET_MSG("You cannot add or remove values of 0.")

    FILE* fp = fopen(portfolio_file, "a"); // Creates empty file if portfolio doesn't exist
    if (fp == NULL) // If file exists, but cannot be opened, usually because of permissions
        RET_MSG("Error opening porfolio.")
    fclose(fp);

    char* password = NULL; // If portfolio is encrypted, store password when decrypting for re-encryption
    String* pString = portfolio_file_get_string(&password);
    if (pString == NULL) // Return if error or wrong password
        return;

    // pString is now guaranteed to be valid unencrypted String (may be length 0)

    Json* jobj;
    if (pString->len == 0) // Create new array if empty file
        jobj = json_object_new_array();
    else jobj = json_tokener_parse(pString->data); // Otherwise parse

    int index = portfolio_symbol_index(symbol, jobj);
    if (index == -1) { // If security is not already contained in portfolio
        if (mod_option == REMOVE) // If trying to remove a security they don't own
            GOTO_CLEAN_MSG("You don't have any of this security to remove")

        if (strcmp("USD$", symbol) != 0) { // Check that the symbol is valid, except if it's USD
            Info* data = api_get_check_info(symbol);
            if (data == NULL) // If NULL response from APIs, it's invalid
                GOTO_CLEAN_MSG("Invalid symbol.")
            else api_info_destroy(&data);
        }

        Json* new_object = json_object_new_object(); // Creates new array index and adds values to it
        json_object_array_add(jobj, new_object);
        json_object_object_add(new_object, "Symbol", json_object_new_string(symbol));
        json_object_object_add(new_object, "Shares", json_object_new_double(quantity_shares));
        json_object_object_add(new_object, "USD_Spent", json_object_new_double(usd_spent));
        printf("Added %lf %s bought for %lf to portfolio.\n", quantity_shares, symbol, usd_spent);
    } else { //if already in portfolio
        Json* current_index = json_object_array_get_idx(jobj, (size_t) index);
        // Store values already in portfolio to modify.
        double current_shares = json_object_get_double(json_object_object_get(current_index, "Shares"));
        double current_spent = json_object_get_double(json_object_object_get(current_index, "USD_Spent"));
        json_object_object_del(current_index, "Shares"); // Deletes the objects already there
        json_object_object_del(current_index, "USD_Spent");
        if (mod_option == SET) { // SET
            current_shares = quantity_shares;
            current_spent = usd_spent;
            printf("Set amount of %s in portfolio to %lf bought for %lf.\n", symbol, quantity_shares,
                   usd_spent);
        } else if (mod_option == ADD) { // ADD
            current_shares += quantity_shares;
            current_spent += usd_spent;
            printf("Added %lf %s bought for %lf to portfolio.\n", quantity_shares, symbol, usd_spent);
        } else { // REMOVE
            current_shares -= quantity_shares;
            current_spent -= usd_spent;
            if (current_shares < 0 || current_spent < 0) // If you try to remove more than you have
                GOTO_CLEAN_MSG("You don't have enough of this security to remove.")

            printf("Removed %lf %s bought for %lf to portfolio.\n", quantity_shares, symbol, usd_spent);
        }
        if (current_shares == 0 && usd_spent == 0) // Deletes index from portfolio if values are 0
            json_object_array_del_idx(jobj, (size_t) index, 1);
        else { // Adds computed values to index
            json_object_object_add(current_index, "Shares", json_object_new_double(current_shares));
            json_object_object_add(current_index, "USD_Spent", json_object_new_double(current_spent));
        }
    }
    const char* new_portfolio_str = json_object_to_json_string(jobj);
    pString->len = strlen(new_portfolio_str);
    pString->data = realloc(pString->data, pString->len + 1); // Realloc string with size of new length
    pointer_alloc_check(pString->data);
    strcpy(pString->data, new_portfolio_str);
    if (password != NULL) { // If data must be re-encrypted
        puts("Re-encrypting portfolio...");
        rc4_encode_string(pString, password);
    }
    string_write_portfolio(pString);
    cleanup: // CLEANUP
    free(password);
    json_object_put(jobj);
    string_destroy(&pString);
}

Info_Array* portfolio_get_info_array(void) {
    String* pString = portfolio_file_get_string(NULL);
    if (pString == NULL) // Read error or wrong password
        return NULL;

    if (pString->len == 0) { // If empty portfolio file
        string_destroy(&pString);
        RETNULL_MSG("Your portfolio is empty.")
    }

    Info_Array* portfolio_data = NULL;
    Json* jobj = json_tokener_parse(pString->data);
    if (json_object_array_length(jobj) == 0) { // If empty array
        json_object_put(jobj);
        string_destroy(&pString);
        RETNULL_MSG("Your portfolio is empty.");
    }

    portfolio_data = api_info_array_init();
    portfolio_data->length = json_object_array_length(jobj);
    portfolio_data->array = malloc(sizeof(Info*) * portfolio_data->length); // malloc portfolio array length pointers
    pointer_alloc_check(portfolio_data->array);

    pthread_t threads[portfolio_data->length];
    char syms[portfolio_data->length][SYMBOL_MAX_LENGTH];
    for (size_t i = 0; i < portfolio_data->length; i++) {
        strcpy(syms[i], json_object_get_string(json_object_object_get(json_object_array_get_idx(jobj, i), "Symbol")));
        if (strcmp(syms[i], "USD$") != 0)
            if (pthread_create(&threads[i], NULL, (void*(*)(void*))api_get_check_info, syms[i]))
                EXIT_MSG("Error creating thread!")
    }

    void* temp = NULL;
    for (size_t i = 0; i < portfolio_data->length; i++) {
        mvprintw(0, 0, "Loading data (%d/%d)\n", (int) i + 1, (int) portfolio_data->length); // Print loading string
        refresh(); // flushes output buffer
        if (strcmp(syms[i], "USD$") != 0) {
            if (pthread_join(threads[i], &temp))
                EXIT_MSG("Error joining thread!")

            portfolio_data->array[i] = temp;
        }
        else {
            portfolio_data->array[i] = api_info_init();
            strcpy(portfolio_data->array[i]->symbol, syms[i]);
        }
        portfolio_data->array[i]->amount = json_object_get_double(json_object_object_get(json_object_array_get_idx(
                jobj, i), "Shares"));
        portfolio_data->array[i]->total_spent = json_object_get_double(json_object_object_get(json_object_array_get_idx(
                jobj, i), "USD_Spent"));
        calculate_check_data(portfolio_data->array[i]);
    }

    json_object_put(jobj);
    string_destroy(&pString);
    return portfolio_data;
}

void portfolio_sort(Info_Array* portfolio_data, int sort_option) {
    if (portfolio_data->length == 1) // Can't sort only one security
        return;
    int loop_flag = 1;
    double val1 = 0, val2 = 0;
    Info* sec_data1, * sec_data2, * temp;
    while (loop_flag) { // Bubble sort
        loop_flag = 0;
        for (size_t i = 0; i < portfolio_data->length - 1; i++) {
            sec_data1 = portfolio_data->array[i];
            sec_data2 = portfolio_data->array[i + 1];
            if (sort_option == SORT_ALPHA || sort_option > SORT_PROFIT_30D_PERCENT) {
                if (strcmp(sec_data1->symbol, sec_data2->symbol) > 0) { // Least to greatest
                    temp = portfolio_data->array[i]; // Swap
                    portfolio_data->array[i] = portfolio_data->array[i + 1];
                    portfolio_data->array[i + 1] = temp;
                    loop_flag = 1;
                }
            } else if (sort_option == SORT_VALUE) {
                val1 = sec_data1->current_value;
                val2 = sec_data2->current_value;
            } else if (sort_option == SORT_SPENT) {
                val1 = sec_data1->total_spent;
                val2 = sec_data2->total_spent;
            } else if (sort_option == SORT_PROFIT) {
                val1 = sec_data1->profit_total;
                val2 = sec_data2->profit_total;
            } else if (sort_option == SORT_PROFIT_PERCENT) {
                val1 = sec_data1->profit_total_percent;
                val2 = sec_data2->profit_total_percent;
            } else if (sort_option == SORT_PROFIT_24H) {
                val1 = sec_data1->profit_last_close;
                val2 = sec_data2->profit_last_close;
            } else if (sort_option == SORT_PROFIT_24H_PERCENT) {
                val1 = sec_data1->profit_last_close_percent;
                val2 = sec_data2->profit_last_close_percent;
            } else if (sort_option == SORT_PROFIT_7D) {
                val1 = sec_data1->profit_7d;
                val2 = sec_data2->profit_7d;
            } else if (sort_option == SORT_PROFIT_7D_PERCENT) {
                val1 = sec_data1->profit_7d_percent;
                val2 = sec_data2->profit_7d_percent;
            } else if (sort_option == SORT_PROFIT_30D) {
                val1 = sec_data1->profit_30d;
                val2 = sec_data2->profit_30d;
            } else if (sort_option == SORT_PROFIT_30D_PERCENT) {
                val1 = sec_data1->profit_30d_percent;
                val2 = sec_data2->profit_30d_percent;
            }
            if (val1 < val2) { // Greatest to least
                temp = portfolio_data->array[i]; // Swap
                portfolio_data->array[i] = portfolio_data->array[i + 1];
                portfolio_data->array[i + 1] = temp;
                loop_flag = 1;
            }
        }
    }
}

void portfolio_print_all(void) {
    initscr();
    noecho(); // Don't echo keystrokes
    keypad(stdscr, TRUE); // Enables extra keystrokes
    curs_set(FALSE); // Hides cursor
    Info_Array* portfolio_data = portfolio_get_info_array();
    if (portfolio_data == NULL) { // Error reading portfolio, wrong password, empty portfolio array
        endwin();
        return;
    }

    double total_owned = 0, total_spent = 0, total_profit_1d = 0, total_profit_7d = 0, total_profit_30d = 0;
    for (size_t i = 0; i < portfolio_data->length; i++) { // Add collected values to totals
        total_owned += portfolio_data->array[i]->current_value;
        total_spent += portfolio_data->array[i]->total_spent;
        total_profit_1d += portfolio_data->array[i]->profit_last_close;
        total_profit_7d += portfolio_data->array[i]->profit_7d;
        total_profit_30d += portfolio_data->array[i]->profit_30d;
    }

    int sort_option = SORT_ALPHA; // Defaults to sort alphabetically
    int highlight_index = HIGHLIGHT_NONE;
    char highlight_sym[SYMBOL_MAX_LENGTH];
    // For printing/formatting categories
    char* sort_categories_str[] = {"SYMBOL", "VALUE", "SPENT", "PROFIT", "(%)", "24H", "(%)", "7D", "(%)", "30D", "(%)"}
    , * sort_spacing_str[] = {"    ", "    ", "   ", "       ", "      ", "       ", "       ", "       ", "      ",
                              "       ", "\n"};
    int ch = 0; // getch() data from keyboard
    Info* info;
    do {
        portfolio_sort(portfolio_data, sort_option); // Sort security array
        move(0, 0);
        attron(A_BOLD); // Bold categories
        printw("  AMOUNT ");
        for (int i = 0; i < SORT_PROFIT_30D_PERCENT + 1; i++) {
            if (sort_option == i) // Highlight current sorting category
                attron(A_STANDOUT);
            printw("%s", sort_categories_str[i]);
            if (sort_option == i)
                attroff(A_STANDOUT);
            printw("%s", sort_spacing_str[i]);
        }
        attroff(A_BOLD);

        for (size_t i = 0; i < portfolio_data->length; i++) {
            if (highlight_index == (signed) i)
                attron(A_BOLD);
            info = portfolio_data->array[i]; // Print security data one at a time
            printw("%8.2lf %6s %8.2lf %8.2lf %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%)\n",
                   info->amount, info->symbol, info->current_value, info->total_spent, info->profit_total,
                   info->profit_total_percent, info->profit_last_close, info->profit_last_close_percent,
                   info->profit_7d, info->profit_7d_percent, info->profit_30d, info->profit_30d_percent);
            if (highlight_index == (signed) i)
                attroff(A_BOLD);
        }
        attron(A_BOLD); // Bold totals
        printw("\n         TOTALS %8.2lf %8.2lf %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%)"
               , total_owned, total_spent, total_owned - total_spent, (100 * (total_owned - total_spent)) / total_spent,
               total_profit_1d, 100 * total_profit_1d / total_spent, total_profit_7d,
               100 * total_profit_7d / total_spent, total_profit_30d, 100 * total_profit_30d / total_spent);
        attroff(A_BOLD);

        ch = getch(); // Get keyboard input -- also flushes output buffer
        if (ch == KEY_RIGHT && sort_option != SORT_PROFIT_30D_PERCENT) { // key RIGHT -- moves sort category right
            if (highlight_index != HIGHLIGHT_NONE) {
                strcpy(highlight_sym, portfolio_data->array[highlight_index]->symbol);
                sort_option++;
                portfolio_sort(portfolio_data, sort_option);
                for (size_t i = 0; i < portfolio_data->length; i++)
                    if (strcmp(portfolio_data->array[i]->symbol, highlight_sym) == 0)
                        highlight_index = (int) i; // Make sure the same security stays highlighted
            } else sort_option++;
        } else if (ch == KEY_LEFT && sort_option != SORT_ALPHA) { // key LEFT -- moves sort category left
            if (highlight_index != HIGHLIGHT_NONE) {
                strcpy(highlight_sym, portfolio_data->array[highlight_index]->symbol);
                sort_option--;
                portfolio_sort(portfolio_data, sort_option); // Sort security array
                for (size_t i = 0; i < portfolio_data->length; i++)
                    if (strcmp(portfolio_data->array[i]->symbol, highlight_sym) == 0)
                        highlight_index = (int) i; // Make sure the same security stays highlighted
            } else sort_option--;
        } else if (ch == KEY_DOWN) {
            highlight_index++;
            if (highlight_index == (signed) portfolio_data->length) // Wrap around
                highlight_index = 0;
        } else if (ch == KEY_UP) {
            highlight_index--;
            if (highlight_index < 0) // Wrap around
                highlight_index = (signed) portfolio_data->length -1;
        } else if (ch == KEY_ESCAPE)
            highlight_index = HIGHLIGHT_NONE;
    } while (ch != 'q'); // "q" to quit
    endwin();
    api_info_array_destroy(&portfolio_data);
}

void portfolio_print_stock(const char* symbol) {
    String* pString = portfolio_file_get_string(NULL);
    if (pString == NULL) // Error reading portfolio, wrong password, empty portfolio array
        return;

    Json* jobj = json_tokener_parse(pString->data);
    size_t i = 0, len = json_object_array_length(jobj);
    while (i++ < len && strcmp(json_object_get_string(json_object_object_get(
            json_object_array_get_idx(jobj, i), "Symbol")), symbol) != 0);

    Info* info = NULL;
    if (i != len)
        info = api_get_check_info(symbol);
    else GOTO_CLEAN_MSG("Your portfolio does not contain any of this security.")

    info->amount = json_object_get_double(json_object_object_get(json_object_array_get_idx(jobj, i), "Shares"));
    info->total_spent = json_object_get_double(json_object_object_get(json_object_array_get_idx(jobj, i), "USD_Spent"));
    calculate_check_data(info);
    printf("  AMOUNT SYMBOL    VALUE    SPENT   PROFIT       (%%)      24H       (%%)      7D       (%%)      30D      "
           " (%%)\n%8.2lf %6s %8.2lf %8.2lf %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%)\n",
           info->amount, info->symbol, info->current_value, info->total_spent, info->profit_total,
           info->profit_total_percent, info->profit_last_close, info->profit_last_close_percent,
           info->profit_7d, info->profit_7d_percent, info->profit_30d, info->profit_30d_percent);

    api_info_destroy(&info);
    cleanup:
    json_object_put(jobj);
    string_destroy(&pString);
}

int portfolio_symbol_index(const char* symbol, const Json* jarray) {
    char string[32];
    for (int i = 0; i < (int) json_object_array_length(jarray); i++) {
        strcpy(string, json_object_to_json_string(
                json_object_object_get(json_object_array_get_idx(jarray, (size_t) i), "Symbol")));
        strip_char(string, '\"');
        if (strcmp(string, symbol) == 0)
            return i;
    }
    return -1;
}

void portfolio_encrypt_decrypt(int crypt_opt) {
    char* password = NULL;
    String* pString = portfolio_file_get_string(&password);
    if (pString == NULL) // Error reading portfolio or wrong password when decrypting
        return;

    if (crypt_opt == ENCRYPT && password != NULL) // Trying to encrypt an encrypted portfolio
        GOTO_CLEAN_MSG("Portfolio is already encrypted.")

    if (crypt_opt == DECRYPT && password == NULL) // Trying to decrypt a plaintext portfolio
        GOTO_CLEAN_MSG("Portfolio isn't encrypted.")

    if (crypt_opt == DECRYPT) {
        string_write_portfolio(pString);
        GOTO_CLEAN_MSG("Decrypted successfully")
    }

    // ENCRYPT
    password = rc4_getPassword();
    puts("You will be asked to enter your password again to make sure the entries match.");
    sleep(2); // Sleep so user can read above message before ncurses initscr()
    char* password_check = rc4_getPassword(); // Get password a second time
    if (strcmp(password, password_check) != 0) { // Make sure the two passwords are the same
        free(password_check);
        GOTO_CLEAN_MSG("Passwords do not match!")
    }
    rc4_encode_string(pString, password);
    string_write_portfolio(pString);
    puts("Encrypted successfully");
    free(password_check);
    cleanup: // CLEANUP
    free(password);
    string_destroy(&pString);
}