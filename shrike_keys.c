#include <gtk/gtk.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#ifndef DATADIR
#define DATADIR "."
#endif

static GtkWidget *pgp_name_entry;
static GtkWidget *pgp_email_entry;
static GtkWidget *pgp_comment_entry;
static GtkWidget *pgp_pass_entry;
static GtkWidget *pgp_expire_entry;
static GtkWidget *pgp_sign_entry;
static GtkWidget *pgp_status_label;
static GtkWidget *pgp_key_combo;
static gchar *fingerprint_str = NULL;

static GtkWidget *ssh_email_entry;
static GtkWidget *ssh_path_entry;
static GtkWidget *ssh_pass_entry;
static GtkWidget *ssh_overwrite_check;
static GtkWidget *ssh_status_label;

static gchar* execute_command(const gchar *command) {
    FILE *fp;
    char buffer[1024];
    gchar *output = g_strdup("");
    fp = popen(command, "r");
    if (fp == NULL) return g_strdup("Failed to run command.\n");
    while (fgets(buffer, sizeof(buffer), fp) != NULL) {
        gchar *temp = g_strconcat(output, buffer, NULL);
        g_free(output);
        output = temp;
    }
    pclose(fp);
    return output;
}

static gchar* prompt_passphrase(GtkWindow *parent,
                                 const gchar *key_uid,
                                 const gchar *key_algo,
                                 const gchar *key_id,
                                 const gchar *key_date) {

    GtkWidget *dialog = gtk_dialog_new_with_buttons(
        "OpenPGP Key Authentication",
        parent,
        GTK_DIALOG_MODAL | GTK_DIALOG_DESTROY_WITH_PARENT,
        "_Cancel", GTK_RESPONSE_CANCEL,
        "_OK", GTK_RESPONSE_OK,
        NULL);

    gtk_window_set_default_size(GTK_WINDOW(dialog), 460, 310);
    gtk_window_set_position(GTK_WINDOW(dialog), GTK_WIN_POS_CENTER_ON_PARENT);
    gtk_window_set_resizable(GTK_WINDOW(dialog), FALSE);
    gtk_dialog_set_default_response(GTK_DIALOG(dialog), GTK_RESPONSE_OK);

    GtkWidget *content_area = gtk_dialog_get_content_area(GTK_DIALOG(dialog));
    gtk_container_set_border_width(GTK_CONTAINER(content_area), 18);
    gtk_box_set_spacing(GTK_BOX(content_area), 6);

    gchar *lock_path = g_build_filename(DATADIR, "lock.svg", NULL);
    GtkWidget *lock_img = gtk_image_new_from_file(lock_path);
    g_free(lock_path);
    gtk_widget_set_halign(lock_img, GTK_ALIGN_CENTER);
    gtk_widget_set_margin_bottom(lock_img, 4);
    gtk_box_pack_start(GTK_BOX(content_area), lock_img, FALSE, FALSE, 0);

    GtkWidget *ttl1 = gtk_label_new(NULL);
    gtk_label_set_markup(GTK_LABEL(ttl1),
        "<span font_desc=\"11\" weight=\"bold\">Please enter the passphrase to unlock</span>");
    gtk_widget_set_halign(ttl1, GTK_ALIGN_CENTER);
    gtk_box_pack_start(GTK_BOX(content_area), ttl1, FALSE, FALSE, 0);

    GtkWidget *ttl2 = gtk_label_new(NULL);
    gtk_label_set_markup(GTK_LABEL(ttl2),
        "<span font_desc=\"11\" weight=\"bold\">the OpenPGP key</span>");
    gtk_widget_set_halign(ttl2, GTK_ALIGN_CENTER);
    gtk_box_pack_start(GTK_BOX(content_area), ttl2, FALSE, FALSE, 0);

    GtkWidget *det_box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 2);
    gtk_widget_set_margin_top(det_box, 10);
    gtk_widget_set_margin_bottom(det_box, 10);
    gtk_box_pack_start(GTK_BOX(content_area), det_box, FALSE, FALSE, 0);

    GtkWidget *uid_lbl = gtk_label_new(NULL);
    if (key_uid && strlen(key_uid) > 0) {
        gchar *m = g_strdup_printf("<span font_desc=\"10\">%s</span>", key_uid);
        gtk_label_set_markup(GTK_LABEL(uid_lbl), m);
        g_free(m);
    } else {
        gtk_label_set_markup(GTK_LABEL(uid_lbl), "<span font_desc=\"10\">Unknown key</span>");
    }
    gtk_widget_set_halign(uid_lbl, GTK_ALIGN_CENTER);
    gtk_box_pack_start(GTK_BOX(det_box), uid_lbl, FALSE, FALSE, 0);

    GtkWidget *type_lbl = gtk_label_new(NULL);
    if (key_algo && key_id && strlen(key_algo) > 0 && strlen(key_id) > 0) {
        gchar *m = g_strdup_printf("<span font_desc=\"10\">%s key, ID %s</span>", key_algo, key_id);
        gtk_label_set_markup(GTK_LABEL(type_lbl), m);
        g_free(m);
    } else {
        gtk_label_set_markup(GTK_LABEL(type_lbl), "<span font_desc=\"10\">Key details unavailable</span>");
    }
    gtk_widget_set_halign(type_lbl, GTK_ALIGN_CENTER);
    gtk_box_pack_start(GTK_BOX(det_box), type_lbl, FALSE, FALSE, 0);

    if (key_date && strlen(key_date) > 0) {
        GtkWidget *date_lbl = gtk_label_new(NULL);
        gchar *m = g_strdup_printf("<span font_desc=\"10\">Created %s</span>", key_date);
        gtk_label_set_markup(GTK_LABEL(date_lbl), m);
        g_free(m);
        gtk_widget_set_halign(date_lbl, GTK_ALIGN_CENTER);
        gtk_box_pack_start(GTK_BOX(det_box), date_lbl, FALSE, FALSE, 0);
    }

    GtkWidget *sep = gtk_separator_new(GTK_ORIENTATION_HORIZONTAL);
    gtk_widget_set_margin_top(sep, 4);
    gtk_widget_set_margin_bottom(sep, 4);
    gtk_box_pack_start(GTK_BOX(content_area), sep, FALSE, FALSE, 0);

    GtkWidget *pass_row = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 8);
    gtk_box_pack_start(GTK_BOX(content_area), pass_row, FALSE, FALSE, 0);

    GtkWidget *plbl = gtk_label_new("Passphrase:");
    gtk_box_pack_start(GTK_BOX(pass_row), plbl, FALSE, FALSE, 0);

    GtkWidget *pentry = gtk_entry_new();
    gtk_entry_set_visibility(GTK_ENTRY(pentry), FALSE);
    gtk_entry_set_activates_default(GTK_ENTRY(pentry), TRUE);
    gtk_entry_set_width_chars(GTK_ENTRY(pentry), 30);
    gtk_box_pack_start(GTK_BOX(pass_row), pentry, TRUE, TRUE, 0);

    gtk_widget_show_all(dialog);
    gtk_widget_grab_focus(pentry);

    gchar *result = NULL;
    gint resp = gtk_dialog_run(GTK_DIALOG(dialog));

    if (resp == GTK_RESPONSE_OK) {
        const char *txt = gtk_entry_get_text(GTK_ENTRY(pentry));
        if (txt && *txt) result = g_strdup(txt);
    }

    gtk_widget_destroy(dialog);
    return result;
}

