#include "info.h"

int zoom_months[] = {60, 48, 36, 24, 12, 9, 6, 3, 1}, zoom_change_x_months[] = {12, 12, 12, 12, 12, 3, 3, 3, 2};

void symbol_print_info(const char* symbol) {
    Info* symbol_info;
    if (strlen(symbol) > 5) { // If symbol length is greater than 5, then it must be a crypto
        symbol_info = coinmarketcap_get_info(symbol);
        if (symbol_info == NULL)
            RET_MSG("Invalid symbol!")
    }
    else {
        symbol_info = iex_get_info(symbol);
        if (symbol_info == NULL)
            symbol_info = morningstar_get_info(symbol);
        if (symbol_info == NULL)
            RET_MSG("Invalid symbol!")
    }
    initscr();
    int rows, cols;
    getmaxyx(stdscr, rows, cols);
    start_color();
    init_pair(2, COLOR_WHITE, COLOR_BLACK); // Init black background, white foreground
    bkgd(BLACK); // set background/foreground

    char time_str[32];
    time_t time = symbol_info->intraday_time / 1000; // divide into second instead of milliseconds
    struct tm* ts = localtime(&time);
    strftime(time_str, 32, "%F %T", ts);

    mvprintw(0, 13, "%s", time_str);
    mvprintw(0, (int)(28 + strlen(symbol_info->name) + strlen(symbol_info->symbol)), "24H      7D     30D");
    mvprintw(1, 13, "%s %s %8.2lf %6.2lf%% %6.2lf%% %6.2lf%%", symbol_info->name, symbol_info->symbol,
             symbol_info->price, symbol_info->change_1d, symbol_info->change_7d, symbol_info->change_30d);

    WINDOW* company_win = newwin(COMPANY_HEIGHT, COMPANY_WIDTH, COMPANY_Y, COMPANY_X);

    if (symbol_info->description[0] != '\0')
        mvwprintw(company_win, 0, 0, "%s\n\n", symbol_info->description);
    else mvwprintw(company_win, 0, 0, "Description unavailable.\n\n");

    if (symbol_info->ceo[0] != '\0')
        wprintw(company_win, "CEO: %s", symbol_info->ceo);
    else wprintw(company_win, "CEO unavailable.");

    int x, y;
    getyx(company_win, y, x);

    if (symbol_info->website[0] != '\0')
        mvwprintw(company_win, y, getmaxx(company_win) / 2, "Website: %s\n", symbol_info->website);
    else mvwprintw(company_win, y, getmaxx(company_win) / 2, "Website unavailable.\n");

    if (symbol_info->sector[0] != '\0')
        wprintw(company_win, "Sector: %s", symbol_info->sector);
    else wprintw(company_win, "Sector unavailable.");

    getyx(company_win, y, x);

    if (symbol_info->industry[0] != '\0')
        mvwprintw(company_win, y, getmaxx(company_win) / 2, "Industry: %s\n", symbol_info->industry);
    else mvwprintw(company_win, y, getmaxx(company_win) / 2, "Industry unavailable.\n");

    if (symbol_info->revenue != EMPTY)
        wprintw(company_win, "Revenue: %ld", symbol_info->revenue);
    else wprintw(company_win, "Revenue unavailable.");

    getyx(company_win, y, x);

    if (symbol_info->gross_profit != EMPTY)
        mvwprintw(company_win, y, getmaxx(company_win) / 2, "Gross Profit: %ld\n", symbol_info->gross_profit);
    else mvwprintw(company_win, y, getmaxx(company_win) / 2, "Gross Profit unavailable.\n");

    if (symbol_info->cash != EMPTY)
        wprintw(company_win, "Cash: %ld", symbol_info->cash);
    else wprintw(company_win, "Cash unavailable.");

    getyx(company_win, y, x);

    if (symbol_info->debt != EMPTY)
        mvwprintw(company_win, y, getmaxx(company_win) / 2, "Debt: %ld\n", symbol_info->debt);
    else mvwprintw(company_win, y, getmaxx(company_win) / 2, "Debt unavailable.\n");

    if (symbol_info->marketcap != EMPTY)
        wprintw(company_win, "Market Cap: %ld", symbol_info->marketcap);
    else wprintw(company_win, "Market Cap unavailable.");

    getyx(company_win, y, x);

    if (symbol_info->volume_1d != EMPTY)
        mvwprintw(company_win, y, getmaxx(company_win) / 2, "Volume: %ld\n", symbol_info->volume_1d);
    else mvwprintw(company_win, y, getmaxx(company_win) / 2, "Volume unavailable.\n");

    if (symbol_info->pe_ratio != EMPTY)
        wprintw(company_win, "P/E Ratio: %ld", symbol_info->pe_ratio);
    else wprintw(company_win, "P/E Ratio unavailable.");

    getyx(company_win, y, x);

    if (symbol_info->div_yield != EMPTY)
        mvwprintw(company_win, y, getmaxx(company_win) / 2, "Dividend Yield: %lf\n\n", symbol_info->div_yield);
    else mvwprintw(company_win, y, getmaxx(company_win) / 2, "Dividend Yield unavailable.\n\n");

    y += 2;
    for (int i = 0; i < QUARTERS; i++)
        mvwprintw(company_win, y, 4 + i * getmaxx(company_win) / QUARTERS, "%s", symbol_info->fiscal_period[i]);

    y++;
    mvwprintw(company_win, y, 0, "EPS ");
    for (int i = 0; i < QUARTERS; i++)
        mvwprintw(company_win, y, 4 + i * getmaxx(company_win) / QUARTERS, "%.2lf", symbol_info->eps[i]);

    y++;
    mvwprintw(company_win, y, 0, "1Y%%  ");
    for (int i = 0; i < QUARTERS; i++)
        mvwprintw(company_win, y, 4 + i * getmaxx(company_win) / QUARTERS, "%.2lf%%", symbol_info->eps_year_ago[i]);

    refresh();
    wrefresh(company_win);

    WINDOW* graph_win = newwin(GRAPH_HEIGHT, GRAPH_WIDTH, GRAPH_Y, GRAPH_X);
    graph_main(symbol, NULL, graph_win);
    endwin();
    api_info_destroy(&symbol_info);
}

