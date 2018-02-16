#include "portfolio.h"

void portfolio_file_init() {
    char* home = getenv("HOME");
    char* path = (char*) malloc(strlen(home) + 30);
    if (path == NULL) {
        fprintf(stderr, "malloc() failed\n");
        exit(EXIT_FAILURE);
    }
    sprintf(path, "%s/.tick_portfolio.json", home);
    portfolio_file = path;
}

char* portfolio_file_get_string(FILE* fp) {
    char* portfolio_string = calloc(65536, 1);
    fseek(fp, 0, SEEK_END);
    size_t portfolio_size = (size_t) ftell(fp);
    fseek(fp, 0, SEEK_SET);
    if (fread(portfolio_string, sizeof(char), portfolio_size, fp) != portfolio_size)
        return NULL;
    return portfolio_string;
}

void portfolio_modify(char* ticker_name_string, double quantity_shares, double usd_spent, FILE* fp, int option) {
    if (quantity_shares < 0 || usd_spent < 0) {
        printf("You must use positive values.\n");
        return;
    }
    if (option != SET && quantity_shares == 0 && usd_spent == 0) {
        printf("You cannot add or remove values of 0.\n");
        return;
    }
    char* portfolio_string = portfolio_file_get_string(fp);
    if (portfolio_string == NULL) {
        fprintf(stderr, "malloc() failed\n");
        return;
    }
    Json* jobj = NULL;
    if (strcmp(portfolio_string, "") == 0) { //new file
        jobj = json_object_new_array();
    } else jobj = json_tokener_parse(portfolio_string); //existing file
    if (jobj == NULL)
        printf("NULL JOBJ\n");
    int index = portfolio_symbol_index(ticker_name_string, jobj);
    if (index == -1) { //if not already in portfolio
        if (option == REMOVE) {
            printf("You don't have any %s to remove.\n", ticker_name_string);
            free(portfolio_string);
            json_object_put(jobj);
            return;
        }
        if (strcmp("USD$", ticker_name_string) != 0) {
            double* data = api_get_current_price(ticker_name_string); // Curl data and check if NULL
            if (data == NULL) {
                printf("Invalid symbol.\n");
                json_object_put(jobj);
                free(portfolio_string);
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
                free(portfolio_string);
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
    fp = fopen(portfolio_file, "w");
    fprintf(fp, "%s", json_object_to_json_string(jobj));
    fclose(fp);
    json_object_put(jobj);
    free(portfolio_string);
}

void portfolio_print_all(FILE* fp) {
    printf("  AMOUNT SYMBOL    VALUE    SPENT   PROFIT       (%%)      24H       (%%)\n");
    char* portfolio_string = portfolio_file_get_string(fp);
    double* data, total_owned = 0, total_spent = 0, total_gain_1d = 0;
    if (strcmp(portfolio_string, "") == 0)
        return;
    Json* jobj = json_tokener_parse(portfolio_string);
    int num_symbols = (int) json_object_array_length(jobj);
    for (int i = 0; i < num_symbols; i++) {
        data = portfolio_print_stock(NULL, NULL, json_object_array_get_idx(jobj, (size_t) i));
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
    json_object_put(jobj);
    free(portfolio_string);
}

double* portfolio_print_stock(char* ticker_name_string, FILE* fp, Json* current_index) {
    /**
     * Values in USD
     * a[0] -- current balance
     * a[1] -- amount spent
     * a[2] -- 1d gain
     */
    double* data = malloc(sizeof(double) * 3);
    char* portfolio_string = NULL;
    Json* jobj = NULL;
    if (fp == NULL) { //if being called from portfolio_print_all
        ticker_name_string = (char*) strip_char(
                (char*) json_object_get_string(json_object_object_get(current_index, "Symbol")), '\"');
        data[0] = json_object_get_double(json_object_object_get(current_index, "Shares"));
        data[1] = json_object_get_double(json_object_object_get(current_index, "USD_Spent"));
    } else { //if being called directly from main
        portfolio_string = portfolio_file_get_string(fp);
        if (portfolio_string == NULL) {
            fprintf(stderr, "fread() failed\n");
            free(data);
            return NULL;
        }
        jobj = json_tokener_parse(portfolio_string);
        int index = portfolio_symbol_index(ticker_name_string, jobj);
        if (index == -1) {
            printf("You do not have %s in your portfolio.\n", ticker_name_string);
            return data;
        }
        current_index = json_object_array_get_idx(jobj, (size_t) index);
    }
    data[0] = json_object_get_double(json_object_object_get(current_index, "Shares"));
    data[1] = json_object_get_double(json_object_object_get(current_index, "USD_Spent"));
    data[2] = 0;
    double* ticker_data, ticker_current_price_usd = 1, ticker_1d_price_usd, ticker_1d_percent_change = 0;
    if (strcmp(ticker_name_string, "USD$") != 0) {
        ticker_data = api_get_current_price(ticker_name_string);
        ticker_current_price_usd = ticker_data[0];
        ticker_1d_price_usd = ticker_data[1];
        free(ticker_data);
        data[2] = ((ticker_current_price_usd - ticker_1d_price_usd) * data[0]);
        ticker_1d_percent_change = 100 * (ticker_current_price_usd / ticker_1d_price_usd - 1);
        data[0] *= ticker_current_price_usd;
    }
    printf("%8.2lf %6s %8.2lf %8.2lf %8.2lf (%6.2lf%%) %8.2lf (%6.2lf%%)\n",
           data[0] / ticker_current_price_usd, ticker_name_string, data[0], data[1], data[0] - data[1],
           (100 * (data[0] - data[1])) / data[1],
           data[2], ticker_1d_percent_change);
    if (fp == NULL)
        free(ticker_name_string);
    else json_object_put(jobj);
    free(portfolio_string);
    return data;
}

int portfolio_symbol_index(char* ticker_name_string, Json* jarray) {
    int num_symbols = (int) json_object_array_length(jarray);
    char* str;
    for (int i = 0; i < num_symbols; i++) {
        str = (char*) json_object_to_json_string(
                json_object_object_get(json_object_array_get_idx(jarray, (size_t) i), "Symbol"));
        str = (char*) strip_char(str, '\"');
        if (strcmp(str, ticker_name_string) == 0) {
            free(str);
            return i;
        }
        free(str);
    }
    return -1;
}

char* portfolio_legacy_get_next_val(FILE* fp) {
    char* val = calloc(16, 1);
    char c;
    for (int i = 0; i < 16; i++) {
        c = (char) fgetc(fp);
        if (c == ' ' || c == '\n' || feof(fp))
            break;
        val[i] = c;
    }
    return val;
}

void portfolio_legacy_convert() {
    printf("Warning: this will overwrite your JSON formatted portfolio, which is stored at: \"$HOME/.tick_portfolio\". Continue? y/n\n");
    char c = 0;
    while (c != 'y' && c != 'n') {
        if (scanf("%c", &c) < 0)
            c = 0;
    }
    if (c == 'n') {
        printf("Aborted.\n");
        return;
    }
    FILE* fp = fopen(portfolio_file, "w");
    char* pf = portfolio_file_get_string(fp);
    if (pf == NULL) {
        fprintf(stderr, "fread() failed\n");
        exit(EXIT_FAILURE);
    }
    if (strcmp(pf, "") != 0)
        remove(portfolio_file);
    fclose(fp);
    fp = fopen(portfolio_file, "a+");
    free(pf);
    char* legacy_path = malloc(64);
    strcpy(legacy_path, portfolio_file);
    legacy_path[strlen(legacy_path) - 5] = '\0';
    FILE* fp_legacy = fopen(legacy_path, "r");
    free(legacy_path);
    if (!fp) {
        printf("Could not open legacy portfolio.\n");
        return;
    }
    char* symbol, * amount, * spent;
    while (1) {
        symbol = portfolio_legacy_get_next_val(fp_legacy);
        amount = portfolio_legacy_get_next_val(fp_legacy);
        spent = portfolio_legacy_get_next_val(fp_legacy);
        portfolio_modify(symbol, strtod(amount, NULL), strtod(spent, NULL), fp, ADD);
        free(symbol);
        free(amount);
        free(spent);
        if (feof(fp_legacy))
            break;
    }
    printf("Successfully converted portfolio!\n");
    fclose(fp_legacy);
    fclose(fp);
}