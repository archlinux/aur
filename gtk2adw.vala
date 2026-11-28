// libadwaita front end for gtk2adw-cli: pick a GTK theme, preview its colors, apply them
// to libadwaita apps. Colors come from gtk2adw-cli because GTK3 themes have to be
// read with GTK3, which cannot share a process with GTK4.

const string CLI = "gtk2adw-cli";
const string MARKER = "/* gtk2adw:"; // first line of the CLI's gtk.css

class ThemeColors : Adw.Application {
    Gtk.StringList theme_names = new Gtk.StringList (null);
    Adw.ComboRow theme_row;
    Adw.ActionRow scheme_row;
    Adw.PreferencesPage page;
    Adw.PreferencesGroup? colors_group = null;
    Adw.ToastOverlay toasts;
    Gtk.Button apply_button;
    Gtk.Button remove_button;
    bool loading = true;
    uint preview_request = 0; // drops previews that finish after a newer one was started

    string css_path = Path.build_filename (Environment.get_user_config_dir (), "gtk-4.0", "gtk.css");
    // GTK reads gtk.css only at startup. This provider sits one step above it and shows
    // newly applied colors without a restart.
    Gtk.CssProvider live_css = new Gtk.CssProvider ();
    // GTK loaded our gtk.css at startup and cannot unload it: Remove has to restart.
    bool loaded_at_startup;

    // Colors of the selected theme, from "--print". DARK only holds colors that differ.
    string[] color_names = {};
    HashTable<string, string> light = new HashTable<string, string> (str_hash, str_equal);
    HashTable<string, string> dark = new HashTable<string, string> (str_hash, str_equal);
    bool theme_is_dark = false;
    // Paints the preview mockup with the selected theme's colors before Apply. libadwaita
    // (>= 1.6) styles widgets through CSS variables, so setting them on .theme-preview
    // recolors only that subtree.
    Gtk.CssProvider preview_css = new Gtk.CssProvider ();
    Adw.ActionRow variant_row;
    Adw.ToggleGroup variant_toggle;
    Adw.ToggleGroup preview_mode; // "current": colors in use now, "new": selected theme
    Adw.WindowTitle preview_title;

    public ThemeColors () {
        // NON_UNIQUE: a restart starts the new instance before the old one has quit.
        Object (application_id: "io.github.Gtk2Adw", flags: ApplicationFlags.NON_UNIQUE);
    }

