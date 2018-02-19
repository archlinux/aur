#ifndef PORTFOLIO_H
#define PORTFOLIO_H

#include <math.h>
#include <unistd.h>
#include "api.h"
#include "rc4.h"

#define REMOVE 0
#define ADD 1
#define SET 2
#define DECRYPT 0
#define ENCRYPT 1

const char* portfolio_file;

/**
 * Sets portfolio_file to $HOME/.tick_portfolio.json
 */
void portfolio_file_init();

/**
 * Stores the given file in a string and returns it
 * @param fp the file
 * @param len sets *len to the size of the string -- used for decryption (some chars will be encrypted to '\0', so
 * the returned string will be null terminated somewhere in the middle several times
 * @return the string containing the file
 */
char* portfolio_file_get_string(FILE* fp, size_t* len);

/**
 * Adds quantity_shares of given symbol at given price to portfolio
 * @param id name of currency
 * @param quantity_shares quantity_shares of currency
 * @param purchase_price quantity_shares of money spent
 * @param fp portfolio file
 */
void portfolio_modify(char* ticker_name_string, double quantity_shares, double usd_spent, FILE* fp, int option);

/**
 * Prints current holdings of all symbols
 * @param api_data STRING to hold data in
 * @param crypto_data JSON to hold STRING data in
 * @param fp portfolio file
 */
void portfolio_print_all(FILE* fp);

/**
 * Prints current holdings of a symbol
 * @param id name of currency, NULL if printing all
 * @param fp portfolio file, NULL if printing all
 * @param current_index portfolio file index, NULL if printing one
 */
double* portfolio_print_stock(char* ticker_name_string, FILE* fp, Json* current_index);

/**
 * Returns the index in the Json array of the given symbol
 * @param ticker_name_string the symbol
 * @param jarray the array
 * @return -1 if not found, the index otherwise
 */
int portfolio_symbol_index(char* ticker_name_string, Json* jarray);

/**
 * Returns a string from the current stream pointer to the next space, newline, or EOF
 * @param fp the file
 * @return the string
 */
char* portfolio_legacy_get_next_val(FILE* fp);

/**
 * Adds contents of legacy portfolio to JSON formatted portfolio
 * @param fp JSON formatted portfolio
 */
void portfolio_legacy_convert();

/**
 * Returns an either encrypted or decrypted string of the input
 * @param input the string to encrypt or decrypt
 * @param input_len the length of the string
 * @param password the password to encrypt or decrypt with
 * @return encrypted or decrypted string
 */
char* portfolio_get_encrypt_string(char* input, size_t input_len, char* password);

/**
 * Either encrypts or decrypts the portfolio file
 * @param option ENCRYPT or DECRYPT
 * @param fp portfolio file
 * @param password the password to encrypt/decrypt with or NULL to ask user
 */
void portfolio_encrypt_decrypt(int option, FILE* fp, char* password);

#endif