void symbol_print_news(const char* symbol, int num_articles) {
    if (num_articles > 50)
        RET_MSG("You cannot request more than 50 articles.");

    char iex_api_string[URL_MAX_LENGTH];
    sprintf(iex_api_string, "https://api.iextrading.com/1.0/stock/%s/news/last/%d", symbol, num_articles);
    String* pString = api_curl_data(iex_api_string);
    if (pString == NULL)
        return;

    if (strcmp(pString->data, "Unknown symbol") == 0) { // Invalid symbol
        string_destroy(&pString);
        RET_MSG("Invalid symbol.");
    }

    Json* jobj = json_tokener_parse(pString->data);
    size_t len = json_object_array_length(jobj);
    if (len == 0) {
        json_object_put(jobj);
        string_destroy(&pString);
        RET_MSG("No articles available.");
    }

    Json* idx;
    const char* headline, * source, *url;
    char date[DATE_MAX_LENGTH];
    for (size_t i = 0; i < len; i++) {
        idx = json_object_array_get_idx(jobj, i);
        headline = json_object_get_string(json_object_object_get(idx, "headline")); // Headline
        source = json_object_get_string(json_object_object_get(idx, "source")); // Source
        strncpy(date, json_object_get_string(json_object_object_get(idx, "datetime")), 10); // Date
        date[10] = '\0'; // null terminate date before time
        char summary[strlen(json_object_get_string(json_object_object_get(idx, "summary")))]; // Summary
        strcpy(summary, json_object_get_string(json_object_object_get(idx, "summary")));
        strip_tags(summary); // Summary will be html formatted, so must strip tags
        url = json_object_get_string(json_object_object_get(idx, "url")); // URL
        char related[strlen(json_object_get_string(json_object_object_get(idx, "related")))]; // Related
        strcpy(related, json_object_get_string(json_object_object_get(idx, "related")));
        int related_num = 0;
        for (size_t j = 0; j < strlen(related); j++) { // List only first five related symbols
            if (related[j] == ',')
                related_num++;
            if (related_num == 5) {
                related[j] = '\0';
                break;
            }
        }
        printf("%s | %s | %s\n%s\n%s | Related: %s\n\n", headline, source, date, summary, url, related);
    }
    json_object_put(jobj);
    string_destroy(&pString);
}