    protected override void activate () {
        if (active_window != null) {
            active_window.present ();
            return;
        }
        theme_row = new Adw.ComboRow () {
            title = "GTK theme",
            model = theme_names,
            expression = new Gtk.PropertyExpression (typeof (Gtk.StringObject), null, "string"),
            enable_search = true,
        };
        theme_row.notify["selected"].connect (() => {
            if (!loading)
                preview.begin (selected_theme ());
        });
        scheme_row = new Adw.ActionRow () { title = "Color scheme", subtitle = "…" };
        variant_toggle = new Adw.ToggleGroup () { valign = Gtk.Align.CENTER };
        variant_toggle.add (new Adw.Toggle () { name = "light", label = "Light" });
        variant_toggle.add (new Adw.Toggle () { name = "dark", label = "Dark" });
        variant_toggle.notify["active-name"].connect (() => update_preview ());
        variant_row = new Adw.ActionRow () {
            title = "Preview variant",
            subtitle = "The theme has its own dark variant",
            visible = false,
        };
        variant_row.add_suffix (variant_toggle);
        var theme_group = new Adw.PreferencesGroup () {
            description = "libadwaita apps ignore the GTK theme. Apply copies its colors to ~/.config/gtk-4.0/gtk.css.",
            margin_top = 12, margin_bottom = 6, margin_start = 12, margin_end = 12,
        };
        theme_group.add (theme_row);
        theme_group.add (scheme_row);
        theme_group.add (variant_row);

        page = new Adw.PreferencesPage ();
        var stack = new Adw.ViewStack () { vexpand = true };
        stack.add_titled_with_icon (build_preview (), "preview", "Preview", "applications-graphics-symbolic");
        stack.add_titled_with_icon (page, "colors", "Colors", "color-select-symbolic");
        var body = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        body.append (new Adw.Clamp () { maximum_size = 640, child = theme_group });
        body.append (stack);

        apply_button = new Gtk.Button.with_label ("Apply") { sensitive = false };
        apply_button.add_css_class ("suggested-action");
        apply_button.clicked.connect (() => apply.begin ());
        loaded_at_startup = css_is_ours ();
        remove_button = new Gtk.Button.with_label ("Remove") {
            tooltip_text = "Remove the generated gtk.css: libadwaita apps go back to Adwaita",
            sensitive = loaded_at_startup,
        };
        remove_button.clicked.connect (() => remove.begin ());
        var header = new Adw.HeaderBar () {
            title_widget = new Adw.ViewSwitcher () { stack = stack, policy = Adw.ViewSwitcherPolicy.WIDE },
        };
        header.pack_start (remove_button);
        var help_action = new SimpleAction ("help", null);
        help_action.activate.connect (() => show_help ());
        add_action (help_action);
        set_accels_for_action ("app.help", { "F1" });
        header.pack_end (new Gtk.Button.from_icon_name ("help-browser-symbolic") {
            action_name = "app.help",
            tooltip_text = help_in_russian () ? "Справка (F1)" : "Help (F1)",
        });
        header.pack_end (apply_button);

        var toolbar = new Adw.ToolbarView () { content = body };
        toolbar.add_top_bar (header);
        toasts = new Adw.ToastOverlay () { child = toolbar };

        var window = new Adw.ApplicationWindow (this) {
            title = "Theme Colors",
            default_width = 600,
            default_height = 860,
            content = toasts,
        };
        // valac warns "deprecated": the vapi flags all of StyleContext, the C function is not deprecated.
        Gtk.StyleContext.add_provider_for_display (window.display, live_css, Gtk.STYLE_PROVIDER_PRIORITY_USER + 1);
        Gtk.StyleContext.add_provider_for_display (window.display, preview_css, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
        window.present ();
        load.begin ();
    }

    string selected_theme () {
        return ((Gtk.StringObject) theme_row.selected_item).string;
    }

    // Help from help.vala, in Russian or English depending on the locale.
    void show_help () {
        var ru = help_in_russian ();
        var text = new Gtk.Label (ru ? HELP_RU : HELP_EN) {
            use_markup = true,
            wrap = true,
            xalign = 0,
            margin_top = 12, margin_bottom = 24, margin_start = 24, margin_end = 24,
        };
        var toolbar = new Adw.ToolbarView () {
            content = new Gtk.ScrolledWindow () { hscrollbar_policy = Gtk.PolicyType.NEVER, child = text },
        };
        toolbar.add_top_bar (new Adw.HeaderBar ());
        var dialog = new Adw.Dialog () {
            title = ru ? "Справка" : "Help",
            content_width = 560,
            content_height = 640,
            child = toolbar,
        };
        dialog.present (active_window);
    }

    void toast (string text) {
        toasts.add_toast (new Adw.Toast (text) { timeout = 5 });
    }

    // Runs the CLI with ARGS. Returns whether it succeeded; OUTPUT gets stdout and stderr.
    async bool run_cli (string[] args, out string output) {
        string[] argv = { CLI };
        foreach (var arg in args)
            argv += arg;
        try {
            var process = new Subprocess.newv (argv, SubprocessFlags.STDOUT_PIPE | SubprocessFlags.STDERR_MERGE);
            string? stdout_text;
            yield process.communicate_utf8_async (null, null, out stdout_text, null);
            output = (stdout_text ?? "").strip ();
            return process.get_successful ();
        } catch (Error e) {
            output = e.message;
            return false;
        }
    }

    // Last line of CLI output: the error message, or the final status line.
    static string last_line (string output) {
        var lines = output.split ("\n");
        return lines[lines.length - 1];
    }

    async void load () {
        string output;
        if (!(yield run_cli ({ "--list" }, out output))) {
            toast (last_line (output));
            return;
        }
        foreach (var name in output.split ("\n"))
            theme_names.append (name);

        // Without a THEME argument the CLI reports the active theme.
        if (!(yield run_cli ({ "--print" }, out output))) {
            toast (last_line (output));
            return;
        }
        var active = show_colors (output);
        uint index = 0;
        while (index < theme_names.get_n_items () && theme_names.get_string (index) != active)
            index++;
        if (index == theme_names.get_n_items ())
            theme_names.append (active); // not installed: GTK falls back to Adwaita, show it anyway
        theme_row.selected = index;
        loading = false;
        apply_button.sensitive = true;
    }

    async void preview (string theme) {
        var request = ++preview_request;
        string output;
        var ok = yield run_cli ({ "--print", theme }, out output);
        if (request != preview_request)
            return;
        apply_button.sensitive = ok;
        if (ok)
            show_colors (output);
        else
            toast (last_line (output));
    }

    bool css_is_ours () {
        string contents = "";
        try {
            if (FileUtils.test (css_path, FileTest.IS_SYMLINK) || !FileUtils.get_contents (css_path, out contents))
                return false;
        } catch (Error e) {
            return false;
        }
        return contents.has_prefix (MARKER);
    }

    async void apply () {
        string output;
        if (!(yield run_cli ({ selected_theme () }, out output))) {
            toast (last_line (output));
            return;
        }
        live_css.load_from_path (css_path);
        remove_button.sensitive = true;
        toast ("Applied. Restart other libadwaita apps.");
    }

    async void remove () {
        string output;
        yield run_cli ({ "--off" }, out output);
        remove_button.sensitive = css_is_ours ();
        if (loaded_at_startup) {
            restart ();
            return;
        }
        live_css.load_from_string ("");
        toast ("Removed. Restart other libadwaita apps.");
    }

    // Starts a fresh copy of this program, which no longer loads the removed gtk.css, and quits.
    void restart () {
        try {
            new Subprocess.newv ({ FileUtils.read_link ("/proc/self/exe") }, SubprocessFlags.NONE);
        } catch (Error e) {
            toast (@"Removed, but restart failed: $(e.message)");
            return;
        }
        quit ();
    }

    // Fills the preview from "--print" output and returns the theme name.
    string show_colors (string output) {
        string theme = "";
        color_names = {};
        light.remove_all ();
        dark.remove_all ();
        foreach (var line in output.split ("\n")) {
            var field = line.split (" ", 3);
            if (field[0] == "theme" && field.length >= 2) {
                theme = line.substring ("theme ".length);
            } else if (field[0] == "scheme" && field.length == 2) {
                theme_is_dark = field[1] == "prefer-dark";
                scheme_row.subtitle = theme_is_dark ? "Dark (prefer-dark)" : "Light (default)";
            } else if (field[0] == "light" && field.length == 3) {
                color_names += field[1];
                light[field[1]] = field[2];
            } else if (field[0] == "dark" && field.length == 3) {
                dark[field[1]] = field[2];
            }
        }
        variant_row.visible = dark.size () > 0;
        variant_toggle.active_name = "light";
        update_preview ();

        if (colors_group != null)
            page.remove (colors_group);
        colors_group = new Adw.PreferencesGroup () {
            title = "Colors",
            description = dark.size () > 0 ? "Left: light. Right: the theme's dark variant." : null,
        };
        foreach (var name in color_names) {
            var row = new Adw.ActionRow () {
                title = name.replace ("_color", "").replace ("_", " "),
                subtitle = dark.contains (name) ? @"$(light[name])  ·  $(dark[name])" : light[name],
                subtitle_selectable = true,
            };
            row.add_suffix (swatch (light[name]));
            if (dark.contains (name))
                row.add_suffix (swatch (dark[name]));
            else if (dark.size () > 0) // keeps the light swatch in the light column
                row.add_suffix (new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0) { width_request = 48 });
            colors_group.add (row);
        }
        page.add (colors_group);
        return theme;
    }

