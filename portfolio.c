#include "portfolio.h"

void portfolio_file_init(){
    char* home = getenv("HOME");
    char* path = (char*)malloc(strlen(home) + 21);
    memcpy(path, home, strlen(home) + 1);
    memcpy(&path[strlen(home)], "/.getcrypt_portfolio", 21);
    portfolio_file = path;
}

void portfolio_modify(char* id, double amount, double amount_spent, FILE* fp, int option) {
    if (portfolio_contains(id, fp)) {
        long position = ftell(fp);
        char* beginning = (char*) calloc(65536, sizeof(char));
        char* end = (char*) calloc(65536, sizeof(char));
        fseek(fp, 0, SEEK_SET);
        for (int i = 0; i < (int) position; i++)
            beginning[i] = (char) fgetc(fp);
        fseek(fp, position, SEEK_SET);
        double new_amount;
        double new_amount_spent;
        if (option == ADD) {
            new_amount = get_next_val(fp) + amount;
            new_amount_spent = get_next_val(fp) + amount_spent;
        } else if (option == REMOVE) {
            new_amount = get_next_val(fp) - amount;
            new_amount_spent = get_next_val(fp) - amount_spent;
        } else {
            new_amount = amount;
            new_amount_spent = amount_spent;
            get_next_val(fp);
            get_next_val(fp);
        }
        char c;
        for (int i = 0;; i++) {
            c = (char) fgetc(fp);
            if (feof(fp))
                break;
            end[i] = c;
        }
        if (end[strlen(end)-1] == '\n')
            end[strlen(end)-1] = '\0';
        remove(portfolio_file);
        fp = fopen(portfolio_file, "w");
        fprintf(fp, "%s%lf %lf", beginning, new_amount, new_amount_spent);
        if (strlen(end) != 0)
            fprintf(fp, "\n%s", end);
        free(beginning);
        free(end);
        fclose(fp);
    } else {
        if (option == REMOVE){
            printf("You don't have any %s to remove!\n", id);
            return;
        }
        fseek(fp, 0, SEEK_END);
        if (ftell(fp) != 0)
            fprintf(fp, "\n");
        fprintf(fp, "%s %lf %lf", id, amount, amount_spent);
    }
}

double portfolio_get_amount(char* id, FILE* fp) {
    if (portfolio_contains(id, fp))
        return get_next_val(fp);
    return 0;
}

double portfolio_get_amount_spent(char* id, FILE* fp) {
    if (portfolio_contains(id, fp)) {
        get_next_val(fp);
        return get_next_val(fp);
    }
    return 0;
}

void portfolio_print_all(STRING api_data, JSON crypto_data, FILE* fp){
    char* str = (char*)calloc(64, sizeof(char));
    char* id = (char*)calloc(32, sizeof(char));
    double* data;
    double total_owned=0, total_spent=0;
    int i;
    char c;
    while (fgets(str, 63, fp) != NULL){
        i = 0;
        while ((c = str[i]) != ' ') {
            id[i] = c;
            i++;
        }
        string_write_data(api_data, id);
        crypto_data = json_init(api_data, 0);
        data = portfolio_print_currency(id, json_get_data(crypto_data), fp);
        total_owned += data[0];
        total_spent += data[1];
        memset(str, '\0', 64);
        memset(id, '\0', 32);
        string_destroy(&api_data);
        json_destroy(&crypto_data);
        api_data = string_init();
        crypto_data = NULL;
        free(data);
    }
    printf("\nTotal amount owned: $%lf. Total amount spent: $%lf.\n", total_owned, total_spent);
    string_destroy(&api_data);
    free(str);
    free(id);
}

double* portfolio_print_currency(char* id, const double* data, FILE* fp) {
    double* a = malloc(sizeof(double)*2);
    if (portfolio_get_amount_spent(id, fp)) {
        a[0] = portfolio_get_amount(id, fp) * data[PRICE_USD];
        a[1] = portfolio_get_amount_spent(id, fp);
        if (a[0] == 0 && a[1] == 0)
            printf("Your portfolio does not contain %s\n", id);
        else printf("%lf %s. Purchased for: $%lf. Current value: $%lf.\n", a[0] / data[PRICE_USD], id, a[1], a[0]);
    } else {
        printf("Your portfolio does not contain %s\n", id);
        return NULL;
    }
    return a;
}

int portfolio_contains(char* id, FILE* fp) {
    fseek(fp, 0, SEEK_SET);
    char* temp = (char*) calloc(16, sizeof(char)), c;
    int i = 0;
    while (1) {
        c = (char) fgetc(fp);
        if (feof(fp)) {
            fseek(fp, 0, 0);
            free(temp);
            return 0;
        }
        if (c == ' ') {
            if (strcmp(id, temp) == 0) {
                free(temp);
                return 1;
            } else {
                while (fgetc(fp) != '\n') {
                    if (feof(fp))
                        break;
                }
                memset(temp, '\0', 16);
                i = 0;
            }
        } else {
            temp[i] = c;
            i++;
        }
    }
}

double get_next_val(FILE* fp) {
    char* temp = (char*) calloc(32, sizeof(char)), c;
    int i = 0;
    while ((c = (char) fgetc(fp)) != ' ' && c != '\n') {
        if (feof(fp))
            break;
        temp[i] = c;
        i++;
    }
    double val = strtod(temp, NULL);
    free(temp);
    return val;
}