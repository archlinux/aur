#include "gtk_win.h"

App_Data app;

char column_names[16][NUM_COLS];

void window_main(void) {
    gtk_init(NULL, NULL);

    // Set defaults
    app.portfolio_data = NULL;
    app.portfolio_string = NULL;
    app.builder = gtk_builder_new();
    app.password[0] = '\0';

    // Read glade XML config file
    gtk_builder_add_from_file(app.builder, "window_main.glade", NULL);

    // Copy names of columns into array
    GtkTreeView* tree_view = GTK_TREE_VIEW(gtk_builder_get_object(app.builder, "check_tree_view"));
    for (gint i = 0; i < NUM_COLS; i++)
        strcpy(column_names[i], gtk_tree_view_column_get_title(gtk_tree_view_get_column(
                tree_view, i)));

    gtk_builder_connect_signals(app.builder, NULL); // Connect signals

    // Show check window as default opening window
    gtk_widget_show(GTK_WIDGET(gtk_builder_get_object(app.builder, "check_window")));
    gtk_main(); // Main loop
}

void check_list_create_from_string(void) {
    api_info_array_destroy(&app.portfolio_data);
    app.portfolio_data = portfolio_info_array_init_from_portfolio_string(app.portfolio_string);
    if (app.portfolio_data == NULL) // Empty JSON array
        return;

    format_cells(app.portfolio_data);
    GtkListStore* pListStore = GTK_LIST_STORE(gtk_builder_get_object(app.builder, "check_list"));
    Info* idx; // Append pListStore store with portfolio data
    for (size_t i = 0; i < app.portfolio_data->length + 1; i++) {
        GtkTreeIter iter;
        gtk_list_store_append(pListStore, &iter);
        if (i == app.portfolio_data->length) {
            idx = app.portfolio_data->totals;
        } else {
            idx = app.portfolio_data->array[i];
            gtk_list_store_set(pListStore, &iter, AMOUNT, idx->famount, -1);
        }
        gtk_list_store_set(pListStore, &iter, SYMBOL, idx->symbol, SPENT, idx->ftotal_spent, -1);
    }
}

void check_list_add_api_data(void) {
    GtkListStore* pListStore = GTK_LIST_STORE(gtk_builder_get_object(app.builder, "check_list"));
    format_cells(app.portfolio_data);
    Info* idx;
    GtkTreeIter iter;
    for (size_t i = 0; i < app.portfolio_data->length + 1; i++) {
        if (i == app.portfolio_data->length)
            idx = app.portfolio_data->totals;
        else idx = app.portfolio_data->array[i];
        if (i == 0)
            gtk_tree_model_get_iter_first(GTK_TREE_MODEL(pListStore), &iter);
        else gtk_tree_model_iter_next(GTK_TREE_MODEL(pListStore), &iter);
        gtk_list_store_set(pListStore, &iter, VALUE, idx->fcurrent_value, PROFIT,
                           idx->fprofit_total, PROFIT_PERCENT, idx->fprofit_total_percent,
                           PROFIT_24H, idx->fprofit_last_close, PROFIT_24H_PERCENT,
                           idx->fprofit_last_close_percent, PROFIT_7D, idx->fprofit_7d,
                           PROFIT_7D_PERCENT, idx->fprofit_7d_percent, PROFIT_30D, idx->fprofit_30d,
                           PROFIT_30D_PERCENT, idx->fprofit_30d_percent, -1);
    }
}

