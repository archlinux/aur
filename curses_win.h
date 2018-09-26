#ifndef TICK_CURSES_WIN_H
#define TICK_CURSES_WIN_H

#define GRAPH_COLS_MIN 24
#define GRAPH_ROWS_MIN 10

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

#define RED COLOR_PAIR(1)
#define BLACK COLOR_PAIR(2)

#define PADDING 1

#define GRAPH_Y PADDING * 2
#define GRAPH_X PADDING
#define GRAPH_HEIGHT (rows / 2 - GRAPH_Y) - PADDING
#define GRAPH_WIDTH (cols / 2 - GRAPH_X) - PADDING

#define COMPANY_Y GRAPH_Y
#define COMPANY_X GRAPH_WIDTH + GRAPH_X + PADDING
#define COMPANY_HEIGHT GRAPH_HEIGHT + PADDING
#define COMPANY_WIDTH GRAPH_WIDTH

#define NEWS_Y GRAPH_Y + GRAPH_HEIGHT + PADDING
#define NEWS_X PADDING
#define NEWS_HEIGHT GRAPH_HEIGHT + PADDING * 3
#define NEWS_WIDTH GRAPH_WIDTH

#define PEERS_Y NEWS_Y
#define PEERS_X NEWS_X + NEWS_WIDTH + PADDING * 2
#define PEERS_HEIGHT GRAPH_HEIGHT
#define PEERS_WIDTH GRAPH_WIDTH

#include <stdlib.h>
#include <ncurses.h>
#include "api.h"
#include "portfolio.h"

extern int zoom_months[9], zoom_change_x_months[9];

void portfolio_printw(void);

/**
 * Prints to stdout information about every security contained in the portfolio: symbol, number of shares, USD spent,
 * current value, profit, and 24h profit. Additionally, print a grand total with info from all securities.
 */
void info_array_portfolio_printw(Info_Array* portfolio_data);

/**
 * Prints to stdout information about a specific security contained in the portfolio: symbol, number of shares, USD spent,
 * current value, profit, and 24h profit.
 * @param symbol the security to print
 */
void portfolio_print_stock(const char* symbol);

/**
 * Main function to print information about a security. Stocks/etfs/mutf/otc securities will print in an ncurses window,
 * while cryptos will print to stdout due to lack of information.
 * @param symbol any security
 */
void interface_print(const char* symbol);

/**
 * Prints basic price information header to an Ncurses window.
 * @param window
 * @param symbol_info Info*
 */
void header_printw(WINDOW* window, const Info* symbol_info);

/**
 * Prints basic information about a security to stdout.
 * @param symbol_info Info*
 */
void info_print(const Info* symbol_info);

/**
 * Prints basic information about a security to an Ncurses window.
 * @param symbol_info Info*
 */
void info_printw(WINDOW* window, const Info* symbol_info);

/**
 * Prints num_articles articles relating to the given symbol to stdout. Currently only works for stocks/etfs
 * @param symbol stock/etf symbol
 * @param num_articles number of articles to print (max 50)
 */
void news_print(const char* symbol, int num_articles);

/**
 * Prints articles relating to the given symbol to an Ncurses window. Currently only works for stocks/etfs
 * @param window
 * @param symbol_info Info*
 */
void news_printw(WINDOW* window, const Info* symbol_info);

/**
 * Prints peers relating to the given symbol to an Ncurses window. Currently only works for stocks/etfs
 * @param window
 * @param symbol_info Info*
 */
void peers_printw(WINDOW* window, const Info* symbol_info);

/**
 * Graphs a security in stdscr. If symbol2 is not NULL, also graphs that security.
 * @param symbol security to graph
 * @param symbol2 optional second security
 */
void graph_print(const char* symbol, const char* symbol2);

/**
 * -- Main input loop for graphing --
 * Graphs a secuturity or securities in the given window.
 * The user may input keystrokes to manipulate the graph(s).
 * Valid keystrokes:
 * q: Quits program
 * UP: increase zoom level by one and moves start date forward by one year, three months, or two months.
 * DOWN: decreases zoom level by one and moves start date backward by one year, three months, or two months.
 * LEFT: moves start date backward by one year, three months, or one month.
 * RIGHT: moves start date forward by one year, three months, or one month.
 * @param window the window to print to
 * @param symbol_info Info* containing points
 * @param symbol_info2 optional Info* containing points
 */
void graph_printw(WINDOW* window, Info* symbol_info, Info* symbol_info2);

/**
 * Prints out a NCurses based graph given an Info*.
 * If symbol_info2 if not NULL, also prints a graph of its data in a different color.
 * x-axis -- date
 * y-axis -- close price
 * @param window the window to print to
 * @param symbol_info Info* containing points
 * @param symbol_info2 optional Info* containing points
 * @param start_time the starting date of prices to print
 * @param zoom the zoom level
 */
void graph_draw(WINDOW* window, Info* symbol_info, Info* symbol_info2, struct tm* start_time, int zoom);

#endif