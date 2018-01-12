#include "parse.h"

const static char* attributes[] = {
        "Rank", "Price (USD)", "Price (BTC)", "Volume 24h (USD)",
        "Market Cap (USD)", "Available Supply", "Total Supply",
        "Max Supply", "Percent Change 1h", "Percent Change 24h",
        "Percent Change 7d", "Time updated"
};

JSON json_init(STRING hString, int offset) {
    Json* pJson = (Json*) malloc(sizeof(Json));
    if (pJson != NULL) {
        pJson->id = calloc(64, sizeof(char));
        pJson->name = calloc(64, sizeof(char));
        pJson->symbol = calloc(64, sizeof(char));
        pJson->data = malloc(sizeof(double) * 12);
        if (pJson->id == NULL || pJson->name == NULL || pJson->symbol == NULL) {
            fprintf(stderr, "malloc() failed\n");
            exit(EXIT_FAILURE);
        }
    } else {
        fprintf(stderr, "malloc() failed\n");
        exit(EXIT_FAILURE);
    }
    String* pString = (String*) hString;
    char* str = pString->data;
    int i = 0;
    while (offset > 0) {
        if (str[i] == '}')
            offset--;
        i++;
    }
    int temp, element = 0;
    char* conv = calloc(16, sizeof(char));
    while (str[i] != '}') {
        if (str[i] == ':') {
            i += 3;
            temp = i;
            while (str[i] != QUOTES)
                i++;
            if (element == 0)
                memcpy(pJson->id, &str[temp], (size_t) i - temp);
            else if (element == 1)
                memcpy(pJson->name, &str[temp], (size_t) i - temp);
            else if (element == 2)
                memcpy(pJson->symbol, &str[temp], (size_t) i - temp);
            else {
                memset(conv, '\0', 16);
                memcpy(conv, &str[temp], (size_t) i - temp);
                pJson->data[element - 3] = strtod(conv, NULL);

            }
            element++;
        }
        i++;
    }
    free(conv);
    return pJson;
}

double* json_get_data(JSON hJson){
    Json* pJson = (Json*) hJson;
    return pJson->data;
}

void json_print_all(JSON hJson) {
    Json* pJson = (Json*) hJson;
    printf("ID: %s\nName: %s\nSymbol: %s\n", pJson->id, pJson->name, pJson->symbol);
    for (int i = 0; i < 11; i++)
        printf("%s: %lf\n", attributes[i], pJson->data[i]);
    time_t now = (int) pJson->data[11];
    struct tm ts;
    char buf[80];
    ts = *localtime(&now);
    strftime(buf, sizeof(buf), "%a %Y-%m-%d %H:%M:%S %Z", &ts);
    printf("Time Updated: %s\n", buf);
}

void json_destroy(JSON* phJson) {
    Json* pJson = (Json*) *phJson;
    free(pJson->id);
    free(pJson->name);
    free(pJson->symbol);
    free(pJson->data);
    free(*phJson);
    *phJson = NULL;
}