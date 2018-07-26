#ifndef TICK_PORTFOLIO_H
#define TICK_PORTFOLIO_H

#include <math.h>
#include <sys/stat.h>
#include <pthread.h>
#include "api.h"
#include "rc4.h"

#define REMOVE 0
#define ADD 1
#define SET 2

#define SORT_ALPHA 0
#define SORT_VALUE 1
#define SORT_SPENT 2
#define SORT_PROFIT 3
#define SORT_PROFIT_PERCENT 4
#define SORT_PROFIT_24H 5
#define SORT_PROFIT_24H_PERCENT 6
#define SORT_PROFIT_7D 7
#define SORT_PROFIT_7D_PERCENT 8
#define SORT_PROFIT_30D 9
#define SORT_PROFIT_30D_PERCENT 10

#define HIGHLIGHT_NONE -1

extern char* portfolio_file_path;

/**
 * Postcondition: the char* portfolio_file (the "portfolio") is allocated on the heap and contains the
 * path "$HOME/.tick_portfolio.json"
 */
void portfolio_file_path_init(void);

/**
 * Returns the portfolio in a String. If it is encrypted, it will be decrypted using password
 * input through ncurses.
 * @param password_ref if decryption is necessary, will reference a char* of the password
 * @return Plaintext portfolio in a String or NULL if error/wrong password
 */
String* portfolio_ncurses_get_plaintext_string(char** password_ref);

/**
 * If portfolio file exists, decrypts it if necessary and calls portfolio_string_modify to change
 * the value of an element in the portfolio. If it doesn't exist, creates a new file.
 *
 * Afterwards, re-encrypts the portfolio and writes it to the user's home folder.
 *
 * @param symbol string containing the symbol of the security to add or name of the cryptocurrency
 * @param quantity_shares the number of shares to modify the portfolio by (must be >0 for add/rm,
 * or >=0 for set)
 * @param usd_spent the amount of USD to modify the portfolio by (must be >0 for add/rm, or >=0
 * for set)
 * @param mod_option SET, REMOVE, or ADD
 */
void portfolio_modify_write(const char* symbol, double quantity_shares, double usd_spent,
                            int mod_option);

/**
 * Creates or modifies the portfolio in JSON format. Each security is an object in an array. Each object contains the
 * following keys: "Symbol" (string), "Shares" (double), and "USD_Spent" (double).
 *
 * If the portfolio doesn't exist, create one with an empty array.

 * If the security is NOT already in the portfolio, checks if ticker_name_string is a valid security. If it is,
 * appends to the JSON array a new object containing the keys specified above.
 *
 * If the security IS already in the portfolio, modifies the values "Shares" and "USD_Spent" according to
 * the parameter option. SET will set the values to the parameters quantity_shares and usd_spent, REMOVE will
 * subtract the parameters from the values already in the portfolio, and ADD will add the parameters to the values
 * already in the portfolio.
 *
 * Adding or removing when quantity_shares and usd_spent are both 0, trying to remove more than is already contained in
 * the portfolio, or entering negative numbers isn't allowed either.
 *
 * After this, overwrite the portfolio with the (encrypted or not) created/modified JSON array.
 *
 * @param symbol string containing the symbol of the security to add or name of the cryptocurrency
 * @param quantity_shares the number of shares to modify the portfolio by
 * @param usd_spent the amount of USD to modify the portfolio by
 * @param mod_option SET, REMOVE, or ADD
 */
int portfolio_modify_string(String* pString, const char* symbol, double quantity_shares,
                             double usd_spent, int mod_option);

/**
 * Returns an Info_Array containing data from the portfolio.
 * length is the number of securities in the portfolio
 * @return SDA array
 */
Info_Array* portfolio_info_array_init_from_portfolio_string(String* pString);

/**
 * Sorts the SDA array based on the SORT mode.
 * SORT_ALPHA will sort the array lexicographically from least to greatest
 * SORT_VALUE, SORT_PROFIT, SORT_PROFIT_1D, and SORT_PROFIT_7D will sort the array from greatest to least
 * @param portfolio_data array to sort
 * @param sort_option mode to sort
 */
void portfolio_sort(Info_Array* portfolio_data, int sort_option);

/**
 * Goes through the given JSON array until the JSON object at the given index's key "Symbol" contains
 * the string ticker_name_string, then returns that index number.
 * @param symbol the security to return the index of
 * @param jarray the JSON array
 * @return -1 if not found, the index number otherwise
 */
int portfolio_symbol_index(const char* symbol, const Json* jarray);

#endif