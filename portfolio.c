#include "portfolio.h"

char* portfolio_file;

void portfolio_file_init(void) {
    char* home = getenv("HOME");
    char* path = (char*) malloc(strlen(home) + 30);
    if (path == NULL) {
        fprintf(stderr, "malloc() failed\n");
        exit(EXIT_FAILURE);
    }
    sprintf(path, "%s/.tick_portfolio.json", home);
    portfolio_file = path;
}

String* portfolio_file_get_string(void) {
    FILE* fp = fopen(portfolio_file, "r");
    if (fp == NULL)
        return NULL;
    String* pString = string_init();
    pString->data = realloc(pString->data, 65536);
    memset(pString->data, '\0', 65536);
    if (pString->data == NULL) {
        fprintf(stderr, "realloc() failed\n");
        exit(EXIT_FAILURE);
    }
    fseek(fp, 0, SEEK_END);
    pString->len = (size_t) ftell(fp);
    fseek(fp, 0, SEEK_SET);
    if (fread(pString->data, sizeof(char), pString->len, fp) != pString->len) {
        fclose(fp);
        printf("Returning null\n");
        return NULL;
    }
    fclose(fp);
    return pString;
}

void portfolio_modify(const char* ticker_name_string, double quantity_shares, double usd_spent, int option) {
    if (quantity_shares < 0 || usd_spent < 0) { // Negative numbers
        printf("You must use positive values.\n");
        return;
    }
    if (option != SET && quantity_shares == 0 && usd_spent == 0) { // Adding or removing 0
        printf("You cannot add or remove values of 0.\n");
        return;
    }
    String* pString = portfolio_file_get_string();
    if (pString == NULL) {
        printf("Error reading portfolio.\n");
        return;
    }
    Json* jobj = NULL;
    if (pString->len == 0) //new file
        jobj = json_object_new_array();
    else jobj = json_tokener_parse(pString->data); //existing file
    char* password = NULL;
    if (jobj == NULL) { //ENCRYPTED PORTFOLIO
        password = rc4_getPassword();
        printf("Decrypting portfolio...\n");
        String* temp = rc4_get_crypted_string(pString, password, DECRYPT);
        string_destroy(&pString);
        pString = temp;
        jobj = json_tokener_parse(pString->data);
        if (pString == NULL) {
            free(password);
            return;
        }
    }
    int index = portfolio_symbol_index(ticker_name_string, jobj);
    if (index == -1) { //if not already in portfolio
        if (option == REMOVE) {
            printf("You don't have any %s to remove.\n", ticker_name_string);
            json_object_put(jobj);
            string_destroy(&pString);
            if (password != NULL)
                free(password);
            return;
        }
        if (strcmp("USD$", ticker_name_string) != 0) {
            double* data = api_get_current_price(ticker_name_string); // Curl data and check if NULL
            if (data == NULL) {
                printf("Invalid symbol.\n");
                json_object_put(jobj);
                string_destroy(&pString);
                if (password != NULL)
                    free(password);
                return;
            } else free(data);
        }
        Json* new_object = json_object_new_object(); // Creates new array index and adds values to it
        json_object_array_add(jobj, new_object);
        json_object_object_add(new_object, "Symbol", json_object_new_string(ticker_name_string));
        json_object_object_add(new_object, "Shares", json_object_new_double(quantity_shares));
        json_object_object_add(new_object, "USD_Spent", json_object_new_double(usd_spent));
        printf("Added %lf %s bought for %lf to portfolio.\n", quantity_shares, ticker_name_string, usd_spent);
    } else { //if already in portfolio
        Json* current_index = json_object_array_get_idx(jobj, (size_t) index);
        double current_shares = json_object_get_double(
                json_object_object_get(current_index, "Shares")); // Stores values already there
        double current_spent = json_object_get_double(json_object_object_get(current_index, "USD_Spent"));
        json_object_object_del(current_index, "Shares"); // Deletes the objects already there
        json_object_object_del(current_index, "USD_Spent");
        if (option == SET) {
            current_shares = quantity_shares;
            current_spent = usd_spent;
            printf("Set amount of %s in portfolio to %lf bought for %lf.\n", ticker_name_string, quantity_shares,
                   usd_spent);
        } else if (option == ADD) {
            current_shares += quantity_shares;
            current_spent += usd_spent;
            printf("Added %lf %s bought for %lf to portfolio.\n", quantity_shares, ticker_name_string, usd_spent);
        } else {
            current_shares -= quantity_shares;
            current_spent -= usd_spent;
            if (current_shares < 0 || current_spent < 0) { // If you try to remove more than you have
                printf("You do not have that many %s to remove.\n", ticker_name_string);
                json_object_put(jobj);
                string_destroy(&pString);
                if (password != NULL)
                    free(password);
                return;
            }
            printf("Removed %lf %s bought for %lf to portfolio.\n", quantity_shares, ticker_name_string, usd_spent);
        }
        if (current_shares == 0 && usd_spent == 0) //deletes index from portfolio if values are 0
            json_object_array_del_idx(jobj, (size_t) index, 1);
        else {
            json_object_object_add(current_index, "Shares", json_object_new_double(
                    round(current_shares * 100) / 100)); //adds computed values to index
            json_object_object_add(current_index, "USD_Spent",
                                   json_object_new_double(round(current_spent * 100) / 100));
        }
    }
    if (password != NULL) { // If data must be re-encrypted
        printf("Encrypting portfolio...\n");
        strcpy(pString->data, json_object_to_json_string(jobj));
        String* temp = rc4_get_crypted_string(pString, password, ENCRYPT);
        string_destroy(&pString);
        pString = temp;
        free(password);
    }
    json_object_put(jobj);
    string_write_portfolio(pString);
    string_destroy(&pString);
}

