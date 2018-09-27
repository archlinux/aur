#include "utils.h"

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

String* file_get_string(const char* file_name) {
    struct stat file_info;
    if (stat(file_name, &file_info)) // If called from portfolio_modify_string, file should exist (possibly size 0)
        return NULL;

    if (file_info.st_size == 0) // Return new String if new file
        return string_init();

    FILE* fp = fopen(file_name, "r");
    if (fp == NULL) // If file exists, but cannot be opened, usually because of permissions
        RETNULL_MSG("Error opening file.")

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
    return pString;
}

void string_write_file(const String* pString, const char* file_name) {
    FILE* fp = fopen(file_name, "w");
    if (fp == NULL)
        RET_MSG("Error opening file.")
    if (fwrite(pString->data, sizeof(char), pString->len, fp) != pString->len)
        puts("Error writing file.");
    fclose(fp);
}

void string_destroy(String** phString) {
    if (*phString == NULL)
        return;

    String* pString = *phString;
    free(pString->data);
    free(*phString);
    *phString = NULL;
}

void pointer_alloc_check(const void* alloced) {
    if (alloced == NULL)
        EXIT_MSG("alloc failed!")
}

int is_string_json_array(const String* pString) {
    Json* jobj = json_tokener_parse(pString->data);
    int formatted = jobj != NULL && json_object_is_type(jobj, json_type_array);
    json_object_put(jobj);
    return formatted;
}

int is_str_number(const char* string) {
    size_t len = strlen(string);
    if (len == 0)
        return 0;

    for (size_t i = 0; i < len; i++)
        if (!isdigit(string[i]) && string[i] != '.')
            return 0;

    return 1;
}

double csv_read_next_double(String* pString, size_t* idx) {
    char string[32];
    size_t i, j = 0;
    for (i = *idx; pString->data[i] != ',' && pString->data[i] != '\n' && i < pString->len; i++,
            j++)
        string[j] = pString->data[i];

    string[j] = '\0';
    *idx = i + 1;
    return strtod(string, NULL);
}

int csv_goto_next_line(String* pString, size_t* idx) {
    size_t i;
    for (i = *idx; i < pString->len; i++) {
        if (pString->data[i] == '\n') {
            *idx = i + 1;
            return 1;
        }
    }

    return 0;
}

int csv_goto_next_value(String* pString, size_t* idx) {
    size_t i;
    for (i = *idx; i < pString->len; i++) {
        if (pString->data[i] == ',') {
            *idx = i + 1;
            return 1;
        }
    }

    return 0;
}

size_t string_get_num_lines(String* pString) {
    size_t lines = 0, i = 0;
    while (i++ < pString->len)
        if (pString->data[i] == '\n')
            lines++;

    return lines;
}