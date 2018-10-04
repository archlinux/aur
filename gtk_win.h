#ifndef TICK_GTK_WIN_H
#define TICK_GTK_WIN_H

#include <gtk/gtk.h>
#include "portfolio.h"

#define GET_OBJECT(obj) gtk_builder_get_object(app.builder, obj)
#define PEER_COLUMN_SYMBOL 0
#define PEER_COLUMN_PROFIT_24H_PERCENT 1
#define PEER_COLUMN_PROFIT_7D_PERCENT 2
#define PEER_COLUMN_PROFIT_30D_PERCENT 3
#define INFO_ARRAY_CACHE_MAX 128

typedef enum column_index {
    AMOUNT, SYMBOL, VALUE, SPENT, PROFIT, PROFIT_PERCENT, PROFIT_24H, PROFIT_24H_PERCENT, PROFIT_7D,
    PROFIT_7D_PERCENT, PROFIT_30D, PROFIT_30D_PERCENT, NUM_COLS
} Col_Index;

typedef enum zoom_level_total_months {
    FIVE_Y, FOUR_Y, THREE_Y, TWO_Y, ONE_Y, SIX_M, THREE_M, ONE_M, FOURTEEN_D, SEVEN_D
} Zoom_Months;

typedef struct app_data {
    Info_Array* portfolio_data;
    String* portfolio_string;
    GtkBuilder* builder;
    Info_Array* info_cache;
    char password[PASS_MAX];
    time_t last_reload;
    Info* focused;
} App_Data;

/**
 * Initializes gtk, loads glade file, connects signals, shows the check window, and enters the
 * main gtk loop.
 */
void window_main(void);

/**
 * Precondition: app.portfolio_string is a String containing a JSON array of portfolio data
 *
 * If the JSON array is length 0, the function will do nothing.
 *
 * Otherwise, app.portfolio_data will be created from app.portfolio_string and the check list store
 * will be cleared and appended with this data.
 */
void check_list_create_from_string(void);

/**
 * Precondition: check_list_create_from_string has already been called and api data has been
 * stored in app.portfolio_data
 *
 * Api data from app.portfolio_data will be stored in the check list store
 */
void check_list_add_api_data(void);

/**
 * SIGNAL FOR LOAD BUTTON CLICK
 *
 * Loads the portfolio file, decrypts if necessary, collects api data, and adds all the data to
 * the check list store.
 * @param button UNUSED -- MAY BE NULL
 */
void on_load_button_clicked(GtkButton* button);

/**
 * SIGNAL FOR LOAD BUTTON CLICK
 *
 * Shows either the encrypt or decrypt dialog depending on the button's label.
 * @param button a GtkButton with either label "Encrypt" or "Decrypt"
 */
void on_lock_button_clicked(GtkButton* button);

/**
 * SIGNAL FOR SET PASSWORD DIALOG RESPONSE
 *
 * If response is GTK_RESPONSE_CANCEL (if click cancel or press escape), hide the dialog.
 * Otherwise, calls on_set_password_entry_activate.
 * @param dialog
 * @param response_id response of button activated  -- either GTK_RESPONSE_CANCEL or GTK_RESPONSE_OK
 */
void on_set_password_dialog_response(GtkDialog* dialog, gint response_id);

/**
 * SIGNAL FOR SET PASSWORD ENTRY ACTIVATE
 *
 * Activated by keypress ENTER.
 *
 * If the length of the entered password is not between 6 and 30 characters or the two entered
 * passwords are not the same, the password will not be set.
 * @param entry UNUSED -- MAY BE NULL
 */
void on_set_password_entry_activate(GtkEntry* entry);

/**
 * SIGNAL FOR DECRYPT DIALOG RESPONSE
 *
 * If response is GTK_RESPONSE_CANCEL (if click cancel or press escape), hide the dialog.
 * Otherwise, calls on_decrypt_password_entry_activate.
 * @param dialog
 * @param response_id response of button activated  -- either GTK_RESPONSE_CANCEL or GTK_RESPONSE_OK
 */
void on_decrypt_dialog_response(GtkDialog* dialog, gint response_id);

/**
 * SIGNAL FOR DECRYPT PASSWORD ENTRY ACTIVATE
 *
 * If the entered password matches app.password, app.password will be cleared.
 * @param entry UNUSED -- MAY BE NULL
 */
void on_decrypt_password_entry_activate(GtkEntry* entry);

/**
 * SIGNAL FOR ADD, REMOVE, AND SET BUTTON CLICK
 *
 * Opens portfolio_modify_dialog based on which button was clicked.
 * @param button the button clicked
 */
void on_modify_button_clicked(GtkButton* button);

/**
 * SIGNAL FOR MODIFY ENTRY ACTIVATE
 *
 * Modifies app.portfolio_string according to the values entered in portfolio_modify_dialog
 * @param entry UNUSED -- MAY BE NULL
 */
void on_modify_entry_activate(GtkEntry* entry);

