/**
 * API data is taken from IEX Trading, Morningstar, Coinmarketcap.
 * https://iextrading.com/developer/docs/
 * http://www.morningstar.com/
 * https://coinmarketcap.com/api/
 */

#ifndef API_H
#define API_H

#define QUARTERS 4
#define DATE_MAX_LENGTH 16
#define SYMBOL_MAX_LENGTH 32
#define URL_MAX_LENGTH 2048
#define INFO_TEXT_MAX 2048
#define EMPTY (-999)

#include <stddef.h>
#include <curl/curl.h>
#include <json-c/json_tokener.h>
#include <pthread.h>
#include "string-tick.h"

typedef struct info {
    /* Company */
    char symbol[SYMBOL_MAX_LENGTH]; // Symbol of security (ex. AAPL)
    char name[INFO_TEXT_MAX]; // Name of security (ex. Apple Inc.)
    char industry[INFO_TEXT_MAX];
    char website[URL_MAX_LENGTH];
    char description[INFO_TEXT_MAX]; // Description of company
    char ceo[INFO_TEXT_MAX];
    char issue_type[3];
    char sector[INFO_TEXT_MAX];

    /* Quote */
    int64_t intraday_time; // unix time
    double price; // Current price of security in USD (ex. 174.54)
    int64_t marketcap; // Market cap in USD (ex. 890489000000)
    int64_t volume_1d; // Volume in shares of security (ex. 33812360)
    double pe_ratio;

    /* Stats */
    double div_yield; // Percent dividend yield (ex. 1.46)
    int64_t revenue;
    int64_t gross_profit;
    int64_t cash;
    int64_t debt;

    /* Earnings */
    double eps[QUARTERS];
    char fiscal_period[QUARTERS][DATE_MAX_LENGTH];
    double eps_year_ago[QUARTERS];

    /* Chart */
    double change_1d, change_7d, change_30d; // Percent change in the past x days (ex. -7.49)
    double* points; // 5y
} Info;

/**
 * Creates and returns an Info object. name and symbol are allocated 64 bytes. the doubles and long are set to EMPTY
 * @return Info object
 */
Info* api_info_init(void);

/**
 * writefunction for cURL HTTP GET/POST
 * stolen from a nice man on stackoverflow
 */
size_t api_string_writefunc(void* ptr, size_t size, size_t nmemb, String* pString);

/**
 * If post_field is not NULL, performs a HTTP POST with the given parameters. Otherwise, performs a HTTP GET. Response
 * data is stored and returned in a String.
 * @param url API url to GET/POST
 * @return NULL if no response from server. Otherwise, String containing data.
 */
String* api_curl_data(const char* url);

/**
 * Returns a double* containing the current price and yesterday's price of a stock or cryptocurrency.
 * [0] = current intraday price
 * [1] = last close price
 * [2] = close price 5 trading days previously
 * The function will first query IEX. If no response, it will query Morningstar. If no response, it will query
 * Coinmarketcap. If Coinmarketcap returns NULL, the function returns NULL.
 * 1. IEX -- NASDAQ/NYSE/NYSEARCA
 * 2. Morningstar -- MUTF/OTCMKTS
 * 3. Coinmarketcap -- CRYPTO
 * @param symbol security symbol or name to get prices of
 * @return price data or NULL if invalid symbol
 */
double* api_get_current_price(const char* symbol);

/**
 * Returns current and yesterday's price of a stock with data from IEX.
 * Tested for NASDAQ, NYSE, and NYSEARCA listed stocks/ETFs.
 * @param symbol symbol
 * @return price data as defined by api_get_current_price or NULL if invalid symbol
 */
double* iex_get_price(const char* symbol);

void* iex_store_company(void* vpInfo);

void* iex_store_quote(void* vpInfo);

void* iex_store_stats(void* vpInfo);

void* iex_store_earnings(void* vpInfo);

void* iex_store_chart(void* vpInfo);

void* morningstar_store_info(void* vpInfo);

void* coinmarketcap_store_info(void* vpInfo);

/**
 * Returns current and yesterday's price of a mutual fund with data from Morningstar
 * Tested for MUTF and OTCMKTS listed securities.
 * @param symbol symbol
 * @return price data as defined by api_get_current_price or NULL if invalid symbol
 */
double* morningstar_get_price(const char* symbol);

/**
 * Returns current and yesterday's price of a cryptocurrency with data from Coinmarketcap.
 * All cryptocurrencies listed on Coinmarketcap will work.
 * @param symbol symbol
 * @return price data as defined by api_get_current_price or NULL if invalid symbol
 */
double* coinmarketcap_get_price(const char* symbol);

/**
 * Returns an array of doubles containing the close price each day in the past 5 years
 * @param symbol symbol
 * @return double array of close prices
 */
double* api_get_hist_5y(const char* symbol);

/**
 * Returns an array of doubles containing the close price each day in the past 5 years
 * @param symbol symbol of stock or etf
 * @return double array of close prices
 */
double* iex_get_hist_5y(const char* symbol);

/**
 * Returns an array of doubles containing the close price each day in the past 5 years
 * @param symbol symbol of mutf/otcmkts
 * @return double array of close prices
 */
double* morningstar_get_hist_5y(const char* symbol);

/**
 * Returns a pointer to an Info object containing info pertaining
 * to the given symbol with data from IEX.
 * @param symbol stock/etf symbol
 * @return Info object
 */
Info* iex_get_info(const char* symbol);

/**
 * Returns a pointer to an Info object containing info pertaining
 * to the given symbol with data from Morningstar
 * @param symbol mutf/otc symbol
 * @return Info object
 */
Info* morningstar_get_info(const char* symbol);

/**
 * Returns a pointer to an Info object containing info pertaining to the given cryptocurrency from Coinmarketcap.
 * @param symbol the crypto's name
 * @return Info object
 */
Info* coinmarketcap_get_info(const char* symbol);

/**
 * Destroys Info object and frees memory. Sets the pointer to the Info to NULL
 * @param phInfo the Info to destroy
 */
void api_info_destroy(Info** phInfo);

#endif