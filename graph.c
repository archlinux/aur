#include "graph.h"

void graph_print(const double* points, struct tm* start_time) {
    struct winsize w;
    ioctl(STDOUT_FILENO, TIOCGWINSZ, &w);
    int cols = w.ws_col - 10; // 10 offset per side to give space for graph labels
    int lines = w.ws_row - ROWS_SPACING;
    lines -= lines % ROWS_SPACING; // Round down to multiple of 5
    if (cols < 10 || lines < 10) {
        puts("Terminal not large enough.\n");
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
            printf("%9.2lf ", (max - ((lines - i) * line_diff)));
        else printf("          ");
        for (int j = 0; j < cols; j++) {
            dat = points[(int) ((double) j * data_length / cols)];
            if (dat <= (max - ((lines - i) * line_diff)) && dat > (min + ((i - 1) * line_diff)))
                putchar('*');
            else if (i % ROWS_SPACING == 0 && j % COLS_SPACING == 0)
                putchar('+');
            else if (i % ROWS_SPACING == 0)
                putchar('-');
            else if (j % COLS_SPACING == 0)
                putchar('|');
            else putchar(' ');
        }
        putchar('\n');
    }

    printf("          ");
    char time_string[16];
    int x = data_length / (COLS_SPACING - 1);
    struct tm copy = *start_time;
    for (int i = 0; i < cols; i++) {
        if (i % (2 * COLS_SPACING) == 0 && cols - i > 10) { // Print x-axis date labels every two
            if (i != 0)
                copy.tm_mday += 2 * x;
            mktime(&copy);
            strftime(time_string, 16, "%m/%d/%Y", &copy);
            printf("%s              ", time_string); // Width 2 * COLS_SPACING
        }
    }
    putchar('\n');
}