void on_load_button_clicked(GtkButton* button) {
    // Already loaded
    if (app.portfolio_string != NULL && is_string_json_array(app.portfolio_string)
        && app.portfolio_data != NULL)
        return;

    if (app.portfolio_string == NULL) { // Portfolio not loaded
        FILE* fp = fopen(portfolio_file_path, "a"); // Touch file to get a valid String if empty
        if (fp)
            fclose(fp);

        // Will be String with length 0 on new portfolio
        app.portfolio_string = file_get_string(portfolio_file_path);
    }

    if (app.portfolio_string == NULL) { // Error reading file
        GValue gtext = G_VALUE_INIT;
        g_value_init(&gtext, G_TYPE_STRING);
        g_value_set_string(&gtext, "There was an error opening your portfolio file. This may be due"
                                   " to the file not existing or invalid permissions on the file.");
        GtkWidget* dialog = GTK_WIDGET(gtk_builder_get_object(
                app.builder, "generic_check_window_error_dialog"));
        g_object_set_property((GObject*) dialog, "text", &gtext);
        gtk_widget_show(dialog);
        return;
    }

    if (app.portfolio_string->len == 0) { // On new portfolio, create empty JSON array
        Json* jobj = json_object_new_array();
        const char* str = json_object_get_string(jobj);
        app.portfolio_string->len = strlen(str);
        app.portfolio_string->data = realloc(app.portfolio_string->data, app
                .portfolio_string->len + 1);
        strcpy(app.portfolio_string->data, str);
        json_object_put(jobj);
        return;
    }

    // If encrypted file
    if (!is_string_json_array(app.portfolio_string)) {
        GtkWidget* dialog = (GtkWidget*) GTK_MESSAGE_DIALOG(gtk_builder_get_object(app.builder,
                "get_password_dialog"));
        gtk_entry_set_text(GTK_ENTRY(gtk_builder_get_object(app.builder, "password_entry")), "");
        gtk_widget_show(dialog); // Decode
        return;
    }

    api_info_array_destroy(&app.portfolio_data);
    app.portfolio_data = portfolio_info_array_init_from_portfolio_string(app.portfolio_string);
    if (app.portfolio_data != NULL) {
        check_list_create_from_string();
        api_info_array_store_check_data(app.portfolio_data);
        check_list_add_api_data();
    }

    GtkButton* lock_button = GTK_BUTTON(gtk_builder_get_object(app.builder, "lock_button"));
    gtk_widget_set_sensitive(GTK_WIDGET(lock_button), TRUE);
    if (app.password[0] == '\0') // Plaintext
        gtk_button_set_label(lock_button, "Encrypt");
    else gtk_button_set_label(lock_button, "Decrypt");
}

void on_lock_button_clicked(GtkButton* button) {
    if (strcmp(gtk_button_get_label(button), "Encrypt") == 0) {
        gtk_entry_set_text(GTK_ENTRY(gtk_builder_get_object(app.builder, "set_password_entry1")),
                           "");
        gtk_entry_set_text(GTK_ENTRY(gtk_builder_get_object(app.builder, "set_password_entry2")),
                           "");
        gtk_widget_show(GTK_WIDGET(gtk_builder_get_object(app.builder, "set_password_dialog")));
    } else {
        gtk_entry_set_text(GTK_ENTRY(gtk_builder_get_object(app.builder, "decrypt_password_entry")),
                           "");
        gtk_widget_show(GTK_WIDGET(gtk_builder_get_object(app.builder, "decrypt_dialog")));
    }
}

void on_set_password_dialog_response(GtkDialog* dialog, gint response_id) {
    if (response_id == GTK_RESPONSE_CANCEL)
        gtk_widget_hide(GTK_WIDGET(dialog));
    else on_set_password_entry_activate(NULL);
}

void on_set_password_entry_activate(GtkEntry* entry) {
    gtk_widget_hide(GTK_WIDGET(gtk_builder_get_object(app.builder, "set_password_dialog")));
    GtkEntry* pass = GTK_ENTRY(gtk_builder_get_object(app.builder, "set_password_entry1"));
    GtkEntry* pass_check = GTK_ENTRY(gtk_builder_get_object(app.builder, "set_password_entry2"));
    const gchar* pass_str = gtk_entry_get_text(pass);
    GValue gtext = G_VALUE_INIT;
    g_value_init(&gtext, G_TYPE_STRING);
    GtkWidget* dialog = GTK_WIDGET(gtk_builder_get_object(
            app.builder, "generic_check_window_error_dialog"));
    if (strlen(pass_str) < 6 || strlen(pass_str) > 30)
        g_value_set_string(&gtext, "Your password must be between 6 and 30 characters.");
    else if (strcmp(pass_str, gtk_entry_get_text(pass_check)) != 0)
        g_value_set_string(&gtext, "Your passwords did not match.");
    else { // If passwords match
        sprintf(app.password, "%s\n", pass_str);
        g_value_set_string(&gtext, "Success! Your portfolio will be encrypted when you close the "
                                   "program.");
        dialog = GTK_WIDGET(gtk_builder_get_object(
                app.builder, "generic_check_window_success_dialog"));

        gtk_button_set_label(GTK_BUTTON(gtk_builder_get_object(app.builder, "lock_button")),
                             "Decrypt");
    }

    g_object_set_property(G_OBJECT(dialog), "text", &gtext);
    gtk_widget_show(dialog);
}

