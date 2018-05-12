#ifndef RC4_H
#define RC4_H

#define PASS_MAX 32
#define BACKSPACE 127
#define KEY_SCHEDULE_LENGTH 256
#define DECRYPT 0
#define ENCRYPT 1

#include <ncurses.h>
#include <json-c/json_tokener.h>
#include <unistd.h>
#include "string-tick.h"

/**
 * Returns a password string taken from user input with a maximum of 32 characters. The user's input
 * should not be echoed in the terminal, so ncurses noecho() function should be used.
 * @return the password taken from input
 */
char* rc4_getPassword(void);

/**
 * Returns an encoded string given a String object and password used to encode it.
 * @param pString The String to encode.
 * @param password the key used to encode
 */
void rc4_encode_string(String* pString, char* password);

#endif