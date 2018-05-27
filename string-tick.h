#ifndef STRING_TICK_H
#define STRING_TICK_H

#define RET_MSG(msg) {\
    puts(msg);\
    return;\
}

#define RETNULL_MSG(msg) {\
    puts(msg);\
    return NULL;\
}

#define GOTO_CLEAN_MSG(msg) {\
    puts(msg);\
    goto cleanup;\
}

#define EXIT_MSG(msg) {\
    fprintf(stderr, "%s\n", msg);\
    exit(EXIT_FAILURE);\
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

typedef struct string {
    char* data;
    size_t len;
} String;

typedef struct json_object Json;

/**
 * Creates and returns a String object with len 1 and no data
 * @return STRING object
 */
String* string_init(void);

/**
 * Changes letters in a string to lowercase in place
 * @param str the string
 */
void strtolower(char* str);

/**
 * Changes letters in a string to uppercase in place
 * @param str the string
 */
void strtoupper(char* str);

/**
 * Returns the input string, stripped of the given char c in place
 * @param string the string to strip the char from
 * @param c the char to strip
 * @return input string
 */
char* strip_char(char* string, char c);

/**
 * Returns the input string, stripped of all HTML tags.
 * @param string input string
 * @return input string
 */
char* strip_tags(char* string);

/**
 * Overwrites the portfolio with the given pString
 * @param pString the String to overwrite with
 */
void string_write_portfolio(String* pString);

/**
 * Destroys String object and frees memory. Points the String to NULL.
 * @param phString the String to destroy
 */
void string_destroy(String** phString);

/**
 * If pointer is NULL, print error message and exit the program
 * @param alloced recently alloced pointer
 */
void pointer_alloc_check(void* alloced);

#endif