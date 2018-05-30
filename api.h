/**
 * API data is taken from IEX Trading, Morningstar, and Coinmarketcap.
 * https://iextrading.com/developer/docs/
 * http://www.morningstar.com/
 * https://coinmarketcap.com/api/documentation/v1
 */

#ifndef TICK_API_H
#define TICK_API_H

#define QUARTERS 4
#define DATE_MAX_LENGTH 16
#define SYMBOL_MAX_LENGTH 32
#define URL_MAX_LENGTH 2048
#define INFO_TEXT_MAX 2048
#define EMPTY (-999)
#define DEFAULT_NUM_ARTICLES 3

#include <stddef.h>
#include <curl/curl.h>
#include <json-c/json_tokener.h>
#include <pthread.h>
#include "string-tick.h"

typedef struct news_article {
    char headline[INFO_TEXT_MAX];
    char source[INFO_TEXT_MAX];
    char date[DATE_MAX_LENGTH];
    char summary[INFO_TEXT_MAX];
    char url[URL_MAX_LENGTH];
    char related[INFO_TEXT_MAX];
} News;

typedef struct info {
    /* Company */
    char symbol[SYMBOL_MAX_LENGTH];     // ex. AAPL
    char name[INFO_TEXT_MAX];           // ex. Apple Inc.
    char industry[INFO_TEXT_MAX];       // ex. Computer Hardware
    char website[URL_MAX_LENGTH];       // ex. apple.com
    char description[INFO_TEXT_MAX];    // Paragraph description of company
    char ceo[INFO_TEXT_MAX];            // ex. Timothy D. Cook
    char issue_type[3];                 /* ad – American Depository Receipt (ADR’s)
                                           re – Real Estate Investment Trust (REIT’s)
                                           ce – Closed end fund (Stock and Bond Fund)
                                           si – Secondary Issue
                                           lp – Limited Partnerships
                                           cs – Common Stock
                                           et – Exchange Traded Fund (ETF)
                                           (blank) = Not Available, i.e., Warrant, Note, or (non-filing)
                                           Closed Ended Funds
                                            */
    char sector[INFO_TEXT_MAX];         // ex. Technology

    /* Quote */
    int64_t intraday_time;              // Unix timestamp of current price
    double price;                       // Current price of security in USD (ex. 174.54)
    int64_t marketcap;                  // Market cap in USD (ex. 890489000000)
    int64_t volume_1d;                  // Volume in shares of security (ex. 33812360)
    double pe_ratio;                    // Price per earnings ratio

    /* Stats */
    double div_yield;                   // Percent dividend yield (ex. 1.46)
    int64_t revenue;                    // Revenue in dollars
    int64_t gross_profit;               // Gross Profit in dollars
    int64_t cash;                       // Cash in dollars
    int64_t debt;                       // Debt in dollars

    /* Earnings */
    double eps[QUARTERS];               // Earnings per share per quarter for past four quarters
    char fiscal_period[QUARTERS][DATE_MAX_LENGTH];  // Quarter and Year of past four quarters (ex. Q1 2018)
    double eps_year_ago[QUARTERS];      // Earnings per share per quarter for the previous year

    /* Chart */
    double change_1d;                   // Percent change since last close
    double change_7d;                   // Percent change since 7 days ago
    double change_30d;                  // Percent change since 30 days ago
    double* points;                     // Array of one price per day, startings five years previously

    /* News */
    News** articles;                    // Array of News pointers
    int num_articles;                   // Number of News pointers in array
} Info;

News* api_news_init(void);

/**
 * Allocates an Info struct and returns a pointer to it. All numbers are set to EMPTY, all strings are NULL
 * terminated at length 0, and all pointers are set to NULL.
 * @return Info*
 */
Info* api_info_init(void);

/**
 * writefunction for cURL HTTP GET/POST
 * stolen from a nice man on stackoverflow
 */
size_t api_string_writefunc(void* ptr, size_t size, size_t nmemb, String* pString);

/**
 * Performs a HTTP GET. Response data is stored and returned in an allocated String*.
 * @param url API url to GET
 * @return NULL if error or no response from server. Otherwise, String* containing data.
 */
String* api_curl_data(const char* url);

/**
 * Designed for threading
 *
 * Queries IEX's company endpoint and stores the data in the Info object pointed to by vpInfo. symbol, name,
 * industry, website, description, ceo, issue_type, and sector are stored.
 * @param vpInfo Info*
 * @return NULL
 */