static void on_pgp_generate_clicked(GtkButton *button, gpointer user_data) {
    const gchar *name = gtk_entry_get_text(GTK_ENTRY(pgp_name_entry));
    const gchar *email = gtk_entry_get_text(GTK_ENTRY(pgp_email_entry));
    const gchar *comment = gtk_entry_get_text(GTK_ENTRY(pgp_comment_entry));
    const gchar *pass = gtk_entry_get_text(GTK_ENTRY(pgp_pass_entry));
    const gchar *expire = gtk_entry_get_text(GTK_ENTRY(pgp_expire_entry));

    if (!strlen(name) || !strlen(email) || !strlen(pass)) {
        gtk_label_set_text(GTK_LABEL(pgp_status_label), "Error: Name, Email, and Passphrase are required.");
        return;
    }

    gchar *batch_filename = g_build_filename(g_get_tmp_dir(), "gpg_batch_XXXXXX", NULL);
    int fd = g_mkstemp(batch_filename);
    if (fd == -1) {
        gtk_label_set_text(GTK_LABEL(pgp_status_label), "Error: Could not create temp file.");
        g_free(batch_filename);
        return;
    }

    FILE *fp = fdopen(fd, "w");
    fprintf(fp, "%%echo Generating PGP key\n");
    fprintf(fp, "Key-Type: RSA\nKey-Length: 4096\nKey-Usage: sign\n");
    fprintf(fp, "Subkey-Type: RSA\nSubkey-Length: 4096\nSubkey-Usage: encrypt\n");
    fprintf(fp, "Name-Real: %s\n", name);
    if (strlen(comment)) fprintf(fp, "Name-Comment: %s\n", comment);
    fprintf(fp, "Name-Email: %s\n", email);
    fprintf(fp, "Expire-Date: %s\nPassphrase: %s\n%%commit\n%%echo Done\n", strlen(expire) ? expire : "0", pass);
    fclose(fp);

    gtk_label_set_text(GTK_LABEL(pgp_status_label), "Generating PGP key... This may take a moment.");

    gchar *cmd = g_strdup_printf("gpg --batch --generate-key %s 2>&1", batch_filename);
    gchar *output = execute_command(cmd);
    remove(batch_filename);
    g_free(batch_filename);
    g_free(cmd);

    cmd = g_strdup_printf("gpg --list-secret-keys --with-colons --with-fingerprint %s 2>&1", email);
    gchar *gpg_output = execute_command(cmd);
    g_free(cmd);

    gchar *found_fpr = NULL;
    gchar **lines = g_strsplit(gpg_output, "\n", -1);
    for (int i = 0; lines[i] != NULL; i++) {
        gchar **fields = g_strsplit(lines[i], ":", -1);
        gint nfields = g_strv_length(fields);
        if (nfields >= 10 && g_strcmp0(fields[0], "fpr") == 0) {
            g_free(found_fpr);
            found_fpr = g_strdup(fields[9]);
        }
        g_strfreev(fields);
    }
    g_strfreev(lines);

    if (found_fpr) {
        g_free(fingerprint_str);
        fingerprint_str = found_fpr;
        gchar *message = g_strdup_printf("Key Generated Successfully!\nFingerprint: %s\n\nOutput:\n%s", fingerprint_str, output);
        gtk_label_set_text(GTK_LABEL(pgp_status_label), message);
        g_free(message);
    } else {
        gchar *message = g_strdup_printf("Key generated, but failed to parse fingerprint.\n\nGPG Output:\n%s\n%s", gpg_output, output);
        gtk_label_set_text(GTK_LABEL(pgp_status_label), message);
        g_free(message);
    }
    g_free(output);
    g_free(gpg_output);
}

