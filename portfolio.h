#ifndef PORTFOLIO_H
#define PORTFOLIO_H

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

#define KEY_ESCAPE 27
extern char* portfolio_file;

/**
 * Postcondition: the char* portfolio_file (the "portfolio") is allocated on the heap and contains the
 * path "$HOME/.tick_portfolio.json"
 */
void portfolio_file_init(void);

/**
 * Reads the portfolio into a String object and returns it. If the file doesn't exist or it cannot be read return NULL.
 * If the stored String is encrypted, decrypt it before returning. Return NULL if given the wrong password to decrypt.
 * @param password_ref Used as a return value. If not NULL, references a char* containing the password to the portfolio
 * @return pointer to a allocated String containing the contents of the unencrypted portfolio or NULL on error opening
 * or reading portfolio
 */
String* portfolio_file_get_string(char** password_ref);

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
void portfolio_modify(const char* symbol, double quantity_shares, double usd_spent, int mod_option);

/**
 * Returns an SDA array containing data from the portfolio.
 * length is the number of securities in the portfolio
 * sec_data is an array of SD pointers to SD structs with the fields symbol, amount, and total_spent populated.
 * The rest of the values are uninitialized
 * @return SDA array
 */
Info_Array* portfolio_get_info_array(void);

/**
 * Sorts the SDA array based on the SORT mode.
 * SORT_ALPHA will sort the array lexicographically from least to greatest
 * SORT_VALUE, SORT_PROFIT, SORT_PROFIT_1D, and SORT_PROFIT_7D will sort the array from greatest to least
 * @param portfolio_data array to sort
 * @param sort_option mode to sort
 */
void portfolio_sort(Info_Array* portfolio_data, int sort_option);

/**
 * Prints to stdout information about every security contained in the portfolio: symbol, number of shares, USD spent,
 * current value, profit, and 24h profit. Additionally, print a grand total with info from all securities.
 */
void portfolio_print_all(void);

/**
 * Prints to stdout information about a specific security contained in the portfolio: symbol, number of shares, USD spent,
 * current value, profit, and 24h profit.
 * @param symbol the security to print
 */
void portfolio_print_stock(const char* symbol);

/**
 * Goes through the given JSON array until the JSON object at the given index's key "Symbol" contains
 * the string ticker_name_string, then returns that index number.
 * @param symbol the security to return the index of
 * @param jarray the JSON array
 * @return -1 if not found, the index number otherwise
 */
int portfolio_symbol_index(const char* symbol, const Json* jarray);

/**
 * Return if trying to encrypt an encrypted portfolio and trying to decrypt a non-encrypted portfolio.
 *
 * If encrypting, ask for password twice to make sure the user has specified the correct password they wish to use to
 * encrypt the portfolio. If they don't match, return. Write the portfolio file with the encrypted String.
 *
 * If decrypting, decrypt the portfolio and write the decrypted String to the file.
 * @param crypt_opt crypt option
 */
void portfolio_encrypt_decrypt(int crypt_opt);

#endif