    void update_preview () {
        var show_new = preview_mode.active_name == "new";
        variant_row.sensitive = show_new;
        preview_title.subtitle = show_new ? "After Apply" : "Now";
        var css = new StringBuilder ("""
.theme-preview {
  background-color: var(--window-bg-color);
  color: var(--window-fg-color);
  border-radius: 12px;
  box-shadow: 0 0 0 1px rgba(0,0,0,0.15), 0 2px 10px rgba(0,0,0,0.2);
}
.theme-preview .preview-sidebar { background-color: var(--sidebar-bg-color); color: var(--sidebar-fg-color); }
""");
        // "Now": no overrides, the mockup inherits the colors libadwaita apps use today.
        if (show_new) {
            var use_dark = variant_toggle.active_name == "dark";
            css.append (".theme-preview {\n");
            foreach (var name in color_names) {
                var value = use_dark && dark.contains (name) ? dark[name] : light[name];
                css.append (@"  --$(name.replace ("_", "-")): $value;\n");
            }
            // libadwaita derives these at :root from the app's own colors; redo them for the preview.
            var oklab = use_dark || theme_is_dark ? "max(l, 0.85) a b" : "min(l, 0.5) a b";
            css.append (@"  --standalone-color-oklab: $oklab;\n");
            foreach (var kind in new string[] { "accent", "destructive", "success", "warning", "error" })
                css.append (@"  --$kind-color: oklab(from var(--$kind-bg-color) var(--standalone-color-oklab));\n");
            css.append ("}\n");
        }
        preview_css.load_from_string (css.str);
    }

