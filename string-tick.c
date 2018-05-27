#include "string-tick.h"
#include "portfolio.h"

String* string_init(void) {
    String* pString = (String*) malloc(sizeof(String));
    pointer_alloc_check(pString);
    pString->len = 0;
    pString->data = calloc(sizeof(char), 1);
    pointer_alloc_check(pString->data);
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

char* strip_tags(char* string) {
    size_t len = strlen(string);
    int i, j;
    for (i = 0, j = 0; j < (int) len; i++, j++) {
        if (string[j] == '<')
            while (string[j] != '>')
                j++;
        string[i] = string[j];
    }
    string[i] = '\0';
    return string;
}

void string_write_portfolio(String* pString) {
    FILE* fp = fopen(portfolio_file, "w");
    if (fp == NULL)
        RET_MSG("Error opening file.")
    if (fwrite(pString->data, sizeof(char), pString->len, fp) != pString->len)
        puts("Error writing file.");
    fclose(fp);
}

void string_destroy(String** phString) {
    String* pString = *phString;
    free(pString->data);
    free(*phString);
    *phString = NULL;
}

void pointer_alloc_check(void* alloced) {
    if (alloced == NULL)
        EXIT_MSG("alloc failed!")
}