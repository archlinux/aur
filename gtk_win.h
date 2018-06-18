#ifndef TICK_GTK_WIN_H
#define TICK_GTK_WIN_H

#include <gtk/gtk.h>
#include "portfolio.h"

typedef enum column_index {
    AMOUNT, SYMBOL, VALUE, SPENT, PROFIT, PROFIT_PERCENT, PROFIT_24H, PROFIT_24H_PERCENT, PROFIT_7D,
    PROFIT_7D_PERCENT, PROFIT_30D, PROFIT_30D_PERCENT, NUM_COLS
} Col_Index;

/**
 * Opens GTK+ Window and prints portfolio data to it. Currently cannot handle encrypted portfolios.
 */
void window_main(void);

/**
 * Formats text in Info structs for printing to window
 * @param portfolio_data
 */
void format_cells(Info_Array* portfolio_data);

/**
 * Signal handler for destroying main window. Exits the program.
 */
void on_main_win_destroy(void);

/**
 * Signal handler for clicking column labels. Sorts the ListStore struct according to which
 * column was clicked.
 * @param column clicked column
 * @param list_store portfolio data list
 */
void on_column_clicked(GtkTreeViewColumn* column, GtkListStore* list_store);

/**
 * Sorts a ListStore struct according to idx.
 * @param list_store ListStore to sort
 * @param idx column number
 */
void list_store_sort(GtkListStore* list_store, Col_Index idx);

#endif