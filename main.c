#include <gtk/gtk.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    GtkWidget *window;
    GtkEntry *entry;
    GtkListBox *listbox;
    GtkButton *btn_install;
    GtkButton *btn_remove;
    GtkButton *btn_info;
    GtkButton *btn_check_updates;
    GtkButton *btn_upgrade;
    gboolean showing_installed;
    guint search_timeout_id;
} AppWidgets;

static GtkWidget* get_row_child(GtkListBoxRow *row) {
    GList *children = gtk_container_get_children(GTK_CONTAINER(row));
    GtkWidget *child = NULL;
    if (children != NULL) {
        child = GTK_WIDGET(children->data);
        g_list_free(children);
    }
    return child;
}


static gchar *run_cmd(const gchar *cmd) {
    FILE *fp = popen(cmd, "r");
    if (!fp) return g_strdup("ERROR");

    GString *result = g_string_new("");
    char buffer[512];
    while (fgets(buffer, sizeof(buffer), fp))
        g_string_append(result, buffer);

    pclose(fp);
    return g_string_free(result, FALSE);
}

static void on_upgrade_system_clicked(GtkButton *btn, gpointer user_data) {
    AppWidgets *a = user_data;
    GtkWidget *dialog = gtk_message_dialog_new(GTK_WINDOW(a->window),
        GTK_DIALOG_MODAL,
        GTK_MESSAGE_QUESTION,
        GTK_BUTTONS_YES_NO,
        "Are you sure you want to upgrade all packages?\nThis will run: sudo pacman -Syu");

    gint response = gtk_dialog_run(GTK_DIALOG(dialog));
    gtk_widget_destroy(dialog);

    if (response != GTK_RESPONSE_YES)
        return;

  
    system("pkexec pacman -Syu");
}


static void on_check_updates_clicked(GtkButton *btn, gpointer user_data) {
    AppWidgets *a = user_data;
    a->showing_installed = TRUE;

    gtk_list_box_invalidate_filter(GTK_LIST_BOX(a->listbox));
    gtk_list_box_invalidate_sort(GTK_LIST_BOX(a->listbox));
    gtk_list_box_invalidate_headers(GTK_LIST_BOX(a->listbox));

    GList *children = gtk_container_get_children(GTK_CONTAINER(a->listbox));
    for (GList *l = children; l != NULL; l = l->next)
        gtk_widget_destroy(GTK_WIDGET(l->data));
    g_list_free(children);

    char *output = run_cmd("pacman -Qu");
    if (!output || strlen(output) == 0) {
        GtkWidget *row = gtk_label_new("All packages are up to date.");
        gtk_list_box_insert(GTK_LIST_BOX(a->listbox), row, -1);
	gtk_widget_show_all(GTK_WIDGET(a->listbox));
        free(output);
        return;
    }

    char *line = strtok(output, "\n");
    while (line) {
        GtkWidget *row = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
        GtkWidget *check = gtk_check_button_new();
        GtkWidget *label = gtk_label_new(line);
        gtk_label_set_xalign(GTK_LABEL(label), 0);
        gtk_box_pack_start(GTK_BOX(row), check, FALSE, FALSE, 0);
        gtk_box_pack_start(GTK_BOX(row), label, TRUE, TRUE, 0);
        gtk_list_box_insert(GTK_LIST_BOX(a->listbox), row, -1);
        line = strtok(NULL, "\n");
    }

    gtk_widget_show_all(GTK_WIDGET(a->listbox));
    free(output);
}

static void clear_listbox(GtkListBox *listbox) {
    GList *children = gtk_container_get_children(GTK_CONTAINER(listbox));
    for (GList *iter = children; iter != NULL; iter = iter->next)
        gtk_widget_destroy(GTK_WIDGET(iter->data));
    g_list_free(children);
}

