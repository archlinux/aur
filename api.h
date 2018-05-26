/**
 * API data is taken from IEX Trading, Morningstar, Coinmarketcap, and News API.
 * https://iextrading.com/developer/docs/
 * http://www.morningstar.com/
 * https://coinmarketcap.com/api/
 * https://newsapi.org/docs
 */

#ifndef API_H
#define API_H

#define SYMBOL_MAX_LENGTH 32
#define EMPTY (-999)

#include <stddef.h>
#include <curl/curl.h>
#include <json-c/json_tokener.h>
#include "string-tick.h"

typedef struct info {
    char name[SYMBOL_MAX_LENGTH]; // Name of security (ex. Apple Inc.)
    char symbol[SYMBOL_MAX_LENGTH]; // Symbol of security (ex. AAPL)
    double price; // Current price of security in USD (ex. 174.54)
    double change_1d, change_7d, change_30d; // Percent change in the past x days (ex. -7.49)
    double div_yield; // Percent dividend yield (ex. 1.46)
    long marketcap; // Market cap in USD (ex. 890489000000)
    long volume_1d; // Volume in shares of security (ex. 33812360)
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
 * @param post_field data needed for POST
 * @return NULL if no response from server. Otherwise, String containing data.
 */
String* api_curl_data(const char* url, const char* post_field);

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
 * Prints the top three news articles by popularity pertaining to the given string, ticker_name_string. Spaces and
 * underscores will be url-encoded (replaced by "%20"). News API will be used for data.
 * @param ticker_name_string the string to query
 */
void news_print_top_three(const char* ticker_name_string);

/**
 * Prints relevant information about up to three articles given a News API JSON formatted response object. Title, source,
 * and URL will always be printed. The URL will be shortened by Google's URL-shortener API. If the author and date
 * are specified, those will be printed as well.
 * @param jobj the JSON array
 */
void json_print_news(const Json* jobj);

/**
 * Prints information about the symbol ticker_name_string by calling the function json_print_news.
 * @param ticker_name_string
 */
void api_print_info(const char* ticker_name_string);

/**
 * Returns a pointer to an Info object containing info pertaining
 * to the given symbol with data from IEX.
 * @param ticker_name_string stock/etf symbol
 * @return Info object
 */
Info* iex_get_info(const char* ticker_name_string);

/**
 * Returns a pointer to an Info object containing info pertaining
 * to the given symbol with data from Morningstar
 * @param ticker_name_string mutf/otc symbol
 * @return Info object
 */
Info* morningstar_get_info(const char* ticker_name_string);

/**
 * Returns a pointer to an Info object containing info pertaining to the given cryptocurrency from Coinmarketcap.
 * @param ticker_name_string the crypto's name
 * @return Info object
 */
Info* coinmarketcap_get_info(const char* ticker_name_string);

/**
 * Given a url, returns a shorter link using Google's URL-shortener API.
 * @param url_string the link to shorten
 * @return the shortened link
 */
char* google_shorten_link(const char* url_string);

/**
 * Destroys Info object and frees memory. Sets the pointer to the Info to NULL
 * @param phInfo the Info to destroy
 */
void api_info_destroy(Info** phInfo);

#endif