static void on_pgp_upload_clicked(GtkButton *button, gpointer user_data) {
    if (!fingerprint_str || strlen(fingerprint_str) < 8) {
        gtk_label_set_text(GTK_LABEL(pgp_status_label), "Error: No valid fingerprint found. Generate a key first.");
        return;
    }
    gtk_label_set_text(GTK_LABEL(pgp_status_label), "Uploading public key to keys.openpgp.org...");
    gchar *cmd = g_strdup_printf("gpg --keyserver keys.openpgp.org --send-keys %s 2>&1", fingerprint_str);
    gchar *output = execute_command(cmd);
    g_free(cmd);
    gchar *message = g_strdup_printf("Upload Result:\n%s", output);
    gtk_label_set_text(GTK_LABEL(pgp_status_label), message);
    g_free(output);
    g_free(message);
}

static void on_pgp_list_clicked(GtkButton *button, gpointer user_data) {
    const gchar *email = gtk_entry_get_text(GTK_ENTRY(pgp_email_entry));
    if (!strlen(email)) {
        gtk_label_set_text(GTK_LABEL(pgp_status_label), "Error: Please enter an email address to list keys.");
        return;
    }
    gchar *cmd = g_strdup_printf("gpg --list-keys --keyid-format=long \"%s\" 2>&1", email);
    gchar *output = execute_command(cmd);
    g_free(cmd);
    gchar *message = g_strdup_printf("Keys for %s:\n\n%s", email, output);
    gtk_label_set_text(GTK_LABEL(pgp_status_label), message);
    g_free(output);
    g_free(message);
}

static void on_pgp_sign_clicked(GtkButton *button, gpointer user_data) {
    const gchar *text = gtk_entry_get_text(GTK_ENTRY(pgp_sign_entry));
    if (!strlen(text)) {
        gtk_label_set_text(GTK_LABEL(pgp_status_label), "Error: Enter text in the 'Text to Sign' box first.");
        return;
    }

    gchar *tmp_file = g_build_filename(g_get_tmp_dir(), "shrike_sign_XXXXXX", NULL);
    int fd = g_mkstemp(tmp_file);
    if (fd == -1) {
        gtk_label_set_text(GTK_LABEL(pgp_status_label), "Error: Could not create temp file.");
        g_free(tmp_file);
        return;
    }

    FILE *fp = fdopen(fd, "w");
    fprintf(fp, "%s", text);
    fclose(fp);

    gtk_label_set_text(GTK_LABEL(pgp_status_label), "Signing text...");

    gchar *cmd = g_strdup_printf("gpg --clearsign %s 2>&1", tmp_file);
    gchar *output = execute_command(cmd);
    g_free(cmd);

    gchar *asc_file = g_strdup_printf("%s.asc", tmp_file);
    gchar *asc_content = NULL;

    if (g_file_get_contents(asc_file, &asc_content, NULL, NULL)) {
        gchar *message = g_strdup_printf("Status:\n%s\n\nSigned Text:\n%s", output, asc_content);
        gtk_label_set_text(GTK_LABEL(pgp_status_label), message);
        g_free(message);
        g_free(asc_content);
    } else {
        gchar *message = g_strdup_printf("Status:\n%s", output);
        gtk_label_set_text(GTK_LABEL(pgp_status_label), message);
        g_free(message);
    }

    remove(tmp_file);
    remove(asc_file);
    g_free(tmp_file);
    g_free(asc_file);
    g_free(output);
}

