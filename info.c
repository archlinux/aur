#include "info.h"

int zoom_months[] = {60, 48, 36, 24, 12, 9, 6, 3, 1}, zoom_change_x_months[] = {12, 12, 12, 12, 12, 3, 3, 3, 2};

void interface_print(const char* symbol) {
    Info* symbol_info = api_get_info(symbol);
    if (symbol_info == NULL)
        RET_MSG("Invalid symbol.")

    if (symbol_info->points == NULL) { // If a crypto print info to stdout and return
        info_print(symbol_info);
        api_info_destroy(&symbol_info);
        return;
    }

    initscr();
    if (!has_colors())
        GOTO_CLEAN_MSG("Your terminal does not support color.")

    int rows, cols;
    getmaxyx(stdscr, rows, cols);
    start_color();
    init_pair(2, COLOR_WHITE, COLOR_BLACK); // Init black background, white foreground
    bkgd(BLACK); // set background/foreground
    curs_set(FALSE);
    WINDOW* header_window = newwin(2, cols / 2, 0, 13);
    WINDOW* graph_window = newwin(GRAPH_HEIGHT, GRAPH_WIDTH, GRAPH_Y, GRAPH_X);
    WINDOW* company_window = newwin(COMPANY_HEIGHT, COMPANY_WIDTH, COMPANY_Y, COMPANY_X);
    WINDOW* news_window = newwin(NEWS_HEIGHT, NEWS_WIDTH, NEWS_Y, NEWS_X);
    wbkgd(header_window, BLACK);
    wbkgd(graph_window, BLACK);
    wbkgd(company_window, BLACK);
    wbkgd(news_window, BLACK);

    int graph_rows, graph_cols;
    getmaxyx(graph_window, graph_rows, graph_cols);
    graph_cols -= 11; // 10 offset to give space for graph labels + 1 for right side
    graph_rows -= 3; // Make space for zoom indicator
    graph_rows -= graph_rows % ROWS_SPACING; // Round down to multiple of 5
    if (graph_cols < GRAPH_COLS_MIN || graph_rows < GRAPH_ROWS_MIN) // Exits if the terminal is too small
        GOTO_CLEAN_MSG("Terminal not large enough.")

    header_printw(header_window, symbol_info); // Print to windows
    info_printw(company_window, symbol_info);
    news_printw(news_window, symbol_info);

    wrefresh(header_window); // Refresh other windows before graph otherwise they won't print before next getch()
    wrefresh(company_window);
    wrefresh(news_window);

    graph_printw(graph_window, symbol_info, NULL); // No refresh needed since getch()

    cleanup:
    endwin();
    api_info_destroy(&symbol_info);
}

void header_printw(WINDOW* window, Info* symbol_info) {
    if (symbol_info->intraday_time != EMPTY) {
        char time_str[32];
        time_t time = symbol_info->intraday_time / 1000; // divide into second instead of milliseconds
        struct tm* ts = localtime(&time);
        strftime(time_str, 32, "%F %T", ts);
        mvwprintw(window, 0, 0, "%s", time_str);
    }
    mvwprintw(window, 0, (int) (15 + strlen(symbol_info->name) + strlen(symbol_info->symbol)), "24H      7D     ");
    if (symbol_info->change_30d != EMPTY)
        wprintw(window, "30D");
    mvwprintw(window, 1, 0, "%s %s %8.2lf %6.2lf%% %6.2lf%% ", symbol_info->name, symbol_info->symbol,
             symbol_info->price, symbol_info->change_1d, symbol_info->change_7d);
    if (symbol_info->change_30d != EMPTY)
        wprintw(window, "%6.2lf%%", symbol_info->change_30d);
}

void info_print(Info* symbol_info) {
    if (strcmp(symbol_info->name, "") != 0)
        printf("Name: %s\n", symbol_info->name);
    if (strcmp(symbol_info->symbol, "") != 0)
        printf("Symbol: %s\n", symbol_info->symbol);
    if (symbol_info->price != EMPTY)
        printf("Price: $%.2lf\n", symbol_info->price);
    if (symbol_info->change_1d != EMPTY)
        printf("Percent change 24h: %.2lf%%\n", symbol_info->change_1d);
    if (symbol_info->change_7d != EMPTY)
        printf("Percent change 7d: %.2lf%%\n", symbol_info->change_7d);
    if (symbol_info->change_30d != EMPTY)
        printf("Percent change 30d: %.2lf%%\n", symbol_info->change_30d);
    if (symbol_info->div_yield != EMPTY)
        printf("Dividend yield: %.2lf%%\n", symbol_info->div_yield);
    if (symbol_info->marketcap != EMPTY)
        printf("Market Cap: $%ld\n", symbol_info->marketcap);
    if (symbol_info->volume_1d != EMPTY)
        printf("Volume 24h: $%ld\n", symbol_info->volume_1d);
}

