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
 * Postcondition: the char* portfolio_file (the "portfolio") is allocated on the heap and contains the
 * path "$HOME/.tick_portfolio.json"
 */
void portfolio_file_init(void);

/**
 * Precondition: portfolio_file has been initialized
 * @return pointer to a allocated String containing the contents of the portfolio or NULL on error opening
 * or reading portfolio
 */
String* portfolio_file_get_string(void);

/**
 * Precondition: portfolio_file has been initialized
 * Postcondition: the portoflio has been modified according to the functions arguments
 *
 * The portfolio is formatted in JSON. Each security is an object in an array. Each object contains the following
 * keys: "Symbol" (string), "Shares" (double), and "USD_Spent" (double).
 *
 * If the portfolio is empty, creates a new JSON array with it's only index being a JSON object containing
 * ticker_name_string, quantity_shares, and usd_spent as it's attributes.
 *
 * If the security is NOT already in the portfolio, checks if ticker_name_string is a valid security. If it is,
 * appends to the JSON array a new object containing the keys specified above.
 *
 * If the security IS already in the portfolio, modifies the values "Shares" and "USD_Spent" according to
 * the parameter option. SET will set the values to the parameters quantity_shares and usd_spent, REMOVE will
 * subtract the parameters from the values already in the portfolio, and ADD will add the parameters to the values
 * already in the portfolio.
 *
 * Adding or removing when quantity_shares and usd_spent are both 0 will abort the function, as well as trying to
 * remove more than is already contained in the portfolio. Negative numbers aren't allowed either.
 *
 * If the portfolio is encrypted, ask for the password to decrypt it. If invalid password, abort the function. If
 * valid password, perform the functions specified above. After this, re-encrypt the portfolio using the already
 * given password.
 *
 * After all this, overwrite the portfolio with the (encrypted or not) created/modified JSON array.
 *
 * @param ticker_name_string string containing the symbol of the security to add or name of the cryptocurrency
 * @param quantity_shares the number of shares to modify the portfolio by
 * @param usd_spent the amount of USD to modify the portfolio by
 * @param option SET, REMOVE, or ADD
 */
void portfolio_modify(const char* ticker_name_string, double quantity_shares, double usd_spent, int option);

/**
 * Precondition: portfolio_file has been initialized
 * Prints to stdout information about every security contained in the portfolio: symbol, number of shares, USD spent,
 * current value, profit, and 24h profit. Additionally, print a grand total with info from all securities.
 *
 * If the portfolio is encrypted, ask for the password and store the decrypted portfolio, but do not write to the file.
 */
void portfolio_print_all(void);

/**
 * Precondition: portfolio_file has been initialized
 * Prints to stdout information about every security contained in the portfolio: symbol, number of shares, USD spent,
 * current value, profit, and 24h profit.
 * @param ticker_name_string the security to print or NULL is passing in JSON index
 * @param current_index JSON index to print or NULL if passing in security's name or symbol
 * @return double array containing the indices:
 * [0] -- current balance
 * [1] -- amount spent
 * [2] -- 24h gain
 */
double* portfolio_print_stock(char* ticker_name_string, Json* current_index);

/**
 * Goes through the given JSON array until the JSON object at the given index's key "Symbol" contains
 * the string ticker_name_string, then returns that index number.
 * @param ticker_name_string the security to return the index of
 * @param jarray the JSON array
 * @return -1 if not found, the index number otherwise
 */
int portfolio_symbol_index(const char* ticker_name_string, Json* jarray);

#endif