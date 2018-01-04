#ifndef PARSE_H
#define PARSE_H

const static char* attributes[];

enum api_values {
    RANK, PRICE_USD, PRICE_BTC, VOLUME_24H_USD,
    MARKET_CAP_USD, AVAILABLE_SUPPLY, TOTAL_SUPPLY,
    MAX_SUPPLY, PERCENT_CHANGE_1H, PERCENT_CHANGE_24H,
    PERCENT_CHANGE_7D, TIME_UPDATED
};

#define QUOTES 34

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "web.h"

struct json {
    char* id;
    char* name;
    char* symbol;
    double* data;
};

typedef struct json Json;

typedef void* JSON;

/**
 * Creates and returns a JSON object
 * with the contents of a STRING object
 * @param hString the data to store
 * @param offset rank to store
 * @return JSON object with data stored
 */
JSON json_init(STRING hString, int offset);

double* json_get_data(JSON hJson);

/**
 * Prints a formatted output of
 * JSON object data
 * @param hJson data to print
 */
void json_print_all(JSON hJson);

/**
 * Frees all memory associated with a JSON
 * object and sets the pointer to NULL
 * @param phJson pointer to JSON object to be freed
 */
void json_destroy(JSON* phJson);

#endif