void on_decrypt_dialog_response(GtkDialog* dialog, gint response_id) {
    if (response_id == GTK_RESPONSE_CANCEL)
        gtk_widget_hide(GTK_WIDGET(dialog));
    else on_decrypt_password_entry_activate(NULL);
}

void on_decrypt_password_entry_activate(GtkEntry* entry) {
    gtk_widget_hide(GTK_WIDGET(gtk_builder_get_object(app.builder, "decrypt_dialog")));
    GValue gtext = G_VALUE_INIT;
    g_value_init(&gtext, G_TYPE_STRING);
    GtkDialog* dialog;
    const gchar* pass = gtk_entry_get_text(GTK_ENTRY(
            gtk_builder_get_object(app.builder, "decrypt_password_entry")));
    gchar mod_pass[strlen(pass) + 1];
    sprintf(mod_pass, "%s\n", pass);
    if (strcmp(app.password, mod_pass) == 0) { // Success
        memset(app.password, '\0', PASS_MAX);
        g_value_set_string(&gtext, "Successfully decrypted.");
        dialog = GTK_DIALOG(gtk_builder_get_object(app.builder,
                "generic_check_window_success_dialog"));

        gtk_button_set_label(GTK_BUTTON(gtk_builder_get_object(app.builder, "lock_button")),
                             "Encrypt");
    } else {
        g_value_set_string(&gtext, "Wrong password!.");
        dialog = GTK_DIALOG(gtk_builder_get_object(app.builder,
                                                   "generic_check_window_error_dialog"));
    }
    g_object_set_property(G_OBJECT(dialog), "text", &gtext);
    gtk_widget_show(GTK_WIDGET(dialog));
}

void on_modify_button_clicked(GtkButton* button) {
    if (app.portfolio_string == NULL) {
        GValue gtext = G_VALUE_INIT;
        g_value_init(&gtext, G_TYPE_STRING);
        g_value_set_string(&gtext, "Your portfolio hasn't been loaded yet. Click the button Load "
                                   "Portfolio to the left.");
        GtkWidget* dialog = GTK_WIDGET(gtk_builder_get_object(
                app.builder, "generic_check_window_error_dialog"));
        g_object_set_property((GObject*) dialog, "text", &gtext);
        gtk_widget_show(dialog);
        return;
    }

    GtkMessageDialog* dialog = GTK_MESSAGE_DIALOG(gtk_builder_get_object(
            app.builder, "portfolio_modify_dialog"));

    const gchar* label = gtk_button_get_label(button);
    GValue gtext = G_VALUE_INIT;
    g_value_init(&gtext, G_TYPE_STRING);
    g_value_set_string(&gtext, label);

    g_object_set_property((GObject*) dialog, "text", &gtext);
    gtk_entry_set_text(GTK_ENTRY(gtk_builder_get_object(app.builder, "modify_symbol_entry")), "");
    gtk_entry_set_text(GTK_ENTRY(gtk_builder_get_object(app.builder, "modify_amount_entry")), "");
    gtk_entry_set_text(GTK_ENTRY(gtk_builder_get_object(app.builder, "modify_spent_entry")), "");
    gtk_widget_show((GtkWidget*) dialog);
}

