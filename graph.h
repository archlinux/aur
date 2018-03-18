#ifndef GRAPH_H
#define GRAPH_H

#define ZOOM_5y 0
#define ZOOM_4y 1
#define ZOOM_3y 2
#define ZOOM_2y 3
#define ZOOM_1y 4
#define ZOOM_9m 5
#define ZOOM_6m 6
#define ZOOM_3m 7
#define ZOOM_1m 8

#define ROWS_SPACING 5
#define COLS_SPACING 12
#define DAYS_TO_BUSINESS_DAYS_RATIO (29.0/20.0)

#include <stdlib.h>
#include <ncurses.h>
#include "api.h"

int zoom_months[] = {60, 48, 36, 24, 12, 9, 6, 3, 1};

int zoom_change_x_months[] = {12, 12, 12, 12, 12, 3, 3, 3, 2};

/**
 * -- Main input loop for graphing --
 *
 * Initially prints a five-year graph of the given security. The user may input keystrokes to manipulate the graph
 * Valid keystrokes:
 * q: Quits program
 * UP: increase zoom level by one and moves start date forward by one year, three months, or two months.
 * DOWN: decreases zoom level by one and moves start date backward by one year, three months, or two months.
 * LEFT: moves start date backward by one year, three months, or one month.
 * RIGHT: moves start date forward by one year, three months, or one month.
 * @param ticker_name_string symbol
 */
void graph_main(const char* ticker_name_string);

/**
 * Prints out a NCurses based graph given an array of daily close prices.
 * x-axis -- close price
 * y-axis -- date
 * @param points daily close prices of past five years
 * @param start_time the starting date of prices to print
 * @param zoom the zoom level
 */
void graph_print(const double* points, struct tm* start_time, int zoom);

#endif