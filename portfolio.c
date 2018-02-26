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

char* portfolio_file_get_string(FILE* fp, size_t* len) {
    char* portfolio_string = calloc(65536, 1);
    if (portfolio_string == NULL) {
        fprintf(stderr, "calloc() failed\n");
        exit(EXIT_FAILURE);
    }
    fseek(fp, 0, SEEK_END);
    size_t portfolio_size = (size_t) ftell(fp);
    if (len != NULL)
        *len = portfolio_size;
    fseek(fp, 0, SEEK_SET);
    if (fread(portfolio_string, sizeof(char), portfolio_size, fp) != portfolio_size)
        return NULL;
    return portfolio_string;
}

void portfolio_modify(const char* ticker_name_string, double quantity_shares, double usd_spent, FILE* fp, int option) {
    if (quantity_shares < 0 || usd_spent < 0) { // Negative numbers
        printf("You must use positive values.\n");
        return;
    }
    if (option != SET && quantity_shares == 0 && usd_spent == 0) { // Adding or removing 0
        printf("You cannot add or remove values of 0.\n");
        return;
    }
    size_t len;
    char* portfolio_string = portfolio_file_get_string(fp, &len);
    Json* jobj = NULL;
    if (len == 0) //new file
        jobj = json_object_new_array();
    else jobj = json_tokener_parse(portfolio_string); //existing file
    char* password = NULL;
    if (jobj == NULL) { //ENCRYPTED PORTFOLIO
        password = rc4_getPassword();
        printf("Decrypting portfolio...\n");
        portfolio_encrypt_decrypt(DECRYPT, fp, password);
        fp = fopen(portfolio_file, "r+");
        free(portfolio_string);
        portfolio_string = portfolio_file_get_string(fp, NULL);
        json_object_put(jobj);
        jobj = json_tokener_parse(portfolio_string);
        if (jobj == NULL) {
            free(portfolio_string);
            return;
        }
    }
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
    if (password != NULL) { // If portfolio was decrypted, encrypt again
        fflush(fp);
        printf("Encrypting porfolio...\n");
        portfolio_encrypt_decrypt(ENCRYPT, fp, password);
        free(password);
    }
    json_object_put(jobj);
    free(portfolio_string);
}

