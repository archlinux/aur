#include "api.h"

Info* api_info_init(void) {
    Info* pInfo = malloc(sizeof(Info));
    pointer_alloc_check(pInfo);
    *pInfo = (Info) {
            .symbol[0] = '\0', .name[0] = '\0', .industry[0] = '\0', .website[0] = '\0', .description[0] = '\0',
            .ceo[0] = '\0', .issue_type[0] = '\0', .sector[0] = '\0', .intraday_time = EMPTY, .price = EMPTY,
            .marketcap = EMPTY, .volume_1d = EMPTY, .pe_ratio = EMPTY, .div_yield = EMPTY, .revenue = EMPTY,
            .gross_profit = EMPTY, .cash = EMPTY, .debt = EMPTY, .eps = {EMPTY, EMPTY, EMPTY, EMPTY},
            .fiscal_period[0][0] = '\0', .fiscal_period[1][0] = '\0', .fiscal_period[2][0] = '\0',
            .fiscal_period[3][0] = '\0', .eps_year_ago = {EMPTY, EMPTY, EMPTY, EMPTY}, .change_1d = EMPTY,
            .change_7d = EMPTY, .change_30d = EMPTY
    };
    return pInfo;
}

size_t api_string_writefunc(void* ptr, size_t size, size_t nmemb, String* pString) {
    size_t new_len = pString->len + size * nmemb;
    pString->data = realloc(pString->data, new_len + 1);
    pointer_alloc_check(pString->data);
    memcpy(pString->data + pString->len, ptr, size * nmemb);
    pString->data[new_len] = '\0';
    pString->len = new_len;
    return size * nmemb;
}

String* api_curl_data(const char* url) {
    CURL* curl = curl_easy_init();
    CURLcode res;
    if (!curl) // Error creating curl object
        RETNULL_MSG("Error initializing curl.")

    String* pString = string_init();
    curl_easy_setopt(curl, CURLOPT_URL, url); // Set URL
    curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L); // Needed for HTTPS
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, api_string_writefunc); // Specify writefunc for return data
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, &pString->data); // Specify object for return data
    res = curl_easy_perform(curl);
    curl_easy_cleanup(curl);
    if (res != CURLE_OK) {
        string_destroy(&pString); // Error receiving data
        RETNULL_MSG("Error curling data.")
    }

    return pString;
}

double* api_get_current_price(const char* symbol) {
    double* val;
    if (strlen(symbol) > 5) { // If symbol length is greater than 5, then it must be a crypto
        val = coinmarketcap_get_price(symbol);
        return val;
    }

    val = iex_get_price(symbol); // First tries IEX for intraday prices
    if (val != NULL)
        return val;

    val = morningstar_get_price(symbol); // Secondly tries Morningstar for market open/close data
    if (val != NULL)
        return val;

    val = coinmarketcap_get_price(symbol); // Thirdly tries Coinmarketcap for real-time crypto data
    if (val != NULL)
        return val;

    return NULL; // Invalid symbol
}

double* iex_get_price(const char* symbol) {
    char iex_api_string[URL_MAX_LENGTH];
    sprintf(iex_api_string, "https://api.iextrading.com/1.0/stock/%s/quote", symbol);
    String* pString = api_curl_data(iex_api_string);
    if (pString == NULL)
        return NULL;

    if (strcmp(pString->data, "Unknown symbol") == 0) { // Invalid symbol
        string_destroy(&pString);
        return NULL;
    }

    Json* jobj = json_tokener_parse(pString->data);
    double* api_data = malloc(sizeof(double) * 3);
    pointer_alloc_check(api_data);
    // First API call can only give intraday and previous close
    api_data[0] = json_object_get_double(json_object_object_get(jobj, "latestPrice")); // Intraday
    api_data[1] = json_object_get_double(json_object_object_get(jobj, "previousClose")); // Previous close
    json_object_put(jobj);
    string_destroy(&pString);

    // Second API call gives 7D price
    sprintf(iex_api_string, "https://api.iextrading.com/1.0/stock/%s/chart", symbol);
    pString = api_curl_data(iex_api_string);
    if (pString == NULL) {
        free(api_data);
        return NULL;
    }

    if (strcmp(pString->data, "Unknown symbol") == 0) { // May happen as a result of an unpredictable API
        free(api_data);
        string_destroy(&pString);
        return NULL;
    }

    jobj = json_tokener_parse(pString->data);
    api_data[2] = json_object_get_double(
            json_object_object_get(json_object_array_get_idx(jobj, json_object_array_length(jobj) - 5), "close"));
    json_object_put(jobj);
    string_destroy(&pString);
    return api_data;
}

