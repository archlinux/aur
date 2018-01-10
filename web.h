#ifndef WEB_H
#define WEB_H

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

typedef void* STRING;

/**
 * Creates and returns a STRING
 * object with size 1 and no data
 * @return STRING object
 */
STRING string_init(void);

/**
 * writefunction for cURL HTTP GET
 */
size_t writefunc(void* ptr, size_t size, size_t nmemb, STRING hString);

/**
 * Stores data from CoinMarketCap API
 * in given STRING object
 * @param hString STRING object to store data in
 * @param id the name of the currency to store
 */
void string_write_data_cmc(STRING hString, char* id);

/**
 *  Frees all memory associated with a STRING
 * object and sets the pointer to NULL
 * @param phString pointer to a STRING objec to be freed
 */
void string_destroy(STRING* phString);

#endif