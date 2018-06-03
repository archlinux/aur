#include "api.h"

News* api_news_init(void) {
    News* pNews = malloc(sizeof(News));
    pointer_alloc_check(pNews);
    *pNews = (News) {
        .headline[0] = '\0', .source[0] = '\0', .date[0] = '\0', .summary[0] = '\0', .url[0] = '\0', .related[0] = '\0'
    };
    return pNews;
}

Info* api_info_init(void) {
    Info* pInfo = malloc(sizeof(Info));
    pointer_alloc_check(pInfo);
    *pInfo = (Info) { // Set every string to NULL and every value to EMPTY
            .symbol[0] = '\0', .name[0] = '\0', .industry[0] = '\0', .website[0] = '\0', .description[0] = '\0',
            .ceo[0] = '\0', .issue_type[0] = '\0', .sector[0] = '\0', .intraday_time = EMPTY, .price = EMPTY,
            .marketcap = EMPTY, .volume_1d = EMPTY, .pe_ratio = EMPTY, .div_yield = EMPTY, .revenue = EMPTY,
            .gross_profit = EMPTY, .cash = EMPTY, .debt = EMPTY, .eps = {EMPTY, EMPTY, EMPTY, EMPTY},
            .fiscal_period[0][0] = '\0', .fiscal_period[1][0] = '\0', .fiscal_period[2][0] = '\0',
            .fiscal_period[3][0] = '\0', .eps_year_ago = {EMPTY, EMPTY, EMPTY, EMPTY}, .price_last_close = EMPTY,
            .price_7d = EMPTY, .price_30d = EMPTY, .points = NULL, .num_points = EMPTY, .articles = NULL,
            .num_articles = EMPTY, .peers = NULL, .amount = EMPTY, .total_spent = EMPTY, .current_value = 0,
            .profit_total = EMPTY, .profit_total_percent = EMPTY, .profit_last_close = EMPTY,
            .profit_last_close_percent = EMPTY, .profit_7d = EMPTY, .profit_7d_percent = EMPTY, .profit_30d = EMPTY,
            .profit_30d_percent = EMPTY
    };
    return pInfo;
}