void* iex_store_company(void* vpInfo) {
    Info* symbol_info = vpInfo;
    char iex_api_string[URL_MAX_LENGTH];
    sprintf(iex_api_string, "https://api.iextrading.com/1.0/stock/%s/company", symbol_info->symbol);
    String* pString = api_curl_data(iex_api_string); // API CALL 1 -- Company
    if (pString == NULL)
        return NULL;

    Json* jobj = json_tokener_parse(pString->data);
    if (jobj == NULL) { // Invalid symbol
        string_destroy(&pString);
        return NULL;
    }

    strcpy(symbol_info->symbol, json_object_get_string(json_object_object_get(jobj, "symbol")));
    strcpy(symbol_info->name, json_object_get_string(json_object_object_get(jobj, "companyName")));
    strcpy(symbol_info->industry, json_object_get_string(json_object_object_get(jobj, "industry")));
    strcpy(symbol_info->website, json_object_get_string(json_object_object_get(jobj, "website")));
    strcpy(symbol_info->description, json_object_get_string(json_object_object_get(jobj, "description")));
    strcpy(symbol_info->ceo, json_object_get_string(json_object_object_get(jobj, "CEO")));
    strcpy(symbol_info->issue_type, json_object_get_string(json_object_object_get(jobj, "issueType")));
    strcpy(symbol_info->sector, json_object_get_string(json_object_object_get(jobj, "sector")));
    json_object_put(jobj);
    string_destroy(&pString);
    return NULL;
}

void* iex_store_quote(void* vpInfo) {
    Info* symbol_info = vpInfo;
    if (symbol_info->symbol[0] == '\0')
        return NULL;

    char iex_api_string[URL_MAX_LENGTH];
    sprintf(iex_api_string, "https://api.iextrading.com/1.0/stock/%s/quote", symbol_info->symbol);
    String* pString = api_curl_data(iex_api_string); // API CALL 2 -- Quote
    if (pString == NULL)
        return NULL;

    Json* jobj = json_tokener_parse(pString->data);
    if (jobj == NULL) { // Invalid symbol
        string_destroy(&pString);
        return NULL;
    }

    symbol_info->price = json_object_get_double(json_object_object_get(jobj, "latestPrice"));
    symbol_info->intraday_time = json_object_get_int64(json_object_object_get(jobj, "closeTime"));
    symbol_info->marketcap = json_object_get_int64(json_object_object_get(jobj, "marketCap"));
    symbol_info->volume_1d = json_object_get_int64(json_object_object_get(jobj, "latestVolume"));
    symbol_info->pe_ratio = json_object_get_int64(json_object_object_get(jobj, "peRatio"));
    json_object_put(jobj);
    string_destroy(&pString);
    return NULL;
}

