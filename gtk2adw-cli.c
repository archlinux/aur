// gtk2adw-cli: give libadwaita apps the colors of the active GTK theme.
// libadwaita ignores the GTK theme and only reads ~/.config/gtk-4.0/gtk.css,
// so this reads the theme colors through GTK3 and writes them there.
#include <glib/gstdio.h>
#include <gtk/gtk.h>
#include <stdlib.h>

#define MARKER "/* gtk2adw:"
#define USAGE "Usage: gtk2adw-cli [THEME] | --print [THEME] | --list | --off"

// libadwaita color, then theme colors to try in order. libadwaita names come first
// so adw-gtk3 based themes map 1:1; the rest are the standard public GTK3 names.
// The first entry must stay window_bg_color: it is required and decides light/dark.
static const char *const MAPPING[][3] = {
  {"window_bg_color", "window_bg_color", "theme_bg_color"},
  {"window_fg_color", "window_fg_color", "theme_fg_color"},
  {"view_bg_color", "view_bg_color", "theme_base_color"},
  {"view_fg_color", "view_fg_color", "theme_text_color"},
  {"accent_bg_color", "accent_bg_color", "theme_selected_bg_color"},
  {"accent_fg_color", "accent_fg_color", "theme_selected_fg_color"},
  {"headerbar_bg_color", "headerbar_bg_color", "theme_bg_color"},
  {"headerbar_fg_color", "headerbar_fg_color", "theme_fg_color"},
  {"sidebar_bg_color", "sidebar_bg_color", "theme_bg_color"},
  {"sidebar_fg_color", "sidebar_fg_color", "theme_fg_color"},
  {"popover_bg_color", "popover_bg_color", "theme_base_color"},
  {"popover_fg_color", "popover_fg_color", "theme_text_color"},
  {"dialog_bg_color", "dialog_bg_color", "theme_bg_color"},
  {"dialog_fg_color", "dialog_fg_color", "theme_fg_color"},
  {"card_bg_color", "card_bg_color", "theme_base_color"},
  {"card_fg_color", "card_fg_color", "theme_text_color"},
  {"destructive_bg_color", "destructive_bg_color", "error_color"},
  {"success_bg_color", "success_bg_color", "success_color"},
  {"warning_bg_color", "warning_bg_color", "warning_color"},
  {"error_bg_color", "error_bg_color", "error_color"},
};
#define N_COLORS G_N_ELEMENTS(MAPPING)

typedef struct {
  gboolean found[N_COLORS];
  GdkRGBA color[N_COLORS];
} Colors;

static void die(const char *fmt, ...) G_GNUC_PRINTF(1, 2) G_GNUC_NORETURN;

static void die(const char *fmt, ...) {
  va_list ap;
  va_start(ap, fmt);
  g_autofree char *msg = g_strdup_vprintf(fmt, ap);
  va_end(ap);
  g_printerr("gtk2adw-cli: %s\n", msg);
  exit(1);
}

static const char *const BUILTIN_THEMES[] = {"Adwaita", "HighContrast", "HighContrastInverse", NULL};

// Same places GTK3 looks for themes: */themes/NAME/gtk-3.0.
static GPtrArray *theme_dirs(void) {
  GPtrArray *dirs = g_ptr_array_new_with_free_func(g_free);
  g_ptr_array_add(dirs, g_build_filename(g_get_user_data_dir(), "themes", NULL));
  g_ptr_array_add(dirs, g_build_filename(g_get_home_dir(), ".themes", NULL));
  for (const char *const *dir = g_get_system_data_dirs(); *dir; dir++)
    g_ptr_array_add(dirs, g_build_filename(*dir, "themes", NULL));
  return dirs;
}

static gboolean is_theme(const char *themes_dir, const char *name) {
  g_autofree char *path = g_build_filename(themes_dir, name, "gtk-3.0", NULL);
  return g_file_test(path, G_FILE_TEST_IS_DIR);
}

static gboolean theme_exists(const char *name) {
  if (g_strv_contains(BUILTIN_THEMES, name))
    return TRUE;
  g_autoptr(GPtrArray) dirs = theme_dirs();
  for (guint i = 0; i < dirs->len; i++)
    if (is_theme(dirs->pdata[i], name))
      return TRUE;
  return FALSE;
}

