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
 * Precondition: keySchedule is an int array of size 256 and key is a valid string
 * Postcondition: keySchedule values have been initialized by the RC4 key-scheduling algorithm.
 * Performs the RC4 key exchange with keylength 256. Pseudocode example:
 * for i from 0 to 255
 *   S[i] := i
 * endfor
 * j := 0
 * for i from 0 to 255
 *   j := (j + S[i] + key[i mod keylength]) mod 256
    swap values of S[i] and S[j]
 * endfor
 *
 * @param keySchedule int array of size keylength
 * @param key user given password
 */
void rc4_key_exchange(int keySchedule[KEY_SCHEDULE_LENGTH], char* key);

/**
 * Precondition: keySchedule is an int array of size 256 already initialized by the RC4 key-scheduling algorithm
 * Performs the RC4 pseudo-random generation algorithm with keylength 256. Returns a string of length len with output
 * frm this algorithm. Pseudocode example:
 * i := 0
 * j := 0
 * while GeneratingOutput:
 *   i := (i + 1) mod 256
 *   j := (j + S[i]) mod 256
 *   swap values of S[i] and S[j]
 *   K := S[(S[i] + S[j]) mod 256]
 *   output K
 * endwhile
 *
 * @param keySchedule int array of size keylength (already initialized)
 * @param len size of portfolio in bytes
 * @return string of size len that can be XOR'ed with message to be en/decoded
 */
char* rc4_prga(int keySchedule[KEY_SCHEDULE_LENGTH], size_t len);

/**
 * Precondition: output is a string containing the output of the RC4 pseudo-random generation algorithm. pString
 * is a String object containing the portfolio.
 * XOR's the each index of output by each index of the char* in pString and stores that in the index of output
 * @param output string
 * @param message portoflio String
 */
void rc4_execute(char* output, String* pString);

/**
 * Returns an encoded string given a String object and password used to encode it.
 * @param pString The String to encode.
 * @param password the key used to encode
 * @return encoded string
 */
char* rc4_encode_string(String* pString, char* password);

/**
 * Given input input_pString, returns an encrypted or decrypted version of it. If trying to encrypt a non-JSON
 * formatted input_pString, abort. Similarly, if trying to decrypt a JSON-formatted input_pString, abort. password may
 * be a string or NULL. If NULL, get a password from the user if encrypting, ask for the password again to confirm
 * inputs are the same. If decrypting and the decrypted String is not JSON formatted, abort (wrong password).
 * @param input_pString the String to encrypt/decrypt
 * @param password the key or NULL
 * @param option ENCRYPT or DECRYPT
 * @return encrypted or decrypted String
 */
String* rc4_get_crypted_string(String* input_pString, char* password, int option);

#endif