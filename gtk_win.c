#include "gtk_win.h"

App_Data app;

char column_names[16][NUM_COLS];

void window_main(void) {
    gtk_init(NULL, NULL);

    // Read glade XML config file
    app.portfolio_data = NULL;
    app.builder = gtk_builder_new();
    gtk_builder_add_from_file(app.builder, "/usr/share/tick/window_main.glade", NULL);

    GtkTreeView* tree_view = GTK_TREE_VIEW(gtk_builder_get_object(app.builder, "check_tree_view"));
    for (gint i = 0; i < NUM_COLS; i++) // Copy names of columns into array
        strcpy(column_names[i], gtk_tree_view_column_get_title(gtk_tree_view_get_column(
                tree_view, i)));

    gtk_builder_connect_signals(app.builder, NULL); // Connect signals
    gtk_widget_show(GTK_WIDGET(gtk_builder_get_object(app.builder, "check_window")));
    gtk_main(); // Main loop
}

void create_check_list(void) {
    if (app.portfolio_data != NULL)
        return;

    app.portfolio_data = portfolio_info_array_init_from_portfolio_string(app.portfolio_string);
    format_cells(app.portfolio_data);
    GtkTreeIter iters[app.portfolio_data->length + 1];
    GtkListStore* pListStore = GTK_LIST_STORE(gtk_builder_get_object(app.builder, "check_list"));
    Info* idx; // Append pListStore store with portfolio data
    for (size_t i = 0; i < app.portfolio_data->length + 1; i++) {
        gtk_list_store_append(pListStore, &iters[i]);
        if (i == app.portfolio_data->length) {
            idx = app.portfolio_data->totals;
        } else {
            idx = app.portfolio_data->array[i];
            gtk_list_store_set(pListStore, &iters[i], AMOUNT, idx->famount, -1);
        }
        gtk_list_store_set(pListStore, &iters[i], SYMBOL, idx->symbol, SPENT, idx->ftotal_spent,
                           VALUE, "Loading...", -1);
    }

    api_info_array_store_check_data(app.portfolio_data);
    format_cells(app.portfolio_data);

    for (size_t i = 0; i < app.portfolio_data->length + 1; i++) {
        if (i == app.portfolio_data->length)
            idx = app.portfolio_data->totals;
        else idx = app.portfolio_data->array[i];
        gtk_list_store_set(pListStore, &iters[i], VALUE, idx->fcurrent_value, PROFIT,
                           idx->fprofit_total, PROFIT_PERCENT, idx->fprofit_total_percent,
                           PROFIT_24H, idx->fprofit_last_close, PROFIT_24H_PERCENT,
                           idx->fprofit_last_close_percent, PROFIT_7D, idx->fprofit_7d,
                           PROFIT_7D_PERCENT, idx->fprofit_7d_percent, PROFIT_30D, idx->fprofit_30d,
                           PROFIT_30D_PERCENT, idx->fprofit_30d_percent, -1);
    }
}

void on_load_button_clicked(GtkButton* button) {
    if (app.portfolio_string == NULL)
        app.portfolio_string = file_get_string(portfolio_file_path);

    // Error reading file
    if (app.portfolio_string == NULL) {
        gtk_widget_show(GTK_WIDGET(gtk_builder_get_object(
                app.builder, "portfolio_file_get_string_error_dialog")));
        return;
    }

    Json* jobj = json_tokener_parse(app.portfolio_string->data);
    if (jobj == NULL || !json_object_is_type(jobj, json_type_array)) { // Encrypted String
        GtkWidget* dialog = (GtkWidget*) GTK_MESSAGE_DIALOG(gtk_builder_get_object(
                app.builder, "get_password_dialog"));
        gtk_entry_set_text(GTK_ENTRY(gtk_builder_get_object(app.builder, "password_entry")), "");
        gtk_widget_show(dialog);
    } else create_check_list(); // Unencrypted String
    json_object_put(jobj);
}

void on_password_entry_activate(GtkEntry* entry, gpointer dialog) {
    gtk_widget_hide((GtkWidget*) dialog);
    const gchar* password = gtk_entry_get_text(entry);
    if (password == NULL || strcmp(password, "") == 0)
        return;

    char modified_pw[PASS_MAX];
    sprintf(modified_pw, "%s\n", password); // See portfolio_write_encrypt_decrypt (rc4.c)
    rc4_encode_string(app.portfolio_string, modified_pw);
    Json* jobj = json_tokener_parse(app.portfolio_string->data);
    if (jobj == NULL || !json_object_is_type(jobj, json_type_array)) { // Wrong password
        // Reverse the failed decryption to its original state
        rc4_encode_string(app.portfolio_string, modified_pw);
        gtk_widget_show((GtkWidget*) GTK_MESSAGE_DIALOG(gtk_builder_get_object(
                app.builder, "wrong_password_dialog")));
    } else create_check_list();
    json_object_put(jobj);
}