void info_printw(WINDOW* window, Info* symbol_info) {
    if (symbol_info->description[0] != '\0')
        mvwprintw(window, 0, 0, "%s\n\n", symbol_info->description);
    else mvwprintw(window, 0, 0, "Description unavailable.\n\n");

    if (symbol_info->ceo[0] != '\0')
        wprintw(window, "CEO: %s", symbol_info->ceo);
    else wprintw(window, "CEO unavailable.");

    if (symbol_info->website[0] != '\0')
        mvwprintw(window, getcury(window), getmaxx(window) / 2, "Website: %s\n", symbol_info->website);
    else mvwprintw(window, getcury(window), getmaxx(window) / 2, "Website unavailable.\n");

    if (symbol_info->sector[0] != '\0')
        wprintw(window, "Sector: %s", symbol_info->sector);
    else wprintw(window, "Sector unavailable.");

    if (symbol_info->industry[0] != '\0')
        mvwprintw(window, getcury(window), getmaxx(window) / 2, "Industry: %s\n", symbol_info->industry);
    else mvwprintw(window, getcury(window), getmaxx(window) / 2, "Industry unavailable.\n");

    if (symbol_info->revenue != EMPTY)
        wprintw(window, "Revenue: %ld", symbol_info->revenue);
    else wprintw(window, "Revenue unavailable.");

    if (symbol_info->gross_profit != EMPTY)
        mvwprintw(window, getcury(window), getmaxx(window) / 2, "Gross Profit: %ld\n", symbol_info->gross_profit);
    else mvwprintw(window, getcury(window), getmaxx(window) / 2, "Gross Profit unavailable.\n");

    if (symbol_info->cash != EMPTY)
        wprintw(window, "Cash: %ld", symbol_info->cash);
    else wprintw(window, "Cash unavailable.");

    if (symbol_info->debt != EMPTY)
        mvwprintw(window, getcury(window), getmaxx(window) / 2, "Debt: %ld\n", symbol_info->debt);
    else mvwprintw(window, getcury(window), getmaxx(window) / 2, "Debt unavailable.\n");

    if (symbol_info->marketcap != EMPTY)
        wprintw(window, "Market Cap: %ld", symbol_info->marketcap);
    else wprintw(window, "Market Cap unavailable.");

    if (symbol_info->volume_1d != EMPTY)
        mvwprintw(window, getcury(window), getmaxx(window) / 2, "Volume: %ld\n", symbol_info->volume_1d);
    else mvwprintw(window, getcury(window), getmaxx(window) / 2, "Volume unavailable.\n");

    if (symbol_info->pe_ratio != EMPTY)
        wprintw(window, "P/E Ratio: %lf", symbol_info->pe_ratio);
    else wprintw(window, "P/E Ratio unavailable.");

    if (symbol_info->div_yield != EMPTY)
        mvwprintw(window, getcury(window), getmaxx(window) / 2, "Dividend Yield: %lf\n\n", symbol_info->div_yield);
    else mvwprintw(window, getcury(window), getmaxx(window) / 2, "Dividend Yield unavailable.\n\n");

    for (int i = 0; i < QUARTERS && symbol_info->fiscal_period[i][0] != '\0'; i++)
        mvwprintw(window, getcury(window), 4 + i * getmaxx(window) / QUARTERS, "%s",
                  symbol_info->fiscal_period[i]);
    waddch(window, '\n');

    if (symbol_info->eps[0] != EMPTY)
        mvwprintw(window, getcury(window), 0, "EPS ");
    for (int i = 0; i < QUARTERS && symbol_info->eps[i] != EMPTY; i++)
        mvwprintw(window, getcury(window), 4 + i * getmaxx(window) / QUARTERS, "%.2lf",
                  symbol_info->eps[i]);
    waddch(window, '\n');

    if (symbol_info->eps_year_ago[0] != EMPTY)
        mvwprintw(window, getcury(window), 0, "1Y  ");
    for (int i = 0; i < QUARTERS && symbol_info->eps_year_ago[i] != EMPTY; i++)
        mvwprintw(window, getcury(window), 4 + i * getmaxx(window) / QUARTERS, "%.2lf", symbol_info->eps_year_ago[i]);
}

