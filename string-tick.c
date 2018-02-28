#include "string-tick.h"
#include "portfolio.h"

String* string_init(void) {
    String* pString = (String*) malloc(sizeof(String));
    if (pString != NULL) {
        pString->len = 0;
        pString->data = (char*) malloc(sizeof(char));
        if (pString->data == NULL) {
            fprintf(stderr, "malloc() failed\n");
            exit(EXIT_FAILURE);
        }
        pString->data[0] = '\0';
    } else {
        fprintf(stderr, "malloc() failed\n");
        exit(EXIT_FAILURE);
    }
    return pString;
}

void strtolower(char* str) {
    for (int i = 0; str[i] != '\0'; i++)
        str[i] = (char) tolower(str[i]);
}

void strtoupper(char* str) {
    for (int i = 0; str[i] != '\0'; i++)
        str[i] = (char) toupper(str[i]);
}

char* strip_char(char* string, char c) {
    size_t len = strlen(string);
    int i, j;
    for (i = 0, j = 0; j < (int) len; i++, j++) {
        while (string[j] == c)
            j++;
        string[i] = string[j];
    }
    string[i] = '\0';
    return string;
}

void string_write_portfolio(String* pString){
    FILE* fp = fopen(portfolio_file, "w"); // fprintf %s won't work since there some chars are encoded to '\0', so it
    for (int i = 0; i < (int) pString->len; i++)    // will be null terminated several times in the middle
        fputc(pString->data[i], fp);
    fclose(fp);
}

void string_destroy(String** phString) {
    String* pString = *phString;
    free(pString->data);
    free(*phString);
    *phString = NULL;
}