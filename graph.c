#include "graph.h"

void graph_main(const char* ticker_name_string) {
    initscr();
    noecho();
    keypad(stdscr, TRUE);
    curs_set(0);
    double* data = api_get_hist_5y(ticker_name_string);
    if (data == NULL) {
        puts("Invalid symbol.");
        return;
    }
    time_t now = time(NULL);
    struct tm ts = *localtime(&now);
    ts.tm_year -= 5;

    int ch, zoom = ZOOM_5y;
    graph_print(data, &ts, zoom);

    while (1) {
        ch = getch();
        if (ch == 'q')
            break;
        if ((ch == KEY_UP && zoom != ZOOM_1m) || (ch == KEY_DOWN && zoom != ZOOM_5y)) {
            if (ch == KEY_UP) {
                zoom++;
                if (zoom <= ZOOM_1y)
                    ts.tm_year += 1;
                else if (zoom <= ZOOM_3m)
                    ts.tm_mon += 3;
                else ts.tm_mon += 2;
            } else if (ch == KEY_DOWN) {
                zoom--;
                if (zoom < ZOOM_1y)
                    ts.tm_year -= 1;
                else if (zoom < ZOOM_3m)
                    ts.tm_mon -= 3;
                else ts.tm_mon -= 2;
            }
            clear();
            mktime(&ts); // Normalize
            graph_print(data, &ts, zoom);
        }
    }
    endwin();
    free(data);
}

void graph_print(const double* points, struct tm* start_time, int zoom) {
    struct winsize w;
    ioctl(STDOUT_FILENO, TIOCGWINSZ, &w);
    int cols = w.ws_col - 11; // 10 offset to give space for graph labels + 1 for right side
    int lines = w.ws_row;
    lines -= lines % ROWS_SPACING; // Round down to multiple of 5
    if (cols < 10 || lines < 10) {
        puts("Terminal not large enough.");
        return;
    }

    struct tm end_time = *start_time;

    if (zoom == ZOOM_5y)
        end_time.tm_year += 5;
    else if (zoom == ZOOM_4y)
        end_time.tm_year += 4;
    else if (zoom == ZOOM_3y)
        end_time.tm_year += 3;
    else if (zoom == ZOOM_2y)
        end_time.tm_year += 2;
    else if (zoom == ZOOM_1y)
        end_time.tm_year += 1;
    else if (zoom == ZOOM_9m)
        end_time.tm_mon += 9;
    else if (zoom == ZOOM_6m)
        end_time.tm_mon += 6;
    else if (zoom == ZOOM_3m)
        end_time.tm_mon += 3;
    else if (zoom == ZOOM_1m)
        end_time.tm_mon += 1;

    mktime(&end_time); // Normalize

    double seconds = difftime(mktime(&end_time), mktime(start_time));
    int trading_days = (int) ((1.0 / DAYS_TO_BUSINESS_DAYS_RATIO) * seconds / 86400.0); // Total trading day to print

    time_t now = time(NULL);
    struct tm* five_y = localtime(&now);
    five_y->tm_year -= 5;

    seconds = difftime(mktime(start_time), mktime(five_y));
    int starting_index = (int) ((1.0 / DAYS_TO_BUSINESS_DAYS_RATIO) * seconds / 86400.0);

    double max = points[starting_index], min = points[starting_index];
    for (int i = starting_index + 1;
         i < trading_days + starting_index; i++) { // Find max and min values for graph upper/lower bounds
        if (points[i] > max)
            max = points[i];
        if (points[i] < min)
            min = points[i];
    }
    double line_diff = (max - min) / lines, dat; // Each lines includes data point up to line_diff below

    for (int i = lines; i >= 0; i--) {
        if (i % ROWS_SPACING == 0) // Print y-axis price labels with width 10
            printw("%9.2lf ", (max - ((lines - i) * line_diff)));
        else printw("          ");
        for (int j = 0; j < cols; j++) {
            dat = points[starting_index + (int)((double) j * trading_days / cols)];
            if (dat <= (max - ((lines - i) * line_diff)) && dat > (min + ((i - 1) * line_diff)))
                addch(ACS_DIAMOND);
            else if (i % ROWS_SPACING == 0 && j % COLS_SPACING == 0)
                addch(ACS_PLUS);
            else if (i % ROWS_SPACING == 0)
                addch(ACS_HLINE);
            else if (j % COLS_SPACING == 0)
                addch(ACS_VLINE);
            else
                addch(' ');
        }
        addch('\n');
    }

    printw("     ");
    char time_string[16];
    double x = (DAYS_TO_BUSINESS_DAYS_RATIO * trading_days) / (cols / COLS_SPACING);
    struct tm copy = *start_time;
    for (int i = 0; i < cols; i++) {
        if (i % (2 * COLS_SPACING) == 0 && cols - i > 10) { // Print x-axis date labels every two
            if (i != 0)
                copy.tm_sec += x * 2.0 * 86400.0;
            mktime(&copy);
            strftime(time_string, 16, "%m/%d/%Y", &copy);
            printw("%s              ", time_string); // Width 2 * COLS_SPACING
        }
    }
    addch('\n');
}