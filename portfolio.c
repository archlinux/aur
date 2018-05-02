#include "portfolio.h"

char* portfolio_file;

void portfolio_file_init(void) {
    char* home = getenv("HOME");
    char* path = (char*) malloc(strlen(home) + 30);
    pointer_alloc_check(path);
    sprintf(path, "%s/.tick_portfolio.json", home);
    portfolio_file = path;
}

String* portfolio_file_get_string(void) {
    FILE* fp = fopen(portfolio_file, "r"); // Must be w+ because r will fail if portfolio doesn't exist
    if (fp == NULL)
        return NULL;
    String* pString = string_init();
    pString->data = realloc(pString->data, 65536);
    pointer_alloc_check(pString->data);
    memset(pString->data, '\0', 65536);
    fseek(fp, 0, SEEK_END);
    pString->len = (size_t) ftell(fp);
    fseek(fp, 0, SEEK_SET);
    if (fread(pString->data, sizeof(char), pString->len, fp) != pString->len) {
        fclose(fp);
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
        FILE* fp = fopen(portfolio_file, "a"); // Creates if doesn't exist
        fclose(fp);
    }
    Json* jobj = NULL;
    if (pString == NULL || pString->len == 0) { //new file
        if (pString != NULL && pString->len == 0)
            string_destroy(&pString);
        jobj = json_object_new_array();
    } else jobj = json_tokener_parse(pString->data); //existing file
    char* password = NULL;
    if (jobj == NULL) { //ENCRYPTED PORTFOLIO
        password = rc4_getPassword();
        printf("Decrypting portfolio...\n");
        String* temp = rc4_get_crypted_string(pString, password, DECRYPT);
        string_destroy(&pString);
        pString = temp;
        if (pString == NULL)
            return;
        jobj = json_tokener_parse(pString->data);
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
        if (current_shares == 0 && usd_spent == 0) // Deletes index from portfolio if values are 0
            json_object_array_del_idx(jobj, (size_t) index, 1);
        else {
            json_object_object_add(current_index, "Shares", json_object_new_double(
                    round(current_shares * 100) / 100)); // Adds computed values to index
            json_object_object_add(current_index, "USD_Spent",
                                   json_object_new_double(round(current_spent * 100) / 100));
        }
    }
    if (pString == NULL) // If new portfolio
        pString = string_init();

    pString->len = strlen(json_object_to_json_string(jobj));
    pString->data = realloc(pString->data, pString->len + 1);
    pointer_alloc_check(pString->data);

    strcpy(pString->data, json_object_to_json_string(jobj));
    if (password != NULL) { // If data must be re-encrypted
        printf("Encrypting portfolio...\n");
        String* temp = rc4_get_crypted_string(pString, password, ENCRYPT);
        string_destroy(&pString);
        pString = temp;
        free(password);
    }
    string_write_portfolio(pString);
    json_object_put(jobj);
    string_destroy(&pString);
}

SDA* portfolio_get_data_array(void) {
    String* pString = portfolio_file_get_string();
    if (pString == NULL) {
        puts("Empty portfolio.");
        return NULL;
    }
    if (strcmp(pString->data, "") == 0) {
        puts("Empty portfolio.");
        string_destroy(&pString);
        return NULL;
    }

    Json* jobj = json_tokener_parse(pString->data);
    char* password = NULL;
    if (jobj == NULL) { //ENCRYPTED PORTFOLIO
        password = rc4_getPassword();
        printf("Decrypting portfolio...\n");
        String* temp = rc4_get_crypted_string(pString, password, DECRYPT);
        string_destroy(&pString);
        pString = temp;
        if (pString == NULL)
            return NULL;
        jobj = json_tokener_parse(pString->data);
        if (password != NULL)
            free(password);
    }

    size_t portfolio_size = json_object_array_length(jobj);
    if (portfolio_size == 0)
        return NULL;

    SDA* portfolio_data = malloc(sizeof(SDA));
    pointer_alloc_check(portfolio_data);
    portfolio_data->length = portfolio_size;
    portfolio_data->sec_data = malloc(sizeof(SD*) * portfolio_data->length);
    pointer_alloc_check(portfolio_data->sec_data);

    Json* json_index;
    SD* tcd_index;
    for (size_t i = 0; i < portfolio_data->length; i++) {
        portfolio_data->sec_data[i] = malloc(sizeof(SD));
        tcd_index = portfolio_data->sec_data[i];
        pointer_alloc_check(tcd_index);
        json_index = json_object_array_get_idx(jobj, i);
        strcpy(tcd_index->symbol, json_object_get_string(json_object_object_get(json_index, "Symbol")));
        tcd_index->amount = json_object_get_double(json_object_object_get(json_index, "Shares"));
        tcd_index->total_spent = json_object_get_double(json_object_object_get(json_index, "USD_Spent"));
    }
    json_object_put(jobj);
    string_destroy(&pString);
    return portfolio_data;
}