void* iex_store_stats(void* vpInfo) {
    Info* symbol_info = vpInfo;
    if (symbol_info->symbol[0] == '\0')
        return NULL;

    char iex_api_string[URL_MAX_LENGTH];
    sprintf(iex_api_string, "https://api.iextrading.com/1.0/stock/%s/stats", symbol_info->symbol);
    String* pString = api_curl_data(iex_api_string); // API CALL 3 -- Stats
    if (pString == NULL)
        return NULL;

    Json* jobj = json_tokener_parse(pString->data);
    if (jobj == NULL) { // Invalid symbol
        string_destroy(&pString);
        return NULL;
    }

    symbol_info->div_yield = json_object_get_double(json_object_object_get(jobj, "dividendYield"));
    symbol_info->revenue = json_object_get_int64(json_object_object_get(jobj, "revenue"));
    symbol_info->gross_profit = json_object_get_int64(json_object_object_get(jobj, "grossProfit"));
    symbol_info->cash = json_object_get_int64(json_object_object_get(jobj, "cash"));
    symbol_info->debt = json_object_get_int64(json_object_object_get(jobj, "debt"));
    json_object_put(jobj);
    string_destroy(&pString);
    return NULL;
}

void* iex_store_earnings(void* vpInfo) {
    Info* symbol_info = vpInfo;
    if (symbol_info->symbol[0] == '\0')
        return NULL;

    char iex_api_string[URL_MAX_LENGTH];
    sprintf(iex_api_string, "https://api.iextrading.com/1.0/stock/%s/earnings", symbol_info->symbol);
    String* pString = api_curl_data(iex_api_string); // API CALL 4 -- Earnings
    if (pString == NULL)
        return NULL;

    Json* jobj = json_tokener_parse(pString->data);
    if (jobj == NULL) { // Invalid symbol
        string_destroy(&pString);
        return NULL;
    }

    Json* idx;
    size_t len = json_object_array_length(json_object_object_get(jobj, "earnings"));
    for (size_t i = 0; i < len; i++) {
        idx = json_object_array_get_idx(json_object_object_get(jobj, "earnings"), i);
        symbol_info->eps[i] = json_object_get_double(json_object_object_get(idx, "actualEPS"));
        symbol_info->eps_year_ago[i] = json_object_get_double(json_object_object_get(idx, "yearAgo"));
        strcpy(symbol_info->fiscal_period[i], json_object_get_string(json_object_object_get(idx, "fiscalPeriod")));
    }
    json_object_put(jobj);
    string_destroy(&pString);
    return NULL;
}

void* iex_store_chart(void* vpInfo) {
    Info* symbol_info = vpInfo;
    if (symbol_info->symbol[0] == '\0')
        return NULL;

    char iex_api_string[URL_MAX_LENGTH];
    sprintf(iex_api_string, "https://api.iextrading.com/1.0/stock/%s/chart/5y", symbol_info->symbol);
    String* pString = api_curl_data(iex_api_string);
    if (pString == NULL)
        return NULL;

    Json* jobj = json_tokener_parse(pString->data);
    if (jobj == NULL) { // Invalid symbol
        string_destroy(&pString);
        return NULL;
    }

    size_t len = json_object_array_length(jobj);
    symbol_info->points = calloc(len + 1, sizeof(double));
    pointer_alloc_check(symbol_info->points);
    for (size_t i = 0; i < len; i++)
        symbol_info->points[i] = json_object_get_double(
                json_object_object_get(json_object_array_get_idx(jobj, i), "close"));

    len = 0;
    while (symbol_info->points[len] != '\0')
        len++;
    time_t now = time(NULL);
    struct tm* ts = localtime(&now);
    mktime(ts);
    int after_close = ts->tm_hour > 16 && ts->tm_wday != 0 && ts->tm_wday != 6;
    double coef = 100 / symbol_info->price;
    symbol_info->change_1d = coef * (symbol_info->price - symbol_info->points[len - 2 + after_close]);
    symbol_info->change_7d = coef * (symbol_info->price - symbol_info->points[len - 6 + after_close]);
    symbol_info->change_30d = coef * (symbol_info->price - symbol_info->points[len - 22 + after_close]);
    json_object_put(jobj);
    string_destroy(&pString);
    return NULL;
}

