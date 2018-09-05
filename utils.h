#ifndef TICK_UTILS_H
#define TICK_UTILS_H

#define streq(a,b) (strcmp(a,b) == 0)

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

#define RET_TRUE_MSG(msg) {\
    puts(msg);\
    return 1;\
}

#define RET_FALSE_MSG(msg) {\
    puts(msg);\
    return 0;\
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <json-c/json_tokener.h>
#include <sys/stat.h>

typedef struct string {
    char* data;
    size_t len;
} String;

typedef struct json_object Json;

/**
 * Creates and returns a String object with len 0 and data allocated 1 byte null terminated.
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
 * Returns the contents of a file in a String. Will return NULL if the file doesn't exist, if the
 * file cannot be opened, or if there is an issue reading the file.
 * @param file_name path to file
 * @return String* or NULL
 */
String* file_get_string(const char* file_name);

/**
 * Writes a String to a file. Will return on error opening file.
 * @param pString the String to overwrite with
 */
void string_write_file(const String* pString, const char* file_name);

/**
 * Destroys String object and frees memory. Points the String to NULL.
 * @param phString the String to destroy
 */
void string_destroy(String** phString);

/**
 * If pointer is NULL, print error message and exit the program
 * @param alloced recently alloced pointer
 */
void pointer_alloc_check(const void* alloced);

/**
 * Returns 1 if the given String is JSON formatted.
 * @param pString the String to check
 * @return 1 if JSON formatted, 0 otherwise
 */
int is_string_json_array(const String* pString);

/**
 * Returns 1 if the string contains only digits or 0 otherwise
 * @param string char*
 * @return 1 is number, 0 if not
 */
int is_str_number(const char* string);

/**
 * Starting at pString->data[*idx], returns the next double and advances idx to after the next
 * comma or newline
 * @param pString String*
 * @param idx index
 * @return value as double
 */
double csv_read_next_double(String* pString, size_t* idx);

/**
 * Advances idx past the next newline in pString
 * @param pString String*
 * @param idx index
 * @return 1 if success, 0 if encountered end of string
 */
int csv_goto_next_line(String* pString, size_t* idx);

/**
 * Advances idx to the start of the next value
 * @param pString String*
 * @param idx index
 * @return 1 if success, 0 if encountered end of string
 */
int csv_goto_next_value(String* pString, size_t* idx);

/**
 * Returns the number of lines in a String
 * @param pString String*
 * @return size_t number of lines
 */
size_t string_get_num_lines(String* pString);

#endif