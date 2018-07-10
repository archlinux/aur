#ifndef TICK_GTK_WIN_H
#define TICK_GTK_WIN_H

#include <gtk/gtk.h>
#include "portfolio.h"

typedef enum column_index {
    AMOUNT, SYMBOL, VALUE, SPENT, PROFIT, PROFIT_PERCENT, PROFIT_24H, PROFIT_24H_PERCENT, PROFIT_7D,
    PROFIT_7D_PERCENT, PROFIT_30D, PROFIT_30D_PERCENT, NUM_COLS
} Col_Index;

typedef struct app_data {
    Info_Array* portfolio_data;
    String* portfolio_string;
    GtkBuilder* builder;
    char password[PASS_MAX];
} App_Data;

/**
 * Opens GTK+ Window and prints portfolio data to it. Currently cannot handle encrypted portfolios.
 */
void window_main(void);

void check_list_create_from_string(void);

void check_list_add_api_data(void);

/** SIGNALS **/

void on_load_button_clicked(GtkButton* button);

void on_lock_button_clicked(GtkButton* button);

void on_set_password_dialog_response(GtkDialog* dialog, gint response_id);

void on_set_password_entry_activate(GtkEntry* entry);

void on_decrypt_dialog_response(GtkDialog* dialog, gint response_id);

void on_decrypt_password_entry_activate(GtkEntry* entry);

void on_modify_button_clicked(GtkButton* button);

void on_modify_entry_activate(GtkEntry* entry, gpointer dialog);

void on_portfolio_modify_dialog_response(GtkDialog* dialog, gint response_id);

void on_password_entry_activate(GtkEntry* entry, gpointer dialog);

void on_get_password_dialog_response(GtkDialog* dialog, gint response_id, gpointer entry);

/**
 * Signal handler for destroying main window. Exits the program.
 */
void on_check_window_destroy(void);

/**
 * Signal handler for clicking column labels. Sorts the ListStore struct according to which
 * column was clicked.
 * @param column clicked column
 * @param list_store portfolio data list
 */
void on_column_clicked(GtkTreeViewColumn* column, GtkListStore* list_store);

/** UTILS **/

/**
 * Formats text in Info structs for printing to window
 * @param portfolio_data
 */
void format_cells(Info_Array* portfolio_data);

/**
 * Sorts a ListStore struct according to idx.
 * @param list_store ListStore to sort
 * @param idx column number
 */
void list_store_sort(GtkListStore* list_store, Col_Index idx);

void list_store_update(void);

void show_generic_message_dialog(const char* message, gboolean success);

#endif