Info_Array* api_info_array_init(void) {
    Info_Array* pInfo_Array = malloc(sizeof(Info_Array));
    pointer_alloc_check(pInfo_Array);
    pInfo_Array->array = NULL;
    pInfo_Array->length = 0;
    return pInfo_Array;
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

    if (json_object_object_get(jobj, "symbol") != NULL)
        strcpy(symbol_info->symbol, json_object_get_string(json_object_object_get(jobj, "symbol")));
    if (json_object_object_get(jobj, "companyName") != NULL)
        strcpy(symbol_info->name, json_object_get_string(json_object_object_get(jobj, "companyName")));
    if (json_object_object_get(jobj, "industry") != NULL)
        strcpy(symbol_info->industry, json_object_get_string(json_object_object_get(jobj, "industry")));
    if (json_object_object_get(jobj, "website") != NULL)
        strcpy(symbol_info->website, json_object_get_string(json_object_object_get(jobj, "website")));
    if (json_object_object_get(jobj, "description") != NULL)
        strcpy(symbol_info->description, json_object_get_string(json_object_object_get(jobj, "description")));
    if (json_object_object_get(jobj, "CEO") != NULL)
        strcpy(symbol_info->ceo, json_object_get_string(json_object_object_get(jobj, "CEO")));
    if (json_object_object_get(jobj, "issueType") != NULL)
        strcpy(symbol_info->issue_type, json_object_get_string(json_object_object_get(jobj, "issueType")));
    if (json_object_object_get(jobj, "sector") != NULL)
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
    symbol_info->intraday_time = json_object_get_int64(json_object_object_get(jobj, "latestUpdate"));
    symbol_info->marketcap = json_object_get_int64(json_object_object_get(jobj, "marketCap"));
    symbol_info->volume_1d = json_object_get_int64(json_object_object_get(jobj, "latestVolume"));
    symbol_info->pe_ratio = json_object_get_double(json_object_object_get(jobj, "peRatio"));
    if (symbol_info->amount != EMPTY) {
        symbol_info->current_value = symbol_info->amount * symbol_info->price;
        symbol_info->profit_total = symbol_info->current_value - symbol_info->total_spent;
        symbol_info->profit_total_percent = 100 * (symbol_info->current_value / symbol_info->total_spent - 1);
    }
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

    if (json_object_is_type(json_object_object_get(jobj, "earnings"), json_type_array)) { // ETFs don't report earnings
        size_t len = json_object_array_length(json_object_object_get(jobj, "earnings"));
        Json* idx;
        for (size_t i = 0; i < len; i++) {
            idx = json_object_array_get_idx(json_object_object_get(jobj, "earnings"), i);
            symbol_info->eps[i] = json_object_get_double(json_object_object_get(idx, "actualEPS"));
            symbol_info->eps_year_ago[i] = json_object_get_double(json_object_object_get(idx, "yearAgo"));
            if (json_object_object_get(idx, "fiscalPeriod") != NULL)
                strcpy(symbol_info->fiscal_period[i],
                       json_object_get_string(json_object_object_get(idx, "fiscalPeriod")));
            else if (json_object_object_get(idx, "fiscalEndDate") != NULL)
                strcpy(symbol_info->fiscal_period[i],
                       json_object_get_string(json_object_object_get(idx, "fiscalEndDate")));
            else if (json_object_object_get(idx, "EPSReportDate") != NULL)
                strcpy(symbol_info->fiscal_period[i],
                       json_object_get_string(json_object_object_get(idx, "EPSReportDate")));
        }
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
    symbol_info->price_last_close = symbol_info->points[len - 2 + after_close];
    symbol_info->price_7d = symbol_info->points[len - 6 + after_close];
    symbol_info->price_30d = symbol_info->points[len - 22 + after_close];
    if (symbol_info->amount != EMPTY) {
        symbol_info->profit_last_close = symbol_info->amount * (symbol_info->price - symbol_info->price_last_close);
        symbol_info->profit_last_close_percent = 100 * (symbol_info->current_value / (symbol_info->current_value -
                symbol_info->profit_last_close) - 1);
        symbol_info->profit_7d = symbol_info->amount * (symbol_info->price - symbol_info->price_7d);
        symbol_info->profit_7d_percent = 100 * (symbol_info->current_value / (symbol_info->current_value -
                symbol_info->profit_7d) - 1);
        symbol_info->profit_30d = symbol_info->amount * (symbol_info->price - symbol_info->price_30d);
        symbol_info->profit_30d_percent = 100 * (symbol_info->current_value / (symbol_info->current_value -
                                                                              symbol_info->profit_30d) - 1);
    }
    json_object_put(jobj);
    string_destroy(&pString);
    return NULL;
}

void* iex_store_news(void* vpInfo) {
    Info* symbol_info = vpInfo;
    if (symbol_info->symbol[0] == '\0')
        return NULL;

    if (symbol_info->num_articles == EMPTY)
        symbol_info->num_articles = DEFAULT_NUM_ARTICLES;

    char iex_api_string[URL_MAX_LENGTH];
    sprintf(iex_api_string, "https://api.iextrading.com/1.0/stock/%s/news/last/%d", symbol_info->symbol,
            symbol_info->num_articles);
    String* pString = api_curl_data(iex_api_string);
    if (pString == NULL)
        return NULL;

    Json* jobj = json_tokener_parse(pString->data), * idx, *headline;
    if (jobj == NULL) { // Invalid symbol
        string_destroy(&pString);
        return NULL;
    }
    size_t len = json_object_array_length(jobj);
    if (len < (unsigned) symbol_info->num_articles)
        symbol_info->num_articles = (int)len;

    symbol_info->articles = malloc(sizeof(News*) * symbol_info->num_articles);
    pointer_alloc_check(symbol_info->articles);

    for (int i = 0; i < symbol_info->num_articles; i++) {
        idx = json_object_array_get_idx(jobj, (size_t) i);
        headline = json_object_object_get(idx, "headline");
        // If two articles in a row are the same, change num_articles and break loop. This will happen if there are not
        if (i > 0 && headline != NULL && // enough articles supplied by API.
            strcmp(json_object_get_string(headline), symbol_info->articles[i - 1]->headline) == 0) {
            symbol_info->num_articles = i;
            break;
        }

        symbol_info->articles[i] = api_news_init();
        if (headline != NULL)
            strcpy(symbol_info->articles[i]->headline, json_object_get_string(headline));
        if (json_object_object_get(idx, "source") != NULL)
            strcpy(symbol_info->articles[i]->source, json_object_get_string(json_object_object_get(idx, "source")));
        if (json_object_object_get(idx, "dateTime") != NULL)
            strncpy(symbol_info->articles[i]->date, json_object_get_string(json_object_object_get(idx, "datetime")), 10);
        symbol_info->articles[i]->date[10] = '\0';
        if (json_object_object_get(idx, "summary") != NULL)
            strcpy(symbol_info->articles[i]->summary, json_object_get_string(json_object_object_get(idx, "summary")));
        strip_tags(symbol_info->articles[i]->summary); // Summary will be html formatted, so must strip tags
        if (json_object_object_get(idx, "url") != NULL)
            strcpy(symbol_info->articles[i]->url, json_object_get_string(json_object_object_get(idx, "url")));
        if (json_object_object_get(idx, "related") != NULL)
            strcpy(symbol_info->articles[i]->related, json_object_get_string(json_object_object_get(idx, "related")));
        int related_num = 0;
        for (size_t j = 0; j < strlen(symbol_info->articles[i]->related); j++) { // List only first five related symbols
            if (symbol_info->articles[i]->related[j] == ',')
                related_num++;
            if (related_num == 5) {
                symbol_info->articles[i]->related[j] = '\0';
                break;
            }
        }
    }
    json_object_put(jobj);
    string_destroy(&pString);
    return NULL;
}

void* iex_store_peers(void* vpInfo) {
    Info* symbol_info = vpInfo;
    if (symbol_info->symbol[0] == '\0')
        return NULL;

    char iex_api_string[URL_MAX_LENGTH];
    sprintf(iex_api_string, "https://api.iextrading.com/1.0/stock/%s/peers", symbol_info->symbol);
    String* pString = api_curl_data(iex_api_string);
    if (pString == NULL)
        return NULL;

    Json* jobj = json_tokener_parse(pString->data);
    if (jobj == NULL) { // Invalid symbol
        string_destroy(&pString);
        return NULL;
    }

    size_t len = (int) json_object_array_length(jobj);
    if (len == 0) {
        json_object_put(jobj);
        string_destroy(&pString);
        return NULL;
    }
    if (len > MAX_PEERS)
        len = MAX_PEERS;

    symbol_info->peers = api_info_array_init();
    symbol_info->peers->length = len;
    symbol_info->peers->array = malloc(sizeof(Info*) * len);
    pointer_alloc_check(symbol_info->peers->array);
    pthread_t threads[len];
    char syms[len][SYMBOL_MAX_LENGTH];
    for (size_t i = 0; i < len; i++) {
        strcpy(syms[i], json_object_get_string(json_object_array_get_idx(jobj, (size_t) i)));
        // Cast function to enable it as a thread entrypoint
        if (pthread_create(&threads[i], NULL, (void* (*)(void*)) api_get_check_info, (void*) syms[i]))
            EXIT_MSG("Error creating thread!");
    }

    for (size_t i = 0; i < len; i++) {
        void* ret = NULL;
        if (pthread_join(threads[i], &ret))
            EXIT_MSG("Error joining thread!")

        symbol_info->peers->array[i] = ret;
    }

    json_object_put(jobj);
    string_destroy(&pString);
    return NULL;
}

void calculate_check_data(Info* pInfo) {
    if (pInfo->amount == EMPTY)
        return;

    if (strcmp(pInfo->symbol, "USD$") != 0) {
        pInfo->current_value = pInfo->amount * pInfo->price;
        pInfo->profit_total = pInfo->current_value - pInfo->total_spent;
        pInfo->profit_total_percent = 100 * (pInfo->current_value / pInfo->total_spent - 1);
        pInfo->profit_last_close = pInfo->amount * (pInfo->price - pInfo->price_last_close);
        pInfo->profit_last_close_percent = 100 * (pInfo->current_value / (pInfo->current_value -
                                                                          pInfo->profit_last_close) - 1);
        pInfo->profit_7d = pInfo->amount * (pInfo->price - pInfo->price_7d);
        pInfo->profit_7d_percent = 100 * (pInfo->current_value / (pInfo->current_value - pInfo->profit_7d) - 1);
        pInfo->profit_30d = pInfo->amount * (pInfo->price - pInfo->price_30d);
        pInfo->profit_30d_percent = 100 * (pInfo->current_value / (pInfo->current_value - pInfo->profit_30d) - 1);
    } else {
        pInfo->current_value = pInfo->amount;
        pInfo->profit_total = pInfo->current_value - pInfo->total_spent;
        pInfo->profit_total_percent = 100 * pInfo->profit_total / pInfo->total_spent;
        pInfo->profit_last_close = 0;
        pInfo->profit_last_close_percent = 0;
        pInfo->profit_7d = 0;
        pInfo->profit_7d_percent = 0;
        pInfo->profit_30d = 0;
        pInfo->profit_30d_percent = 0;
    }
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
    symbol_info->price_last_close = api_data[len - 2];
    symbol_info->price_7d = api_data[len - 6];
    symbol_info->price_30d = api_data[len - 22];
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
    if (pString == NULL)
        return NULL;

    if (pString->data[0] == '{') { // Invalid symbol
        string_destroy(&pString);
        return NULL;
    }

    Json* jobj = json_tokener_parse(pString->data);
    Json* data = json_object_array_get_idx(jobj, 0);
    strcpy(symbol_info->name, json_object_get_string(json_object_object_get(data, "name")));
    strcpy(symbol_info->symbol, json_object_get_string(json_object_object_get(data, "symbol")));
    symbol_info->price = strtod(json_object_get_string(json_object_object_get(data, "price_usd")), NULL);
    symbol_info->price_last_close = symbol_info->price /
            (strtod(json_object_get_string(json_object_object_get(data, "percent_change_24h")), NULL) / 100 + 1);
    symbol_info->price_7d = symbol_info->price /
            (strtod(json_object_get_string(json_object_object_get(data, "percent_change_7d")), NULL) / 100 + 1);
    symbol_info->price_30d = symbol_info->price_7d;
    symbol_info->marketcap = strtol(json_object_get_string(json_object_object_get(data, "market_cap_usd")), NULL, 10);
    symbol_info->volume_1d = strtol(json_object_get_string(json_object_object_get(data, "24h_volume_usd")), NULL, 10);
    symbol_info->intraday_time = strtol(json_object_get_string(json_object_object_get(data, "last_updated")), NULL, 10);
    json_object_put(jobj);
    string_destroy(&pString);
    return NULL;
}

Info* iex_get_info(const char* symbol) {
    Info* symbol_info = api_info_init();
    strcpy(symbol_info->symbol, symbol);
    pthread_t threads[7];
    void* (*funcs[7]) (void*) = {
            iex_store_company, iex_store_quote, iex_store_stats, iex_store_earnings, iex_store_chart, iex_store_news,
            iex_store_peers
    };
    for (int i = 0; i < 7; i++)
        if (pthread_create(&threads[i], NULL, funcs[i], symbol_info))
            EXIT_MSG("Error creating thread!");

    for (int i = 0; i < 7; i++)
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

Info* api_get_check_info(const char* symbol) {
    if (strlen(symbol) > 5) // If symbol length is greater than 5, then it must be a crypto
        return coinmarketcap_get_info(symbol);

    Info* symbol_info = api_info_init();
    strcpy(symbol_info->symbol, symbol);
    pthread_t threads[2];
    void* (*funcs[2])(void*) = {iex_store_quote, iex_store_chart};
    for (int i = 0; i < 2; i++)
        if (pthread_create(&threads[i], NULL, funcs[i], symbol_info))
            EXIT_MSG("Error creating thread!")

    for (int i = 0; i < 2; i++)
        if (pthread_join(threads[i], NULL))
            EXIT_MSG("Error joining thread!")

    if (symbol_info->price != EMPTY)
        return symbol_info;

    api_info_destroy(&symbol_info);
    symbol_info = morningstar_get_info(symbol);

    if (symbol_info != NULL)
        return symbol_info;

    return coinmarketcap_get_info(symbol);
}

Info* api_get_info(const char* symbol) {
    if (strlen(symbol) > 5)
        return coinmarketcap_get_info(symbol);

    Info* symbol_info = iex_get_info(symbol);
    if (symbol_info != NULL)
        return symbol_info;

    symbol_info = morningstar_get_info(symbol);

    if (symbol_info != NULL)
        return symbol_info;

    return coinmarketcap_get_info(symbol);
}

void api_news_destroy(News** phNews) {
    free(*phNews);
    *phNews = NULL;
}

void api_info_destroy(Info** phInfo) {
    Info* pInfo = *phInfo;
    free(pInfo->points);
    if (pInfo->articles != NULL)
        for (int i = 0; i < pInfo->num_articles; i++)
            api_news_destroy(&pInfo->articles[i]);

    if (pInfo->peers != NULL)
        api_info_array_destroy(&pInfo->peers);

    free(pInfo->articles);
    free(*phInfo);
    *phInfo = NULL;
}

void api_info_array_destroy(Info_Array** phInfo_Array) {
    Info_Array* pInfo_Array = *phInfo_Array;
    for (size_t i = 0; i < pInfo_Array->length; i++)
        api_info_destroy(&pInfo_Array->array[i]);
    free(pInfo_Array->array);
    free(*phInfo_Array);
    *phInfo_Array = NULL;
}