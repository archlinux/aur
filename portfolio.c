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

SDA* portfolio_get_data_array(void) {
    String* pString = portfolio_file_get_string(NULL);
    if (pString == NULL) // Read error or wrong password
        return NULL;

    Json* jobj = NULL;
    SDA* portfolio_data = NULL;
    if (pString->len == 0) // If empty portfolio file
        GOTO_CLEAN_MSG("Your portfolio is empty.")

    jobj = json_tokener_parse(pString->data);
    size_t portfolio_size = json_object_array_length(jobj);
    if (portfolio_size == 0) // If empty array
        GOTO_CLEAN_MSG("Your portfolio is empty.")

    portfolio_data = malloc(sizeof(SDA));
    pointer_alloc_check(portfolio_data);
    portfolio_data->length = portfolio_size;
    portfolio_data->sec_data = malloc(sizeof(SD*) * portfolio_data->length); // malloc portfolio array length pointers
    pointer_alloc_check(portfolio_data->sec_data);

    Json* json_index;
    SD* tcd_index;
    for (size_t i = 0; i < portfolio_data->length; i++) {
        portfolio_data->sec_data[i] = malloc(sizeof(SD)); // malloc security data object for each array index
        tcd_index = portfolio_data->sec_data[i];
        pointer_alloc_check(tcd_index);
        json_index = json_object_array_get_idx(jobj, i);
        strcpy(tcd_index->symbol, json_object_get_string(json_object_object_get(json_index, "Symbol")));
        tcd_index->amount = json_object_get_double(json_object_object_get(json_index, "Shares"));
        tcd_index->total_spent = json_object_get_double(json_object_object_get(json_index, "USD_Spent"));
    }
    cleanup:
    json_object_put(jobj);
    string_destroy(&pString);
    return portfolio_data;
}

void* portfolio_store_api_data(void* vsec_data) {
    SD* sec_data = vsec_data;
    if (strcmp(sec_data->symbol, "USD$") != 0) {
        Info* symbol_info = api_get_check_info(sec_data->symbol);
        double price_data[3] = {
                symbol_info->price, symbol_info->price - symbol_info->price * symbol_info->change_1d / 100,
                symbol_info->price - symbol_info->price * symbol_info->change_7d / 100
        };
        sec_data->current_value = sec_data->amount * price_data[0];
        sec_data->total_profit = sec_data->current_value - sec_data->total_spent;
        sec_data->total_profit_percent = 100 * ((price_data[0] / (sec_data->total_spent / sec_data->amount)) - 1);
        sec_data->one_day_profit = sec_data->current_value - (sec_data->amount * price_data[1]);
        sec_data->one_day_profit_percent = 100 * ((price_data[0] / price_data[1]) - 1);
        sec_data->seven_day_profit = sec_data->current_value - (sec_data->amount * price_data[2]);
        sec_data->seven_day_profit_percent = 100 * ((price_data[0] / price_data[2]) - 1);
        api_info_destroy(&symbol_info);
    } else {
        sec_data->current_value = sec_data->amount;
        sec_data->total_profit = sec_data->current_value - sec_data->total_spent;
        sec_data->total_profit_percent = 100 * sec_data->total_profit / sec_data->total_spent;
        sec_data->one_day_profit = 0;
        sec_data->one_day_profit_percent = 0;
        sec_data->seven_day_profit = 0;
        sec_data->seven_day_profit_percent = 0;
    }
    return NULL;
}

void portfolio_sort(SDA* sda_data, int sort_option) {
    if (sda_data->length == 1) // Can't sort only one security
        return;
    int loop_flag = 1;
    double val1 = 0, val2 = 0;
    SD* sec_data1, * sec_data2, * temp;
    while (loop_flag) { // Bubble sort
        loop_flag = 0;
        for (size_t i = 0; i < sda_data->length - 1; i++) {
            sec_data1 = sda_data->sec_data[i];
            sec_data2 = sda_data->sec_data[i + 1];
            if (sort_option == SORT_ALPHA || sort_option > SORT_PROFIT_7D_PERCENT) {
                if (strcmp(sec_data1->symbol, sec_data2->symbol) > 0) { // Least to greatest
                    temp = sda_data->sec_data[i]; // Swap
                    sda_data->sec_data[i] = sda_data->sec_data[i + 1];
                    sda_data->sec_data[i + 1] = temp;
                    loop_flag = 1;
                }
            } else if (sort_option == SORT_VALUE) {
                val1 = sec_data1->current_value;
                val2 = sec_data2->current_value;
            } else if (sort_option == SORT_SPENT) {
                val1 = sec_data1->total_spent;
                val2 = sec_data2->total_spent;
            } else if (sort_option == SORT_PROFIT) {
                val1 = sec_data1->total_profit;
                val2 = sec_data2->total_profit;
            } else if (sort_option == SORT_PROFIT_PERCENT) {
                val1 = sec_data1->total_profit_percent;
                val2 = sec_data2->total_profit_percent;
            } else if (sort_option == SORT_PROFIT_24H) {
                val1 = sec_data1->one_day_profit;
                val2 = sec_data2->one_day_profit;
            } else if (sort_option == SORT_PROFIT_24H_PERCENT) {
                val1 = sec_data1->one_day_profit_percent;
                val2 = sec_data2->one_day_profit_percent;
            } else if (sort_option == SORT_PROFIT_7D) {
                val1 = sec_data1->seven_day_profit;
                val2 = sec_data2->seven_day_profit;
            } else if (sort_option == SORT_PROFIT_7D_PERCENT) {
                val1 = sec_data1->seven_day_profit_percent;
                val2 = sec_data2->seven_day_profit_percent;
            }
            if (val1 < val2) { // Greatest to least
                temp = sda_data->sec_data[i]; // Swap
                sda_data->sec_data[i] = sda_data->sec_data[i + 1];
                sda_data->sec_data[i + 1] = temp;
                loop_flag = 1;
            }
        }
    }
}