static void list_installed_packages(AppWidgets *a) {
    clear_listbox(a->listbox);
    gchar *output = run_cmd("pacman -Qq");
    gchar **lines = g_strsplit(output, "\n", -1);
    for (int i = 0; lines[i] && lines[i][0]; i++) {
        GtkWidget *row = gtk_label_new(lines[i]);
        gtk_list_box_insert(a->listbox, row, -1);
    }
    g_strfreev(lines);
    g_free(output);
    gtk_widget_show_all(GTK_WIDGET(a->listbox));
    a->showing_installed = TRUE;
    gtk_button_set_label(a->btn_install, "Install");
}

static void list_search_packages(AppWidgets *a, const gchar *term) {
    clear_listbox(a->listbox);
    if (term == NULL || strlen(term) == 0) {
        list_installed_packages(a);
        return;
    }

    char cmd[256];
    snprintf(cmd, sizeof(cmd), "pacman -Ss %s | head -n 100 | cut -d/ -f2 | cut -d' ' -f1", term);

    gchar *output = run_cmd(cmd);
    gchar **lines = g_strsplit(output, "\n", -1);
    for (int i = 0; lines[i] && lines[i][0]; i++) {
        GtkWidget *row = gtk_label_new(lines[i]);
        gtk_list_box_insert(a->listbox, row, -1);
    }
    g_strfreev(lines);
    g_free(output);

    gtk_widget_show_all(GTK_WIDGET(a->listbox));
    a->showing_installed = FALSE;
    gtk_button_set_label(a->btn_install, "Install");
}

static void show_info_window(GtkWindow *parent, const gchar *pkg, gboolean installed) {
    char cmd[256];
    if (installed)
        snprintf(cmd, sizeof(cmd), "pacman -Qi %s", pkg);
    else
        snprintf(cmd, sizeof(cmd), "pacman -Si %s", pkg);

    gchar *info = run_cmd(cmd);

    GtkWidget *dialog = gtk_dialog_new_with_buttons("Package Info",
        parent,
        GTK_DIALOG_MODAL | GTK_DIALOG_DESTROY_WITH_PARENT,
        "_Close", GTK_RESPONSE_CLOSE,
        NULL);

    GtkWidget *content_area = gtk_dialog_get_content_area(GTK_DIALOG(dialog));
    GtkWidget *scrolled = gtk_scrolled_window_new(NULL, NULL);
    gtk_widget_set_size_request(scrolled, 600, 400);
    gtk_container_add(GTK_CONTAINER(content_area), scrolled);

    GtkWidget *textview = gtk_text_view_new();
    gtk_text_view_set_editable(GTK_TEXT_VIEW(textview), FALSE);
    gtk_text_view_set_cursor_visible(GTK_TEXT_VIEW(textview), FALSE);
    gtk_container_add(GTK_CONTAINER(scrolled), textview);

    GtkTextBuffer *buffer = gtk_text_view_get_buffer(GTK_TEXT_VIEW(textview));
    gtk_text_buffer_set_text(buffer, info, -1);

    gtk_widget_show_all(dialog);

    g_signal_connect(dialog, "response", G_CALLBACK(gtk_widget_destroy), NULL);
    g_free(info);
}

static void on_info_clicked(GtkButton *btn, gpointer user_data) {
    AppWidgets *a = user_data;
    GtkListBoxRow *row = gtk_list_box_get_selected_row(a->listbox);
    if (!row) return;
    GtkWidget *label = get_row_child(row);
    const gchar *pkg = gtk_label_get_text(GTK_LABEL(label));
    show_info_window(GTK_WINDOW(a->window), pkg, a->showing_installed);
}

static void run_pacman_pkexec(const gchar *args) {
    char cmd[512];
    snprintf(cmd, sizeof(cmd), "pkexec bash -c 'pacman %s --noconfirm'", args);
    system(cmd);
}