void* morningstar_store_info(void* vpInfo) {
    Info* symbol_info = vpInfo;
    char today_str[DATE_MAX_LENGTH], five_year_str[DATE_MAX_LENGTH], morningstar_api_string[URL_MAX_LENGTH];
    time_t now = time(NULL);
    struct tm* ts = localtime(&now);
    mktime(ts);
    strftime(today_str, DATE_MAX_LENGTH, "%Y-%m-%d", ts);
    ts->tm_year -= 5; //get info from past 5 years
    mktime(ts);
    strftime(five_year_str, DATE_MAX_LENGTH, "%Y-%m-%d", ts);
    sprintf(morningstar_api_string,
            "http://globalquote.morningstar.com/globalcomponent/RealtimeHistoricalStockData.ashx?showVol=true&dtype=his"
            "&f=d&curry=USD&isD=true&isS=true&hasF=true&ProdCode=DIRECT&ticker=%s&range=%s|%s",
            symbol_info->symbol, five_year_str, today_str);
    String* pString = api_curl_data(morningstar_api_string);
    if (pString == NULL)
        return NULL;

    if (strcmp("null", pString->data) == 0) { // Invalid symbol
        string_destroy(&pString);
        return NULL;
    }

    Json* jobj = json_tokener_parse(pString->data);
    Json* datapoints = json_object_object_get(
            json_object_array_get_idx(json_object_object_get(jobj, "PriceDataList"), 0), "Datapoints");
    size_t len = json_object_array_length(datapoints);
    double* api_data = calloc(len + 1, sizeof(double)); // Must calloc() because some data points don't exist
    pointer_alloc_check(api_data);
    for (int i = 0; i < (int) len; i++)
        api_data[i] = json_object_get_double(
                json_object_array_get_idx(json_object_array_get_idx(datapoints, (size_t) i), 0));
    symbol_info->points = api_data;
    symbol_info->price = api_data[len - 1];
    symbol_info->change_1d = 100 / symbol_info->price * (symbol_info->price - api_data[len - 2]);
    symbol_info->change_7d = 100 / symbol_info->price * (symbol_info->price - api_data[len - 6]);
    symbol_info->change_30d = 100 / symbol_info->price * (symbol_info->price - api_data[len - 22]);
    Json* vol = json_object_object_get(jobj, "VolumeList");
    if (vol != NULL) // There is no volume for MUTF
        symbol_info->volume_1d = (long) (1000000 * json_object_get_double( // Data listed in millions
                json_object_array_get_idx(json_object_object_get(vol, "Datapoints"), len - 1)));
    json_object_put(jobj);
    string_destroy(&pString);
    return NULL;
}

void* coinmarketcap_store_info(void* vpInfo) {
    Info* symbol_info = vpInfo;
    char coinmarketcap_api_string[URL_MAX_LENGTH];
    sprintf(coinmarketcap_api_string, "https://api.coinmarketcap.com/v1/ticker/%s", symbol_info->symbol);
    String* pString = api_curl_data(coinmarketcap_api_string);
    if (pString->data[0] == '{') { // Invalid symbol
        string_destroy(&pString);
        return NULL;
    }
    Info* ticker_info = api_info_init();
    Json* jobj = json_tokener_parse(pString->data);
    Json* data = json_object_array_get_idx(jobj, 0);
    strcpy(ticker_info->name, json_object_get_string(json_object_object_get(data, "name")));
    strcpy(ticker_info->symbol, json_object_get_string(json_object_object_get(data, "symbol")));
    ticker_info->price = strtod(json_object_get_string(json_object_object_get(data, "price_usd")), NULL);
    ticker_info->change_1d = strtod(json_object_get_string(json_object_object_get(data, "percent_change_24h")), NULL);
    ticker_info->change_7d = strtod(json_object_get_string(json_object_object_get(data, "percent_change_7d")), NULL);
    ticker_info->marketcap = strtol(json_object_get_string(json_object_object_get(data, "market_cap_usd")), NULL, 10);
    ticker_info->volume_1d = strtol(json_object_get_string(json_object_object_get(data, "24h_volume_usd")), NULL, 10);
    json_object_put(jobj);
    string_destroy(&pString);
    return NULL;
}

