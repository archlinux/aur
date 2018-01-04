#ifndef PORTFOLIO_H
#define PORTFOLIO_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "web.h"
#include "parse.h"

#define REMOVE 0
#define ADD 1
#define SET 2

const char* portfolio_file;

void portfolio_file_init();

/**
 * Adds amount of given currency at
 * given price to portfolio
 * @param id name of currency
 * @param amount amount of currency
 * @param purchase_price amount of money spent
 * @param fp portfolio file
 */
void portfolio_modify(char* id, double amount, double amount_spent, FILE* fp, int option);

/**
 * Taken from the portfolio file, returns a double
 * of the amount of crypto
 * @param id the crypto
 * @param fp portfolio file
 * @return the amount
 */
double portfolio_get_amount(char* id, FILE* fp);

/**
 * Taken from the portfolio file, returns a double
 * of the amount of money spent of a crypto
 * @param id the crypto
 * @param fp portfolio file
 * @return the amount spent
 */
double portfolio_get_amount_spent(char* id, FILE* fp);

/**
 * Prints current holdings of all currencies
 * @param api_data STRING to hold data in
 * @param crypto_data JSON to hold STRING data in
 * @param fp portfolio file
 */
void portfolio_print_all(STRING api_data, JSON crypto_data, FILE* fp);

/**
 * Prints current holdings of a currency
 * @param id name of currency
 * @param fp portfolio file
 */
double* portfolio_print_currency(char* id, const double* data,FILE* fp);

/**
 * Sets stream pointer to first digit
 * of currency amount if exists, otherwise
 * sets stream pointer to beginning of stream
 * @param id name of currency
 * @param fp portfolio file
 * @return 1 if contains, 0 if not
 */
int portfolio_contains(char* id, FILE* fp);

/**
 * Given a file stream pointing to
 * the first digit of a number,
 * return the number as a double
 * @param fp the file
 * @return the value
 */
double get_next_val(FILE* fp);

#endif