static void on_remove_clicked(GtkButton *btn, gpointer user_data) {
    AppWidgets *a = user_data;
    if (!a->showing_installed) return; 

    GtkListBoxRow *row = gtk_list_box_get_selected_row(a->listbox);
    if (!row) return;

    GtkWidget *label = get_row_child(row);
    const gchar *pkg = gtk_label_get_text(GTK_LABEL(label));
    if (!pkg) return;

    
    GtkWidget *dialog = gtk_message_dialog_new(GTK_WINDOW(a->window),
        GTK_DIALOG_MODAL,
        GTK_MESSAGE_WARNING,
        GTK_BUTTONS_YES_NO,
        "Are you sure you want to REMOVE package '%s'?", pkg);

    gint response = gtk_dialog_run(GTK_DIALOG(dialog));
    gtk_widget_destroy(dialog);
    if (response != GTK_RESPONSE_YES) return;

    char args[128];
    snprintf(args, sizeof(args), "-R %s", pkg);
    run_pacman_pkexec(args);

    list_installed_packages(a);
}


static void on_install_clicked(GtkButton *btn, gpointer user_data) {
    AppWidgets *a = user_data;
    if (a->showing_installed) return; 

    GtkListBoxRow *row = gtk_list_box_get_selected_row(a->listbox);
    if (!row) return;

    GtkWidget *label = get_row_child(row);
    const gchar *pkg = gtk_label_get_text(GTK_LABEL(label));
    if (!pkg) return;

    char args[128];
    snprintf(args, sizeof(args), "-S %s", pkg);
    run_pacman_pkexec(args);

    gtk_entry_set_text(a->entry, "");
    list_installed_packages(a);
}

static gboolean delayed_search(gpointer user_data) {
    AppWidgets *a = user_data;
    const gchar *text = gtk_entry_get_text(a->entry);
    list_search_packages(a, text);
    a->search_timeout_id = 0;
    return G_SOURCE_REMOVE;
}

static void on_entry_changed(GtkEditable *editable, gpointer user_data) {
    AppWidgets *a = user_data;
    if (a->search_timeout_id != 0)
        g_source_remove(a->search_timeout_id);
    a->search_timeout_id = g_timeout_add(500, delayed_search, a);
}
/*
static void on_list_selection_changed(GtkListBox *box, gpointer user_data) {
    AppWidgets *a = user_data;
    GtkListBoxRow *row = gtk_list_box_get_selected_row(box);
    gboolean has_selection = true;
    gtk_widget_set_sensitive(GTK_WIDGET(a->btn_info), has_selection);
    gtk_widget_set_sensitive(GTK_WIDGET(a->btn_remove), has_selection);
    gtk_widget_set_sensitive(GTK_WIDGET(a->btn_install), has_selection);
}*/