void news_print(const char* symbol, int num_articles) {
    if (num_articles > 50 || num_articles < 1)
        RET_MSG("You cannot request more than 50 articles.");

    Info* symbol_info = api_info_init();
    strcpy(symbol_info->symbol, symbol);
    symbol_info->num_articles = num_articles;
    iex_store_news(symbol_info);
    if (symbol_info->articles == NULL) {
        api_info_destroy(&symbol_info);
        RET_MSG("Invalid symbol");
    }
    for (int i = 0; i < symbol_info->num_articles; i++)
        printf("%s | %s | %s\n%s\n%s | Related: %s\n\n",
               symbol_info->articles[i]->headline, symbol_info->articles[i]->source, symbol_info->articles[i]->date,
               symbol_info->articles[i]->summary, symbol_info->articles[i]->url, symbol_info->articles[i]->related);
    api_info_destroy(&symbol_info);
}

void news_printw(WINDOW* window, Info* symbol_info) {
    if (symbol_info->num_articles == EMPTY)
        wprintw(window, "News unavailable.");
    for (int i = 0; i < symbol_info->num_articles;  i++)
        wprintw(window, "%s | %s | %s\n%s\n%s | Related: %s\n\n",
               symbol_info->articles[i]->headline, symbol_info->articles[i]->source, symbol_info->articles[i]->date,
               symbol_info->articles[i]->summary, symbol_info->articles[i]->url, symbol_info->articles[i]->related);
}

void graph_print(const char* symbol, const char* symbol2) {
    Info* symbol_info = api_get_check_info(symbol), *symbol_info2 = NULL;
    if (symbol_info == NULL)
        RET_MSG("Invalid symbol")

    if (symbol2 != NULL) {
        symbol_info2 = api_get_check_info(symbol2);
        if (symbol_info2 ==  NULL) {
            api_info_destroy(&symbol_info);
            RET_MSG("Invalid symbol")
        }
    }
    initscr();
    if (!has_colors()) { // compare command will use two colors to differentiate, so color must
        endwin();        // be supported. Must endwin() before puts()
        RET_MSG("Your terminal does not support color.");
    }

    graph_printw(stdscr, symbol_info, symbol_info2);
    api_info_destroy(&symbol_info);
    if (symbol_info2 != NULL)
        api_info_destroy(&symbol_info2);
    endwin();
}

void graph_printw(WINDOW* window, Info* symbol_info, Info* symbol_info2) {
    noecho(); // Don't echo keystrokes
    keypad(window, TRUE); // Enables extra keystrokes
    curs_set(0); // Hides cursor
    start_color(); // Enable colors for comparison
    init_pair(1, COLOR_RED, COLOR_BLACK); // Init color red
    init_pair(2, COLOR_WHITE, COLOR_BLACK); // Init black background, white foreground
    wbkgd(window, BLACK); // set background/foreground

    time_t now = time(NULL);
    struct tm today_date = *localtime(&now), start_date = today_date, furthest_back_date = today_date, end;
    start_date.tm_year -= 5, furthest_back_date.tm_year -= 5; // Go back five years
    double seconds = difftime(mktime(&today_date), mktime(&furthest_back_date));

    // Calculate total number of trading days between today and five years ago
    int trading_days = (int) ((1.0 / DAYS_TO_BUSINESS_DAYS_RATIO) * seconds / 86400.0);

    int total_data_points = 0, total_data_points2 = 0;
    for (int i = 0; symbol_info->points[i] != '\0'; i++) // Calculate total number of data points in the security. This may not
        total_data_points++;                    // be equal to trading days if the security is younger than 5 years old

    if (trading_days - total_data_points > 0) // If younger than 5, realloc with num of trading days and fill with EMPTY
        symbol_info->points = graph_fill_empty(symbol_info->points, total_data_points, trading_days);

    if (symbol_info2 != NULL) {
        for (int i = 0; symbol_info2->points[i] != '\0'; i++)
            total_data_points2++;
        if (trading_days - total_data_points2 > 0)
            symbol_info2->points = graph_fill_empty(symbol_info2->points, total_data_points2, trading_days);
    }

    int ch, zoom = ZOOM_5y;
    graph_draw(window, symbol_info, symbol_info2, &start_date, zoom); // Initial graph of 5 year history

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
            graph_draw(window, symbol_info, symbol_info2, &start_date, zoom);
        }
    }
}

