#include "api.h"

String* api_string_init() {
    String* pString = (String*) malloc(sizeof(String));
    if (pString != NULL) {
        pString->len = 0;
        pString->data = (char*) malloc(sizeof(char));
        if (pString->data == NULL) {
            fprintf(stderr, "malloc() failed\n");
            exit(EXIT_FAILURE);
        }
        pString->data[0] = '\0';
    } else {
        fprintf(stderr, "malloc() failed\n");
        exit(EXIT_FAILURE);
    }
    return pString;
}

size_t api_string_writefunc(void* ptr, size_t size, size_t nmemb, String* hString) {
    String* pString = hString;
    size_t new_len = pString->len + size * nmemb;
    pString->data = realloc(pString->data, new_len + 1);
    if (pString->data == NULL) {
        fprintf(stderr, "realloc() failed\n");
        exit(EXIT_FAILURE);
    }
    memcpy(pString->data + pString->len, ptr, size * nmemb);
    pString->data[new_len] = '\0';
    pString->len = new_len;
    return size * nmemb;
}

String* api_curl_data(char* url, char* post_field) {
    String* pString = api_string_init();
    CURL* curl = curl_easy_init();
    CURLcode res;
    curl_global_init(CURL_GLOBAL_DEFAULT);
    if (curl) {
        curl_easy_setopt(curl, CURLOPT_URL, url);
        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, api_string_writefunc);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &pString->data);
        struct curl_slist* list = NULL;
        if (url[12] == 'g') {
            list = curl_slist_append(list, "Content-Type: application/json");
            curl_easy_setopt(curl, CURLOPT_HTTPHEADER, list);
            curl_easy_setopt(curl, CURLOPT_POSTFIELDS, post_field);
            curl_easy_setopt(curl, CURLOPT_POSTFIELDSIZE, strlen(post_field));
        }
        res = curl_easy_perform(curl);
        if (url[12] == 'g')
            curl_slist_free_all(list);
        curl_easy_cleanup(curl);
        if (res != CURLE_OK)
            return NULL;
    }
    return pString;
}

double api_get_current_price(char* ticker_name_string) {
    double val = iex_get_current_price(ticker_name_string);
    if (val != -1)
        return val;
    val = alphavantage_get_current_price(ticker_name_string);
    if (val != -1)
        return val;
    val = morningstar_get_price(ticker_name_string, 0);
    if (val != -1)
        return val;
    val = coinmarketcap_get_current_price(ticker_name_string);
    if (val != -1)
        return val;
    return -1;
}

double api_get_1d_price(char* ticker_name_string) {
    double val = iex_get_1d_price(ticker_name_string);
    if (val != -1)
        return val;
    val = alphavantage_get_1d_price(ticker_name_string);
    if (val != -1)
        return val;
    val = morningstar_get_price(ticker_name_string, 1);
    if (val != -1)
        return val;
    val = coinmarketcap_get_1d_price(ticker_name_string);
    if (val != -1)
        return val;
    return -1;
}

double morningstar_get_price(char* ticker_name_string, int offset) {
    time_t now = time(NULL);
    struct tm* ts;
    char* today_char = calloc(16, 1);
    char* yesterday_char = calloc(16, 1);
    ts = localtime(&now);
    mktime(ts);
    ts->tm_mday -= offset;
    strftime(today_char, 16, "%Y-%m-%d", ts);
    ts->tm_mday--;
    mktime(ts);
    strftime(yesterday_char, 16, "%Y-%m-%d", ts);

    char* morningstar_api_string = calloc(512, 1);
    sprintf(morningstar_api_string, "%s%s%s%s|%s%s",
            "http://globalquote.morningstar.com/globalcomponent/RealtimeHistoricalStockData.ashx?ticker=",
            ticker_name_string,
            "&showVol=true&dtype=his&f=d&curry=USD&range=", yesterday_char, today_char,
            "&isD=true&isS=true&hasF=true&ProdCode=DIRECT");
    String* pString = api_curl_data(morningstar_api_string, NULL);
    free(morningstar_api_string);
    free(today_char);
    free(yesterday_char);

    Json* jobj = json_tokener_parse(pString->data);
    if (strcmp("null", pString->data) == 0){
        api_string_destroy(&pString);
        return -1;
    }
    Json* price_data_list = json_object_object_get(jobj, "PriceDataList");
    Json* price = json_object_array_get_idx(price_data_list, 0);
    Json* current = json_object_object_get(price, "Max");
    char* price_string = (char*) json_object_to_json_string(current);
    char* copy = calloc(16, 1);
    strcpy(copy, price_string);
    json_object_put(jobj);
    double ret = strtod(copy, NULL);
    free(copy);
    api_string_destroy(&pString);
    return ret;
}

