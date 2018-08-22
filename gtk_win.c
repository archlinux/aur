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
    gtk_builder_add_from_file(app.builder, "/usr/share/tick/window_main.glade", NULL);

    // Copy names of columns into array
    GtkTreeView* tree_view = GTK_TREE_VIEW(GET_OBJECT("check_tree_view"));
    for (gint i = 0; i < NUM_COLS; i++)
        strcpy(column_names[i], gtk_tree_view_column_get_title(gtk_tree_view_get_column(
                tree_view, i)));

    // Connect signals
    gtk_builder_connect_signals(app.builder, NULL);

    // Show check window as default opening window
    gtk_widget_show(GTK_WIDGET(GET_OBJECT("check_window")));
    gtk_main(); // Main loop
}

void check_list_create_from_string(void) {
    GtkListStore* pListStore = GTK_LIST_STORE(GET_OBJECT("check_list"));
    gtk_list_store_clear(pListStore); // Clear in case reloading
    api_info_array_destroy(&app.portfolio_data); // Destroy in case reloading
    app.portfolio_data = portfolio_info_array_init_from_portfolio_string(app.portfolio_string);
    if (app.portfolio_data == NULL) // Empty JSON array
        return;

    format_cells(app.portfolio_data);
    Info* idx; // Append pListStore store with portfolio data
    GtkTreeIter iter;
    for (size_t i = 0; i < app.portfolio_data->length + 1; i++) { // + 1 for totals
        gtk_list_store_append(pListStore, &iter);
        if (i == app.portfolio_data->length) { // On last iteration, set Info* to totals
            idx = app.portfolio_data->totals;
        } else {                               // Otherwise set Info* to array[i]
            idx = app.portfolio_data->array[i];
            // Set amount for securities, but not totals
            gtk_list_store_set(pListStore, &iter, AMOUNT, idx->famount, -1);
        }
        gtk_list_store_set(pListStore, &iter, SYMBOL, idx->symbol, SPENT, idx->ftotal_spent, -1);
    }
}

