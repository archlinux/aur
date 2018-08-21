#include "api.h"

Ref_Data* api_ref_data_init_from_length(size_t length) {
    Ref_Data* pRef_Data = malloc(sizeof(Ref_Data));
    pointer_alloc_check(pRef_Data);
    pRef_Data->symbols = malloc(length * sizeof(char*));
    pRef_Data->names = malloc(length * sizeof(char*));
    pointer_alloc_check(pRef_Data->symbols);
    pointer_alloc_check(pRef_Data->names);
    for (size_t i = 0; i < length; i++) {
        pRef_Data->symbols[i] = malloc(SYMBOL_MAX_LENGTH);
        pRef_Data->names[i] = malloc(NAME_MAX_LENGTH);
        pointer_alloc_check(pRef_Data->symbols[i]);
        pointer_alloc_check(pRef_Data->names[i]);
    }
    pRef_Data->length = length;
    return pRef_Data;
}

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
    *pInfo = (Info) { // Null terminate every string and set every value to EMPTY
            .api_provider = EMPTY, .symbol[0] = '\0', .name[0] = '\0', .industry[0] = '\0',
            .website[0] = '\0', .description[0] = '\0', .ceo[0] = '\0', .issue_type[0] = '\0',
            .sector[0] = '\0', .intraday_time = EMPTY, .price = EMPTY, .marketcap = EMPTY,
            .volume_1d = EMPTY, .pe_ratio = EMPTY, .div_yield = EMPTY, .revenue = EMPTY,
            .gross_profit = EMPTY, .cash = EMPTY, .debt = EMPTY, .eps = {EMPTY, EMPTY, EMPTY, EMPTY}
            , .fiscal_period[0][0] = '\0', .fiscal_period[1][0] = '\0', .fiscal_period[2][0] = '\0',
            .fiscal_period[3][0] = '\0', .eps_year_ago = {EMPTY, EMPTY, EMPTY, EMPTY},
            .price_last_close = EMPTY, .price_7d = EMPTY, .price_30d = EMPTY, .points = NULL,
            .num_points = EMPTY, .articles = NULL, .num_articles = EMPTY, .peers = NULL,
            .amount = EMPTY, .total_spent = EMPTY, .current_value = 0, .famount[0] = '\0',
            .ftotal_spent[0] = '\0', .fcurrent_value[0] = '\0', .profit_total = EMPTY,
            .profit_total_percent = EMPTY, .profit_last_close = EMPTY,
            .profit_last_close_percent = EMPTY, .profit_7d = EMPTY, .profit_7d_percent = EMPTY,
            .profit_30d = EMPTY, .profit_30d_percent = EMPTY, .fprofit_total[0] = '\0',
            .fprofit_total_percent[0] = '\0', .fprofit_last_close[0] = '\0',
            .fprofit_last_close_percent[0] = '\0', .fprofit_7d[0] = '\0',
            .fprofit_7d_percent[0] = '\0', .fprofit_30d[0] = '\0', .fprofit_30d_percent[0] = '\0'
    };
    return pInfo;
}

Info_Array* api_info_array_init(void) {
    Info_Array* pInfo_Array = malloc(sizeof(Info_Array));
    pointer_alloc_check(pInfo_Array);
    *pInfo_Array = (Info_Array) {
            .array = NULL, .length = 0, .totals = NULL
    };
    return pInfo_Array;
}