static void on_pgp_refresh_combo_clicked(GtkButton *button, gpointer user_data) {
    gtk_combo_box_text_remove_all(GTK_COMBO_BOX_TEXT(pgp_key_combo));

    gchar *cmd = g_strdup("gpg --list-secret-keys --with-colons --with-fingerprint 2>&1");
    gchar *output = execute_command(cmd);
    g_free(cmd);

    gchar **lines = g_strsplit(output, "\n", -1);
    g_free(output);

    gchar *current_fpr = NULL;
    gboolean is_primary = FALSE;
    gboolean uid_added = FALSE;

    for (int i = 0; lines[i] != NULL; i++) {
        gchar **fields = g_strsplit(lines[i], ":", -1);
        gint nfields = g_strv_length(fields);

        if (nfields >= 2 && g_strcmp0(fields[0], "sec") == 0) {
            is_primary = TRUE;
            uid_added = FALSE;
            g_free(current_fpr);
            current_fpr = NULL;
        } else if (nfields >= 2 && g_strcmp0(fields[0], "ssb") == 0) {
            is_primary = FALSE;
        } else if (is_primary && nfields >= 10 && g_strcmp0(fields[0], "fpr") == 0) {
            g_free(current_fpr);
            current_fpr = g_strdup(fields[9]);
        } else if (nfields >= 10 && g_strcmp0(fields[0], "uid") == 0 && !uid_added && current_fpr) {
            gint fpr_len = strlen(current_fpr);
            const gchar *short_fpr = (fpr_len > 10) ? (current_fpr + fpr_len - 10) : current_fpr;
            gchar *display = g_strdup_printf("%s  --  %s", short_fpr, fields[9]);
            gtk_combo_box_text_append(GTK_COMBO_BOX_TEXT(pgp_key_combo), current_fpr, display);
            g_free(display);
            uid_added = TRUE;
        }

        g_strfreev(fields);
    }

    g_free(current_fpr);
    g_strfreev(lines);

    gtk_label_set_text(GTK_LABEL(pgp_status_label), "Key list refreshed. Select a key from the dropdown.");
}

static void on_pgp_delete_key_clicked(GtkButton *button, gpointer user_data) {
    const gchar *fpr_const = gtk_combo_box_get_active_id(GTK_COMBO_BOX(pgp_key_combo));
    if (!fpr_const) {
        gtk_label_set_text(GTK_LABEL(pgp_status_label), "Error: No key selected. Click 'Refresh List' first.");
        return;
    }

    gchar *fingerprint = g_strdup(fpr_const);

    gchar *detail_cmd = g_strdup_printf(
        "gpg --list-secret-keys --with-colons --with-fingerprint '%s' 2>&1", fingerprint);
    gchar *gpg_detail = execute_command(detail_cmd);
    g_free(detail_cmd);

    gchar *key_uid = NULL;
    gchar *key_algo = NULL;
    gchar *key_id = NULL;
    gchar *key_date = NULL;

    gchar **lines = g_strsplit(gpg_detail, "\n", -1);
    for (int i = 0; lines[i] != NULL; i++) {
        gchar **fields = g_strsplit(lines[i], ":", -1);
        gint nfields = g_strv_length(fields);

        if (nfields >= 6 && g_strcmp0(fields[0], "sec") == 0) {
            if (nfields >= 5 && fields[4] && strlen(fields[4]) > 0) {
                g_free(key_id);
                key_id = g_strdup(fields[4]);
            }
            if (nfields >= 4 && fields[2] && strlen(fields[2]) > 0) {
                int algo_num = (fields[3] && strlen(fields[3]) > 0) ? atoi(fields[3]) : 0;
                const char *algo_name = "Unknown";
                switch(algo_num) {
                    case 1:  algo_name = "RSA"; break;
                    case 16: algo_name = "Elgamal"; break;
                    case 17: algo_name = "DSA"; break;
                    case 18: algo_name = "ECDH"; break;
                    case 19: algo_name = "ECDSA"; break;
                    case 22: algo_name = "EdDSA"; break;
                }
                g_free(key_algo);
                key_algo = g_strdup_printf("%s-bit %s", fields[2], algo_name);
            }
            if (nfields >= 6 && fields[5] && strlen(fields[5]) > 0) {
                gint64 ts = g_ascii_strtoll(fields[5], NULL, 10);
                if (ts > 0) {
                    GDateTime *dt = g_date_time_new_from_unix_local(ts);
                    if (dt) {
                        g_free(key_date);
                        key_date = g_date_time_format(dt, "%Y-%m-%d");
                        g_date_time_unref(dt);
                    }
                }
            }
        }
        else if (nfields >= 10 && g_strcmp0(fields[0], "uid") == 0 && !key_uid) {
            key_uid = g_strdup(fields[9]);
        }

        g_strfreev(fields);
    }
    g_strfreev(lines);
    g_free(gpg_detail);

    if (!key_uid)  key_uid  = g_strdup("Unknown");
    if (!key_algo) key_algo = g_strdup("Unknown");
    if (!key_id)   key_id   = g_strdup("Unknown");
    if (!key_date) key_date = g_strdup("Unknown");

    GtkWindow *parent_window = GTK_WINDOW(gtk_widget_get_toplevel(GTK_WIDGET(button)));
    gchar *passphrase = prompt_passphrase(parent_window, key_uid, key_algo, key_id, key_date);

    g_free(key_uid);
    g_free(key_algo);
    g_free(key_id);
    g_free(key_date);

    if (!passphrase) {
        gtk_label_set_text(GTK_LABEL(pgp_status_label), "Deletion cancelled.");
        g_free(fingerprint);
        return;
    }

    gtk_label_set_text(GTK_LABEL(pgp_status_label), "Deleting key... verifying passphrase.");
    while (gtk_events_pending()) gtk_main_iteration();

    gchar *argv[] = {
        "gpg", "--batch", "--yes",
        "--pinentry-mode", "loopback",
        "--passphrase", passphrase,
        "--delete-secret-and-public-keys", fingerprint,
        NULL
    };
    gint exit_status = -1;
    gchar *stderr_out = NULL;

    g_spawn_sync(NULL, argv, NULL, G_SPAWN_SEARCH_PATH, NULL, NULL, NULL, &stderr_out, &exit_status, NULL);

    if (exit_status == 0) {
        gtk_label_set_text(GTK_LABEL(pgp_status_label), "Key deleted successfully!");
    } else {
        gchar *msg = g_strdup_printf("Failed to delete key. Wrong passphrase?\n%s", stderr_out ? stderr_out : "");
        gtk_label_set_text(GTK_LABEL(pgp_status_label), msg);
        g_free(msg);
    }

    g_free(stderr_out);
    g_free(passphrase);
    g_free(fingerprint);

    on_pgp_refresh_combo_clicked(NULL, NULL);
}