void graph_draw(WINDOW* window, Info* symbol_info, Info* symbol_info2, struct tm* start_time, int zoom) {
    wmove(window, 0, 0); // Instead of clear()ing, move to the top left corner and re-print
    int cols, rows;
    getmaxyx(window, rows, cols);
    cols -= 11; // 10 offset to give space for graph labels + 1 for right side
    rows -= 3; // Make space for zoom indicator
    rows -= rows % ROWS_SPACING; // Round down to multiple of 5
    if (cols < GRAPH_COLS_MIN || rows < GRAPH_ROWS_MIN) // Exits if the terminal is too small
        RET_MSG("Terminal not large enough.")

    time_t now = time(NULL);
    struct tm end_date = *start_time, * five_y = localtime(&now);
    end_date.tm_mon += zoom_months[zoom], five_y->tm_year -= 5;

    double seconds = difftime(mktime(&end_date), mktime(start_time));
    int trading_days = (int) ((1.0 / DAYS_TO_BUSINESS_DAYS_RATIO) * seconds / 86400.0); // Total trading days to print

    seconds = difftime(mktime(start_time), mktime(five_y));
    int starting_index = (int) ((1.0 / DAYS_TO_BUSINESS_DAYS_RATIO) * seconds / 86400.0);

    double max = symbol_info->points[starting_index], min = symbol_info->points[starting_index];
    int k = 0;
    while (max == EMPTY) // If initial max is EMPTY, get first non-EMPTY value
        max = symbol_info->points[++k];
    if (k > 0) // Do the same thing with min
        min = max;
    for (int i = starting_index + 1; i < trading_days + starting_index; i++) {
        if (symbol_info->points[i] != EMPTY) { // Ignore EMPTY values
            if (symbol_info->points[i] > max) // Find max and min values for graph upper/lower bounds
                max = symbol_info->points[i];
            if (symbol_info->points[i] < min)
                min = symbol_info->points[i];
        }
    }
    double line_diff = (max - min) / rows, day_close; // Each line includes data point up to line_diff below

    double max2 = 0, min2 = 0, line_diff2 = 0, day_close2 = 0;
    if (symbol_info2 != NULL) {
        max2 = symbol_info2->points[starting_index], min2 = symbol_info2->points[starting_index];
        k = 0;
        while (max2 == EMPTY) // If initial max is EMPTY, get first non-EMPTY value
            max2 = symbol_info2->points[++k];
        if (k > 0) // Do the same thing with min
            min2 = max2;
        for (int i = starting_index + 1; i < trading_days + starting_index; i++) {
            if (symbol_info2->points[i] != EMPTY) { // Ignore EMPTY values
                if (symbol_info2->points[i] > max2) // Find max and min values for graph upper/lower bounds
                    max2 = symbol_info2->points[i];
                if (symbol_info2->points[i] < min2)
                    min2 = symbol_info2->points[i];
            }
        }
        line_diff2 = (max2 - min2) / rows; // Each line includes data point up to line_diff below
    }

    for (int i = rows; i >= 0; i--) {
        if (i % ROWS_SPACING == 0) // Print y-axis price labels with width 10
            wprintw(window, "%9.2lf ", (max - ((rows - i) * line_diff)));
        else if (symbol_info2 != NULL && (i - 1) % ROWS_SPACING == 0) { // Print comparison price label above
            wattron(window, RED);
            wprintw(window, "%9.2lf ", (max2 - ((rows - i) * line_diff2)));
            wattroff(window, RED);
        } else wprintw(window, "          "); // Indent width 10 otherwise

        for (int j = 0; j < cols; j++) {
            day_close = symbol_info->points[starting_index + (int) ((double) j * trading_days / cols)]; // Get close prices
            if (symbol_info2 != NULL)
                day_close2 = symbol_info2->points[starting_index + (int) ((double) j * trading_days / cols)];

            if (day_close <= (max - ((rows - i) * line_diff)) && day_close > (min + ((i - 1) * line_diff)))
                waddch(window, ACS_DIAMOND); // Print diamond if close price is within line_diff
            else if (symbol_info2 != NULL && day_close2 <= (max2 - ((rows - i) * line_diff2)) &&
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
    wprintw(window, "%s", symbol_info->symbol); // Empty line as spacing, then print key containing the symbol(s) and diamond
    // with color
    waddch(window, ACS_DIAMOND);
    if (symbol_info2 != NULL) {
        wattron(window, RED);
        wprintw(window, " %s", symbol_info2->symbol);
        waddch(window, ACS_DIAMOND);
        wattroff(window, RED);
    }
    waddch(window, ' ');
    size_t offset = (cols / 2) - (11 + strlen(symbol_info->symbol)); // Center zoom level
    if (symbol_info2 != NULL)
        offset -= strlen(symbol_info2->symbol) + 2;
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