Info_Array* api_info_array_init_from_length(size_t length) {
    if (length == 0)
        return api_info_array_init();

    Info_Array* pInfo_Array = api_info_array_init();
    pInfo_Array->length = length;
    pInfo_Array->array = malloc(sizeof(Info*) * length);
    pointer_alloc_check(pInfo_Array->array);
    for (size_t i = 0; i < length; i++)
        pInfo_Array->array[i] = api_info_init();

    pInfo_Array->totals = api_info_init();
    strcpy(pInfo_Array->totals->symbol, "TOTALS");
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

void iex_batch_store_data_info_array(Info_Array* pInfo_Array, Data_Level data_level) {
    char** symbol_array = malloc(pInfo_Array->length * sizeof(char*));
    pointer_alloc_check(symbol_array);
    for (size_t i = 0; i < pInfo_Array->length; i++) {
        symbol_array[i] = malloc(SYMBOL_MAX_LENGTH);
        pointer_alloc_check(symbol_array[i]);
        strcpy(symbol_array[i], pInfo_Array->array[i]->symbol);
    }

    String* pString = iex_batch_get_data_string(symbol_array, pInfo_Array->length, data_level);
    Json* jobj = json_tokener_parse(pString->data);
    info_array_store_all_from_json(pInfo_Array, jobj);

    for (size_t i = 0; i < pInfo_Array->length; i++)
        free(symbol_array[i]);

    free(symbol_array);
    json_object_put(jobj);
    string_destroy(&pString);
}

void iex_batch_store_data_info(Info* pInfo, Data_Level data_level) {
    char* symbol_array = malloc(SYMBOL_MAX_LENGTH);
    free(symbol_array);
    strcpy(symbol_array, pInfo->symbol);
    String* pString = iex_batch_get_data_string(&symbol_array, 1, data_level);
    Json* jobj = json_tokener_parse(pString->data);
    info_store_all_from_json(pInfo, json_object_object_get(jobj, pInfo->symbol));

    free(symbol_array);
    json_object_put(jobj);
    string_destroy(&pString);
}

String* iex_batch_get_data_string(char* symbol_array[SYMBOL_MAX_LENGTH], size_t len,
        Data_Level data_level) {
    // TO-DO -- MAKE FUNCTION HANDLE MORE THAN 100 SECURITIES (API LIMITATION)

    char iex_api_string[URL_MAX_LENGTH], symbol_list_string[URL_MAX_LENGTH];
    symbol_list_string[0] = '\0';
    for (size_t i = 0; i < len; i++)
        if (strcmp(symbol_array[i], "USD$") != 0)
            sprintf(&symbol_list_string[strlen(symbol_list_string)], "%s,", symbol_array[i]);

    symbol_list_string[strlen(symbol_list_string) - 1] = '\0'; // Remove last comma

    char endpoints[128];
    if (data_level == ALL)
        strcpy(endpoints, "quote,chart,company,stats,peers,news,earnings&range=5y");
    else if (data_level == CHECK)
        strcpy(endpoints, "quote,chart");
    else strcpy(endpoints, "company,stats,peers,news,earnings&range=5y");
    sprintf(iex_api_string,
            "https://api.iextrading.com/1.0/stock/market/batch?symbols=%s&types=%s",
            symbol_list_string, endpoints);

    return api_curl_data(iex_api_string);
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

    symbol_info->api_provider = IEX;

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
    return vpInfo;
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

    symbol_info->api_provider = IEX;

    // If latest price is in extended hours
    if (json_object_get_int64(json_object_object_get(jobj, "extendedPriceTime")) >
        json_object_get_int64(json_object_object_get(jobj, "latestUpdate"))) {
        symbol_info->price = json_object_get_double(json_object_object_get(jobj, "extendedPrice"));
        symbol_info->intraday_time = json_object_get_int64(json_object_object_get(jobj, "extendedPriceTime")) / 1000;
    } else {
        symbol_info->price = json_object_get_double(json_object_object_get(jobj, "latestPrice"));
        symbol_info->intraday_time = json_object_get_int64(json_object_object_get(jobj, "latestUpdate")) / 1000;
    }
    symbol_info->price_last_close = json_object_get_double(json_object_object_get(jobj, "previousClose"));
    if (symbol_info->price_last_close == 0) // May be 0 over weekend
        symbol_info->price_last_close = EMPTY;
    symbol_info->marketcap = json_object_get_int64(json_object_object_get(jobj, "marketCap"));
    symbol_info->volume_1d = json_object_get_int64(json_object_object_get(jobj, "latestVolume"));
    symbol_info->pe_ratio = json_object_get_double(json_object_object_get(jobj, "peRatio"));
    json_object_put(jobj);
    string_destroy(&pString);
    return vpInfo;
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

    symbol_info->api_provider = IEX;

    symbol_info->div_yield = json_object_get_double(json_object_object_get(jobj, "dividendYield"));
    symbol_info->revenue = json_object_get_int64(json_object_object_get(jobj, "revenue"));
    symbol_info->gross_profit = json_object_get_int64(json_object_object_get(jobj, "grossProfit"));
    symbol_info->cash = json_object_get_int64(json_object_object_get(jobj, "cash"));
    symbol_info->debt = json_object_get_int64(json_object_object_get(jobj, "debt"));
    json_object_put(jobj);
    string_destroy(&pString);
    return vpInfo;
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

    symbol_info->api_provider = IEX;

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
    return vpInfo;
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

    symbol_info->api_provider = IEX;

    size_t len = json_object_array_length(jobj);
    symbol_info->points = calloc(len + 1, sizeof(double));
    pointer_alloc_check(symbol_info->points);
    for (size_t i = 0; i < len; i++)
        symbol_info->points[i] = json_object_get_double(
                json_object_object_get(json_object_array_get_idx(jobj, i), "close"));
    if (symbol_info->price_last_close == EMPTY) // May be 0 over weekend, so get last close from points array
        symbol_info->price_last_close = symbol_info->points[len - 1];
    if (len > 5)
        symbol_info->price_7d = symbol_info->points[len - 5];
    if (len > 21)
        symbol_info->price_30d = symbol_info->points[len - 21];
    json_object_put(jobj);
    string_destroy(&pString);
    return vpInfo;
}

void* iex_store_news(void* vpInfo) {
    Info* symbol_info = vpInfo;
    if (symbol_info->symbol[0] == '\0')
        return NULL;

    int num_articles = DEFAULT_NUM_ARTICLES;
    if (symbol_info->num_articles != EMPTY)
        num_articles = symbol_info->num_articles;

    char iex_api_string[URL_MAX_LENGTH];
    sprintf(iex_api_string, "https://api.iextrading.com/1.0/stock/%s/news/last/%d",
            symbol_info->symbol, num_articles);
    String* pString = api_curl_data(iex_api_string);
    if (pString == NULL)
        return NULL;

    Json* jobj = json_tokener_parse(pString->data), * idx, *headline;
    if (jobj == NULL) { // Invalid symbol
        string_destroy(&pString);
        return NULL;
    }

    symbol_info->api_provider = IEX;

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
            strncpy(symbol_info->articles[i]->date,
                    json_object_get_string(json_object_object_get(idx, "datetime")), 10);
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
    return vpInfo;
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

    symbol_info->api_provider = IEX;

    size_t len = (int) json_object_array_length(jobj);
    if (len == 0) {
        json_object_put(jobj);
        string_destroy(&pString);
        return NULL;
    }
    if (len > MAX_PEERS)
        len = MAX_PEERS;

    symbol_info->peers = api_info_array_init_from_length(len);
    for (size_t i = 0; i < symbol_info->peers->length; i++)
        strcpy(symbol_info->peers->array[i]->symbol, json_object_get_string(
                json_object_array_get_idx(jobj, (size_t) i)));

    api_info_array_store_check_data(symbol_info->peers);

    json_object_put(jobj);
    string_destroy(&pString);
    return vpInfo;
}

void* iex_store_all_info(void* vpInfo) {
    pthread_t threads[7];
    void* (*funcs[7]) (void*) = {
            iex_store_company, iex_store_quote, iex_store_stats, iex_store_earnings,
            iex_store_chart, iex_store_news, iex_store_peers
    };
    for (int i = 0; i < 7; i++)
        if (pthread_create(&threads[i], NULL, funcs[i], vpInfo))
            EXIT_MSG("Error creating thread!");

    void* ret = vpInfo, * thread_ret = NULL;
    for (int i = 0; i < 7; i++) {
        if (pthread_join(threads[i], &thread_ret))
            EXIT_MSG("Error joining thread!");

        if (thread_ret == NULL)
            ret = NULL;
    }
    return ret;
}

void* iex_store_check_info(void* vpInfo) {
    pthread_t threads[2];
    void* (*funcs[2]) (void*) = {
            iex_store_quote, iex_store_chart
    };
    for (int i = 0; i < 2; i++)
        if (pthread_create(&threads[i], NULL, funcs[i], vpInfo))
            EXIT_MSG("Error creating thread!");

    void* ret = vpInfo, * thread_ret = NULL;
    for (int i = 0; i < 2; i++) {
        if (pthread_join(threads[i], &thread_ret))
            EXIT_MSG("Error joining thread!");

        if (thread_ret == NULL)
            ret = NULL;
    }
    return ret;
}

void* iex_store_misc_info(void* vpInfo) {
    pthread_t threads[5];
    void* (*funcs[5]) (void*) = {
            iex_store_company, iex_store_stats, iex_store_earnings, iex_store_news, iex_store_peers
    };
    for (int i = 0; i < 5; i++)
        if (pthread_create(&threads[i], NULL, funcs[i], vpInfo))
            EXIT_MSG("Error creating thread!");

    void* ret = vpInfo, * thread_ret = NULL;
    for (int i = 0; i < 5; i++) {
        if (pthread_join(threads[i], &thread_ret))
            EXIT_MSG("Error joining thread!");

        if (thread_ret == NULL)
            ret = NULL;
    }
    return ret;
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

    symbol_info->api_provider = MORNINGSTAR;

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
    return vpInfo;
}

void* alphavantage_store_info(void* vpInfo) {
    Info* symbol_info = vpInfo;
    if (symbol_info->symbol[0] == '\0')
        return NULL;

    char alphavantage_api_string[URL_MAX_LENGTH];
    sprintf(alphavantage_api_string, "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY"
                                     "&symbol=%s&apikey=DFUMLJ1ILOM2G7IH&outputsize=full&datatype"
                                     "=csv", symbol_info->symbol);
    String* pString = api_curl_data(alphavantage_api_string);
    if (pString == NULL)
        return NULL;

    if (pString->data[0] == '{') { // Invalid symbol/error
        string_destroy(&pString);
        return NULL;
    }

    symbol_info->api_provider = ALPHAVANTAGE;

    size_t len = string_get_num_lines(pString) - 1, idx = 0;
    if (len > 1260) // 5 years
        len = 1260;

    symbol_info->points = calloc(len + 1, sizeof(double));
    pointer_alloc_check(symbol_info->points);

    csv_goto_next_line(pString, &idx); // skip columns line
    for (int i = (int) len - 1; i >= 0; i--) {
        for (size_t j = 0; j < 4; j++)
            csv_goto_next_value(pString, &idx);

        symbol_info->points[i] = csv_read_next_double(pString, &idx);
        if (symbol_info->points[i] == 0 && i < (int) len - 1) // API Error
            symbol_info->points[i] = symbol_info->points[i + 1];
        csv_goto_next_line(pString, &idx);
    }

    symbol_info->price = symbol_info->points[len - 1];
    symbol_info->price_last_close = symbol_info->points[len - 2];
    symbol_info->price_7d = symbol_info->points[len - 6];
    symbol_info->price_30d = symbol_info->points[len - 22];
    string_destroy(&pString);
    return vpInfo;
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

    symbol_info->api_provider = COINMARKETCAP;

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
    return vpInfo;
}

void* api_store_all_info(void* vpInfo) {
    Info* pInfo = vpInfo;
    if (strlen(pInfo->symbol) > 5) // If symbol length is greater than 5, then it must be a crypto
        return coinmarketcap_store_info(vpInfo);

    if (iex_store_all_info(vpInfo) == NULL && alphavantage_store_info(vpInfo) == NULL &&
        coinmarketcap_store_info(vpInfo) == NULL)
        return NULL;
    else return vpInfo;
}

void* api_store_check_info(void* vpInfo) {
    Info* pInfo = vpInfo;
    if (strlen(pInfo->symbol) > 5) // If symbol length is greater than 5, then it must be a crypto
        return coinmarketcap_store_info(vpInfo);

    if (iex_store_check_info(vpInfo) == NULL && alphavantage_store_info(vpInfo) == NULL &&
        coinmarketcap_store_info(vpInfo) == NULL)
        return NULL;
    else return vpInfo;
}

void* api_store_misc_info(void* vpInfo) {
    Info* pInfo = vpInfo;
    if (pInfo->api_provider == IEX)
        return iex_store_misc_info(pInfo);

    return NULL;
}

void* api_info_array_store_check_data(void* vpPortfolio_Data) {
    Info_Array* portfolio_data = vpPortfolio_Data;
    pthread_t threads[portfolio_data->length];
    for (size_t i = 0; i < portfolio_data->length; i++)
        if (strcmp(portfolio_data->array[i]->symbol, "USD$") != 0)
            if (pthread_create(&threads[i], NULL, api_store_check_info, portfolio_data->array[i]))
            EXIT_MSG("Error creating thread!")

    void* ret = vpPortfolio_Data, * thread_ret = NULL;
    int load_len = 0;
    for (size_t i = 0; i < portfolio_data->length; i++) {
        // Print loading string
        if (i > 0)
            for (int j = 0; j < load_len; j++)
                putchar('\b');
        load_len = printf("Loading data (%d/%d)", (int) i + 1, (int) portfolio_data->length);
        fflush(stdout);

        if (strcmp(portfolio_data->array[i]->symbol, "USD$") != 0) {
            if (pthread_join(threads[i], &thread_ret))
            EXIT_MSG("Error joining thread!")
        }
        if (thread_ret == NULL)
            ret = NULL;
        else info_store_check_data(portfolio_data->array[i]);
    }
    if (ret != NULL)
        info_array_store_totals(portfolio_data);
    return ret;
}

void api_info_array_store_data_batch(Info_Array* pInfo_Array, Data_Level data_level) {
    iex_batch_store_data_info_array(pInfo_Array, data_level);

    // All IEX securities are accounted for
    Info* pInfo;
    pthread_t threads[pInfo_Array->length];
    for (size_t i = 0; i < pInfo_Array->length; i++) {
        pInfo = pInfo_Array->array[i];
        if (pInfo->api_provider == EMPTY && strcmp(pInfo->symbol, "USD$") != 0) {
            if (strlen(pInfo->symbol) > 5) // Crypto
                pthread_create(&threads[i], NULL, coinmarketcap_store_info, pInfo);
            else pthread_create(&threads[i], NULL, alphavantage_store_info, pInfo); // AV
        }
    }

    for (size_t i = 0; i < pInfo_Array->length; i++) {
        pInfo = pInfo_Array->array[i];
        if (pInfo->api_provider != IEX && strcmp(pInfo->symbol, "USD$") != 0) {
            pthread_join(threads[i], NULL);
            if (strlen(pInfo->symbol) <= 5) // Crypto with 5 char or less name
                pthread_create(&threads[i], NULL, alphavantage_store_info, pInfo);
        }
    }
    for (size_t i = 0; i < pInfo_Array->length; i++) {
        pInfo = pInfo_Array->array[i];
        if (pInfo->api_provider != IEX && pInfo->api_provider != ALPHAVANTAGE &&
            strlen(pInfo->symbol) <= 5 && strcmp(pInfo->symbol, "USD$") != 0)
            pthread_join(threads[i], NULL); // Crypto with 5 char or less name

        info_store_check_data(pInfo_Array->array[i]);
    }
    info_array_store_totals(pInfo_Array);
}

void info_store_check_data(Info* pInfo) {
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

void info_array_store_totals(Info_Array* pInfo_Array) {
    pInfo_Array->totals->total_spent = 0;
    pInfo_Array->totals->current_value = 0;
    pInfo_Array->totals->profit_total = 0;
    pInfo_Array->totals->profit_last_close = 0;
    pInfo_Array->totals->profit_7d = 0;
    pInfo_Array->totals->profit_30d = 0;
    for (size_t i = 0; i < pInfo_Array->length; i++) {
        pInfo_Array->totals->total_spent += pInfo_Array->array[i]->total_spent;
        pInfo_Array->totals->current_value += pInfo_Array->array[i]->current_value;
        pInfo_Array->totals->profit_total += pInfo_Array->array[i]->profit_total;
        pInfo_Array->totals->profit_last_close += pInfo_Array->array[i]->profit_last_close;
        pInfo_Array->totals->profit_7d += pInfo_Array->array[i]->profit_7d;
        pInfo_Array->totals->profit_30d += pInfo_Array->array[i]->profit_30d;
    }
    pInfo_Array->totals->profit_total_percent = (100 * (pInfo_Array->totals->current_value -
                                                        pInfo_Array->totals->total_spent)) / pInfo_Array->totals->total_spent;
    pInfo_Array->totals->profit_last_close_percent = 100 *
                                                     pInfo_Array->totals->profit_last_close / pInfo_Array->totals->total_spent;
    pInfo_Array->totals->profit_7d_percent = 100 *  pInfo_Array->totals->profit_7d /
                                             pInfo_Array->totals->total_spent;
    pInfo_Array->totals->profit_30d_percent = 100 *  pInfo_Array->totals->profit_30d /
                                              pInfo_Array->totals->total_spent;
}

Ref_Data* iex_get_valid_symbols(void) {
    String* pString = api_curl_data("https://api.iextrading.com/1.0/ref-data/symbols");
    if (pString == NULL)
        return NULL;

    Json* jobj = json_tokener_parse(pString->data), * idx;
    Ref_Data* pRef_Data = api_ref_data_init_from_length(json_object_array_length(jobj));
    for (size_t i = 0; i < pRef_Data->length; i++) {
        idx = json_object_array_get_idx(jobj, i);
        strcpy(pRef_Data->symbols[i], json_object_get_string(json_object_object_get(idx,
                "symbol")));
        strcpy(pRef_Data->names[i], json_object_get_string(json_object_object_get(idx, "name")));
    }

    json_object_put(jobj);
    string_destroy(&pString);
    return pRef_Data;
}

void info_array_store_all_from_json(Info_Array* pInfo_Array, const Json* jobj) {
    Json* jsymbol;
    for (size_t i = 0; i < pInfo_Array->length; i++) {
        jsymbol = json_object_object_get(jobj, pInfo_Array->array[i]->symbol);
        if (jsymbol != NULL)
            info_store_all_from_json(pInfo_Array->array[i], jsymbol);
    }
}

void info_store_all_from_json(Info* pInfo, const Json* jsymbol) {
    Json* jquote, * jchart, * jcompany, * jstats, * jpeers, * jnews, * jearnings;
    pInfo->api_provider = IEX;
    jquote = json_object_object_get(jsymbol, "quote");
    jchart = json_object_object_get(jsymbol, "chart");
    jcompany = json_object_object_get(jsymbol, "company");
    jstats = json_object_object_get(jsymbol, "stats");
    jpeers = json_object_object_get(jsymbol, "peers");
    jnews = json_object_object_get(jsymbol, "news");
    jearnings = json_object_object_get(jsymbol, "earnings");
    if (jquote != NULL)
        info_store_quote_from_json(pInfo, jquote);
    if (jchart != NULL)
        info_store_chart_from_json(pInfo, jchart);
    if (jcompany != NULL)
        info_store_company_from_json(pInfo, jcompany);
    if (jstats != NULL)
        info_store_stats_from_json(pInfo, jstats);
    if (jpeers != NULL)
        info_store_peers_from_json(pInfo, jpeers);
    if (jnews != NULL)
        info_store_news_from_json(pInfo, jnews);
    if (jearnings != NULL)
        info_store_earnings_from_json(pInfo, jearnings);
}

void info_store_quote_from_json(Info* pInfo, const Json* jquote) {
    if (json_object_get_int64(json_object_object_get(jquote, "extendedPriceTime")) >
        json_object_get_int64(json_object_object_get(jquote, "latestUpdate"))) {
        pInfo->price = json_object_get_double(json_object_object_get(jquote, "extendedPrice"));
        pInfo->intraday_time = json_object_get_int64(json_object_object_get(jquote,
                                                                            "extendedPriceTime")) / 1000;
    } else {
        pInfo->price = json_object_get_double(json_object_object_get(jquote, "latestPrice"));
        pInfo->intraday_time = json_object_get_int64(json_object_object_get(jquote, "latestUpdate")) /
                               1000;
    }
    pInfo->price_last_close = json_object_get_double(json_object_object_get(jquote, "previousClose"));
    if (pInfo->price_last_close == 0) // May be 0 over weekend
        pInfo->price_last_close = EMPTY;
    pInfo->marketcap = json_object_get_int64(json_object_object_get(jquote, "marketCap"));
    pInfo->volume_1d = json_object_get_int64(json_object_object_get(jquote, "latestVolume"));
    pInfo->pe_ratio = json_object_get_double(json_object_object_get(jquote, "peRatio"));
}


void info_store_chart_from_json(Info* pInfo, const Json* jchart) {
    size_t len = json_object_array_length(jchart);
    pInfo->points = calloc(len + 1, sizeof(double));
    pointer_alloc_check(pInfo->points);
    for (size_t i = 0; i < len; i++)
        pInfo->points[i] = json_object_get_double(
                json_object_object_get(json_object_array_get_idx(jchart, i), "close"));
    if (pInfo->price_last_close == EMPTY) // May be 0 over weekend, so get last close from points array
        pInfo->price_last_close = pInfo->points[len - 1];
    if (len > 5)
        pInfo->price_7d = pInfo->points[len - 5];
    if (len > 21)
        pInfo->price_30d = pInfo->points[len - 21];
    if (len < 25) // 1 month api data
        pInfo->price_30d = pInfo->points[0];
}

void info_store_company_from_json(Info* pInfo, const Json* jcompany) {
    Json* jsymbol, * jname, * jindustry, * jwebsite, * jdescription, * jceo, * jtype, * jsector;
    jsymbol = json_object_object_get(jcompany, "symbol");
    jname = json_object_object_get(jcompany, "companyName");
    jindustry = json_object_object_get(jcompany, "industry");
    jwebsite = json_object_object_get(jcompany, "website");
    jdescription = json_object_object_get(jcompany, "description");
    jceo = json_object_object_get(jcompany, "CEO");
    jtype = json_object_object_get(jcompany, "issueType");
    jsector = json_object_object_get(jcompany, "sector");

    if (jsymbol != NULL)
        strcpy(pInfo->symbol, json_object_get_string(jsymbol));
    if (jname != NULL)
        strcpy(pInfo->name, json_object_get_string(jname));
    if (jindustry != NULL)
        strcpy(pInfo->industry, json_object_get_string(jindustry));
    if (jwebsite != NULL)
        strcpy(pInfo->website, json_object_get_string(jwebsite));
    if (jdescription != NULL)
        strcpy(pInfo->description, json_object_get_string(jdescription));
    if (jceo != NULL)
        strcpy(pInfo->ceo, json_object_get_string(jceo));
    if (jtype != NULL)
        strcpy(pInfo->issue_type, json_object_get_string(jtype));
    if (jsector != NULL)
        strcpy(pInfo->sector, json_object_get_string(jsector));
}

void info_store_stats_from_json(Info* pInfo, const Json* jstats) {
    pInfo->div_yield = json_object_get_double(json_object_object_get(jstats, "dividendYield"));
    pInfo->revenue = json_object_get_int64(json_object_object_get(jstats, "revenue"));
    pInfo->gross_profit = json_object_get_int64(json_object_object_get(jstats, "grossProfit"));
    pInfo->cash = json_object_get_int64(json_object_object_get(jstats, "cash"));
    pInfo->debt = json_object_get_int64(json_object_object_get(jstats, "debt"));
}

void info_store_peers_from_json(Info* pInfo, const Json* jpeers) {
    size_t len = json_object_array_length(jpeers);
    if (len == 0)
        return;

    if (len > MAX_PEERS)
        len = MAX_PEERS;

    pInfo->peers = api_info_array_init_from_length(len);
    for (size_t i = 0; i < pInfo->peers->length; i++)
        strcpy(pInfo->peers->array[i]->symbol, json_object_get_string(
                json_object_array_get_idx(jpeers, i)));

    api_info_array_store_data_batch(pInfo->peers, CHECK);
}

void info_store_news_from_json(Info* pInfo, const Json* jnews) {
    Json* idx, * headline, * source, * date, * summary, * url, * related;
    size_t len = json_object_array_length(jnews);
    if (len < (unsigned) pInfo->num_articles)
        pInfo->num_articles = (int)len;

    pInfo->articles = malloc(sizeof(News*) * pInfo->num_articles);
    pointer_alloc_check(pInfo->articles);

    for (int i = 0; i < pInfo->num_articles; i++) {
        idx = json_object_array_get_idx(jnews, (size_t) i);
        headline = json_object_object_get(idx, "headline");
        source = json_object_object_get(idx, "source");
        date = json_object_object_get(idx, "datetime");
        summary = json_object_object_get(idx, "summary");
        url = json_object_object_get(idx, "url");
        related = json_object_object_get(idx, "related");

        /*
         * If two articles in a row are the same, change num_articles and break loop. This will
         * happen if there are not enough articles supplied by API.
         */
        if (i > 0 && headline != NULL &&
            strcmp(json_object_get_string(headline), pInfo->articles[i - 1]->headline) == 0) {
            pInfo->num_articles = i;
            break;
        }

        pInfo->articles[i] = api_news_init();
        if (headline != NULL)
            strcpy(pInfo->articles[i]->headline, json_object_get_string(headline));
        if (source != NULL)
            strcpy(pInfo->articles[i]->source, json_object_get_string(source));
        if (date != NULL)
            strncpy(pInfo->articles[i]->date, json_object_get_string(date), 10);
        pInfo->articles[i]->date[10] = '\0'; // strncpy doesn't null terminate
        if (summary != NULL)
            strcpy(pInfo->articles[i]->summary, json_object_get_string(summary));
        strip_tags(pInfo->articles[i]->summary); // Summary will be html formatted, so strip tags
        if (url != NULL)
            strcpy(pInfo->articles[i]->url, json_object_get_string(url));
        if (related != NULL)
            strcpy(pInfo->articles[i]->related, json_object_get_string(related));
        int related_num = 0;
        for (size_t j = 0; j < strlen(pInfo->articles[i]->related); j++) { // List only first five related symbols
            if (pInfo->articles[i]->related[j] == ',')
                related_num++;
            if (related_num == 5) {
                pInfo->articles[i]->related[j] = '\0';
                break;
            }
        }
    }
}

void info_store_earnings_from_json(Info* pInfo, const Json* jearnings) {
    // ETFs don't report earnings
    if (!json_object_is_type(json_object_object_get(jearnings, "earnings"), json_type_array))
        return;

    size_t len = json_object_array_length(json_object_object_get(jearnings, "earnings"));
    Json* idx, * period, * end_date, * report_date;
    for (size_t i = 0; i < len; i++) {
        idx = json_object_array_get_idx(json_object_object_get(jearnings, "earnings"), i);
        pInfo->eps[i] = json_object_get_double(json_object_object_get(idx, "actualEPS"));
        pInfo->eps_year_ago[i] = json_object_get_double(json_object_object_get(idx, "yearAgo"));
        period = json_object_object_get(idx, "fiscalPeriod");
        end_date = json_object_object_get(idx, "fiscalEndDate");
        report_date = json_object_object_get(idx, "EPSReportDate");
        if (period != NULL)
            strcpy(pInfo->fiscal_period[i], json_object_get_string(period));
        else if (end_date != NULL)
            strcpy(pInfo->fiscal_period[i], json_object_get_string(end_date));
        else if (report_date != NULL)
            strcpy(pInfo->fiscal_period[i], json_object_get_string(report_date));
    }
}

Info* info_array_get_info_from_symbol(const Info_Array* pInfo_Array, const char* symbol) {
    for (size_t i = 0; i < pInfo_Array->length; i++)
        if (strcmp(symbol, pInfo_Array->array[i]->symbol) == 0)
            return pInfo_Array->array[i];

    return NULL;
}

void api_ref_data_destroy(Ref_Data** phRef_Data) {
    if (*phRef_Data == NULL)
        return;

    Ref_Data* pRef_data = *phRef_Data;
    for (size_t i = 0; i < pRef_data->length; i++) {
        free(pRef_data->symbols[i]);
        free(pRef_data->names[i]);
    }
    free(pRef_data->symbols);
    free(pRef_data->names);
    free(*phRef_Data);
    *phRef_Data = NULL;
}

void api_news_destroy(News** phNews) {
    if (*phNews == NULL)
        return;

    free(*phNews);
    *phNews = NULL;
}

void api_info_destroy(Info** phInfo) {
    if (*phInfo == NULL)
        return;

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
    if (*phInfo_Array == NULL)
        return;

    Info_Array* pInfo_Array = *phInfo_Array;
    for (size_t i = 0; i < pInfo_Array->length; i++)
        api_info_destroy(&pInfo_Array->array[i]);
    free(pInfo_Array->array);
    if (pInfo_Array->totals != NULL)
        api_info_destroy(&pInfo_Array->totals);
    free(*phInfo_Array);
    *phInfo_Array = NULL;
}