/**
 * API data is taken from IEX Trading, Morningstar, and Coinmarketcap.
 * https://iextrading.com/developer/docs/
 * http://www.morningstar.com/
 * https://coinmarketcap.com/api/documentation/v1
 */

#ifndef TICK_API_H
#define TICK_API_H

#define IEX 0
#define MORNINGSTAR 1
#define ALPHAVANTAGE 2
#define COINMARKETCAP 3

typedef enum data_level {
    ALL, CHECK, MISC, NEWS
} Data_Level;

#define QUARTERS 4
#define DATE_MAX_LENGTH 32
#define CELL_MAX_LENGTH 16
#define SYMBOL_MAX_LENGTH 32
#define NAME_MAX_LENGTH 128
#define URL_MAX_LENGTH 2048
#define INFO_TEXT_MAX 2048
#define EMPTY (-999)
#define DEFAULT_NUM_ARTICLES 3
#define MAX_PEERS 12

#include <stddef.h>
#include <curl/curl.h>
#include <json-c/json_tokener.h>
#include <pthread.h>
#include "utils.h"

typedef struct ref_data {
    char** symbols;
    char** names;
    size_t length;
} Ref_Data;

typedef struct news_article {
    char headline[INFO_TEXT_MAX];
    char source[INFO_TEXT_MAX];
    char date[DATE_MAX_LENGTH];
    char summary[INFO_TEXT_MAX];
    char url[URL_MAX_LENGTH];
    char related[INFO_TEXT_MAX];
} News;

typedef struct info Info;

typedef struct info_array Info_Array;

struct info {
    int api_provider;                   // IEX, MORNINGSTAR, ALPHAVANTAGE, COINMARKETCAP
    /** API DATA **/

    /* Company */
    char symbol[SYMBOL_MAX_LENGTH];     // ex. AAPL
    char name[NAME_MAX_LENGTH];         // ex. Apple Inc.
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
    double price_last_close;            // Last close price
    double price_7d;                    // Price 7 days ago
    double price_30d;                   // Price 30 days ago
    double* points;                     // Array of one price per day, startings five years previously
    int num_points;                     // Number of data points

    /* News */
    News** articles;                    // Array of News pointers
    int num_articles;                   // Number of News pointers in array

    /* Peers */
    Info_Array* peers;

    /** PORTFOLIO DATA **/

    double amount;                      // Amount of security in porfolio
    double total_spent;                 // Total USD spent
    double current_value;               // Total USD value

    char famount[CELL_MAX_LENGTH];                      // Amount of security in porfolio
    char ftotal_spent[CELL_MAX_LENGTH];                 // Total USD spent
    char fcurrent_value[CELL_MAX_LENGTH];               // Total USD value

    /** CALCULATED DATA **/

    double profit_total;                // Total profit
    double profit_total_percent;        // Total profit %
    double profit_last_close;           // Profit since last close
    double profit_last_close_percent;   // Profit since last close %
    double profit_7d;                   // Profit since seven days ago
    double profit_7d_percent;           // Profit since seven days ago %
    double profit_30d;                  // Profit since thirty days ago
    double profit_30d_percent;          // Profit since thirty days ago %

    char fprofit_total[CELL_MAX_LENGTH];                // Total profit
    char fprofit_total_percent[CELL_MAX_LENGTH];        // Total profit %
    char fprofit_last_close[CELL_MAX_LENGTH];           // Profit since last close
    char fprofit_last_close_percent[CELL_MAX_LENGTH];   // Profit since last close %
    char fprofit_7d[CELL_MAX_LENGTH];                   // Profit since seven days ago
    char fprofit_7d_percent[CELL_MAX_LENGTH];           // Profit since seven days ago %
    char fprofit_30d[CELL_MAX_LENGTH];                  // Profit since thirty days ago
    char fprofit_30d_percent[CELL_MAX_LENGTH];          // Profit since thirty days ago %
};

struct info_array {
    Info** array;
    size_t length;
    Info* totals;
};

Ref_Data* api_ref_data_init_from_length(size_t length);

/**
 * Allocates a News struct and returns a pointer to it.
 * @return News*
 */
News* api_news_init(void);

/**
 * Allocates an Info struct and returns a pointer to it. All numbers are set to EMPTY, all strings are NULL
 * terminated at length 0, and all pointers are set to NULL.
 * @return Info*
 */
Info* api_info_init(void);

/**
 * Allocates an Info_Array struct with length 0.
 * @return Info_Array*
 */
Info_Array* api_info_array_init(void);

/**
 * Allocates an Info_Array struct with allocated length.
 * @param length number of Info pointers to allocate
 * @return Info_Array*
 */
Info_Array* api_info_array_init_from_length(size_t length);

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

void iex_batch_store_data_info_array(Info_Array* pInfo_Array, Data_Level data_level);

void iex_batch_store_data_info(Info* pInfo, Data_Level data_level);

/**
 * This function will only store stock and ETF data.
 * Queries several of IEX's endpoints for multiple symbols at a time to store the data in
 * pInfo_Array. data_level will determine the endpoints queried:
 * ALL -- quote, chart, company, stats, peers, news, earnings
 * CHECK -- quote, chart
 * MISC -- company, stats, peers, news, earnings
 * @param pInfo_Array the Info_Array
 * @param data_level endpoints to query
 */