static void on_ssh_generate_clicked(GtkButton *button, gpointer user_data) {
    const gchar *email = gtk_entry_get_text(GTK_ENTRY(ssh_email_entry));
    const gchar *path = gtk_entry_get_text(GTK_ENTRY(ssh_path_entry));
    const gchar *pass = gtk_entry_get_text(GTK_ENTRY(ssh_pass_entry));
    gboolean overwrite = gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(ssh_overwrite_check));

    if (!strlen(email)) {
        gtk_label_set_text(GTK_LABEL(ssh_status_label), "Error: Email is required for the comment.");
        return;
    }

    gchar *real_path;
    if (!strlen(path)) {
        real_path = g_build_filename(g_get_home_dir(), ".ssh", "id_ed25519", NULL);
    } else {
        real_path = g_strdup(path);
    }

    gchar *cmd;
    if (overwrite) {
        cmd = g_strdup_printf("echo y | ssh-keygen -t ed25519 -C \"%s\" -f \"%s\" -N \"%s\" 2>&1", email, real_path, pass);
    } else {
        cmd = g_strdup_printf("ssh-keygen -t ed25519 -C \"%s\" -f \"%s\" -N \"%s\" 2>&1", email, real_path, pass);
    }

    gtk_label_set_text(GTK_LABEL(ssh_status_label), "Generating SSH Key...");
    gchar *output = execute_command(cmd);
    g_free(cmd);

    gchar *message = g_strdup_printf("Output:\n%s\n\nSaved to: %s", output, real_path);
    gtk_label_set_text(GTK_LABEL(ssh_status_label), message);

    g_free(output);
    g_free(real_path);
}

static void on_ssh_view_pub_clicked(GtkButton *button, gpointer user_data) {
    const gchar *path = gtk_entry_get_text(GTK_ENTRY(ssh_path_entry));
    gchar *real_path;

    if (!strlen(path)) {
        real_path = g_build_filename(g_get_home_dir(), ".ssh", "id_ed25519.pub", NULL);
    } else {
        real_path = g_strdup_printf("%s.pub", path);
    }

    gchar *cmd = g_strdup_printf("cat \"%s\" 2>&1", real_path);
    gchar *output = execute_command(cmd);
    g_free(cmd);

    if (strstr(output, "No such file") != NULL) {
        gchar *message = g_strdup_printf("Error: Public key not found at:\n%s\nDid you generate it yet?", real_path);
        gtk_label_set_text(GTK_LABEL(ssh_status_label), message);
        g_free(message);
    } else {
        gchar *message = g_strdup_printf("Public Key (Copy this):\n\n%s", output);
        gtk_label_set_text(GTK_LABEL(ssh_status_label), message);
    }

    g_free(output);
    g_free(real_path);
}

static void on_ssh_fingerprint_clicked(GtkButton *button, gpointer user_data) {
    const gchar *path = gtk_entry_get_text(GTK_ENTRY(ssh_path_entry));
    gchar *real_path;

    if (!strlen(path)) {
        real_path = g_build_filename(g_get_home_dir(), ".ssh", "id_ed25519", NULL);
    } else {
        real_path = g_strdup(path);
    }

    gchar *cmd = g_strdup_printf("ssh-keygen -l -v -f \"%s\" 2>&1", real_path);
    gchar *output = execute_command(cmd);
    g_free(cmd);

    if (strstr(output, "No such file") != NULL) {
        gchar *message = g_strdup_printf("Error: Key not found at:\n%s\nDid you generate it yet?", real_path);
        gtk_label_set_text(GTK_LABEL(ssh_status_label), message);
        g_free(message);
    } else {
        gchar *message = g_strdup_printf("Fingerprint & Randomart:\n\n%s", output);
        gtk_label_set_text(GTK_LABEL(ssh_status_label), message);
    }

    g_free(output);
    g_free(real_path);
}

