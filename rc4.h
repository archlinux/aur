#ifndef TICK_RC4_H
#define TICK_RC4_H

#define PASS_MAX 32
#define BACKSPACE 127
#define KEY_SCHEDULE_LENGTH 256
#define DECRYPT 0
#define ENCRYPT 1

#include <ncurses.h>
#include <json-c/json_tokener.h>
#include <unistd.h>
#include "utils.h"
#include "portfolio.h"

/**
 * Returns a password string taken from user input with a maximum of 32 characters. The user's input
 * should not be echoed in the terminal, so ncurses noecho() function should be used.
 * @return the password taken from input
 */
char* rc4_ncurses_get_password(void);

/**
 * Returns an encoded string given a String object and password used to encode it.
 * @param pString The String to encode.
 * @param password the key used to encode
 */
void rc4_encode_string(String* pString, const char password[PASS_MAX]);

int rc4_ncurses_decrypt_string(String* pString, char* password_ref[PASS_MAX]);

/**
 * Return if trying to encrypt an encrypted portfolio and trying to decrypt a non-encrypted portfolio.
 *
 * If encrypting, ask for password twice to make sure the user has specified the correct password they wish to use to
 * encrypt the portfolio. If they don't match, return. Write the portfolio file with the encrypted String.
 *
 * If decrypting, decrypt the portfolio and write the decrypted String to the file.
 * @param crypt_opt crypt option
 */
void portfolio_write_encrypt_decrypt(int crypt_opt);

#endif