String* iex_batch_get_data_string(char* symbol_array[SYMBOL_MAX_LENGTH], size_t len,
                                  Data_Level data_level);
/**
 * Designed for threading
 *
 * Queries Morningstar's API and stores the data in the Info object pointed to by vpInfo. change_1d,
 * change_7d, change_30d, points, and volume_1d are stored.
 * @param vpInfo Info*
 * @return vpInfo on success, NULL on error
 */
void* morningstar_store_info(void* vpInfo);

/**
 * Designed for threading
 *
 * Queries AlpvaVantage's API and stores the data in the Info object pointed to by vpInfo. change_1d,
 * change_7d, change_30d, and points are stored.
 * @param vpInfo Info*
 * @return vpInfo on Success, NULL on error
 */
void* alphavantage_store_info(void* vpInfo);

/**
 * Designed for threading
 *
 * Queries Coinmarketcaps's API and stores the data in the Info object pointed to by vpInfo. name, symbol, price,
 * change_1d, change_7d, marketcap, and volume_1d are stored.
 * @param vpInfo Info*
 * @return vpInfo on success, NULL on error
 */
void* coinmarketcap_store_info(void* vpInfo);

/**
 * Queries IEX, AlphaVantage, and Coinmarketcap to store api data in pInfo_Array. data_level will
 * determine the level of data stored. See iex_batch_store_data for more information on data_level.
 * @param pInfo_Array the Info_Array
 * @param data_level the data level to store
 */
void api_info_array_store_data_batch(Info_Array* pInfo_Array, Data_Level data_level);

void api_info_store_data_batch(Info* pInfo, Data_Level data_level);

/**
 * After API data and portfolio have already been collected, uses them to populate the Info fields current_value and
 * all the profit fields.
 * @param pInfo Info*
 */
void info_store_check_data(Info* pInfo);

/**
 * Adds up values of Info array and sets values in totals.
 * @param pInfo_Array
 */
void info_array_store_totals(Info_Array* pInfo_Array);

/**
 * Returns a pointer to an Info_Array containing a list of all iex listed securities.
 * @return Info_Array*
 */
Ref_Data* iex_get_valid_symbols(void);

/**
 * Stores the data found in IEX formatted jobj in the Info_Array.
 * @param pInfo_Array
 * @param jobj
 */
void info_array_store_all_from_json(Info_Array* pInfo_Array, const Json* jobj);

void info_store_all_from_json(Info* pInfo, const Json* jsymbol);

/**
 * IEX quote endpoint.
 * intraday_time, price, price_last_close, marketcap, volume_1d, and pe_ratio is stored.
 * @param pInfo
 * @param jquote
 */
void info_store_quote_from_json(Info* pInfo, const Json* jquote);

/**
 * IEX chart endpoint.
 * change_7d, change_30d, and points is stored.
 * @param pInfo
 * @param jchart
 */
void info_store_chart_from_json(Info* pInfo, const Json* jchart);

/**
 * IEX company endpoint.
 * symbol, name, industry, website, description, ceo, issue_type, and sector is stored.
 * @param pInfo
 * @param jcompany
 */
void info_store_company_from_json(Info* pInfo, const Json* jcompany);

/**
 * IEX stats endpoint.
 * div_yield, revenue, gross_profit, cash, and debt is stored.
 * @param pInfo
 * @param jstats
 */
void info_store_stats_from_json(Info* pInfo, const Json* jstats);

/**
 * IEX peers endpoint.
 * peers is stored.
 * @param pInfo
 * @param jpeers
 */
void info_store_peers_from_json(Info* pInfo, const Json* jpeers);

/**
 * IEX news endpoint.
 * articles and num_articles is stored.
 * @param pInfo
 * @param jnews
 */
void info_store_news_from_json(Info* pInfo, const Json* jnews);

/**
 * IEX earnings endpoint.
 * eps, fiscal_period, and eps_year_ago is stored.
 * @param pInfo
 * @param jearnings
 */
void info_store_earnings_from_json(Info* pInfo, const Json* jearnings);

/**
 * Searches through an Info_Array and returns a ponter to the Info which has the same symbol as
 * the function's argument. If not found, returns NULL.
 * @param pInfo_Array the Info_Array to search
 * @param symbol the symbol to match
 * @return valid Info* or NULL if not found
 */
Info* info_array_get_info_from_symbol(const Info_Array* pInfo_Array, const char* symbol);

/**
 * Destroys Ref_Data object and frees memory. Sets the pointer of the Ref_Data to NULL
 * @param phRef_Data the Ref_Data to destroy
 */
void api_ref_data_destroy(Ref_Data** phRef_Data);

/**
 * Destroys News object and frees memory. Sets the pointer of the News to NULL
 * @param phNews the News to destroy
 */
void api_news_destroy(News** phNews);

/**
 * Destroys Info object and frees memory. Sets the pointer to the Info to NULL
 * @param phInfo the Info to destroy
 */
void api_info_destroy(Info** phInfo);

/**
 * Destroys Info_Array object and frees memory. Sets the pointer to the Info to NULL
 * @param phInfo_Array the Info_Array to destroy
 */
void api_info_array_destroy(Info_Array** phInfo_Array);

#endif