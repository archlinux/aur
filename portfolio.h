#ifndef PORTFOLIO_H
#define PORTFOLIO_H

#include <math.h>
#include "api.h"

#define REMOVE 0
#define ADD 1
#define SET 2

const char* portfolio_file;

/**
 * Sets portfolio_file to $HOME/.tick_portfolio.json
 */
void portfolio_file_init();

/**
 * Stores the given file in a string and returns it
 * @param fp the file
 * @return the string containing the file
 */
char* portfolio_file_get_string(FILE* fp);

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

#endif