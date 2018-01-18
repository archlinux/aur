/**
 * API data is taken from IEX Trading
 * https://iextrading.com/developer/docs/
 */

#ifndef IEX_H
#define IEX_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <curl/curl.h>
#include <stddef.h>

struct string {
    char* data;
    size_t len;
};

typedef struct string String;

/**
 * Creates and returns a STRING
 * object with size 1 and no data
 * @return STRING object
 */
String* iex_string_init(void);

/**
 * writefunction for cURL HTTP GET
 * stolen from a nice man on stackoverflow
 */
size_t iex_string_writefunc(void* ptr, size_t size, size_t nmemb, String* hString);

/**
 * Returns current price of a stock
 * @param ticker_name_string symbol
 * @return current price of stock
 */
double iex_get_current_price(char* ticker_name_string);

/**
 * Destroys STRING object and frees memory
 * @param phString the String to destroy
 */
void iex_string_destroy(String** phString);

#endif