void graph_main(const char* symbol, const char* symbol2, WINDOW* window) {
    if (window == NULL)
        window = initscr();

    if (!has_colors()) { // compare command will use two colors to differentiate, so color must
        endwin();        // be supported. Must endwin() before puts()
        RET_MSG("Your terminal does not support color.");
    }

    wprintw(window, "Loading data...");
    double* price_data = api_get_hist_5y(symbol), * price_data2 = NULL;
    if (price_data == NULL) { // If invalid symbol or cryptocurrency
        endwin();
        RET_MSG("Invalid symbol.");
    }

    if (symbol2 != NULL) {
        price_data2 = api_get_hist_5y(symbol2);
        if (price_data2 == NULL) { // If invalid symbol or cryptocurrency
            free(price_data);
            endwin();
            RET_MSG("Invalid symbol.");
        }
    }

    noecho(); // Don't echo keystrokes
    keypad(window, TRUE); // Enables extra keystrokes
    curs_set(0); // Hides cursor
    start_color(); // Enable colors for comparison
    init_pair(1, COLOR_RED, COLOR_BLACK); // Init color red
    init_pair(2, COLOR_WHITE, COLOR_BLACK); // Init black background, white foreground
    wbkgd(window, BLACK); // set background/foreground
    wrefresh(window); // flush

    time_t now = time(NULL);
    struct tm today_date = *localtime(&now), start_date = today_date, furthest_back_date = today_date, end;
    start_date.tm_year -= 5, furthest_back_date.tm_year -= 5; // Go back five years
    double seconds = difftime(mktime(&today_date), mktime(&furthest_back_date));

    // Calculate total number of trading days between today and five years ago
    int trading_days = (int) ((1.0 / DAYS_TO_BUSINESS_DAYS_RATIO) * seconds / 86400.0);

    int total_data_points = 0, total_data_points2 = 0;
    for (int i = 0; price_data[i] != '\0'; i++) // Calculate total number of data points in the security. This may not
        total_data_points++;                    // be equal to trading days if the security is younger than 5 years old

    if (trading_days - total_data_points > 0) // If younger than 5, realloc with num of trading days and fill with EMPTY
        price_data = graph_fill_empty(price_data, total_data_points, trading_days);

    if (symbol2 != NULL) {
        for (int i = 0; price_data2[i] != '\0'; i++)
            total_data_points2++;
        if (trading_days - total_data_points2 > 0)
            price_data2 = graph_fill_empty(price_data2, total_data_points2, trading_days);
    }

    int ch, zoom = ZOOM_5y;
    graph_print(price_data, price_data2, &start_date, zoom, symbol, symbol2, window); // Initial graph of 5 year history

    while ((ch = wgetch(window)) != 'q') { // Main input loop -- end if keypress 'q'
        if ((ch == KEY_UP && zoom != ZOOM_1m) || (ch == KEY_DOWN && zoom != ZOOM_5y) ||
            (zoom != ZOOM_5y && (ch == KEY_LEFT || ch == KEY_RIGHT))) { // UP / DOWN / LEFT / RIGHT
            if (ch == KEY_UP) {
                zoom++;
                start_date.tm_mon += zoom_change_x_months[zoom];
            } else if (ch == KEY_RIGHT || ch == KEY_DOWN) {
                if (ch == KEY_DOWN)
                    zoom--;
                if (zoom == ZOOM_1m)
                    start_date.tm_mon += 1; // Moves only one month if zoom is 1 month
                else start_date.tm_mon += zoom_change_x_months[zoom];

                end = start_date; // If trying to go past current date, set start to (zoom level - current date)
                end.tm_mon += zoom_months[zoom];
                if (difftime(mktime(&end), mktime(&today_date)) > 0) {
                    start_date = today_date;
                    start_date.tm_mon -= zoom_months[zoom];
                }
            } else { // LEFT
                if (zoom == ZOOM_1m)
                    start_date.tm_mon -= 1; // Moves only one month if zoom is 1 month
                else start_date.tm_mon -= zoom_change_x_months[zoom];
                if (difftime(mktime(&start_date), mktime(&furthest_back_date)) < 0)
                    start_date = furthest_back_date; // Can't go back past furthest_date
            }
            graph_print(price_data, price_data2, &start_date, zoom, symbol, symbol2, window);
        }
    }
    if (window == stdscr)
        endwin();
    free(price_data);
    if (price_data2 != NULL)
        free(price_data2);
}

