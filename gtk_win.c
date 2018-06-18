#include "gtk_win.h"

char column_names[16][NUM_COLS];

void window_main(void) {
    gtk_init(NULL, NULL);
    GtkBuilder* builder = gtk_builder_new();

    // Read glade XML config file
    gtk_builder_add_from_file(builder, "/usr/share/tick/window_main.glade", NULL);

    // Get widgets
    GtkWidget* window = GTK_WIDGET(gtk_builder_get_object(builder, "window_main"));
    GtkListStore* list = GTK_LIST_STORE(gtk_builder_get_object(builder, "check_list"));
    GtkTreeView* tree_view = GTK_TREE_VIEW(gtk_builder_get_object(builder, "check_tree_view"));
    for (gint i = 0; i < NUM_COLS; i++) // Copy names of columns into array
        strcpy(column_names[i], gtk_tree_view_column_get_title(gtk_tree_view_get_column(
                tree_view, i)));

    Info_Array* portfolio_data = portfolio_get_info_array(); // Portfolio data
    format_cells(portfolio_data); // Format portfolio data to strings

    Info* idx; // Append list store with portfolio data
    for (size_t i = 0; i < portfolio_data->length; i++) {
        GtkTreeIter iter;
        idx = portfolio_data->array[i];
        gtk_list_store_append(list, &iter);
        gtk_list_store_set(list, &iter, AMOUNT, idx->famount, SYMBOL, idx->symbol, VALUE,
                           idx->fcurrent_value, SPENT, idx->ftotal_spent, PROFIT,
                           idx->fprofit_total, PROFIT_PERCENT, idx->fprofit_total_percent,
                           PROFIT_24H, idx->fprofit_last_close, PROFIT_24H_PERCENT,
                           idx->fprofit_last_close_percent, PROFIT_7D, idx->fprofit_7d,
                           PROFIT_7D_PERCENT, idx->fprofit_7d_percent, PROFIT_30D, idx->fprofit_30d,
                           PROFIT_30D_PERCENT, idx->fprofit_30d_percent, -1);
    }

    GtkTreeIter iter;
    gtk_list_store_append(list, &iter); // Add totals
    gtk_list_store_set(list, &iter, SYMBOL, "TOTALS", VALUE, portfolio_data->fcurrent_value, SPENT,
                       portfolio_data->ftotal_spent, PROFIT, portfolio_data->fprofit_total,
                       PROFIT_PERCENT, portfolio_data->fprofit_total_percent, PROFIT_24H,
                       portfolio_data->fprofit_last_close, PROFIT_24H_PERCENT,
                       portfolio_data->fprofit_last_close_percent, PROFIT_7D,
                       portfolio_data->fprofit_7d, PROFIT_7D_PERCENT,
                       portfolio_data->fprofit_7d_percent, PROFIT_30D, portfolio_data->fprofit_30d,
                       PROFIT_30D_PERCENT, portfolio_data->fprofit_30d_percent, -1);

    gtk_builder_connect_signals(builder, NULL); // Connect signals
    g_object_unref(builder);
    gtk_widget_show_all(window);
    gtk_main(); // Main loop
    api_info_array_destroy(&portfolio_data);
}

void format_cells(Info_Array* portfolio_data) {
    Info* idx;
    for (size_t i = 0; i < portfolio_data->length; i++) {
        idx = portfolio_data->array[i];
        sprintf(idx->famount, "%.2lf", idx->amount);
        sprintf(idx->ftotal_spent, "%.2lf", idx->total_spent);
        sprintf(idx->fcurrent_value, "%.2lf", idx->current_value);
        sprintf(idx->fprofit_total, "%.2lf", idx->profit_total);
        sprintf(idx->fprofit_total_percent, "%.2lf", idx->profit_total_percent);
        sprintf(idx->fprofit_last_close, "%.2lf", idx->profit_last_close);
        sprintf(idx->fprofit_last_close_percent, "%.2lf", idx->profit_last_close_percent);
        sprintf(idx->fprofit_7d, "%.2lf", idx->profit_7d);
        sprintf(idx->fprofit_7d_percent, "%.2lf", idx->profit_7d_percent);
        sprintf(idx->fprofit_30d, "%.2lf", idx->profit_30d);
        sprintf(idx->fprofit_30d_percent, "%.2lf", idx->profit_30d_percent);
    }
    sprintf(portfolio_data->ftotal_spent, "%.2lf", portfolio_data->total_spent);
    sprintf(portfolio_data->fcurrent_value, "%.2lf", portfolio_data->current_value);
    sprintf(portfolio_data->fprofit_total, "%.2lf", portfolio_data->profit_total);
    sprintf(portfolio_data->fprofit_total_percent, "%.2lf", portfolio_data->profit_total_percent);
    sprintf(portfolio_data->fprofit_last_close, "%.2lf", portfolio_data->profit_last_close);
    sprintf(portfolio_data->fprofit_last_close_percent, "%.2lf",
            portfolio_data->profit_last_close_percent);
    sprintf(portfolio_data->fprofit_7d, "%.2lf", portfolio_data->profit_7d);
    sprintf(portfolio_data->fprofit_7d_percent, "%.2lf", portfolio_data->profit_7d_percent);
    sprintf(portfolio_data->fprofit_30d, "%.2lf", portfolio_data->profit_30d);
    sprintf(portfolio_data->fprofit_30d_percent, "%.2lf",
            portfolio_data->profit_30d_percent);
}

void on_main_win_destroy(void) {
    gtk_main_quit();
}

void on_column_clicked(GtkTreeViewColumn* column, GtkListStore* list_store) {
    int idx = -1;
    for (int i = 0; i < NUM_COLS; i++)
        if (strcmp(gtk_tree_view_column_get_title(column), column_names[i]) == 0)
            idx = i;

    list_store_sort(list_store, (Col_Index) idx);
}

void list_store_sort(GtkListStore* list_store, Col_Index idx) {
    GtkTreeModel* model = (GtkTreeModel*) list_store;
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