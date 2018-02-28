#ifndef STRING_TICK_H
#define STRING_TICK_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

struct string {
    char* data;
    size_t len;
};

typedef struct string String;

typedef struct json_object Json;

/**
 * Creates and returns a STRING
 * object with size 1 and no data
 * @return STRING object
 */
String* string_init(void);

/**
 * Changes letters in a string to lowercase
 * @param str the string
 */
void strtolower(char* str);

/**
 * Changes letters in a string to uppercase
 * @param str the string
 */
void strtoupper(char* str);

/**
 * Returns the input string, stripped of the given char
 * @param string the string to strip the char from
 * @param c the char to strip
 * @return input string
 */
char* strip_char(char* string, char c);

void string_write_portfolio(String* pString);

/**
 * Destroys String object and frees memory
 * @param phString the String to destroy
 */
void string_destroy(String** phString);

#endif