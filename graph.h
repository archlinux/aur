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

#include <stdio.h>
#include <stdlib.h>
#include <ncurses.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include "api.h"

/**
 * Main input loop
 * Entering the key UP or DOWN will zoom in or out one level
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
void graph_print(const double* points, struct tm* start_time, int zoom);

#endif