static void list_themes(void) {
  g_autoptr(GHashTable) names = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, NULL);
  for (guint i = 0; BUILTIN_THEMES[i]; i++)
    g_hash_table_add(names, g_strdup(BUILTIN_THEMES[i]));
  g_autoptr(GPtrArray) dirs = theme_dirs();
  for (guint i = 0; i < dirs->len; i++) {
    g_autoptr(GDir) dir = g_dir_open(dirs->pdata[i], 0, NULL);
    const char *name;
    while (dir && (name = g_dir_read_name(dir)))
      if (is_theme(dirs->pdata[i], name))
        g_hash_table_add(names, g_strdup(name));
  }
  GList *sorted = g_list_sort(g_hash_table_get_keys(names), (GCompareFunc)g_strcmp0);
  for (GList *l = sorted; l; l = l->next)
    g_print("%s\n", (const char *)l->data);
  g_list_free(sorted);
}

static void read_colors(GtkSettings *settings, gboolean prefer_dark, Colors *out) {
  g_object_set(settings, "gtk-application-prefer-dark-theme", prefer_dark, NULL);
  while (gtk_events_pending()) // let GTK reload the theme
    gtk_main_iteration();
  GtkWidget *window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  GtkStyleContext *ctx = gtk_widget_get_style_context(window);
  for (guint i = 0; i < N_COLORS; i++) {
    out->found[i] = FALSE;
    for (guint j = 1; j < 3 && !out->found[i]; j++)
      out->found[i] = gtk_style_context_lookup_color(ctx, MAPPING[i][j], &out->color[i]);
  }
  gtk_widget_destroy(window);
}

static char *css_color(const GdkRGBA *c) {
  int r = (int)(c->red * 255 + 0.5), g = (int)(c->green * 255 + 0.5), b = (int)(c->blue * 255 + 0.5);
  if (c->alpha < 1) {
    char alpha[G_ASCII_DTOSTR_BUF_SIZE]; // ASCII: gtk_init sets a locale that may use a decimal comma
    return g_strdup_printf("rgba(%d,%d,%d,%s)", r, g, b, g_ascii_formatd(alpha, sizeof alpha, "%.3g", c->alpha));
  }
  return g_strdup_printf("#%02x%02x%02x", r, g, b);
}

static gboolean is_dark(const GdkRGBA *c) {
  return 0.299 * c->red + 0.587 * c->green + 0.114 * c->blue < 0.5;
}

static gboolean is_ours(const char *path) {
  g_autofree char *contents = NULL;
  if (g_file_test(path, G_FILE_TEST_IS_SYMLINK) || !g_file_test(path, G_FILE_TEST_IS_REGULAR))
    return FALSE;
  return g_file_get_contents(path, &contents, NULL, NULL) && g_str_has_prefix(contents, MARKER);
}

// The theme has its own dark variant (gtk-dark.css) for this color.
static gboolean dark_differs(const Colors *light, const Colors *dark, guint i) {
  return dark->found[i] && !(light->found[i] && gdk_rgba_equal(&light->color[i], &dark->color[i]));
}

// Machine-readable output for the GUI: "theme NAME", "scheme S", "light|dark COLOR VALUE".
static void print_colors(const char *theme, const Colors *light, const Colors *dark) {
  g_print("theme %s\nscheme %s\n", theme, is_dark(&light->color[0]) ? "prefer-dark" : "default");
  for (guint i = 0; i < N_COLORS; i++) {
    if (!light->found[i])
      continue;
    g_autofree char *color = css_color(&light->color[i]);
    g_print("light %s %s\n", MAPPING[i][0], color);
  }
  for (guint i = 0; i < N_COLORS; i++) {
    if (!dark_differs(light, dark, i))
      continue;
    g_autofree char *color = css_color(&dark->color[i]);
    g_print("dark %s %s\n", MAPPING[i][0], color);
  }
}