void* iex_store_company(void* vpInfo);

/**
 * Designed for threading
 *
 * Queries IEX's quote endpoint and stores the data in the Info object pointed to by vpInfo. intraday_time, price,
 * marketcap, volume_1d, and pe_ratio are stored.
 * @param vpInfo Info*
 * @return NULL
 */
void* iex_store_quote(void* vpInfo);

/**
 * Designed for threading
 *
 * Queries IEX's stats endpoint and stores the data in the Info object pointed to by vpInfo. div_yield, revenue,
 * gross_profit, cash, and debt are stored.
 * @param vpInfo Info*
 * @return NULL
 */
void* iex_store_stats(void* vpInfo);

/**
 * Designed for threading
 *
 * Queries IEX's stats earnings and stores the data in the Info object pointed to by vpInfo. eps, fiscal_period, and
 * eps_year_ago are stored.
 * @param vpInfo Info*
 * @return NULL
 */
void* iex_store_earnings(void* vpInfo);

/**
 * Designed for threading
 *
 * Queries IEX's chart endpoint and stores the data in the Info object pointed to by vpInfo. change_1d, change_7d,
 * change_30d, and points are stored.
 * @param vpInfo Info*
 * @return NULL
 */
void* iex_store_chart(void* vpInfo);

void* iex_store_news(void* vpInfo);

/**
 * Designed for threading
 *
 * Queries Morningstar's API and stores the data in the Info object pointed to by vpInfo. price, change_1d,
 * change_7d, change_30d, points, and volume_1d are stored.
 * @param vpInfo Info*
 * @return NULL
 */
void* morningstar_store_info(void* vpInfo);

/**
 * Designed for threading
 *
 * Queries Coinmarketcaps's API and stores the data in the Info object pointed to by vpInfo. name, symbol, price,
 * change_1d, change_7d, marketcap, and volume_1d are stored.
 * @param vpInfo Info*
 * @return NULL
 */
void* coinmarketcap_store_info(void* vpInfo);

/**
 * Returns a pointer to an Info object containing info pertaining to the given symbol with data from IEX.
 * @param symbol stock/etf symbol
 * @return Info* if valid stock/etf or NULL otherwise
 */
Info* iex_get_info(const char* symbol);

/**
 * Returns a pointer to an Info object containing info pertaining to the given symbol with data from Morningstar.
 * @param symbol mutf/otc symbol
 * @return Info* if valid mutf/otc or NULL otherwise
 */
Info* morningstar_get_info(const char* symbol);

/**
 * Returns a pointer to an Info object containing info pertaining to the given symbol with data from Coinmarketcap.
 * @param symbol name of cryptocurrency
 * @return Info* if valid name of cryptocurrency or NULL otherwise
 */
Info* coinmarketcap_get_info(const char* symbol);

/**
 * Returns an Info* populated with information pertaining to the given symbol.
 * The function will first query IEX. If no response, it will query Morningstar. If no response, it will query
 * Coinmarketcap. If Coinmarketcap returns NULL, the function returns NULL.
 * 1. IEX -- NASDAQ/NYSE/NYSEARCA
 * 2. Morningstar -- MUTF/OTCMKTS
 * 3. Coinmarketcap -- CRYPTO
 *
 * In the case of using IEX, only the Quote and Chart sections will be populated.
 * @param symbol
 * @return Info* or NULL if invalid symbol
 */
Info* api_get_check_info(const char* symbol);

/**
 * Returns an Info* populated with information pertaining to the given symbol.
 * The function will first query IEX. If no response, it will query Morningstar. If no response, it will query
 * Coinmarketcap. If Coinmarketcap returns NULL, the function returns NULL.
 * 1. IEX -- NASDAQ/NYSE/NYSEARCA
 * 2. Morningstar -- MUTF/OTCMKTS
 * 3. Coinmarketcap -- CRYPTO
 * @param symbol
 * @return Info* or NULL if invalid symbol
 */
Info* api_get_info(const char* symbol);

void api_news_destroy(News** phNews);

/**
 * Destroys Info object and frees memory. Sets the pointer to the Info to NULL
 * @param phInfo the Info to destroy
 */
void api_info_destroy(Info** phInfo);

#endif