static void activate(GtkApplication *app, gpointer user_data) {
    GtkWidget *window = gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), "Shrike Key Manager");
    gtk_window_set_default_size(GTK_WINDOW(window), 550, 600);

    GtkWidget *main_box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_container_set_border_width(GTK_CONTAINER(main_box), 10);
    gtk_container_add(GTK_CONTAINER(window), main_box);

    GtkWidget *notebook = gtk_notebook_new();
    gtk_box_pack_start(GTK_BOX(main_box), notebook, TRUE, TRUE, 0);

    /* PGP TAB */
    GtkWidget *pgp_box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 6);
    gtk_container_set_border_width(GTK_CONTAINER(pgp_box), 10);

    GtkWidget *pgp_grid = gtk_grid_new();
    gtk_grid_set_column_spacing(GTK_GRID(pgp_grid), 10);
    gtk_grid_set_row_spacing(GTK_GRID(pgp_grid), 6);
    gtk_box_pack_start(GTK_BOX(pgp_box), pgp_grid, FALSE, FALSE, 0);

    int row = 0;
    gtk_grid_attach(GTK_GRID(pgp_grid), gtk_label_new("Name:"), 0, row, 1, 1);
    pgp_name_entry = gtk_entry_new();
    gtk_entry_set_placeholder_text(GTK_ENTRY(pgp_name_entry), "Real Name");
    gtk_grid_attach(GTK_GRID(pgp_grid), pgp_name_entry, 1, row, 1, 1);

    row++;
    gtk_grid_attach(GTK_GRID(pgp_grid), gtk_label_new("Email:"), 0, row, 1, 1);
    pgp_email_entry = gtk_entry_new();
    gtk_entry_set_placeholder_text(GTK_ENTRY(pgp_email_entry), "AUR Email Address");
    gtk_grid_attach(GTK_GRID(pgp_grid), pgp_email_entry, 1, row, 1, 1);

    row++;
    gtk_grid_attach(GTK_GRID(pgp_grid), gtk_label_new("Comment:"), 0, row, 1, 1);
    pgp_comment_entry = gtk_entry_new();
    gtk_entry_set_placeholder_text(GTK_ENTRY(pgp_comment_entry), "e.g. shrikelinuxuganda");
    gtk_grid_attach(GTK_GRID(pgp_grid), pgp_comment_entry, 1, row, 1, 1);

    row++;
    gtk_grid_attach(GTK_GRID(pgp_grid), gtk_label_new("Passphrase:"), 0, row, 1, 1);
    pgp_pass_entry = gtk_entry_new();
    gtk_entry_set_visibility(GTK_ENTRY(pgp_pass_entry), FALSE);
    gtk_entry_set_placeholder_text(GTK_ENTRY(pgp_pass_entry), "Secure Passphrase");
    gtk_grid_attach(GTK_GRID(pgp_grid), pgp_pass_entry, 1, row, 1, 1);

    row++;
    gtk_grid_attach(GTK_GRID(pgp_grid), gtk_label_new("Expiration:"), 0, row, 1, 1);
    pgp_expire_entry = gtk_entry_new();
    gtk_entry_set_placeholder_text(GTK_ENTRY(pgp_expire_entry), "0 = never");
    gtk_entry_set_text(GTK_ENTRY(pgp_expire_entry), "0");
    gtk_grid_attach(GTK_GRID(pgp_grid), pgp_expire_entry, 1, row, 1, 1);

    row++;
    gtk_grid_attach(GTK_GRID(pgp_grid), gtk_label_new("Text to Sign:"), 0, row, 1, 1);
    pgp_sign_entry = gtk_entry_new();
    gtk_entry_set_placeholder_text(GTK_ENTRY(pgp_sign_entry), "Enter text to test clearsign");
    gtk_grid_attach(GTK_GRID(pgp_grid), pgp_sign_entry, 1, row, 1, 1);

    GtkWidget *pgp_btn_box1 = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 4);
    gtk_box_pack_start(GTK_BOX(pgp_box), pgp_btn_box1, FALSE, FALSE, 0);

    gchar *icon_path;

    icon_path = g_build_filename(DATADIR, "key.svg", NULL);
    GtkWidget *gen_pgp_btn = gtk_button_new_with_label("  Generate");
    gtk_button_set_image(GTK_BUTTON(gen_pgp_btn), gtk_image_new_from_file(icon_path));
    g_free(icon_path);
    g_signal_connect(gen_pgp_btn, "clicked", G_CALLBACK(on_pgp_generate_clicked), NULL);
    gtk_box_pack_start(GTK_BOX(pgp_btn_box1), gen_pgp_btn, TRUE, TRUE, 0);

    icon_path = g_build_filename(DATADIR, "upload.svg", NULL);
    GtkWidget *up_pgp_btn = gtk_button_new_with_label("  Upload");
    gtk_button_set_image(GTK_BUTTON(up_pgp_btn), gtk_image_new_from_file(icon_path));
    g_free(icon_path);
    g_signal_connect(up_pgp_btn, "clicked", G_CALLBACK(on_pgp_upload_clicked), NULL);
    gtk_box_pack_start(GTK_BOX(pgp_btn_box1), up_pgp_btn, TRUE, TRUE, 0);

    icon_path = g_build_filename(DATADIR, "list.svg", NULL);
    GtkWidget *list_pgp_btn = gtk_button_new_with_label("  List");
    gtk_button_set_image(GTK_BUTTON(list_pgp_btn), gtk_image_new_from_file(icon_path));
    g_free(icon_path);
    g_signal_connect(list_pgp_btn, "clicked", G_CALLBACK(on_pgp_list_clicked), NULL);
    gtk_box_pack_start(GTK_BOX(pgp_btn_box1), list_pgp_btn, TRUE, TRUE, 0);

    icon_path = g_build_filename(DATADIR, "sign.svg", NULL);
    GtkWidget *sign_pgp_btn = gtk_button_new_with_label("  Sign");
    gtk_button_set_image(GTK_BUTTON(sign_pgp_btn), gtk_image_new_from_file(icon_path));
    g_free(icon_path);
    g_signal_connect(sign_pgp_btn, "clicked", G_CALLBACK(on_pgp_sign_clicked), NULL);
    gtk_box_pack_start(GTK_BOX(pgp_btn_box1), sign_pgp_btn, TRUE, TRUE, 0);

    GtkWidget *pgp_del_sep = gtk_separator_new(GTK_ORIENTATION_HORIZONTAL);
    gtk_box_pack_start(GTK_BOX(pgp_box), pgp_del_sep, FALSE, FALSE, 5);

    GtkWidget *pgp_del_lbl = gtk_label_new("<b>Delete Existing Keys</b>");
    gtk_label_set_use_markup(GTK_LABEL(pgp_del_lbl), TRUE);
    gtk_box_pack_start(GTK_BOX(pgp_box), pgp_del_lbl, FALSE, FALSE, 0);

    pgp_key_combo = gtk_combo_box_text_new();
    gtk_box_pack_start(GTK_BOX(pgp_box), pgp_key_combo, FALSE, FALSE, 0);

    GtkWidget *pgp_btn_box2 = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 4);
    gtk_box_pack_start(GTK_BOX(pgp_box), pgp_btn_box2, FALSE, FALSE, 0);

    icon_path = g_build_filename(DATADIR, "list.svg", NULL);
    GtkWidget *refresh_btn = gtk_button_new_with_label("  Refresh List");
    gtk_button_set_image(GTK_BUTTON(refresh_btn), gtk_image_new_from_file(icon_path));
    g_free(icon_path);
    g_signal_connect(refresh_btn, "clicked", G_CALLBACK(on_pgp_refresh_combo_clicked), NULL);
    gtk_box_pack_start(GTK_BOX(pgp_btn_box2), refresh_btn, TRUE, TRUE, 0);

    icon_path = g_build_filename(DATADIR, "delete.svg", NULL);
    GtkWidget *delete_btn = gtk_button_new_with_label("  Delete Selected");
    gtk_button_set_image(GTK_BUTTON(delete_btn), gtk_image_new_from_file(icon_path));
    g_free(icon_path);
    g_signal_connect(delete_btn, "clicked", G_CALLBACK(on_pgp_delete_key_clicked), NULL);
    gtk_box_pack_start(GTK_BOX(pgp_btn_box2), delete_btn, TRUE, TRUE, 0);

    pgp_status_label = gtk_label_new("Ready to generate PGP key.");
    gtk_label_set_line_wrap(GTK_LABEL(pgp_status_label), TRUE);
    gtk_label_set_selectable(GTK_LABEL(pgp_status_label), TRUE);
    gtk_widget_set_vexpand(pgp_status_label, TRUE);
    gtk_widget_set_valign(pgp_status_label, GTK_ALIGN_START);
    gtk_box_pack_start(GTK_BOX(pgp_box), pgp_status_label, TRUE, TRUE, 0);

    GtkWidget *pgp_tab_label = gtk_label_new("PGP Keys");
    gtk_notebook_append_page(GTK_NOTEBOOK(notebook), pgp_box, pgp_tab_label);

    /* SSH TAB */
    GtkWidget *ssh_box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 6);
    gtk_container_set_border_width(GTK_CONTAINER(ssh_box), 10);

    GtkWidget *ssh_grid = gtk_grid_new();
    gtk_grid_set_column_spacing(GTK_GRID(ssh_grid), 10);
    gtk_grid_set_row_spacing(GTK_GRID(ssh_grid), 6);
    gtk_box_pack_start(GTK_BOX(ssh_box), ssh_grid, FALSE, FALSE, 0);

    int s_row = 0;
    gtk_grid_attach(GTK_GRID(ssh_grid), gtk_label_new("Email (Comment):"), 0, s_row, 1, 1);
    ssh_email_entry = gtk_entry_new();
    gtk_entry_set_placeholder_text(GTK_ENTRY(ssh_email_entry), "your@email.com");
    gtk_grid_attach(GTK_GRID(ssh_grid), ssh_email_entry, 1, s_row, 1, 1);

    s_row++;
    gtk_grid_attach(GTK_GRID(ssh_grid), gtk_label_new("Save Location:"), 0, s_row, 1, 1);
    ssh_path_entry = gtk_entry_new();
    gtk_entry_set_placeholder_text(GTK_ENTRY(ssh_path_entry), "Default: ~/.ssh/id_ed25519");
    gtk_grid_attach(GTK_GRID(ssh_grid), ssh_path_entry, 1, s_row, 1, 1);

    s_row++;
    gtk_grid_attach(GTK_GRID(ssh_grid), gtk_label_new("Passphrase:"), 0, s_row, 1, 1);
    ssh_pass_entry = gtk_entry_new();
    gtk_entry_set_visibility(GTK_ENTRY(ssh_pass_entry), FALSE);
    gtk_entry_set_placeholder_text(GTK_ENTRY(ssh_pass_entry), "Leave blank for no passphrase");
    gtk_grid_attach(GTK_GRID(ssh_grid), ssh_pass_entry, 1, s_row, 1, 1);

    s_row++;
    ssh_overwrite_check = gtk_check_button_new_with_label("Force overwrite if file exists (Y/n)");
    gtk_grid_attach(GTK_GRID(ssh_grid), ssh_overwrite_check, 0, s_row, 2, 1);

    GtkWidget *ssh_btn_box1 = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 4);
    gtk_box_pack_start(GTK_BOX(ssh_box), ssh_btn_box1, FALSE, FALSE, 0);

    icon_path = g_build_filename(DATADIR, "ssh.svg", NULL);
    GtkWidget *gen_ssh_btn = gtk_button_new_with_label("  Generate SSH Key");
    gtk_button_set_image(GTK_BUTTON(gen_ssh_btn), gtk_image_new_from_file(icon_path));
    g_free(icon_path);
    g_signal_connect(gen_ssh_btn, "clicked", G_CALLBACK(on_ssh_generate_clicked), NULL);
    gtk_box_pack_start(GTK_BOX(ssh_btn_box1), gen_ssh_btn, TRUE, TRUE, 0);

    icon_path = g_build_filename(DATADIR, "upload.svg", NULL);
    GtkWidget *view_ssh_btn = gtk_button_new_with_label("  View Public Key");
    gtk_button_set_image(GTK_BUTTON(view_ssh_btn), gtk_image_new_from_file(icon_path));
    g_free(icon_path);
    g_signal_connect(view_ssh_btn, "clicked", G_CALLBACK(on_ssh_view_pub_clicked), NULL);
    gtk_box_pack_start(GTK_BOX(ssh_btn_box1), view_ssh_btn, TRUE, TRUE, 0);

    GtkWidget *ssh_btn_box2 = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 4);
    gtk_box_pack_start(GTK_BOX(ssh_box), ssh_btn_box2, FALSE, FALSE, 0);

    icon_path = g_build_filename(DATADIR, "fingerprint.svg", NULL);
    GtkWidget *fp_ssh_btn = gtk_button_new_with_label("  View Fingerprint");
    gtk_button_set_image(GTK_BUTTON(fp_ssh_btn), gtk_image_new_from_file(icon_path));
    g_free(icon_path);
    g_signal_connect(fp_ssh_btn, "clicked", G_CALLBACK(on_ssh_fingerprint_clicked), NULL);
    gtk_box_pack_start(GTK_BOX(ssh_btn_box2), fp_ssh_btn, TRUE, TRUE, 0);

    ssh_status_label = gtk_label_new("Ready to generate SSH key.");
    gtk_label_set_line_wrap(GTK_LABEL(ssh_status_label), TRUE);
    gtk_label_set_selectable(GTK_LABEL(ssh_status_label), TRUE);
    gtk_widget_set_vexpand(ssh_status_label, TRUE);
    gtk_widget_set_valign(ssh_status_label, GTK_ALIGN_START);
    gtk_box_pack_start(GTK_BOX(ssh_box), ssh_status_label, TRUE, TRUE, 0);

    GtkWidget *ssh_tab_label = gtk_label_new("SSH Keys");
    gtk_notebook_append_page(GTK_NOTEBOOK(notebook), ssh_box, ssh_tab_label);

    gtk_widget_show_all(window);
}

int main(int argc, char **argv) {
    GtkApplication *app;
    int status;
    app = gtk_application_new("org.shrike.keys", G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);
    status = g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
    if (fingerprint_str) g_free(fingerprint_str);
    return status;
}