double iex_get_current_price(char* ticker_name_string) {
    size_t ticker_name_len = strlen(ticker_name_string);
    char* iex_api_string = calloc(64, sizeof(char));
    memcpy(iex_api_string, "https://api.iextrading.com/1.0/stock/", 37);
    memcpy(&iex_api_string[37], ticker_name_string, ticker_name_len);
    memcpy(&iex_api_string[37 + ticker_name_len], "/quote/latestPrice", 18);

    String* pString = api_curl_data(iex_api_string, NULL);
    free(iex_api_string);
    if (strcmp(pString->data, "Unknown symbol") == 0) {
        api_string_destroy(&pString);
        return -1;
    }
    double ret = strtod(pString->data, NULL);
    api_string_destroy(&pString);
    return ret;
}

double alphavantage_get_current_price(char* ticker_name_string) {
    char* av_str = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&interval=1min&apikey=DFUMLJ1ILOM2G7IH&datatype=csv&symbol=";
    char* alphavantage_api_string = calloc(160, sizeof(char));
    memcpy(alphavantage_api_string, av_str, 160);
    size_t av_len = strlen(alphavantage_api_string);
    memcpy(&alphavantage_api_string[av_len], ticker_name_string, 10);
    String* pString = api_curl_data(alphavantage_api_string, NULL);
    if (pString->data[0] == '{') {
        api_string_destroy(&pString);
        memset(alphavantage_api_string, '\0', 160);
        av_str = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&apikey=DFUMLJ1ILOM2G7IH&datatype=csv&symbol=";
        memcpy(alphavantage_api_string, av_str, 160);
        av_len = strlen(alphavantage_api_string);
        memcpy(&alphavantage_api_string[av_len], ticker_name_string, 10);
        pString = api_curl_data(alphavantage_api_string, NULL);
    }
    if (pString->data[0] == '{') {
        free(alphavantage_api_string);
        api_string_destroy(&pString);
        return -1;
    }
    int i = 0;
    for (int j = 0; j < 9; i++, j++)
        while (pString->data[i] != ',')
            i++;
    char* price_string = (char*) calloc(16, 1);
    for (int j = 0; pString->data[i] != ','; i++, j++)
        price_string[j] = pString->data[i];
    free(alphavantage_api_string);
    double ret = strtod(price_string, NULL);
    free(price_string);
    api_string_destroy(&pString);
    return ret;
}

double coinmarketcap_get_current_price(char* ticker_name_string) {
    char* cmc_str = "https://api.coinmarketcap.com/v1/ticker/";
    char* coinmarketcap_api_string = calloc(64, sizeof(char));
    memcpy(coinmarketcap_api_string, cmc_str, 40);
    memcpy(&coinmarketcap_api_string[40], ticker_name_string, 20);
    String* pString = api_curl_data(coinmarketcap_api_string, NULL);
    if (pString->data[0] == '{') {
        free(coinmarketcap_api_string);
        api_string_destroy(&pString);
        return -1;
    }
    int i = 0;
    for (int j = 0; j < 19; i++, j++)
        while (pString->data[i] != '"')
            i++;
    char* price_string = (char*) calloc(16, 1);
    for (int j = 0; pString->data[i] != '"'; i++, j++)
        price_string[j] = pString->data[i];
    free(coinmarketcap_api_string);
    double ret = strtod(price_string, NULL);
    free(price_string);
    api_string_destroy(&pString);
    return ret;
}