static char *render(const char *theme, const Colors *light, const Colors *dark) {
  GString *s = g_string_new(NULL);
  g_string_append_printf(s, MARKER " colors of GTK theme \"%s\", regenerate with gtk2adw */\n", theme);
  for (guint i = 0; i < N_COLORS; i++) {
    if (!light->found[i])
      continue;
    g_autofree char *color = css_color(&light->color[i]);
    g_string_append_printf(s, "@define-color %s %s;\n", MAPPING[i][0], color);
  }
  gboolean has_dark = FALSE;
  for (guint i = 0; i < N_COLORS; i++) {
    if (!dark_differs(light, dark, i))
      continue;
    if (!has_dark)
      g_string_append(s, "@media (prefers-color-scheme: dark) {\n");
    has_dark = TRUE;
    g_autofree char *color = css_color(&dark->color[i]);
    g_string_append_printf(s, "  @define-color %s %s;\n", MAPPING[i][0], color);
  }
  if (has_dark)
    g_string_append(s, "}\n");
  // libadwaita >= 1.6 reads CSS variables, not the named colors.
  g_string_append(s, ":root {\n");
  for (guint i = 0; i < N_COLORS; i++) {
    if (!light->found[i])
      continue;
    g_autofree char *var = g_strdelimit(g_strdup(MAPPING[i][0]), "_", '-');
    g_string_append_printf(s, "  --%s: @%s;\n", var, MAPPING[i][0]);
  }
  g_string_append(s, "}\n");
  return g_string_free(s, FALSE);
}

static void set_color_scheme(gboolean dark) {
  const char *scheme = dark ? "prefer-dark" : "default";
  GSettingsSchemaSource *source = g_settings_schema_source_get_default();
  g_autoptr(GSettingsSchema) schema =
      source ? g_settings_schema_source_lookup(source, "org.gnome.desktop.interface", TRUE) : NULL;
  if (!schema || !g_settings_schema_has_key(schema, "color-scheme")) {
    g_print("gsettings-desktop-schemas is missing: set the color scheme to %s manually\n", scheme);
    return;
  }
  g_autoptr(GSettings) settings = g_settings_new("org.gnome.desktop.interface");
  g_settings_set_string(settings, "color-scheme", scheme);
  g_settings_sync();
  g_print("color-scheme: %s\n", scheme);
}

int main(int argc, char **argv) {
  g_autofree char *target = g_build_filename(g_get_user_config_dir(), "gtk-4.0", "gtk.css", NULL);

  if (argc == 2 && g_str_equal(argv[1], "--off")) {
    if (is_ours(target) && g_remove(target) == 0)
      g_print("removed: %s\n", target);
    return 0;
  }
  if (argc == 2 && g_str_equal(argv[1], "--list")) {
    list_themes();
    return 0;
  }
  gboolean print = argc >= 2 && g_str_equal(argv[1], "--print");
  int first = print ? 2 : 1; // index of the optional THEME argument
  if (argc > first + 1 || (argc == first + 1 && argv[first][0] == '-')) {
    g_printerr(USAGE "\n");
    return 2;
  }
  if (!gtk_init_check(NULL, NULL))
    die("no display: run this inside your graphical session");
  const char *gtk_theme = g_getenv("GTK_THEME");
  if (gtk_theme && *gtk_theme)
    g_print("warning: GTK_THEME=%s is set and overrides the theme\n", gtk_theme);

  GtkSettings *settings = gtk_settings_get_default();
  if (argc == first + 1) {
    if (!theme_exists(argv[first]))
      die("theme \"%s\" not found", argv[first]);
    g_object_set(settings, "gtk-theme-name", argv[first], NULL);
  }
  g_autofree char *theme = NULL;
  g_object_get(settings, "gtk-theme-name", &theme, NULL);
  Colors light, dark;
  read_colors(settings, FALSE, &light);
  if (!light.found[0])
    die("theme \"%s\" defines none of the standard colors, nothing written", theme);
  read_colors(settings, TRUE, &dark);
  if (print) {
    print_colors(theme, &light, &dark);
    return 0;
  }
  g_autofree char *css = render(theme, &light, &dark);

  g_autofree char *dir = g_path_get_dirname(target);
  if (g_mkdir_with_parents(dir, 0755) != 0)
    die("cannot create %s", dir);
  if (g_file_test(target, G_FILE_TEST_EXISTS | G_FILE_TEST_IS_SYMLINK) && !is_ours(target)) {
    g_autofree char *backup = g_strdup_printf("%s.%" G_GINT64_FORMAT ".bak", target, g_get_real_time() / G_USEC_PER_SEC);
    if (g_rename(target, backup) != 0)
      die("cannot back up %s", target);
    g_print("backup: %s\n", backup);
  }
  g_autoptr(GError) error = NULL;
  if (!g_file_set_contents(target, css, -1, &error))
    die("%s", error->message);
  g_print("wrote %s from theme \"%s\". Restart libadwaita apps.\n", target, theme);
  set_color_scheme(is_dark(&light.color[0]));
  return 0;
}
