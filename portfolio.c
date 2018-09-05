#include "portfolio.h"

char* portfolio_file_path;

void portfolio_file_path_init(void) {
    char* home = getenv("HOME");
    char* path = malloc(strlen(home) + 30);
    pointer_alloc_check(path);
    sprintf(path, "%s/.tick_portfolio.json", home);
    portfolio_file_path = path;
}

String* portfolio_ncurses_get_plaintext_string(char** password_ref) {
    String* pString = file_get_string(portfolio_file_path);
    if (pString != NULL && pString->len > 0) { // NULL if error reading file
        char* password = NULL;
        if (!rc4_ncurses_decrypt_string(pString, &password))
            string_destroy(&pString); // Error decrypting
        if (password_ref != NULL)
            *password_ref = password; // Copy password if given reference
        else free(password);
    }
    return pString;
}

void portfolio_modify_write(const char* symbol, double quantity_shares, double usd_spent,
                            int mod_option) {
    if (quantity_shares < 0 || usd_spent < 0) // Negative numbers
        RET_MSG("You must use positive values.")

    if (mod_option != SET && quantity_shares == 0 && usd_spent == 0) // Adding or removing 0
        RET_MSG("You cannot add or remove values of 0.")

    FILE* fp = fopen(portfolio_file_path, "a"); // Creates empty file if portfolio doesn't exist
    if (fp == NULL) // If file exists, but cannot be opened, usually because of permissions
        RET_MSG("Error opening porfolio.")

    fclose(fp);

    char* password = NULL; // Store password for re-encryption
    String* pString = portfolio_ncurses_get_plaintext_string(&password);
    if (pString == NULL) // Decryption error
        return;

    // Perform modification
    portfolio_modify_string(pString, symbol, quantity_shares, usd_spent, mod_option);

    if (password != NULL) { // If need to re-encrypt
        rc4_encode_string(pString, password);
        puts("Re-encrypting portfolio...");
        free(password);
    }

    string_write_file(pString, portfolio_file_path); // Write portfolio file
    string_destroy(&pString);
}

int portfolio_modify_string(String* pString, const char* symbol, double quantity_shares,
                             double usd_spent, int mod_option) {
    // Null string or negative numbers
    if ((symbol != NULL && symbol[0] == '\0') || quantity_shares < 0 || usd_spent < 0)
        return 1;

    // Can't add or remove both values of 0
    if (mod_option != SET && quantity_shares == 0 && usd_spent == 0)
        return 1;

    int status = 0;
    Json* jobj;
    if (pString->len == 0) // Create new array if empty file
        jobj = json_object_new_array();
    else jobj = json_tokener_parse(pString->data); // Otherwise parse

    if (jobj == NULL)
        RET_FALSE_MSG("Portfolio corrupted! Check JSON formatting.");

    int index = portfolio_symbol_index(symbol, jobj);
    if (index == -1) { // If security is not already contained in portfolio
        if (mod_option == REMOVE) {// If trying to remove a security they don't own
            status = 1;
            GOTO_CLEAN_MSG("You don't have any of this security to remove")
        }

        if (!streq("USD$", symbol)) { // Check that the symbol is valid, except if it's USD
            Info* data = info_init();
            strcpy(data->symbol, symbol);
            api_store_info(data, DATA_LEVEL_CHECK);
            if (data->api_provider == EMPTY) {// If NULL response from APIs, it's invalid
                info_destroy(&data);
                status = 1;
                GOTO_CLEAN_MSG("Invalid symbol.")
            }
            info_destroy(&data);
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
            if (current_shares < 0 || current_spent < 0) {// If you try to remove more than you have
                status = 1;
                GOTO_CLEAN_MSG("You don't have enough of this security to remove.")
            }

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
    cleanup: // CLEANUP
    json_object_put(jobj);
    return status;
}

Info_Array* portfolio_info_array_init_from_portfolio_string(String* pString) {
    if (pString->len == 0) // If empty portfolio file
        RETNULL_MSG("Your portfolio is empty.")

    Json* jobj = json_tokener_parse(pString->data);
    size_t length = json_object_array_length(jobj);
    if (length == 0) { // If empty array
        json_object_put(jobj);
        RETNULL_MSG("Your portfolio is empty.");
    }

    Info_Array* portfolio_data = info_array_init_length(length);
    portfolio_data->totals->total_spent = 0;
    for (size_t i = 0; i < portfolio_data->length; i++) {
        strcpy(portfolio_data->array[i]->symbol,
               json_object_get_string(json_object_object_get(json_object_array_get_idx(jobj, i),
                                                             "Symbol")));
        portfolio_data->array[i]->amount = json_object_get_double(json_object_object_get(
                json_object_array_get_idx(jobj, i), "Shares"));
        portfolio_data->array[i]->total_spent = json_object_get_double(json_object_object_get(
                json_object_array_get_idx(jobj, i), "USD_Spent"));
        portfolio_data->totals->total_spent += portfolio_data->array[i]->total_spent;
    }

    json_object_put(jobj);
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

int portfolio_symbol_index(const char* symbol, const Json* jarray) {
    for (size_t i = 0; i < json_object_array_length(jarray); i++) {
        const char* string = json_object_get_string(
                json_object_object_get(json_object_array_get_idx(jarray, (size_t) i), "Symbol"));
        if (streq(string, symbol))
            return (int) i;
    }

    return -1;
}