double iex_get_1d_price(char* ticker_name_string) {
    size_t ticker_name_len = strlen(ticker_name_string);
    char* iex_api_string = calloc(64, sizeof(char));
    memcpy(iex_api_string, "https://api.iextrading.com/1.0/stock/", 37);
    memcpy(&iex_api_string[37], ticker_name_string, ticker_name_len);
    memcpy(&iex_api_string[37 + ticker_name_len], "/previous?format=csv", 21);

    String* pString = api_curl_data(iex_api_string, NULL);
    free(iex_api_string);

    if (strcmp(pString->data, "Unknown symbol") == 0) {
        api_string_destroy(&pString);
        return -1;
    }
    int i = 0;
    for (int j = 0; j < 15; i++, j++)
        while (pString->data[i] != ',')
            i++;
    char* price_string = (char*) calloc(16, 1);
    for (int j = 0; pString->data[i] != ','; i++, j++)
        price_string[j] = pString->data[i];
    double ret = strtod(price_string, NULL);
    free(price_string);
    api_string_destroy(&pString);
    return ret;
}

double alphavantage_get_1d_price(char* ticker_name_string) {
    size_t ticker_name_len = strlen(ticker_name_string);
    char* alphavantage_api_string = calloc(128, sizeof(char));
    memcpy(alphavantage_api_string,
           "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&apikey=DFUMLJ1ILOM2G7IH&datatype=csv&symbol=",
           128);
    size_t prefix = strlen(alphavantage_api_string);
    memcpy(&alphavantage_api_string[prefix], ticker_name_string, ticker_name_len);
    String* pString = api_curl_data(alphavantage_api_string, NULL);
    if (pString->data[0] == '{') {
        free(alphavantage_api_string);
        api_string_destroy(&pString);
        return -1;
    }
    int i = 0;
    for (int j = 0; j < 14; i++, j++)
        while (pString->data[i] != ',')
            i++;
    char* price_string = (char*) calloc(16, 1);
    for (int j = 0; pString->data[i] != ','; i++, j++)
        price_string[j] = pString->data[i];
    double ret = strtod(price_string, NULL);
    free(alphavantage_api_string);
    free(price_string);
    api_string_destroy(&pString);
    return ret;
}

double coinmarketcap_get_1d_price(char* ticker_name_string) {
    char* cmc_str = "https://api.coinmarketcap.com/v1/ticker/";
    char* coinmarketcap_api_string = calloc(64, sizeof(char));
    memcpy(coinmarketcap_api_string, cmc_str, 40);
    memcpy(&coinmarketcap_api_string[40], ticker_name_string, 20);
    String* pString = api_curl_data(coinmarketcap_api_string, NULL);
    if (pString->data[0] == '{') {
        free(coinmarketcap_api_string);
        api_string_destroy(&pString);
        return -1;
    }
    int i = 0;
    for (int j = 0; j < 19; i++, j++)
        while (pString->data[i] != '"')
            i++;
    char* price_string = (char*) calloc(16, 1);
    for (int j = 0; pString->data[i] != '"'; i++, j++)
        price_string[j] = pString->data[i];
    char* percent_string = (char*) calloc(16, 1);
    i = 0;
    for (int j = 0; j < 51; i++, j++)
        while (pString->data[i] != '"')
            i++;
    for (int j = 0; pString->data[i] != '"'; i++, j++)
        percent_string[j] = pString->data[i];
    free(coinmarketcap_api_string);
    double current_price = strtod(price_string, NULL);
    double percent_change = strtod(percent_string, NULL);
    free(price_string);
    free(percent_string);
    api_string_destroy(&pString);
    return current_price - (current_price * (percent_change / 100));
}

