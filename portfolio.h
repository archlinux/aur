#ifndef PORTFOLIO_H
#define PORTFOLIO_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "iex.h"

#define REMOVE 0
#define ADD 1
#define SET 2

const char* portfolio_file;

void portfolio_file_init();

/**
 * Adds quantity_shares of given currency at
 * given price to portfolio
 * @param id name of currency
 * @param quantity_shares quantity_shares of currency
 * @param purchase_price quantity_shares of money spent
 * @param fp portfolio file
 */
void portfolio_modify(char* ticker_name_string, double quantity_shares, double usd_spent, FILE* fp, int option);

/**
 * Taken from the portfolio file, returns a double
 * of the quantity_shares of crypto
 * @param id the crypto
 * @param fp portfolio file
 * @return the quantity_shares
 */
double portfolio_get_quantity_shares(char* ticker_name_string, FILE* fp);

/**
 * Taken from the portfolio file, returns a double
 * of the quantity_shares of money spent of a crypto
 * @param id the crypto
 * @param fp portfolio file
 * @return the quantity_shares spent
 */
double portfolio_get_usd_spent(char* ticker_name_string, FILE* fp);

/**
 * Prints current holdings of all currencies
 * @param api_data STRING to hold data in
 * @param crypto_data JSON to hold STRING data in
 * @param fp portfolio file
 */
void portfolio_print_all(FILE* fp);

/**
 * Prints current holdings of a currency
 * @param id name of currency
 * @param fp portfolio file
 */
double* portfolio_print_stock(char* ticker_name_string, FILE* fp);

/**
 * Sets stream pointer to first digit
 * of currency quantity_shares if exists, otherwise
 * sets stream pointer to beginning of stream
 * @param id name of currency
 * @param fp portfolio file
 * @return 1 if contains, 0 if not
 */
int portfolio_contains(char* ticker_name_string, FILE* fp);

/**
 * Given a file stream pointing to
 * the first digit of a number,
 * return the number as a double
 * @param fp the file
 * @return the value
 */
double get_next_val(FILE* fp);

#endif