double* morningstar_get_price(const char* symbol) {
    char today_str[DATE_MAX_LENGTH], yesterday_str[DATE_MAX_LENGTH], morningstar_api_string[URL_MAX_LENGTH];
    time_t now = time(NULL);
    struct tm* ts = localtime(&now);
    strftime(today_str, DATE_MAX_LENGTH, "%Y-%m-%d", ts);
    ts->tm_mday -= 12; // Get info from past 12 days
    mktime(ts);
    strftime(yesterday_str, DATE_MAX_LENGTH, "%Y-%m-%d", ts);
    sprintf(morningstar_api_string,
            "http://globalquote.morningstar.com/globalcomponent/RealtimeHistoricalStockData.ashx?showVol=true&dtype=his"
            "&f=d&curry=USD&isD=true&isS=true&hasF=true&ProdCode=DIRECT&ticker=%s&range=%s|%s",
            symbol, yesterday_str, today_str);
    String* pString = api_curl_data(morningstar_api_string);
    if (pString == NULL)
        return NULL;

    if (strcmp("null", pString->data) == 0) { // Invalid symbol
        string_destroy(&pString);
        return NULL;
    }

    Json* jobj = json_tokener_parse(pString->data);
    double* api_data = malloc(sizeof(double) * 3);
    pointer_alloc_check(api_data);
    Json* datapoints = json_object_object_get(
            json_object_array_get_idx(json_object_object_get(jobj, "PriceDataList"), 0), "Datapoints");
    size_t size = json_object_array_length(datapoints);
    api_data[0] = json_object_get_double(json_object_array_get_idx(json_object_array_get_idx(datapoints, size - 1), 0));
    api_data[1] = json_object_get_double(json_object_array_get_idx(json_object_array_get_idx(datapoints, size - 2), 0));
    api_data[2] = json_object_get_double(json_object_array_get_idx(json_object_array_get_idx(datapoints, size - 5), 0));
    json_object_put(jobj);
    string_destroy(&pString);
    return api_data;
}

double* coinmarketcap_get_price(const char* symbol) {
    char coinmarketcap_api_string[URL_MAX_LENGTH];
    sprintf(coinmarketcap_api_string, "https://api.coinmarketcap.com/v1/ticker/%s", symbol);
    String* pString = api_curl_data(coinmarketcap_api_string);
    if (pString == NULL)
        return NULL;

    if (pString->data[0] == '{') { // Invalid symbol
        string_destroy(&pString);
        return NULL;
    }

    Json* jobj = json_tokener_parse(pString->data);
    double* api_data = malloc(sizeof(double) * 3);
    pointer_alloc_check(api_data);
    Json* idx = json_object_array_get_idx(jobj, 0);
    api_data[0] = strtod(json_object_get_string(json_object_object_get(idx, "price_usd")), NULL);
    api_data[1] = api_data[0] - ((strtod(json_object_get_string(
            json_object_object_get(idx, "percent_change_24h")), NULL) / 100) * api_data[0]);
    api_data[2] = api_data[0] - ((strtod(json_object_get_string(
            json_object_object_get(idx, "percent_change_7d")), NULL) / 100) * api_data[0]);
    json_object_put(jobj);
    string_destroy(&pString);
    return api_data;
}

double* api_get_hist_5y(const char* symbol) {
    if (strlen(symbol) > 5) // Cryptocurrency
        return NULL;
    double* val = iex_get_hist_5y(symbol); // First tries IEX
    if (val != NULL)
        return val;
    return morningstar_get_hist_5y(symbol); // Secondly tries Morningstar
}

