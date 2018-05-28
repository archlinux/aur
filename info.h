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

#define RED COLOR_PAIR(1)
#define BLACK COLOR_PAIR(2)

#define PADDING 3

#define GRAPH_Y PADDING
#define GRAPH_X PADDING
#define GRAPH_HEIGHT (rows / 2 - GRAPH_Y)
#define GRAPH_WIDTH (cols / 2 - GRAPH_X)

#define COMPANY_Y GRAPH_Y
#define COMPANY_X GRAPH_WIDTH + GRAPH_X
#define COMPANY_HEIGHT GRAPH_HEIGHT
#define COMPANY_WIDTH GRAPH_WIDTH

#include <stdlib.h>
#include <ncurses.h>
#include "api.h"

extern int zoom_months[9], zoom_change_x_months[9];


/**
 * Prints information about the symbol ticker_name_string by calling the function json_print_news.
 * @param symbol
 */
void symbol_print_info(const char* symbol);


/**
 * Prints the top three news articles by popularity pertaining to the given string, ticker_name_string. Spaces and
 * underscores will be url-encoded (replaced by "%20"). News API will be used for data.
 * @param symbol the string to query
 */
void symbol_print_news(const char* symbol, int num_articles);

/**
 * -- Main input loop for graphing --
 *
 * Gets the five year history of the given security(s) and calls graph_print to initially display a graph of it/them.
 * If symbol2 is NULL, only displays the graph for symbol.
 * The user may input keystrokes to manipulate the graph(s).
 * Valid keystrokes:
 * q: Quits program
 * UP: increase zoom level by one and moves start date forward by one year, three months, or two months.
 * DOWN: decreases zoom level by one and moves start date backward by one year, three months, or two months.
 * LEFT: moves start date backward by one year, three months, or one month.
 * RIGHT: moves start date forward by one year, three months, or one month.
 * @param symbol first symbol
 * @param symbol2 second symbol
 */
void graph_main(const char* symbol, const char* symbol2, WINDOW* window);

/**
 * Prints out a NCurses based graph given an array of daily close prices.
 * If points2 if not NULL, also prints a graph of its data in a different color.
 * x-axis -- date
 * y-axis -- close price
 * @param points daily close prices of past five years of first security
 * @param points2 daily close prices of past five years of second security
 * @param start_time the starting date of prices to print
 * @param zoom the zoom level
 * @param symbol first symbol
 * @param symbol2 second symbol
 */
void graph_print(const double* points, const double* points2, struct tm* start_time, int zoom,
        const char* symbol, const char* symbol2, WINDOW* window);

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