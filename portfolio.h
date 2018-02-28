#ifndef PORTFOLIO_H
#define PORTFOLIO_H

#include <math.h>
#include "api.h"
#include "rc4.h"

#define REMOVE 0
#define ADD 1
#define SET 2

extern char* portfolio_file;

/**
 * Sets portfolio_file to $HOME/.tick_portfolio.json
 */
void portfolio_file_init(void);

/**
 * Stores the given file in a string and returns it
 * @param fp the file
 * @param len sets *len to the size of the string -- used for decryption (some chars will be encrypted to '\0', so
 * the returned string will be null terminated somewhere in the middle several times
 * @return the string containing the file
 */
String* portfolio_file_get_string(void);

/**
 * Adds quantity_shares of given symbol at given price to portfolio
 * @param id name of currency
 * @param quantity_shares quantity_shares of currency
 * @param purchase_price quantity_shares of money spent
 * @param fp portfolio file
 */
void portfolio_modify(const char* ticker_name_string, double quantity_shares, double usd_spent, int option);

/**
 * Prints current holdings of all symbols
 * @param api_data STRING to hold data in
 * @param crypto_data JSON to hold STRING data in
 * @param fp portfolio file
 */
void portfolio_print_all(void);

/**
 * Prints current holdings of a symbol
 * @param id name of currency, NULL if printing all
 * @param fp portfolio file, NULL if printing all
 * @param current_index portfolio file index, NULL if printing one
 */
double* portfolio_print_stock(char* ticker_name_string, Json* current_index);

/**
 * Returns the index in the Json array of the given symbol
 * @param ticker_name_string the symbol
 * @param jarray the array
 * @return -1 if not found, the index otherwise
 */
int portfolio_symbol_index(const char* ticker_name_string, Json* jarray);

#endif