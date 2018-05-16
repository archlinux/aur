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

extern int zoom_months[9], zoom_change_x_months[9];

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
void graph_main(const char* ticker_name_string, const char* ticker_name_string2);

/**
 * Prints out a NCurses based graph given an array of daily close prices.
 * x-axis -- close price
 * y-axis -- date
 * @param points daily close prices of past five years
 * @param start_time the starting date of prices to print
 * @param zoom the zoom level
 */
void graph_print(const double* points, const double* points2, struct tm* start_time, int zoom,
        const char* ticker_name_string, const char* ticker_name_string2);

/**
 * Reallocates the given array with size trading days. Moves all values to end of the array and sets
 * values not initialized as EMPTY.
 * @param points the array to realloc
 * @param size the size of points
 * @param trading_days the size to realloc
 * @return the reallocated array
 */
double* graph_fill_empty(double* points, int size, int trading_days);

#endif