void portfolio_print_all(void) {
    String* pString = portfolio_file_get_string();
    if (pString == NULL)
        return;
    if (strcmp(pString->data, "") == 0) {
        string_destroy(&pString);
        return;
    }
    double* data, total_owned = 0, total_spent = 0, total_gain_1d = 0;
    Json* jobj = json_tokener_parse(pString->data);
    char* password = NULL;
    if (jobj == NULL) { //ENCRYPTED PORTFOLIO
        password = rc4_getPassword();
        printf("Decrypting portfolio...\n");
        String* temp = rc4_get_crypted_string(pString, password, DECRYPT);
        string_destroy(&pString);
        pString = temp;
        jobj = json_tokener_parse(pString->data);
    }
    int num_symbols = (int) json_object_array_length(jobj);
    printf("  AMOUNT SYMBOL    VALUE    SPENT   PROFIT       (%%)      24H       (%%)\n");
    for (int i = 0; i < num_symbols; i++) {
        data = portfolio_print_stock(NULL, json_object_array_get_idx(jobj, (size_t) i));
        if (data != NULL) {
            total_owned += data[0];
            total_spent += data[1];
            total_gain_1d += data[2];
        }
        free(data);
    }
    printf("\n         TOTALS %8.2lf %8.2lf %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%)\n",
           total_owned, total_spent, total_owned - total_spent, (100 * (total_owned - total_spent)) / total_spent,
           total_gain_1d, 100 * total_gain_1d / total_spent);
    if (password != NULL)
        free(password);
    json_object_put(jobj);
    string_destroy(&pString);
}

double* portfolio_print_stock(char* ticker_name_string, Json* current_index) {
    /**
     * Values in USD
     * a[0] -- current balance
     * a[1] -- amount spent
     * a[2] -- 1d gain
     */
    char symbol[32];
    double* data = malloc(sizeof(double) * 3);
    if (data == NULL) {
        fprintf(stderr, "malloc() failed\n");
        exit(EXIT_FAILURE);
    }
    String* pString = NULL;
    char* password = NULL;
    Json* jobj = NULL;
    if (current_index != NULL) { //if being called from portfolio_print_all
        strcpy(symbol, json_object_get_string(json_object_object_get(current_index, "Symbol")));
        strip_char(symbol, '\"');
        data[0] = json_object_get_double(json_object_object_get(current_index, "Shares"));
        data[1] = json_object_get_double(json_object_object_get(current_index, "USD_Spent"));
    } else { //if being called directly from main
        strcpy(symbol, ticker_name_string);
        pString = portfolio_file_get_string();
        jobj = json_tokener_parse(pString->data);
        if (jobj == NULL) { //ENCRYPTED PORTFOLIO
            password = rc4_getPassword();
            printf("Decrypting portfolio...\n");
            String* temp = rc4_get_crypted_string(pString, password, DECRYPT);
            string_destroy(&pString);
            pString = temp;
            jobj = json_tokener_parse(pString->data);
            if (pString == NULL) {
                free(password);
                return NULL;
            }
        }
        int index = portfolio_symbol_index(symbol, jobj);
        if (index == -1) {
            printf("You do not have %s in your portfolio.\n", symbol);
            return data;
        }
        current_index = json_object_array_get_idx(jobj, (size_t) index);
        printf("  AMOUNT SYMBOL    VALUE    SPENT   PROFIT       (%%)      24H       (%%)\n");
    }
    data[0] = json_object_get_double(json_object_object_get(current_index, "Shares"));
    data[1] = json_object_get_double(json_object_object_get(current_index, "USD_Spent"));
    data[2] = 0;
    double* ticker_data, ticker_current_price_usd = 1, ticker_1d_price_usd, ticker_1d_percent_change = 0;
    if (strcmp(symbol, "USD$") != 0) {
        ticker_data = api_get_current_price(symbol);
        ticker_current_price_usd = ticker_data[0];
        ticker_1d_price_usd = ticker_data[1];
        free(ticker_data);
        data[2] = ((ticker_current_price_usd - ticker_1d_price_usd) * data[0]);
        ticker_1d_percent_change = 100 * (ticker_current_price_usd / ticker_1d_price_usd - 1);
        data[0] *= ticker_current_price_usd;
    }
    printf("%8.2lf %6s %8.2lf %8.2lf %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%)\n",
           data[0] / ticker_current_price_usd, symbol, data[0], data[1], data[0] - data[1],
           (100 * (data[0] - data[1])) / data[1],
           data[2], ticker_1d_percent_change);
    if (password != NULL)
        free(password);
    json_object_put(jobj);
    if (pString != NULL)
        string_destroy(&pString);
    return data;
}

int portfolio_symbol_index(const char* ticker_name_string, Json* jarray) {
    char string[32];
    for (int i = 0; i < (int) json_object_array_length(jarray); i++) {
        strcpy(string, json_object_to_json_string(
                json_object_object_get(json_object_array_get_idx(jarray, (size_t) i), "Symbol")));
        strip_char(string, '\"');
        if (strcmp(string, ticker_name_string) == 0)
            return i;
    }
    return -1;
}