    // A small libadwaita "window" made of the widgets apps use most.
    Gtk.Widget build_preview () {
        preview_mode = new Adw.ToggleGroup () { halign = Gtk.Align.CENTER, margin_top = 6 };
        preview_mode.add (new Adw.Toggle () { name = "current", label = "Now" });
        preview_mode.add (new Adw.Toggle () { name = "new", label = "After Apply" });
        preview_mode.active_name = "new";
        preview_mode.notify["active-name"].connect (() => update_preview ());
        preview_title = new Adw.WindowTitle ("Preview", "");
        var header = new Adw.HeaderBar () {
            title_widget = preview_title,
            show_start_title_buttons = false,
            show_end_title_buttons = false,
        };
        header.pack_start (new Gtk.Button.from_icon_name ("list-add-symbolic"));
        header.pack_end (new Gtk.MenuButton () { icon_name = "open-menu-symbolic" });

        var sidebar = new Gtk.ListBox () { width_request = 150 };
        sidebar.add_css_class ("navigation-sidebar");
        sidebar.add_css_class ("preview-sidebar");
        foreach (var item in new string[] { "folder-symbolic:Files", "starred-symbolic:Starred", "user-trash-symbolic:Trash" }) {
            var parts = item.split (":");
            var row = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 12);
            row.append (new Gtk.Image.from_icon_name (parts[0]));
            row.append (new Gtk.Label (parts[1]));
            sidebar.append (row);
        }
        sidebar.select_row (sidebar.get_row_at_index (0));

        var buttons = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 6);
        buttons.append (new Gtk.Button.with_label ("Button"));
        var suggested = new Gtk.Button.with_label ("Suggested");
        suggested.add_css_class ("suggested-action");
        buttons.append (suggested);
        var destructive = new Gtk.Button.with_label ("Delete");
        destructive.add_css_class ("destructive-action");
        buttons.append (destructive);
        buttons.append (new Gtk.Switch () { active = true, valign = Gtk.Align.CENTER });
        buttons.append (new Gtk.CheckButton () { active = true });

        var rows = new Gtk.ListBox () { selection_mode = Gtk.SelectionMode.NONE };
        rows.add_css_class ("boxed-list");
        rows.append (new Adw.SwitchRow () { title = "Switch row", active = true });
        rows.append (new Adw.EntryRow () { title = "Entry row", text = "Text" });
        rows.append (new Adw.SpinRow.with_range (0, 100, 1) { title = "Spin row", value = 42 });
        rows.append (new Adw.ActionRow () { title = "Action row", subtitle = "With a subtitle" });

        var progress = new Gtk.ProgressBar () { fraction = 0.6 };
        var scale = new Gtk.Scale.with_range (Gtk.Orientation.HORIZONTAL, 0, 100, 1);
        scale.set_value (40);

        var card = new Gtk.Label ("Card") { height_request = 48 };
        card.add_css_class ("card");
        var text = new Gtk.TextView () { height_request = 48, top_margin = 6, left_margin = 6 };
        text.buffer.text = "Text view (view colors)";
        var text_frame = new Gtk.Frame (null) { child = text };

        var states = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 12);
        foreach (var kind in new string[] { "accent", "success", "warning", "error" }) {
            var label = new Gtk.Label (kind);
            label.add_css_class (kind);
            states.append (label);
        }
        states.append (new Gtk.LinkButton.with_label ("https://gnome.org", "Link"));

        var main = new Gtk.Box (Gtk.Orientation.VERTICAL, 12) {
            margin_top = 12, margin_bottom = 12, margin_start = 12, margin_end = 12, hexpand = true,
        };
        main.append (new Adw.Banner ("Banner with an action") { revealed = true, button_label = "Action" });
        main.append (buttons);
        main.append (rows);
        main.append (progress);
        main.append (scale);
        main.append (card);
        main.append (text_frame);
        main.append (states);

        var panes = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        panes.append (sidebar);
        panes.append (new Gtk.Separator (Gtk.Orientation.VERTICAL));
        panes.append (main);

        var window = new Gtk.Box (Gtk.Orientation.VERTICAL, 0) {
            overflow = Gtk.Overflow.HIDDEN,
            margin_top = 6, margin_bottom = 18, margin_start = 12, margin_end = 12,
        };
        window.add_css_class ("theme-preview");
        window.append (header);
        window.append (panes);
        var preview_page = new Gtk.Box (Gtk.Orientation.VERTICAL, 6);
        preview_page.append (preview_mode);
        preview_page.append (window);
        return new Gtk.ScrolledWindow () {
            hscrollbar_policy = Gtk.PolicyType.NEVER,
            child = new Adw.Clamp () { maximum_size = 640, child = preview_page },
        };
    }

    static Gtk.Widget swatch (string color) {
        Gdk.RGBA rgba = {};
        rgba.parse (color);
        var area = new Gtk.DrawingArea () {
            content_width = 48,
            content_height = 24,
            valign = Gtk.Align.CENTER,
            tooltip_text = color,
        };
        area.set_draw_func ((drawing_area, cr, width, height) => {
            cr.set_source_rgba (rgba.red, rgba.green, rgba.blue, rgba.alpha);
            cr.paint ();
            cr.set_source_rgba (0.5, 0.5, 0.5, 0.5);
            cr.set_line_width (1);
            cr.rectangle (0.5, 0.5, width - 1, height - 1);
            cr.stroke ();
        });
        return area;
    }
}

int main (string[] args) {
    return new ThemeColors ().run (args);
}