void portfolio_print_all(void) {
    SDA* sda_data = portfolio_get_data_array();
    if (sda_data == NULL) // Error reading portfolio, wrong password, empty portfolio array
        return;

    initscr();
    noecho(); // Don't echo keystrokes
    keypad(stdscr, TRUE); // Enables extra keystrokes
    curs_set(FALSE); // Hides cursor
    double total_owned = 0, total_spent = 0, total_profit_1d = 0, total_profit_7d = 0;
    SD* sec_data;
    pthread_t threads[sda_data->length];
    for (size_t i = 0; i < sda_data->length; i++) // Create one thread per security to collect API data
        if (pthread_create(&threads[i], NULL, portfolio_store_api_data, sda_data->sec_data[i]))
            EXIT_MSG("Error creating thread!")

    for (size_t i = 0; i < sda_data->length; i++) {
        mvprintw(0, 0, "Loading data (%d/%d)\n", (int) i + 1, (int) sda_data->length); // Print loading string
        refresh(); // flushes output buffer
        if (pthread_join(threads[i], NULL)) // Wait for each thread to finish collecting API data
            EXIT_MSG("Error joining thread!")

        sec_data = sda_data->sec_data[i];
        total_owned += sec_data->current_value; // Add collected values to totals
        total_spent += sec_data->total_spent;
        total_profit_1d += sec_data->one_day_profit;
        total_profit_7d += sec_data->seven_day_profit;
    }

    int sort_option = SORT_ALPHA; // Defaults to sort alphabetically
    // For printing/formatting categories
    char* sort_categories_str[] = {"SYMBOL", "VALUE", "SPENT", "PROFIT", "(%)", "24H", "(%)", "7D", "(%)"},
            * sort_spacing_str[] = {"    ", "    ", "   ", "       ", "      ", "       ", "       ", "       ", "\n"};
    int ch = 0; // getch() data from keyboard
    do {
        portfolio_sort(sda_data, sort_option); // Sort security array
        move(0, 0);
        attron(A_BOLD); // Bold categories
        printw("  AMOUNT ");
        for (int i = 0; i < SORT_PROFIT_7D_PERCENT + 1; i++) {
            if (sort_option == i) // Highlight current sorting category
                attron(A_STANDOUT);
            printw("%s", sort_categories_str[i]);
            if (sort_option == i)
                attroff(A_STANDOUT);
            printw("%s", sort_spacing_str[i]);
        }
        attroff(A_BOLD);

        for (size_t i = 0; i < sda_data->length; i++) {
            sec_data = sda_data->sec_data[i]; // Print security data one at a time
            printw("%8.2lf %6s %8.2lf %8.2lf %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%)\n", sec_data->amount,
                   sec_data->symbol, sec_data->current_value, sec_data->total_spent, sec_data->total_profit,
                   sec_data->total_profit_percent, sec_data->one_day_profit, sec_data->one_day_profit_percent,
                   sec_data->seven_day_profit, sec_data->seven_day_profit_percent);
        }
        attron(A_BOLD); // Bold totals
        printw("\n         TOTALS %8.2lf %8.2lf %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%)\n",
               total_owned, total_spent, total_owned - total_spent, (100 * (total_owned - total_spent)) / total_spent,
               total_profit_1d, 100 * total_profit_1d / total_spent, total_profit_7d,
               100 * total_profit_7d / total_spent);
        attroff(A_BOLD);

        ch = getch(); // Get keyboard input -- also flushes output buffer
        if (ch == KEY_RIGHT && sort_option != SORT_PROFIT_7D_PERCENT) // key RIGHT -- moves sort category right
            sort_option++;
        else if (ch == KEY_LEFT && sort_option != SORT_ALPHA) // key LEFT -- moves sort category left
            sort_option--;
    } while (ch != 'q'); // "q" to quit
    endwin();
    sda_destroy(&sda_data);
}

void portfolio_print_stock(const char* symbol) {
    SDA* sda_data = portfolio_get_data_array();
    if (sda_data == NULL) // Error reading portfolio, wrong password, empty portfolio array
        return;

    SD* sec_data = NULL;
    size_t i = 0;
    while (i < sda_data->length && strcmp(sda_data->sec_data[i]->symbol, symbol) != 0)
        i++;
    if (i != sda_data->length)
        sec_data = sda_data->sec_data[i];
    else GOTO_CLEAN_MSG("Your portfolio does not contain any of this security.")

    portfolio_store_api_data(sec_data);
    printf("  AMOUNT SYMBOL    VALUE    SPENT   PROFIT       (%%)      24H       (%%)      7D       (%%)\n"
           "%8.2lf %6s %8.2lf %8.2lf %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%)\n", sec_data->amount,
           sec_data->symbol, sec_data->current_value, sec_data->total_spent, sec_data->total_profit,
           sec_data->total_profit_percent, sec_data->one_day_profit, sec_data->one_day_profit_percent,
           sec_data->seven_day_profit, sec_data->seven_day_profit_percent);
    cleanup:
    sda_destroy(&sda_data);
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

void sda_destroy(SDA** phSDA) {
    SDA* ptr = *phSDA;
    for (size_t i = 0; i < ptr->length; i++)
        free(ptr->sec_data[i]);
    free(ptr->sec_data);
    free(ptr);
    *phSDA = NULL;
}