void graph_print(const double* points, const double* points2, struct tm* start_time, int zoom,
                 const char* symbol, const char* symbol2, WINDOW* window) {
    wmove(window, 0, 0); // Instead of clear()ing, move to the top left corner and re-print
    int cols, rows;
    getmaxyx(window, rows, cols);
    cols -= 11; // 10 offset to give space for graph labels + 1 for right side
    rows -= 3; // Make space for zoom indicator
    rows -= rows % ROWS_SPACING; // Round down to multiple of 5
    if (cols < 40 || rows < 15) // Exits if the terminal is too small
        RET_MSG("Terminal not large enough.")

    time_t now = time(NULL);
    struct tm end_date = *start_time, * five_y = localtime(&now);
    end_date.tm_mon += zoom_months[zoom], five_y->tm_year -= 5;

    double seconds = difftime(mktime(&end_date), mktime(start_time));
    int trading_days = (int) ((1.0 / DAYS_TO_BUSINESS_DAYS_RATIO) * seconds / 86400.0); // Total trading days to print

    seconds = difftime(mktime(start_time), mktime(five_y));
    int starting_index = (int) ((1.0 / DAYS_TO_BUSINESS_DAYS_RATIO) * seconds / 86400.0);

    double max = points[starting_index], min = points[starting_index];
    int k = 0;
    while (max == EMPTY) // If initial max is EMPTY, get first non-EMPTY value
        max = points[++k];
    if (k > 0) // Do the same thing with min
        min = max;
    for (int i = starting_index + 1; i < trading_days + starting_index; i++) {
        if (points[i] != EMPTY) { // Ignore EMPTY values
            if (points[i] > max) // Find max and min values for graph upper/lower bounds
                max = points[i];
            if (points[i] < min)
                min = points[i];
        }
    }
    double line_diff = (max - min) / rows, day_close; // Each line includes data point up to line_diff below

    double max2 = 0, min2 = 0, line_diff2 = 0, day_close2 = 0;
    if (points2 != NULL) {
        max2 = points2[starting_index], min2 = points2[starting_index];
        k = 0;
        while (max2 == EMPTY) // If initial max is EMPTY, get first non-EMPTY value
            max2 = points2[++k];
        if (k > 0) // Do the same thing with min
            min2 = max2;
        for (int i = starting_index + 1; i < trading_days + starting_index; i++) {
            if (points2[i] != EMPTY) { // Ignore EMPTY values
                if (points2[i] > max2) // Find max and min values for graph upper/lower bounds
                    max2 = points2[i];
                if (points2[i] < min2)
                    min2 = points2[i];
            }
        }
        line_diff2 = (max2 - min2) / rows; // Each line includes data point up to line_diff below
    }

    for (int i = rows; i >= 0; i--) {
        if (i % ROWS_SPACING == 0) // Print y-axis price labels with width 10
            wprintw(window, "%9.2lf ", (max - ((rows - i) * line_diff)));
        else if (points2 != NULL && (i - 1) % ROWS_SPACING == 0) { // Print comparison price label above
            wattron(window, RED);
            wprintw(window, "%9.2lf ", (max2 - ((rows - i) * line_diff2)));
            wattroff(window, RED);
        } else wprintw(window, "          "); // Indent width 10 otherwise

        for (int j = 0; j < cols; j++) {
            day_close = points[starting_index + (int) ((double) j * trading_days / cols)]; // Get close prices
            if (points2 != NULL)
                day_close2 = points2[starting_index + (int) ((double) j * trading_days / cols)];

            if (day_close <= (max - ((rows - i) * line_diff)) && day_close > (min + ((i - 1) * line_diff)))
                waddch(window, ACS_DIAMOND); // Print diamond if close price is within line_diff
            else if (points2 != NULL && day_close2 <= (max2 - ((rows - i) * line_diff2)) &&
                     day_close2 > (min2 + ((i - 1) * line_diff2))) {
                wattron(window, RED);
                waddch(window, ACS_DIAMOND); // Print RED diamond if close price is within line_diff
                wattroff(window, RED);
            } else if (i % ROWS_SPACING == 0 && j % COLS_SPACING == 0) // Cross on corners
                waddch(window, ACS_PLUS);
            else if (i % ROWS_SPACING == 0) // Horizontal line every ROWS_SPACING lines
                waddch(window, ACS_HLINE);
            else if (j % COLS_SPACING == 0) // Vertical line every COLS_SPACING lines
                waddch(window, ACS_VLINE);
            else // Otherwise prints a space
                waddch(window, ' ');
        }
        waddch(window, '\n'); // Newline on line end
    }

    wprintw(window, "     "); // Indent to center date labels
    char time_string[16];
    double days_per_col_spacing = (DAYS_TO_BUSINESS_DAYS_RATIO * trading_days) / (cols / COLS_SPACING);
    struct tm copy = *start_time;
    for (int i = 0; i < cols; i++) {
        if (i % (2 * COLS_SPACING) == 0 && cols - i > 5) { // Print x-axis date labels every two
            if (i != 0)
                copy.tm_sec += days_per_col_spacing * 2.0 * 86400.0;
            mktime(&copy);
            strftime(time_string, 16, "%m/%d/%Y", &copy);
            wprintw(window, "%s              ", time_string); // Width 2 * COLS_SPACING
        }
    }

    waddch(window, '\n');
    waddch(window, '\n');
    wprintw(window, "%s", symbol); // Empty line as spacing, then print key containing the symbol(s) and diamond
    // with color
    waddch(window, ACS_DIAMOND);
    if (points2 != NULL) {
        wattron(window, RED);
        wprintw(window, " %s", symbol2);
        waddch(window, ACS_DIAMOND);
        wattroff(window, RED);
    }
    waddch(window, ' ');
    size_t offset = (cols / 2) - (11 + strlen(symbol)); // Center zoom level
    if (points2 != NULL)
        offset -= strlen(symbol2) + 2;
    for (unsigned int i = 0; i < offset; i++)
        waddch(window, ' '); // Center text
    const char* str[9] = {"5y", "4y", "3y", "2y", "1y", "9m", "6m", "3m", "1m"}; // Zoom level
    for (int i = 0; i < 9; i++) {
        if (zoom == i)
            wattron(window, A_STANDOUT); // Highlight current zoom level
        waddstr(window, str[i]);
        wattroff(window, A_STANDOUT);
        waddch(window, ' ');
    }
}

double* graph_fill_empty(double* points, int size, int trading_days) {
    int difference = trading_days - size;
    points = realloc(points, (size_t) sizeof(double) * (trading_days + 1)); // Realloc for number of trading days
    pointer_alloc_check(points);
    points[trading_days] = '\0';
    memmove(&points[difference], points, sizeof(double) * size); // Move points to end
    for (int i = 0; i < difference; i++) // Initialize newly allocated bytes as EMPTY
        points[i] = EMPTY;
    return points;
}