void on_modify_entry_activate(GtkEntry* entry, gpointer dialog) {
    gtk_widget_hide((GtkWidget*) dialog);
    GtkEntry* symbol_entry = GTK_ENTRY(gtk_builder_get_object(app.builder, "modify_symbol_entry"));
    GtkEntry* amount_entry = GTK_ENTRY(gtk_builder_get_object(app.builder, "modify_amount_entry"));
    GtkEntry* spent_entry = GTK_ENTRY(gtk_builder_get_object(app.builder, "modify_spent_entry"));
    const gchar* gsymbol = gtk_entry_get_text(symbol_entry);
    char symbol[strlen(gsymbol) + 1];
    strcpy(symbol, gsymbol);
    strtoupper(symbol);
    double amount = strtod(gtk_entry_get_text(amount_entry), NULL);
    double spent = strtod(gtk_entry_get_text(spent_entry), NULL);

    GValue gtext = G_VALUE_INIT;
    g_value_init(&gtext, G_TYPE_STRING);
    g_object_get_property(G_OBJECT(gtk_builder_get_object(app.builder, "portfolio_modify_dialog")),
                          "text", &gtext);
    const gchar* text = g_value_get_string(&gtext);
    int modop;
    if (strcmp(text, "Add") == 0)
        modop = ADD;
    else if (strcmp(text, "Remove") == 0)
        modop = REMOVE;
    else modop = SET;

    if (!portfolio_modify_string(app.portfolio_string, symbol, amount, spent, modop)) // Success
        list_store_update();
}

void on_portfolio_modify_dialog_response(GtkDialog* dialog, gint response_id) {
    if (response_id == GTK_RESPONSE_CANCEL)
        gtk_widget_hide((GtkWidget*) dialog);
    else on_modify_entry_activate(NULL, NULL);
}

void on_password_entry_activate(GtkEntry* entry, gpointer dialog) {
    gtk_widget_hide((GtkWidget*) dialog);
    const gchar* password = gtk_entry_get_text(entry);
    if (password == NULL || strcmp(password, "") == 0)
        return;

    char modified_pw[PASS_MAX];
    sprintf(modified_pw, "%s\n", password); // See portfolio_write_encrypt_decrypt (rc4.c)
    rc4_encode_string(app.portfolio_string, modified_pw);

    if (!is_string_json_array(app.portfolio_string)) { // Wrong password
        // Reverse the failed decryption to its original state
        rc4_encode_string(app.portfolio_string, modified_pw);

        // Error dialog
        GValue gtext = G_VALUE_INIT;
        g_value_init(&gtext, G_TYPE_STRING);
        g_value_set_string(&gtext, "Wrong password!");
        GtkWidget* err_dialog = GTK_WIDGET(gtk_builder_get_object(
                app.builder, "generic_check_window_error_dialog"));
        g_object_set_property((GObject*) err_dialog, "text", &gtext);
        gtk_widget_show(err_dialog);
    } else  { // Correct password
        // Copy password to app
        strcpy(app.password, modified_pw);

        // Load portfolio
        on_load_button_clicked(NULL);
    }
}

void on_get_password_dialog_response(GtkDialog* dialog, gint response_id, gpointer entry) {
    if (response_id == GTK_RESPONSE_CANCEL)
        gtk_widget_hide((GtkWidget*) dialog);
    else on_password_entry_activate(entry, dialog);
}

void on_check_window_destroy(void) {
    g_object_unref(app.builder);
    if (app.portfolio_string != NULL) {
        if (app.password[0] != '\0')
            rc4_encode_string(app.portfolio_string, app.password);
        string_write_file(app.portfolio_string, portfolio_file_path);
    }
    string_destroy(&app.portfolio_string);
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

void list_store_update(void) {
    api_info_array_destroy(&app.portfolio_data);
    gtk_list_store_clear(GTK_LIST_STORE(gtk_builder_get_object(app.builder, "check_list")));
    check_list_create_from_string();
    if (app.portfolio_data != NULL) {
        api_info_array_store_check_data(app.portfolio_data);
        check_list_add_api_data();
    }
}