void on_get_password_dialog_response(GtkDialog* dialog, gint response_id, gpointer entry) {
    if (response_id == GTK_RESPONSE_CANCEL) {
        gtk_widget_hide((GtkWidget*) dialog);
        return;
    }
    on_password_entry_activate(entry, dialog);
}


void on_check_window_destroy(void) {
    g_object_unref(app.builder);
    if (app.portfolio_data != NULL)
        api_info_array_destroy(&app.portfolio_data);
    gtk_main_quit();
}

void on_column_clicked(GtkTreeViewColumn* column, GtkListStore* list_store) {
    int idx = -1;
    for (int i = 0; i < NUM_COLS; i++)
        if (strcmp(gtk_tree_view_column_get_title(column), column_names[i]) == 0)
            idx = i;

    list_store_sort(list_store, (Col_Index) idx);
}

void format_cells(Info_Array* portfolio_data) {
    Info* idx;
    for (size_t i = 0; i < portfolio_data->length + 1; i++) {
        if (i == portfolio_data->length)
            idx = portfolio_data->totals;
        else idx = portfolio_data->array[i];
        if (idx->amount != EMPTY)
            sprintf(idx->famount, "%.2lf", idx->amount);
        if (idx->total_spent != EMPTY)
            sprintf(idx->ftotal_spent, "%.2lf", idx->total_spent);
        if (idx->current_value != EMPTY)
            sprintf(idx->fcurrent_value, "%.2lf", idx->current_value);
        if (idx->profit_total != EMPTY)
            sprintf(idx->fprofit_total, "%.2lf", idx->profit_total);
        if (idx->profit_total_percent != EMPTY)
            sprintf(idx->fprofit_total_percent, "%.2lf", idx->profit_total_percent);
        if (idx->profit_last_close != EMPTY)
            sprintf(idx->fprofit_last_close, "%.2lf", idx->profit_last_close);
        if (idx->profit_last_close_percent != EMPTY)
            sprintf(idx->fprofit_last_close_percent, "%.2lf", idx->profit_last_close_percent);
        if (idx->profit_7d != EMPTY)
            sprintf(idx->fprofit_7d, "%.2lf", idx->profit_7d);
        if (idx->profit_7d_percent != EMPTY)
            sprintf(idx->fprofit_7d_percent, "%.2lf", idx->profit_7d_percent);
        if (idx->profit_30d != EMPTY)
            sprintf(idx->fprofit_30d, "%.2lf", idx->profit_30d);
        if (idx->profit_30d_percent != EMPTY)
            sprintf(idx->fprofit_30d_percent, "%.2lf", idx->profit_30d_percent);
    }
}

void list_store_sort(GtkListStore* list_store, Col_Index idx) {
    GtkTreeModel* model = (GtkTreeModel*) list_store;
    GtkTreeIter iter;
    if (!gtk_tree_model_get_iter_first(model, &iter)) // Empty list_store
        return;

    int loop_flag = 1;
    gchar* str1, * str2, * sym1, * sym2;
    while (loop_flag) { // Bubble sort
        loop_flag = 0;
        GtkTreeIter iter1, iter2;
        gtk_tree_model_get_iter_first(model, &iter1);
        gtk_tree_model_get_iter_first(model, &iter2);
        if (!gtk_tree_model_iter_next(model, &iter2)) // List length 1
            return;
        do {
            gtk_tree_model_get(model, &iter1, SYMBOL, &sym1, -1);
            gtk_tree_model_get(model, &iter2, SYMBOL, &sym2, -1);

            // Don't sort TOTALS
            if (strcmp(sym1, "TOTALS") != 0 && strcmp(sym2, "TOTALS") != 0) {
                gtk_tree_model_get(model, &iter1, idx, &str1, -1);
                gtk_tree_model_get(model, &iter2, idx, &str2, -1);

                // Compare doubles
                if ((idx != SYMBOL && strtod(str1, NULL) < strtod(str2, NULL)) ||
                    (idx == SYMBOL && strcmp(str1, str2) > 0)) { // Compare strings
                    gtk_list_store_swap(list_store, &iter1, &iter2);
                    loop_flag = 1;
                }
                g_free(str1);
                g_free(str2);
            }
            g_free(sym1);
            g_free(sym2);
        } while (gtk_tree_model_iter_next(model, &iter1) &&
                 gtk_tree_model_iter_next(model, &iter2));
    }
}