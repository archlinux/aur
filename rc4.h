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
 * Takes a password from user input and returns it (max 32 chars)
 * @return password
 */
char* rc4_getPassword(void);

/**
 * Performs key exchange
 * @param keySchedule
 * @param key password
 */
void rc4_key_exchange(int keySchedule[KEY_SCHEDULE_LENGTH], char* key);

/**
 * Performs pseudo-random generation algorithm
 * @param keySchedule
 * @param len size of portfolio in bytes
 * @return string that can be XOR'ed with message to be en/decoded
 */
char* rc4_prga(int keySchedule[KEY_SCHEDULE_LENGTH], size_t len);

/**
 * XOR's the string created by prga by the portfolio to encrypt or decrypt it
 * @param output string to be XOR'ed
 * @param message portoflio string
 * @param len length of portfolio in bytes
 */
void rc4_execute(char* output, String* pString);

/**
 * Returns an either encrypted or decrypted string of the input
 * @param input the string to encrypt or decrypt
 * @param input_len the length of the string
 * @param password the password to encrypt or decrypt with
 * @return encrypted or decrypted string
 */
char* rc4_encode_string(String* pString, char* password);

String* rc4_get_crypted_string(String* input_pString, char* password, int option);

#endif