int main(int argc, char *argv[]) {
    if (argc > 1 && strcmp(argv[1], "--uninstall") == 0) {
    const char *exec_path = g_getenv("HOME");
    if (!exec_path) exec_path = "~";

    char bin_path[512], icon_path[512], desktop_path[512];

    snprintf(bin_path, sizeof(bin_path), "%s/.local/bin/basteh", exec_path);
    snprintf(icon_path, sizeof(icon_path), "%s/.local/icons/basteh.png", exec_path);
    snprintf(desktop_path, sizeof(desktop_path), "%s/Desktop/Basteh.desktop", exec_path);

    printf("Uninstalling Basteh...\n");
    unlink(bin_path);
    unlink(icon_path);
    unlink(desktop_path);
    printf("Uninstallation complete.\n");
    printf("Goodbye :)");

    return 0;
    }

    gtk_init(&argc, &argv);
    AppWidgets *a = g_new0(AppWidgets, 1);

    a->window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(a->window), "Basteh");
    gtk_window_set_default_size(GTK_WINDOW(a->window), 600, 600);
    g_signal_connect(a->window, "destroy", G_CALLBACK(gtk_main_quit), NULL);
    gtk_window_set_icon_from_file(GTK_WINDOW(a->window), "~/.local/icons/basteh_minimal.jpg", NULL);

    GtkWidget *vbox = gtk_box_new(GTK_ORIENTATION_VERTICAL, 6);
    gtk_container_add(GTK_CONTAINER(a->window), vbox);

    a->entry = GTK_ENTRY(gtk_entry_new());
    gtk_entry_set_placeholder_text(a->entry, "Search packages...");
    gtk_box_pack_start(GTK_BOX(vbox), GTK_WIDGET(a->entry), FALSE, FALSE, 0);
    g_signal_connect(a->entry, "changed", G_CALLBACK(on_entry_changed), a);

    a->listbox = GTK_LIST_BOX(gtk_list_box_new());
    gtk_list_box_set_selection_mode(a->listbox, GTK_SELECTION_SINGLE);
    GtkWidget *scrolled = gtk_scrolled_window_new(NULL, NULL);
    gtk_scrolled_window_set_policy(GTK_SCROLLED_WINDOW(scrolled),
                                   GTK_POLICY_AUTOMATIC,
                                   GTK_POLICY_AUTOMATIC);
    gtk_container_add(GTK_CONTAINER(scrolled), GTK_WIDGET(a->listbox));
    gtk_box_pack_start(GTK_BOX(vbox), scrolled, TRUE, TRUE, 0);
   // g_signal_connect(a->listbox, "row-selected", G_CALLBACK(on_list_selection_changed), a);

    // Button box
    GtkWidget *btn_box = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_box_pack_start(GTK_BOX(vbox), btn_box, FALSE, FALSE, 0);
    GtkWidget *btn_box2 = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_box_pack_start(GTK_BOX(vbox), btn_box2, FALSE, FALSE, 0);

    a->btn_info = GTK_BUTTON(gtk_button_new_with_label("Info"));
    a->btn_remove = GTK_BUTTON(gtk_button_new_with_label("Remove"));
    a->btn_install = GTK_BUTTON(gtk_button_new_with_label("Install"));
    a->btn_check_updates = GTK_BUTTON(gtk_button_new_with_label("Check for Updates"));
    a->btn_upgrade = GTK_BUTTON(gtk_button_new_with_label("Upgrade System"));

    

    //gtk_widget_set_sensitive(GTK_WIDGET(a->btn_info), FALSE);
    //gtk_widget_set_sensitive(GTK_WIDGET(a->btn_remove), FALSE);
    //gtk_widget_set_sensitive(GTK_WIDGET(a->btn_install), FALSE);

    gtk_box_pack_start(GTK_BOX(btn_box), GTK_WIDGET(a->btn_info), TRUE, TRUE, 0);
    gtk_box_pack_start(GTK_BOX(btn_box), GTK_WIDGET(a->btn_remove), TRUE, TRUE, 0);
    gtk_box_pack_start(GTK_BOX(btn_box), GTK_WIDGET(a->btn_install), TRUE, TRUE, 0);
    gtk_box_pack_start(GTK_BOX(btn_box2), GTK_WIDGET(a->btn_check_updates), TRUE, TRUE, 0);
    gtk_box_pack_start(GTK_BOX(btn_box2), GTK_WIDGET(a->btn_upgrade), TRUE, TRUE, 0);


    g_signal_connect(a->btn_info, "clicked", G_CALLBACK(on_info_clicked), a);
    g_signal_connect(a->btn_remove, "clicked", G_CALLBACK(on_remove_clicked), a);
    g_signal_connect(a->btn_install, "clicked", G_CALLBACK(on_install_clicked), a);
    g_signal_connect(a->btn_check_updates, "clicked", G_CALLBACK(on_check_updates_clicked), a);
    g_signal_connect(a->btn_upgrade, "clicked", G_CALLBACK(on_upgrade_system_clicked), a);


    list_installed_packages(a);

    gtk_widget_show_all(a->window);
    gtk_main();

    g_free(a);
    return 0;
}