void news_print_top_three(char* ticker_name_string) {
    char* qchar = calloc(64, 1);
    sprintf(qchar, "&q=%s", ticker_name_string);
    time_t now = time(NULL);
    struct tm* ts;
    char* yearchar = calloc(64, 1);
    ts = localtime(&now);
    ts->tm_mday -= 14;
    mktime(ts);
    strftime(yearchar, 64, "%Y-%m-%d", ts);
    char* news_api_string = calloc(256, sizeof(char));
    sprintf(news_api_string, "%s%s&from=%s",
            "https://newsapi.org/v2/everything?sortBy=popularity&pageSize=3&language=en&apiKey=1163c352d041460381f0a8273e60a9d1",
            qchar, yearchar);
    free(yearchar);
    free(qchar);
    String* pString = api_curl_data(news_api_string, NULL);
    json_print_news(pString->data);
    free(news_api_string);
    api_string_destroy(&pString);
}

void json_print_news(char* data) {
    Json* jobj = json_tokener_parse(data);
    Json* articles = json_object_object_get(jobj, "articles");
    const char* author_string, * title_string, * source_string, * url_string;
    char* date_string;
    Json* article, * source, * author, * title, * source_name, * date, * url;
    for (int i = 0; i < 3; i++) {
        article = json_object_array_get_idx(articles, (size_t) i);
        author = json_object_object_get(article, "author");
        author_string = json_object_to_json_string(author);
        title = json_object_object_get(article, "title");
        title_string = json_object_to_json_string(title);
        source = json_object_object_get(article, "source");
        source_name = json_object_object_get(source, "name");
        source_string = json_object_to_json_string(source_name);
        date = json_object_object_get(article, "publishedAt");
        date_string = (char*) json_object_to_json_string(date);
        date_string[11] = '\"';
        date_string[12] = '\0';
        url = json_object_object_get(article, "url");
        url_string = json_object_to_json_string(url);
        char* url_final = calloc(strlen(url_string + 1), 1);
        for (int k = 0, j = 0; j < strlen(url_string); k++, j++) {
            if (url_string[j] == '\\' || url_string[j] == '\"')
                j++;
            url_final[k] = url_string[j];
        }

        const char* shorten = google_shorten_link(url_final);
        if (author_string != NULL)
            printf("Title: %s Source: %s Author: %s Date: %s Url: %s\n", title_string, source_string, author_string,
                   date_string, shorten);
        else printf("Title: %s Source: %s Date: %s Url: %s\n", title_string, source_string, date_string, shorten);
        free(url_final);
        free((void*) shorten);
    }
    json_object_put(jobj);
}

const char* google_shorten_link(char* url_string) {
    char* google_api_string = calloc(256, sizeof(char));
    memcpy(google_api_string,
           "https://www.googleapis.com/urlshortener/v1/url?key=AIzaSyAoMAvMPpc7U8lfrnGMk2ZKl966tU2pppU",
           256);
    char* post_string = calloc(1024, 1);
    sprintf(post_string, "{\"longUrl\": \"%s\"}", url_string);
    String* pString = api_curl_data(google_api_string, post_string);
    free(post_string);
    free(google_api_string);
    Json* jobj = json_tokener_parse(pString->data);
    Json* short_url = json_object_object_get(jobj, "id");
    const char* short_url_string = json_object_to_json_string(short_url);
    char* copy = calloc(1024, 1);
    strcpy(copy, short_url_string);
    char* final = calloc(strlen(copy) + 1, 1);
    for (int i = 0, j = 0; j < strlen(copy); i++, j++) {
        if (copy[j] == '\\' || copy[j] == '\"')
            j++;
        final[i] = copy[j];
    }
    json_object_put(jobj);
    free(copy);
    api_string_destroy(&pString);
    return final;
}

void api_string_destroy(String** phString) {
    String* pString = *phString;
    free(pString->data);
    free(*phString);
    *phString = NULL;
}