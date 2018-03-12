#ifndef GRAPH_H
#define GRAPH_H

#define ROWS_SPACING 5
#define COLS_SPACING 12
#define DAYS_TO_BUSINESS_DAYS_RATIO (29.0/20.0)

#include <stdio.h>
#include <stdlib.h>
#include <ncurses.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include "api.h"

/**
 * Main input loop
 * @param ticker_name_string symbol
 */
void graph_main(const char* ticker_name_string);

/**
 * Prints out a NCurses based graph given an array of daily close prices.
 * x-axis -- close price
 * y-axis -- date
 * @param points daily close prices
 * @param start_time the starting date
 */
void graph_print(const double* points, struct tm* start_time);

#endif