void portfolio_print_all(FILE* fp) {
    char* portfolio_string = portfolio_file_get_string(fp, NULL);
    double* data, total_owned = 0, total_spent = 0, total_gain_1d = 0;
    Json* jobj = json_tokener_parse(portfolio_string);
    char* password = NULL;
    if (jobj == NULL) { //ENCRYPTED PORTFOLIO
        password = rc4_getPassword();
        printf("Decrypting portfolio...\n");
        portfolio_encrypt_decrypt(DECRYPT, fp, password);
        fp = fopen(portfolio_file, "r+");
        free(portfolio_string);
        portfolio_string = portfolio_file_get_string(fp, NULL);
        json_object_put(jobj);
        jobj = json_tokener_parse(portfolio_string);
        if (jobj == NULL) {
            free(portfolio_string);
            return;
        }
    }
    if (strcmp(portfolio_string, "") == 0)
        return;
    int num_symbols = (int) json_object_array_length(jobj);
    printf("  AMOUNT SYMBOL    VALUE    SPENT   PROFIT       (%%)      24H       (%%)\n");
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
    if (password != NULL) { // If portfolio was decrypted, encrypt again
        fflush(fp);
        printf("Encrypting porfolio...\n");
        portfolio_encrypt_decrypt(ENCRYPT, fp, password);
        free(password);
    }
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
    char symbol[32];
    double* data = malloc(sizeof(double) * 3);
    char* portfolio_string = NULL;
    char* password = NULL;
    Json* jobj = NULL;
    if (fp == NULL) { //if being called from portfolio_print_all
        strcpy(symbol, json_object_get_string(json_object_object_get(current_index, "Symbol")));
        strip_char(symbol, '\"');
        data[0] = json_object_get_double(json_object_object_get(current_index, "Shares"));
        data[1] = json_object_get_double(json_object_object_get(current_index, "USD_Spent"));
    } else { //if being called directly from main
        strcpy(symbol, ticker_name_string);
        portfolio_string = portfolio_file_get_string(fp, NULL);
        jobj = json_tokener_parse(portfolio_string);
        if (jobj == NULL) { //ENCRYPTED PORTFOLIO
            password = rc4_getPassword();
            printf("Decrypting portfolio...\n");
            portfolio_encrypt_decrypt(DECRYPT, fp, password);
            fp = fopen(portfolio_file, "r+");
            free(portfolio_string);
            portfolio_string = portfolio_file_get_string(fp, NULL);
            json_object_put(jobj);
            jobj = json_tokener_parse(portfolio_string);
            if (jobj == NULL) {
                free(portfolio_string);
                return NULL;
            }
        }
        int index = portfolio_symbol_index(symbol, jobj);
        if (index == -1) {
            printf("You do not have %s in your portfolio.\n", symbol);
            return data;
        }
        current_index = json_object_array_get_idx(jobj, (size_t) index);
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
    if (fp != NULL) {
        json_object_put(jobj);
        if (password != NULL) { // If portfolio was decrypted, encrypt again
            fflush(fp);
            printf("Encrypting porfolio...\n");
            portfolio_encrypt_decrypt(ENCRYPT, fp, password);
            free(password);
        }
    }
    free(portfolio_string);
    return data;
}

int portfolio_symbol_index(const char* ticker_name_string, Json* jarray) {
    char string[32];
    for (int i = 0; i < (int)json_object_array_length(jarray); i++) {
        strcpy(string, json_object_to_json_string(json_object_object_get(json_object_array_get_idx(jarray, (size_t) i), "Symbol")));
        strip_char(string, '\"');
        if (strcmp(string, ticker_name_string) == 0)
            return i;
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

void portfolio_legacy_convert(void) {
    printf("Warning: this will overwrite your JSON formatted portfolio, which is stored at: \"$HOME/.tick_portfolio.json\". Continue? y/n\n");
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
    char* pf = portfolio_file_get_string(fp, NULL);
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

char* portfolio_get_encrypt_string(char* input, size_t input_len, char* password) {
    int keySchedule[256];
    rc4_key_exchange(keySchedule, password);
    char* output = rc4_prga(keySchedule, input_len);
    rc4_execute(output, input, input_len);
    return output;
}

void portfolio_encrypt_decrypt(int option, FILE* fp, char* password) {
    int free_pw = 0;
    if (password == NULL)
        free_pw = 1;
    fp = fopen(portfolio_file, "r+");
    size_t len;
    char* ps = portfolio_file_get_string(fp, &len);
    Json* jobj = json_tokener_parse(ps);
    if (option == ENCRYPT && jobj == NULL) // If trying to encrypt an encrypted portfolio
        printf("Your portfolio is already encrypted.\n");
    else if (option == DECRYPT && jobj != NULL) // If trying to decrypt an unencrypted portfolio
        printf("Your portfolio isn't encrypted.\n");
    else {
        if (password == NULL) {
            password = rc4_getPassword();
            if (option == ENCRYPT) { // When encrypting, ask to enter pw twice to make sure
                printf("You will be asked to enter your password again to make sure the entries match.\n");
                sleep(2);
                char* passwordCheck = rc4_getPassword();
                if (strcmp(password, passwordCheck) != 0) {
                    printf("Passwords do not match!\n");
                    free(password);
                    free(passwordCheck);
                    free(ps);
                    json_object_put(jobj);
                    return;
                }
                free(passwordCheck);
            }
        }
        char* encrypted = portfolio_get_encrypt_string(ps, len, password);
        if (option == DECRYPT) {
            json_object_put(jobj);
            encrypted = realloc(encrypted, len + 1);// Realloc to add null terminator for json parsing
            if (encrypted == NULL) {                // Dealing with len is annoying so it's easier to just realloc
                fprintf(stderr, "malloc() failed\n");
                exit(EXIT_FAILURE);
            }
            encrypted[len] = '\0';
            jobj = json_tokener_parse(encrypted);
            if (jobj == NULL) { // If after decrypting, the portfolio is not JSON formatted,
                printf("Wrong password!\n"); // then it's the wrong password
                free(encrypted);
                free(password);
                free(ps);
                return;
            }
        }
        remove(portfolio_file); // Remove existing file and use fputc to write
        fp = fopen(portfolio_file, "w"); // fprintf %s won't work since there some chars are encoded to '\0', so it
        for (int i = 0; i < (int)len; i++)    // will be null terminated several times in the middle
            fputc(encrypted[i], fp);
        fclose(fp);
        free(encrypted);
        if (free_pw) { // If being called from main
            free(password);
            if (option == ENCRYPT)
                printf("Successfully encrypted your portfolio.\n");
            else printf("Successfully decrypted your portfolio.\n");
        }
    }
    if (jobj != NULL)
        json_object_put(jobj);
    free(ps);
}