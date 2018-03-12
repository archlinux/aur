#include "graph.h"

void graph_main(const char* ticker_name_string){
    initscr();
    noecho();
    keypad(stdscr, TRUE);
    curs_set(0);
    double* data = api_get_hist_5y(ticker_name_string);
    if (data != NULL) {
        time_t now = time(NULL);
        struct tm* ts = localtime(&now);
        ts->tm_year -= 5;
        graph_print(data, ts);
    }
    else puts("Invalid symbol.");

    int ch;
    while (1) {
        ch = getch();
        if (ch == 'q')
            break;
    }
    endwin();
    free(data);
}

void graph_print(const double* points, struct tm* start_time) {
    struct winsize w;
    ioctl(STDOUT_FILENO, TIOCGWINSZ, &w);
    int cols = w.ws_col - 11; // 10 offset to give space for graph labels + 1 for right side
    int lines = w.ws_row - ROWS_SPACING;
    lines -= lines % ROWS_SPACING; // Round down to multiple of 5
    if (cols < 10 || lines < 10) {
        puts("Terminal not large enough.");
        return;
    }

    double max = points[0], min = points[0];
    int data_length = 0;
    for (int i = 1; points[i] != '\0'; i++) { // Find max and min values for graph upper/lower bounds
        if (points[i] > max)
            max = points[i];
        if (points[i] < min)
            min = points[i];
        data_length++;
    }
    double line_diff = (max - min) / lines, dat; // Each lines includes data point up to line_diff below

    for (int i = lines; i >= 0; i--) {
        if (i % ROWS_SPACING == 0) // Print y-axis price labels with width 10
            printw("%9.2lf ", (max - ((lines - i) * line_diff)));
        else printw("          ");
        for (int j = 0; j < cols; j++) {
            dat = points[(int) ((double) j * data_length / cols)];
            if (dat <= (max - ((lines - i) * line_diff)) && dat > (min + ((i - 1) * line_diff)))
                addch(ACS_DIAMOND);
            else if (i % ROWS_SPACING == 0 && j % COLS_SPACING == 0)
                addch(ACS_PLUS);
            else if (i % ROWS_SPACING == 0)
                addch(ACS_HLINE);
            else if (j % COLS_SPACING == 0)
                addch(ACS_VLINE);
            else addch(' ');
        }
        addch('\n');
    }

    printw("     ");
    char time_string[16];
    double x = (DAYS_TO_BUSINESS_DAYS_RATIO * data_length) / (cols / COLS_SPACING);
    struct tm copy = *start_time;
    for (int i = 0; i < cols; i++) {
        if (i % (2 * COLS_SPACING) == 0 && cols - i > 10) { // Print x-axis date labels every two
            if (i != 0)
                copy.tm_mday += x * 2;
            mktime(&copy);
            strftime(time_string, 16, "%m/%d/%Y", &copy);
            printw("%s              ", time_string); // Width 2 * COLS_SPACING
        }
    }
    addch('\n');
}