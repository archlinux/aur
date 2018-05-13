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
#define SORT_PROFIT 2
#define SORT_PROFIT_1D 3
#define SORT_PROFIT_7D 4

struct security_data {
    char symbol[32];
    double amount;
    double total_spent;
    double current_value;
    double total_profit;
    double total_profit_percent;
    double one_day_profit;
    double one_day_profit_percent;
    double seven_day_profit;
    double seven_day_profit_percent;
};

typedef struct security_data SD;

struct security_data_array {
    SD** sec_data;
    size_t length; // Elements in array
};

typedef struct security_data_array SDA;

extern char* portfolio_file;

/**
 * Postcondition: the char* portfolio_file (the "portfolio") is allocated on the heap and contains the
 * path "$HOME/.tick_portfolio.json"
 */
void portfolio_file_init(void);

/**
 * Reads the portfolio into a String object and returns it. If the file doesn't exist or it cannot be read return NULL.
 * If the stored String is encrypted, decrypt it before returning. Return NULL if given the wrong password to decrypt.
 * @param password Used as a return value. If not NULL, references a char* containing the password to the portfolio
 * @return pointer to a allocated String containing the contents of the unencrypted portfolio or NULL on error opening
 * or reading portfolio
 */
String* portfolio_file_get_string(char** password);

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
 * @param ticker_name_string string containing the symbol of the security to add or name of the cryptocurrency
 * @param quantity_shares the number of shares to modify the portfolio by
 * @param usd_spent the amount of USD to modify the portfolio by
 * @param option SET, REMOVE, or ADD
 */
void portfolio_modify(const char* ticker_name_string, double quantity_shares, double usd_spent, int option);

/**
 * Returns an SDA array containing data from the portfolio.
 * length is the number of securities in the portfolio
 * sec_data is an array of SD pointers to SD structs with the fields symbol, amount, and total_spent populated.
 * The rest of the values are uninitialized
 * @return SDA array
 */
SDA* portfolio_get_data_array(void);

/**
 * Initializes the rest of the fields in an SD struct using API data after symbol, amount, and total_spent have already
 * been stored
 * @param vsec_data pointer to an SD struct. Must be void* for threading.
 * @return returns NULL. Must return NULL for threading.
 */
void* portfolio_store_api_data(void* vsec_data);

/**
 * Sorts the SDA array based on the SORT mode.
 * SORT_ALPHA will sort the array lexicographically from least to greatest
 * SORT_VALUE, SORT_PROFIT, SORT_PROFIT_1D, and SORT_PROFIT_7D will sort the array from greatest to least
 * @param sda_data array to sort
 * @param SORT mode to sort
 */
void portfolio_sort(SDA* sda_data, int SORT);

/**
 * Prints to stdout information about every security contained in the portfolio: symbol, number of shares, USD spent,
 * current value, profit, and 24h profit. Additionally, print a grand total with info from all securities.
 */
void portfolio_print_all(int SORT);

/**
 * Prints to stdout information about a specific security contained in the portfolio: symbol, number of shares, USD spent,
 * current value, profit, and 24h profit.
 * @param ticker_name_string the security to print
 */
void portfolio_print_stock(const char* ticker_name_string);

/**
 * Goes through the given JSON array until the JSON object at the given index's key "Symbol" contains
 * the string ticker_name_string, then returns that index number.
 * @param ticker_name_string the security to return the index of
 * @param jarray the JSON array
 * @return -1 if not found, the index number otherwise
 */
int portfolio_symbol_index(const char* ticker_name_string, const Json* jarray);

/**
 * Return if trying to encrypt an encrypted portfolio and trying to decrypt a non-encrypted portfolio.
 *
 * If encrypting, ask for password twice to make sure the user has specified the correct password they wish to use to
 * encrypt the portfolio. If they don't match, return. Write the portfolio file with the encrypted String.
 *
 * If decrypting, decrypt the portfolio and write the decrypted String to the file.
 * @param CRYPT crypt option
 */
void portfolio_encrypt_decrypt(int CRYPT);

/**
 * Frees all memory associated with a SDA struct and sets the handle to NULL
 * @param phSDA
 */
void sda_destroy(SDA** phSDA);

#endif