/**
 * SIGNAL FOR PORTFOLIO MODIFY DIALOG RESPONSE
 *
 * If response is GTK_RESPONSE_CANCEL (if click cancel or press escape), hide the dialog.
 * Otherwise, calls on_modify_entry_activate.
 * @param dialog
 * @param response_id response of button activated  -- either GTK_RESPONSE_CANCEL or GTK_RESPONSE_OK
 */
void on_portfolio_modify_dialog_response(GtkDialog* dialog, gint response_id);

/**
 * SIGNAL FOR PASSWORD ENTRY ACTIVATE
 *
 * If the entered password is correct, copy the password to app.password and load the portfolio
 * @param entry UNUSED -- MAY BE NULL
 */
void on_password_entry_activate(GtkEntry* entry);

/**
 * SIGNAL FOR GET PASSWORD DIALOG RESPONSE
 *
 * If response is GTK_RESPONSE_CANCEL (if click cancel or press escape), hide the dialog.
 * Otherwise, calls on_password_entry_activate.
 * @param dialog
 * @param response_id response of button activated  -- either GTK_RESPONSE_CANCEL or GTK_RESPONSE_OK
 */
void on_get_password_dialog_response(GtkDialog* dialog, gint response_id);

/**
 * SIGNAL FOR CHECK WINDOW DESTROY
 *
 * Encrypts and writes the portfolio to file if necessary. Unrefs gtk builder and exits main gtk
 * loop. Destroys all memory in app.
 */
void on_check_window_destroy(void);

/**
 * SIGNAL FOR COLUMN CLICKED
 *
 * Sorts the ListStore struct according to which column was clicked.
 * @param column clicked column
 * @param list_store portfolio data list
 */
void on_column_clicked(GtkTreeViewColumn* column, GtkListStore* list_store);

/**
 * SIGNAL FOR CHECK TREE VIEW ACTIVATE
 *
 * Shows info for the security in the column activated.
 * @param tree_view GtkTreeView*
 * @param path GtkTreePath*
 * @param column GtkTreeViewColumn*
 */
void on_check_tree_view_row_activated(GtkTreeView* tree_view, GtkTreePath* path,
        GtkTreeViewColumn* column);

/**
 * SIGNAL FOR BACK BUTTON CLICKED
 *
 * Returns to the portfolio view.
 * @param button
 */
void on_info_back_button_clicked(GtkButton* button);

/**
 * SIGNAL FOR SEARCH ENTRY FOCUS
 *
 * On first time focusing, populates the search completion list store with ref symbols.
 * @param search_entry
 * @param event
 */
void on_search_entry_focus_in_event(GtkWidget* search_entry, GdkEvent* event);

/**
 * SIGNAL FOR SEARCH ENTRY ACTIVATE
 *
 * Shows info for the entered security if available.
 * @param entry
 */
void on_search_entry_activate(GtkEntry* entry);

/**
 * SIGNAL FOR PEER COLUMN ACTIVATED
 *
 * Shows info for the security in the column activated.
 * @param tree_view
 * @param path
 * @param column
 */
void on_info_peers_tree_view_row_activated(GtkTreeView* tree_view, GtkTreePath* path,
        GtkTreeViewColumn* column);

/**
 * Shows info for the given symbol
 * @param symbol
 */
void symbol_show_info(const char* symbol);

/**
 * Formats text in an Info_Array for printing to window
 * @param portfolio_data Info_Array* with valid Info data in it.
 */
void info_array_format_cells(Info_Array* portfolio_data);

/**
 * Formats text in pInfo for printing to window
 * @param pInfo
 */
void info_format_cells(Info* pInfo);

/**
 * Sorts a ListStore struct according to idx.
 * @param list_store ListStore to sort
 * @param idx column number
 */
void list_store_sort(GtkListStore* list_store, Col_Index idx);

/**
 * Destroys app.portfolio_data and recreates it from app.portfolio_string with api data. Then
 * recreates the check list.
 */
void list_store_update(void);

/**
 * Fills all components of info window with the given pInfo.
 * @param pInfo
 */
void info_pane_populate_all(const Info* pInfo);

/**
 * Fills header with info from pInfo
 * @param pInfo
 */
void info_pane_populate_header(const Info* pInfo);

/**
 * Fills company section with info from pInfo
 * @param pInfo
 */
void info_pane_populate_company(const Info* pInfo);

/**
 * Fills peers section with info from pInfo
 * @param pInfo
 */
void info_pane_populate_peers(const Info* pInfo);

/**
 * Fills news section with info from pInfo
 * @param pInfo
 */
void info_pane_populate_news(const Info* pInfo);

/**
 * SIGNAL FOR GRAPH DRAW
 *
 * Draws a graph of app.focused
 * @param widget GtkDrawingArea
 * @param cr cairo object to draw on
 * @return FALSE
 */
gboolean on_info_graph_drawing_area_draw(GtkWidget* widget, cairo_t* cr);

/**
 * Shows a generic message dialog.
 * @param message the message to show
 * @param success if true, will show a success dialog. otherwise it will show an error dialog.
 */
void show_generic_message_dialog(const char* message, gboolean success);

/**
 * Sets the text property of a GObject to a string
 * @param object the GObject to change the text of
 * @param text the text to write
 */
void g_object_set_text(GObject* object, const gchar* text);

#endif