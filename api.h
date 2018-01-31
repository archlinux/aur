/**
 * API data is taken from IEX Trading, Alpha Vantage, Coinmarketcap, News API, and Morningstar.
 * https://iextrading.com/developer/docs/
 * https://www.alphavantage.co/documentation/
 * https://coinmarketcap.com/api/
 * https://newsapi.org/docs
 * http://www.morningstar.com/
 */

#ifndef IEX_H
#define IEX_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <curl/curl.h>
#include <stddef.h>
#include <json-c/json_tokener.h>

struct string {
    char* data;
    size_t len;
};

typedef struct string String;

typedef struct json_object Json;

/**
 * Creates and returns a STRING
 * object with size 1 and no data
 * @return STRING object
 */
String* api_string_init(void);

/**
 * GETs data from API server and returns it in a String
 * @param url API url to GET
 * @param post_field data needed for POST
 * @return NULL if no response from server. Otherwise, String containing data.
 */
String* api_curl_data(char* url, char* post_field);

/**
 * Returns current price of a stock or cryptocurrency.
 * Order:
 * 1. IEX -- NASDAQ/NYSE/NYSEARCA
 * 2. Alpha Vantage -- OTCMKTS
 * 3. Morningstar -- MUTF
 * 4. Coinmarketcap -- CRYPTO
 * @param ticker_name_string symbol
 * @return current price of stock
 */
double api_get_current_price(char* ticker_name_string);

/**
 * If it is a listed security, returns the close price of the previous day.
 * If it is a cryptocurrency, returns the price 24 hours ago
 * @param ticker_name_string symbol
 * @return one day ago's price
 */
double api_get_1d_price(char* ticker_name_string);

/**
 * writefunction for cURL HTTP GET
 * stolen from a nice man on stackoverflow
 */
size_t api_string_writefunc(void* ptr, size_t size, size_t nmemb, String* hString);

/**
 * Returns current price of a stock with data from IEX.
 * Tested for NASDAQ, NYSE, and NYSEARCA listed stocks/ETFs.
 * Fast -- should take less than one second per call.
 * @param ticker_name_string symbol
 * @return current price of stock
 */
double iex_get_current_price(char* ticker_name_string);

/**
 * Returns current price of a mutual fund with data from Morningstar
 * Tested for MUTF and OTCMKTS listed securities.
 * Fast -- should take less than one second per call.
 * @param ticker_name_string symbol
 * @param offset number of days ago to get price of (0 = today)
 * @return price of security
 */
double morningstar_get_price(char* ticker_name_string, int offset);

/**
 * Returns current price of a mutual fund or over-the-counter stock with data from Alpha Vantage.
 * Tested for MUTF and OTCMKTS listed securities.
 * Dreadfully slow -- may take up to ten seconds per call.
 * @param ticker_name_string symbol
 * @return current price of security
 */
double alphavantage_get_current_price(char* ticker_name_string);

/**
 * Returns current price of a cryptocurrency with data from Coinmarketcap.
 * All cryptocurrencies listed on Coinmarketcap will work.
 * Fast -- should take less than one second per call.
 * @param ticker_name_string symbol
 * @return current price of cryptocurrency
 */
double coinmarketcap_get_current_price(char* ticker_name_string);

/**
 * Returns previous close price of a stock with data from IEX.
 * Tested for NASDAQ, NYSE, and NYSEARCA listed stocks/ETFs.
 * Fast -- should take less than one second per call.
 * @param ticker_name_string symbol
 * @return current price of stock
 */
double iex_get_1d_price(char* ticker_name_string);

/**
 * Returns previous close price of a mutual fund or over-the-counter stock with data from Alpha Vantage.
 * Tested for MUTF and OTCMKTS listed securities.
 * Dreadfully slow -- may take up to ten seconds per call.
 * @param ticker_name_string symbol
 * @return current price of security
 */
double alphavantage_get_1d_price(char* ticker_name_string);

/**
 * Returns price 24 hours ago of a cryptocurrency with data from Coinmarketcap.
 * If the symbol is not on IEX, Alpha Vantage will be used
 * Tested for MUTF and OTCMKTS listed securities.
 * Fast -- should take less than one second per call.
 * @param ticker_name_string symbol
 * @return current price of cryptocurrency
 */
double coinmarketcap_get_1d_price(char* ticker_name_string);

/**
 * Prints top three news articles in the past week based on the given string
 * @param ticker_name_string the string
 */
void news_print_top_three(char* ticker_name_string);

/**
 * Given a JSON formatted string, print title, source, author, and url of articles
 * @param data the json formatted data
 */
void json_print_news(char* data);

/**
 * Given a url, returns a shorter link using goo.gl
 * @param url_string the link to shorten
 * @return the shortened link
 */
const char* google_shorten_link(char* url_string);

/**
 * Destroys String object and frees memory
 * @param phString the String to destroy
 */
void api_string_destroy(String** phString);

#endif