void check_list_add_api_data(void) {
    GtkListStore* pListStore = GTK_LIST_STORE(GET_OBJECT("check_list"));
    format_cells(app.portfolio_data);
    Info* idx;
    GtkTreeIter iter;
    for (size_t i = 0; i < app.portfolio_data->length + 1; i++) { // + 1 for totals
        if (i == app.portfolio_data->length) // On last iteration, set Info* to totals
            idx = app.portfolio_data->totals;
        else idx = app.portfolio_data->array[i]; // Otherwise set Info* to array[i]
        if (i == 0) // Get first iterator
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
    // If already loaded, do nothing
    if (app.portfolio_string != NULL && is_string_json_array(app.portfolio_string)
        && app.portfolio_data != NULL)
        return;

    // If file not loaded, load it
    if (app.portfolio_string == NULL) {
        // Touch file to get a valid String if file doesn't exist
        FILE* fp = fopen(portfolio_file_path, "a");
        if (fp)
            fclose(fp);

        // Will be String with length 0 on new portfolio
        app.portfolio_string = file_get_string(portfolio_file_path);

        // Error reading file
        if (app.portfolio_string == NULL) {
            show_generic_message_dialog(
                    "There was an error opening your portfolio file. This may be due"
                    " to invalid permissions on the file.", FALSE);
            return;
        }
    }

    // On new portfolio, create empty JSON array and return
    if (app.portfolio_string->len == 0) {
        Json* jobj = json_object_new_array();
        const char* str = json_object_get_string(jobj);
        app.portfolio_string->len = strlen(str);
        app.portfolio_string->data = realloc(app.portfolio_string->data, app
                .portfolio_string->len + 1);
        strcpy(app.portfolio_string->data, str);
        json_object_put(jobj);

        // Enable encrypt button
        GtkButton* lock_button = GTK_BUTTON(GET_OBJECT("lock_button"));
        gtk_widget_set_sensitive(GTK_WIDGET(lock_button), TRUE); // Make button clickable
        gtk_button_set_label(lock_button, "Encrypt");
        return;
    }

    // If file is not a JSON array (encrypted), show password dialog and return
    if (!is_string_json_array(app.portfolio_string)) {
        gtk_entry_set_text(GTK_ENTRY(GET_OBJECT("password_entry")), "");
        gtk_widget_show(GTK_WIDGET(GET_OBJECT("get_password_dialog")));// Decode
        return;
    }

    // Destroy and create a new Info_Array with portfolio and api data
    api_info_array_destroy(&app.portfolio_data);
    app.portfolio_data = portfolio_info_array_init_from_portfolio_string(app.portfolio_string);
    if (app.portfolio_data != NULL) { // If file is not a length 0 JSON array
        check_list_create_from_string();
        api_info_array_store_data_batch(app.portfolio_data, CHECK);
        check_list_add_api_data();
    }

    GtkButton* lock_button = GTK_BUTTON(GET_OBJECT("lock_button"));
    gtk_widget_set_sensitive(GTK_WIDGET(lock_button), TRUE); // Make button clickable
    gtk_widget_set_sensitive(GTK_WIDGET(GET_OBJECT("add_button")), TRUE);
    gtk_widget_set_sensitive(GTK_WIDGET(GET_OBJECT("remove_button")), TRUE);
    gtk_widget_set_sensitive(GTK_WIDGET(GET_OBJECT("set_button")), TRUE);
    if (app.password[0] == '\0') // Plaintext
        gtk_button_set_label(lock_button, "Encrypt");
    else gtk_button_set_label(lock_button, "Decrypt");
}

void on_lock_button_clicked(GtkButton* button) {
    if (strcmp(gtk_button_get_label(button), "Encrypt") == 0) {
        // Reset entries
        gtk_entry_set_text(GTK_ENTRY(GET_OBJECT("set_password_entry1")), "");
        gtk_entry_set_text(GTK_ENTRY(GET_OBJECT("set_password_entry2")), "");
        gtk_widget_show(GTK_WIDGET(GET_OBJECT("set_password_dialog")));
        // Focus first entry
        gtk_widget_grab_focus(GTK_WIDGET(GET_OBJECT("set_password_entry1")));
    } else {
        // Reset entry
        gtk_entry_set_text(GTK_ENTRY(GET_OBJECT("decrypt_password_entry")), "");
        gtk_widget_show(GTK_WIDGET(GET_OBJECT("decrypt_dialog")));
    }
}

void on_set_password_dialog_response(GtkDialog* dialog, gint response_id) {
    if (response_id == GTK_RESPONSE_CANCEL)
        gtk_widget_hide(GTK_WIDGET(dialog));
    if (response_id == GTK_RESPONSE_OK)
        on_set_password_entry_activate(NULL);
}

void on_set_password_entry_activate(GtkEntry* entry) {
    GtkEntry* pass = GTK_ENTRY(GET_OBJECT("set_password_entry1"));
    GtkEntry* pass_check = GTK_ENTRY(GET_OBJECT("set_password_entry2"));
    const gchar* pass_str = gtk_entry_get_text(pass);
    const gchar* pass_check_str = gtk_entry_get_text(pass_check);

    // Return on empty entry
    if (pass_str[0] == '\0' || pass_check_str[0] == '\0')
        return;

    if (strlen(pass_str) < 6 || strlen(pass_str) > 30) // Too short or too long password
        show_generic_message_dialog("Your password must be between 6 and 30 characters.", FALSE);
    else if (strcmp(pass_str, pass_check_str) != 0) // Passwords not matching
        show_generic_message_dialog("Your passwords did not match.", FALSE);
    else { // If passwords match
        sprintf(app.password, "%s\n", pass_str);
        gtk_button_set_label(GTK_BUTTON(GET_OBJECT("lock_button")), "Decrypt");
        show_generic_message_dialog("Success! Your portfolio will be encrypted when you close the "
                                    "program.", TRUE);
    }
    gtk_widget_hide(GTK_WIDGET(GET_OBJECT("set_password_dialog")));
}

void on_decrypt_dialog_response(GtkDialog* dialog, gint response_id) {
    if (response_id == GTK_RESPONSE_OK)
        on_decrypt_password_entry_activate(NULL);
    else gtk_widget_hide(GTK_WIDGET(dialog));
}

void on_decrypt_password_entry_activate(GtkEntry* entry) {
    const gchar* pass = gtk_entry_get_text(GTK_ENTRY(GET_OBJECT("decrypt_password_entry")));

    // Return on empty entry
    if (pass[0] == '\0')
        return;

    gchar mod_pass[strlen(pass) + 2];
    sprintf(mod_pass, "%s\n", pass);
    if (strcmp(app.password, mod_pass) == 0) { // Success
        memset(app.password, '\0', PASS_MAX); // Overwrite password with null chars
        // Change button label to Encrypt
        gtk_button_set_label(GTK_BUTTON(GET_OBJECT("lock_button")), "Encrypt");
        show_generic_message_dialog("Successfully decrypted.", TRUE);
    } else show_generic_message_dialog("Wrong password!", FALSE);
    gtk_widget_hide(GTK_WIDGET(GET_OBJECT("decrypt_dialog")));
}

void on_modify_button_clicked(GtkButton* button) {
    if (app.portfolio_string == NULL) { // Trying to modify portfolio which hasn't been loaded
        show_generic_message_dialog("Your portfolio hasn't been loaded yet. Click the button Load "
                                    "Portfolio to the left.", FALSE);
        return;
    }

    // Clear entries
    gtk_entry_set_text(GTK_ENTRY(GET_OBJECT("modify_symbol_entry")), "");
    gtk_entry_set_text(GTK_ENTRY(GET_OBJECT("modify_amount_entry")), "");
    gtk_entry_set_text(GTK_ENTRY(GET_OBJECT("modify_spent_entry")), "");
    // Change message of modify to Add, Remove, or Set depending on which button was clicked
    GtkWidget* dialog = GTK_WIDGET(GET_OBJECT("portfolio_modify_dialog"));
    g_object_set_text(G_OBJECT(dialog), gtk_button_get_label(button));
    gtk_widget_show(dialog);
    // Focus first entry
    gtk_widget_grab_focus(GTK_WIDGET(GET_OBJECT("modify_symbol_entry")));
}

void on_modify_entry_activate(GtkEntry* entry) {
    GtkEntry* symbol_entry = GTK_ENTRY(GET_OBJECT("modify_symbol_entry"));
    GtkEntry* amount_entry = GTK_ENTRY(GET_OBJECT("modify_amount_entry"));
    GtkEntry* spent_entry = GTK_ENTRY(GET_OBJECT("modify_spent_entry"));
    // Get three fields
    const gchar* gsymbol = gtk_entry_get_text(symbol_entry);
    char symbol[strlen(gsymbol) + 1];
    strcpy(symbol, gsymbol);
    strtoupper(symbol);
    const gchar* amount_str = gtk_entry_get_text(amount_entry);
    const gchar* spent_str = gtk_entry_get_text(spent_entry);

    // Return on empty entry
    if (symbol[0] == '\0' || !is_str_number(amount_str) || !is_str_number(spent_str))
        return;

    double amount = strtod(amount_str, NULL);
    double spent = strtod(spent_str, NULL);

    GValue gtext = G_VALUE_INIT;
    g_value_init(&gtext, G_TYPE_STRING);
    g_object_get_property(G_OBJECT(GET_OBJECT("portfolio_modify_dialog")), "text", &gtext);
    // Get text from dialog to determine whether adding, removing, or setting
    const gchar* text = g_value_get_string(&gtext);
    int modop;
    if (strcmp(text, "Add") == 0)
        modop = ADD;
    else if (strcmp(text, "Remove") == 0)
        modop = REMOVE;
    else modop = SET;

    // On successful modification, update portfolio
    if (!portfolio_modify_string(app.portfolio_string, symbol, amount, spent * amount, modop))
        list_store_update();
    else show_generic_message_dialog("Invalid symbol or arguments.", FALSE);
    gtk_widget_hide(GTK_WIDGET(GET_OBJECT("portfolio_modify_dialog")));
}

void on_portfolio_modify_dialog_response(GtkDialog* dialog, gint response_id) {
    if (response_id == GTK_RESPONSE_OK)
        on_modify_entry_activate(NULL);
    else gtk_widget_hide(GTK_WIDGET(dialog));
}

void on_password_entry_activate(GtkEntry* entry) {
    const gchar* password = gtk_entry_get_text(GTK_ENTRY(GET_OBJECT("password_entry")));
    if (strcmp(password, "") == 0) // Return if NULL or empty entry text
        return;

    gtk_widget_hide(GTK_WIDGET(GET_OBJECT("get_password_dialog")));
    char modified_pw[strlen(password) + 2];
    sprintf(modified_pw, "%s\n", password);
    rc4_encode_string(app.portfolio_string, modified_pw); // Encode String

    if (!is_string_json_array(app.portfolio_string)) { // Wrong password
        // Reverse the failed decryption to its original state and show error dialog
        rc4_encode_string(app.portfolio_string, modified_pw);
        show_generic_message_dialog("Wrong password!", FALSE);
    } else  { // Correct password
        // Copy password to app
        strcpy(app.password, modified_pw);

        // Reload portfolio
        on_load_button_clicked(NULL);
    }
}

void on_get_password_dialog_response(GtkDialog* dialog, gint response_id) {
    if (response_id == GTK_RESPONSE_OK)
        on_password_entry_activate(NULL);
    else gtk_widget_hide(GTK_WIDGET(dialog));
}

void on_check_window_destroy(void) {
    g_object_unref(app.builder); // Free GTK data
    if (app.portfolio_string != NULL) { // If loaded portfolio
        if (app.password[0] != '\0') // If set password, encrypt data
            rc4_encode_string(app.portfolio_string, app.password);

        // Write potentially modified and/or encrypted portfolio to file
        string_write_file(app.portfolio_string, portfolio_file_path);
    }

    // Destroy String and Info_Array and exit main GTK loop
    string_destroy(&app.portfolio_string);
    api_info_array_destroy(&app.portfolio_data);
    gtk_main_quit();
}

void on_column_clicked(GtkTreeViewColumn* column, GtkListStore* list_store) {
    Col_Index idx = SYMBOL;
    for (Col_Index i = AMOUNT; i < NUM_COLS; i++) // Determine which column was clicked
        if (strcmp(gtk_tree_view_column_get_title(column), column_names[i]) == 0)
            idx = i;

    // Sort based on the column
    list_store_sort(list_store, idx);
}

void on_check_tree_view_row_activated(GtkTreeView* tree_view, GtkTreePath* path,
                                      GtkTreeViewColumn* column) {
    GtkContainer* window = GTK_CONTAINER(GET_OBJECT("check_window"));
    gtk_container_remove(window, GTK_WIDGET(GET_OBJECT("check_pane")));
    gtk_container_add(window, GTK_WIDGET(GET_OBJECT("info_pane")));

    GtkTreeIter iter;
    GtkTreeModel* model = GTK_TREE_MODEL(GET_OBJECT("check_list"));
    gtk_tree_model_get_iter(model, &iter, path);
    gchar* symbol;
    gtk_tree_model_get(model, &iter, SYMBOL, &symbol, -1);

    Info* pInfo = info_array_get_info_from_symbol(app.portfolio_data, symbol);
    if (pInfo->api_provider != IEX) // Only see info for iex securities
        return;

    if (pInfo->name[0] == '\0') {// MISC not loaded yet
        api_info_store_data_batch(pInfo, MISC);
        format_cells(pInfo->peers);
    }

    info_pane_populate_all(pInfo);
    g_free(symbol);
}

void on_info_back_button_clicked(GtkButton* button) {
    GtkContainer* window = GTK_CONTAINER(GET_OBJECT("check_window"));
    gtk_container_remove(window, GTK_WIDGET(GET_OBJECT("info_pane")));
    gtk_container_add(window, GTK_WIDGET(GET_OBJECT("check_pane")));
}

void format_cells(Info_Array* portfolio_data) {
    Info* idx;
    for (size_t i = 0; i < portfolio_data->length + 1; i++) { // +1 for totals
        if (i == portfolio_data->length) // On last iteration, set idx to totals
            idx = portfolio_data->totals;
        else idx = portfolio_data->array[i];

        // Round strings to two decimal places
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
    GtkTreeModel* model = GTK_TREE_MODEL(list_store);
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
            // Store symbols in sym1 and sym2 to make sure not totals
            gtk_tree_model_get(model, &iter1, SYMBOL, &sym1, -1);
            gtk_tree_model_get(model, &iter2, SYMBOL, &sym2, -1);

            // Don't sort TOTALS
            if (strcmp(sym1, "TOTALS") != 0 && strcmp(sym2, "TOTALS") != 0) {
                // Get the value from idx
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
        } while (gtk_tree_model_iter_next(model, &iter1) && // Get next until it returns FALSE
                 gtk_tree_model_iter_next(model, &iter2));
    }
}

void list_store_update(void) {
    // Recreate Info_Array
    check_list_create_from_string(); // Will set app.portfolio_data if success
    if (app.portfolio_data != NULL) {
        api_info_array_store_data_batch(app.portfolio_data, CHECK);
        check_list_add_api_data();
    }
}

void info_pane_populate_all(const Info* pInfo) {
    info_pane_populate_header(pInfo);
    info_pane_populate_company(pInfo);
    info_pane_populate_peers(pInfo);
}

void info_pane_populate_header(const Info* pInfo) {
    GtkLabel* symbol_label = GTK_LABEL(GET_OBJECT("info_header_symbol_label"));
    GtkLabel* name_label = GTK_LABEL(GET_OBJECT("info_header_name_label"));
    GtkLabel* date_label = GTK_LABEL(GET_OBJECT("info_header_date_label"));
    GtkLabel* percent_24H_label = GTK_LABEL(GET_OBJECT("info_header_24H_change_label"));
    GtkLabel* percent_7D_label = GTK_LABEL(GET_OBJECT("info_header_7D_change_label"));
    GtkLabel* percent_30D_label = GTK_LABEL(GET_OBJECT("info_header_30D_change_label"));

    gchar date_string[DATE_MAX_LENGTH];
    if (pInfo->intraday_time != EMPTY) {
        time_t time = pInfo->intraday_time;
        struct tm* ts = localtime(&time);
        strftime(date_string, DATE_MAX_LENGTH, "%F %T", ts);
    } else date_string[0] = '\0';

    gtk_label_set_label(symbol_label, pInfo->symbol);
    gtk_label_set_label(name_label, pInfo->name);
    gtk_label_set_label(date_label, date_string);
    gtk_label_set_label(percent_24H_label, pInfo->fprofit_last_close_percent);
    gtk_label_set_label(percent_7D_label, pInfo->fprofit_7d_percent);
    gtk_label_set_label(percent_30D_label, pInfo->fprofit_30d_percent);
}

void info_pane_populate_company(const Info* pInfo) {
    gchar revenue[32], cash[32], marketcap[32], pe_ratio[32], gross_profit[32], debt[32],
    volume[32], div_yield[32];
    sprintf(revenue, "%ld", pInfo->revenue);
    sprintf(cash, "%ld", pInfo->cash);
    sprintf(marketcap, "%ld", pInfo->cash);
    sprintf(pe_ratio, "%lf", pInfo->pe_ratio);
    sprintf(gross_profit, "%ld", pInfo->gross_profit);
    sprintf(debt, "%ld", pInfo->debt);
    sprintf(volume, "%ld", pInfo->volume_1d);
    sprintf(div_yield, "%lf", pInfo->div_yield);

    gtk_label_set_label(GTK_LABEL(GET_OBJECT("info_description_label")), pInfo->description);
    gtk_label_set_label(GTK_LABEL(GET_OBJECT("info_ceo_label")), pInfo->ceo);
    gtk_label_set_label(GTK_LABEL(GET_OBJECT("info_sector_label")), pInfo->sector);

    if (pInfo->revenue != EMPTY)
        gtk_label_set_label(GTK_LABEL(GET_OBJECT("info_revenue_label")), revenue);
    if (pInfo->cash != EMPTY)
        gtk_label_set_label(GTK_LABEL(GET_OBJECT("info_cash_label")), cash);
    if (pInfo->marketcap != EMPTY)
        gtk_label_set_label(GTK_LABEL(GET_OBJECT("info_market_cap_label")), marketcap);
    if (pInfo->pe_ratio != EMPTY)
        gtk_label_set_label(GTK_LABEL(GET_OBJECT("info_pe_ratio_label")), pe_ratio);

    gtk_label_set_label(GTK_LABEL(GET_OBJECT("info_website_label")), pInfo->website);
    gtk_label_set_label(GTK_LABEL(GET_OBJECT("info_industry_label")), pInfo->industry);

    if (pInfo->gross_profit != EMPTY)
        gtk_label_set_label(GTK_LABEL(GET_OBJECT("info_gross_profit_label")), gross_profit);
    if (pInfo->debt != EMPTY)
        gtk_label_set_label(GTK_LABEL(GET_OBJECT("info_debt_label")), debt);
    if (pInfo->volume_1d != EMPTY)
        gtk_label_set_label(GTK_LABEL(GET_OBJECT("info_volume_label")), volume);
    if (pInfo->div_yield != EMPTY)
        gtk_label_set_label(GTK_LABEL(GET_OBJECT("info_div_yield_label")), div_yield);

    gchar period_label_name[32];
    strcpy(period_label_name, "info_fiscal_period_label");
    size_t len = strlen(period_label_name);
    for (int i = 0; i < QUARTERS && pInfo->fiscal_period[i][0] != '\0'; i++) {
        sprintf(&period_label_name[len], "%d", i + 1);
        gtk_label_set_label(GTK_LABEL(GET_OBJECT(period_label_name)), pInfo->fiscal_period[i]);
    }

    gchar eps_label_name[32], eps[16];
    strcpy(eps_label_name, "info_eps_label");
    len = strlen(eps_label_name);
    for (int i = 0; i < QUARTERS && pInfo->eps[i] != EMPTY; i++) {
        sprintf(&eps_label_name[len], "%d", i + 1);
        sprintf(eps, "%.2lf", pInfo->eps[i]);
        gtk_label_set_label(GTK_LABEL(GET_OBJECT(eps_label_name)), eps);
    }

    gchar eps_1y_label_name[32];
    strcpy(eps_1y_label_name, "info_eps_previous_label");
    len = strlen(eps_1y_label_name);
    for (int i = 0; i < QUARTERS && pInfo->eps_year_ago[i] != EMPTY; i++) {
        sprintf(&eps_1y_label_name[len], "%d", i + 1);
        sprintf(eps, "%.2lf", pInfo->eps_year_ago[i]);
        gtk_label_set_label(GTK_LABEL(GET_OBJECT(eps_1y_label_name)), eps);
    }
}

void info_pane_populate_peers(const Info* pInfo) {
    GtkListStore* pListStore = GTK_LIST_STORE(GET_OBJECT("peers_list"));
    gtk_list_store_clear(pListStore);

    Info* idx; // Append pListStore store with portfolio data
    GtkTreeIter iter;
    for (size_t i = 0; i < pInfo->peers->length; i++) {
        gtk_list_store_append(pListStore, &iter);
        idx = pInfo->peers->array[i];
        gtk_list_store_set(pListStore, &iter,
                           PEER_COLUMN_SYMBOL, idx->symbol,
                           PEER_COLUMN_PROFIT_24H_PERCENT, idx->fprofit_last_close_percent,
                           PEER_COLUMN_PROFIT_7D_PERCENT, idx->fprofit_7d_percent,
                           PEER_COLUMN_PROFIT_30D_PERCENT, idx->fprofit_30d_percent, -1);
    }
}

void show_generic_message_dialog(const char* message, gboolean success) {
    char widget_name[64];
    if (success)
        strcpy(widget_name, "generic_check_window_success_dialog");
    else strcpy(widget_name, "generic_check_window_error_dialog");
    GtkWidget* dialog = GTK_WIDGET(GET_OBJECT(widget_name));
    g_object_set_text(G_OBJECT(dialog), message);
    gtk_widget_show(dialog);
}

void g_object_set_text(GObject* object, const gchar* text) {
    GValue gtext = G_VALUE_INIT;
    g_value_init(&gtext, G_TYPE_STRING);
    g_value_set_string(&gtext, text);
    g_object_set_property(object, "text", &gtext);
}