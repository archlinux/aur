#ifndef GRAPH_H
#define GRAPH_H

#define ROWS_SPACING 5
#define COLS_SPACING 12

#include <stdio.h>
#include <stdlib.h>
#include <ncurses.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include "api.h"

void graph_print(const double* points, struct tm* start_time);

#endif