void portfolio_store_api_data(SD* sec_data) {
    if (strcmp(sec_data->symbol, "USD$") != 0) {
        double* ticker_data = api_get_current_price(sec_data->symbol);
        sec_data->current_value = sec_data->amount * ticker_data[0];
        sec_data->total_profit = sec_data->current_value - sec_data->total_spent;
        sec_data->total_profit_percent = 100 * ((ticker_data[0] / (sec_data->total_spent / sec_data->amount)) - 1);
        sec_data->total_profit_percent = 100 * ((ticker_data[0] / (sec_data->total_spent / sec_data->amount)) - 1);
        sec_data->one_day_profit = sec_data->current_value - (sec_data->amount * ticker_data[1]);
        sec_data->one_day_profit_percent = 100 * ((ticker_data[0] / ticker_data[1]) - 1);
        free(ticker_data);
    } else {
        sec_data->current_value = sec_data->amount;
        sec_data->total_profit = sec_data->current_value - sec_data->total_spent;
        sec_data->total_profit_percent = 100 * sec_data->total_profit / sec_data->total_spent;
        sec_data->one_day_profit = 0;
        sec_data->one_day_profit_percent = 0;
    }
}

void portfolio_print_all(void) {
    SDA* sda_data = portfolio_get_data_array();
    printf("  AMOUNT SYMBOL    VALUE    SPENT   PROFIT       (%%)      24H       (%%)\n");
    double total_owned = 0, total_spent = 0, total_profit_1d = 0;
    SD* sec_data;
    for (size_t i = 0; i < sda_data->length; i++) {
        sec_data = sda_data->sec_data[i];
        portfolio_store_api_data(sec_data);
        printf("%8.2lf %6s %8.2lf %8.2lf %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%)\n", sec_data->amount, sec_data->symbol,
               sec_data->current_value, sec_data->total_spent, sec_data->total_profit, sec_data->total_profit_percent,
               sec_data->one_day_profit, sec_data->one_day_profit_percent);
        total_owned += sec_data->current_value;
        total_spent += sec_data->total_spent;
        total_profit_1d += sec_data->one_day_profit;
    }
    printf("\n         TOTALS %8.2lf %8.2lf %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%)\n",
           total_owned, total_spent, total_owned - total_spent, (100 * (total_owned - total_spent)) / total_spent,
           total_profit_1d, 100 * total_profit_1d / total_spent);
    sda_destroy(&sda_data);
}

void portfolio_print_stock(char* ticker_name_string) {
    SDA* sda_data = portfolio_get_data_array();
    SD* sec_data = NULL;
    for (size_t i = 0; i < sda_data->length; i++) {
        if (strcmp(sda_data->sec_data[i]->symbol, ticker_name_string) == 0) {
            sec_data = sda_data->sec_data[i];
            break;
        }
    }
    if (sec_data == NULL) {
        printf("Your portfolio does not contain any %s.\n", ticker_name_string);
        sda_destroy(&sda_data);
        return;
    }
    portfolio_store_api_data(sec_data);
    printf("  AMOUNT SYMBOL    VALUE    SPENT   PROFIT       (%%)      24H       (%%)\n");
    printf("%8.2lf %6s %8.2lf %8.2lf %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%)\n", sec_data->amount, sec_data->symbol,
           sec_data->current_value, sec_data->total_spent, sec_data->total_profit, sec_data->total_profit_percent,
           sec_data->one_day_profit, sec_data->one_day_profit_percent);
    sda_destroy(&sda_data);
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

void sda_destroy(SDA** phSDA) {
    SDA* ptr = *phSDA;
    for (size_t i = 0; i < ptr->length; i++)
        free(ptr->sec_data[i]);
    free(ptr->sec_data);
    free(ptr);
    *phSDA = NULL;
}