double* iex_get_hist_5y(const char* symbol) {
    char iex_api_string[URL_MAX_LENGTH];
    sprintf(iex_api_string, "https://api.iextrading.com/1.0/stock/%s/chart/5y", symbol);
    String* pString = api_curl_data(iex_api_string);
    if (pString == NULL)
        return NULL;

    if (strcmp(pString->data, "Unknown symbol") == 0) { // Invalid symbol
        string_destroy(&pString);
        return NULL;
    }

    Json* jobj = json_tokener_parse(pString->data);
    size_t len = json_object_array_length(jobj);
    double* api_data = calloc(len + 1, sizeof(double));
    pointer_alloc_check(api_data);
    for (size_t i = 0; i < len; i++)
        api_data[i] = json_object_get_double(json_object_object_get(json_object_array_get_idx(jobj, i), "close"));
    json_object_put(jobj);
    string_destroy(&pString);
    return api_data;
}

double* morningstar_get_hist_5y(const char* symbol) {
    char today_str[DATE_MAX_LENGTH], yesterday_str[DATE_MAX_LENGTH], morningstar_api_string[URL_MAX_LENGTH];
    time_t now = time(NULL);
    struct tm* ts = localtime(&now);
    mktime(ts);
    strftime(today_str, DATE_MAX_LENGTH, "%Y-%m-%d", ts);
    ts->tm_year -= 5; //get info from past 5 years
    mktime(ts);
    strftime(yesterday_str, DATE_MAX_LENGTH, "%Y-%m-%d", ts);
    sprintf(morningstar_api_string,
            "http://globalquote.morningstar.com/globalcomponent/RealtimeHistoricalStockData.ashx?showVol=true&dtype=his"
            "&f=d&curry=USD&isD=true&isS=true&hasF=true&ProdCode=DIRECT&ticker=%s&range=%s|%s",
            symbol, yesterday_str, today_str);
    String* pString = api_curl_data(morningstar_api_string);
    if (pString == NULL)
        return NULL;

    if (strcmp("null", pString->data) == 0) { // Invalid symbol
        string_destroy(&pString);
        return NULL;
    }

    Json* jobj = json_tokener_parse(pString->data);
    Json* datapoints = json_object_object_get(
            json_object_array_get_idx(json_object_object_get(jobj, "PriceDataList"), 0), "Datapoints");
    size_t len = json_object_array_length(datapoints);
    double* api_data = calloc(len + 1, sizeof(double)); // Must calloc() because some data points don't exist
    pointer_alloc_check(api_data);
    for (int i = 0; i < (int) len; i++)
        api_data[i] = json_object_get_double(
                json_object_array_get_idx(json_object_array_get_idx(datapoints, (size_t) i), 0));
    json_object_put(jobj);
    string_destroy(&pString);
    return api_data;
}

Info* iex_get_info(const char* symbol) {
    Info* symbol_info = api_info_init();
    strcpy(symbol_info->symbol, symbol);
    pthread_t threads[5];
    void* (*funcs[5]) (void*) = {
            iex_store_company, iex_store_quote, iex_store_stats, iex_store_earnings, iex_store_chart
    };
    for (int i = 0; i < 5; i++)
        if (pthread_create(&threads[i], NULL, funcs[i], symbol_info))
            EXIT_MSG("Error creating thread!");

    for (int i = 0; i < 5; i++)
        if (pthread_join(threads[i], NULL))
            EXIT_MSG("Error joining thread!");

    if (symbol_info->price == EMPTY)
        api_info_destroy(&symbol_info);

    return symbol_info;
}

Info* morningstar_get_info(const char* symbol) {
    Info* symbol_info = api_info_init();
    strcpy(symbol_info->symbol, symbol);
    morningstar_store_info(symbol_info);

    if (symbol_info->price == EMPTY)
        api_info_destroy(&symbol_info);

    return symbol_info;
}

Info* coinmarketcap_get_info(const char* symbol) {
    Info* symbol_info = api_info_init();
    strcpy(symbol_info->symbol, symbol);
    coinmarketcap_store_info(symbol_info);

    if (symbol_info->price == EMPTY)
        api_info_destroy(&symbol_info);

    return symbol_info;
}

void api_info_destroy(Info** phInfo) {
    free((*phInfo)->points);
    free(*phInfo);
    *phInfo = NULL;
}