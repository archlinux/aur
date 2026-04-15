using Gtk;
using GLib;
using Gdk;

public class DesktopEntry : Object {
    public string path { get; set; default = ""; }
    public string desktop_id { get; set; default = ""; }
    public string name { get; set; default = ""; }
    public string comment { get; set; default = ""; }
    public string exec_cmd { get; set; default = ""; }
    public string icon_name { get; set; default = ""; }
    public string categories { get; set; default = ""; }
    public string source_dir { get; set; default = ""; }
    public bool no_display { get; set; default = false; }
    public bool hidden { get; set; default = false; }
    public bool is_user_owned { get; set; default = false; }
}

private enum CategoryColumns {
    ICON_NAME,
    LABEL,
    KEY
}

private enum EntryColumns {
    ICON_PIXBUF,
    NAME,
    COMMENT,
    PATH,
    ENTRY
}

public class DesktopScanner : Object {
    private const string DESKTOP_GROUP = "Desktop Entry";

    private string[] scan_dirs;
    private string[] user_delete_roots;
    private GenericArray<DesktopEntry> last_scan_entries;

    public DesktopScanner () {
        string home_dir = Environment.get_home_dir ();

        this.scan_dirs = {
            Path.build_filename (home_dir, ".local", "share", "applications"),
            "/usr/local/share/applications",
            "/usr/share/applications",
            Path.build_filename (home_dir, ".local", "share", "flatpak", "exports", "share", "applications"),
            "/var/lib/flatpak/exports/share/applications",
            "/var/lib/snapd/desktop/applications",
            Path.build_filename (home_dir, "Desktop"),
            Path.build_filename (home_dir, ".config", "autostart")
        };

        this.user_delete_roots = {
            Path.build_filename (home_dir, ".local", "share", "applications"),
            Path.build_filename (home_dir, "Desktop"),
            Path.build_filename (home_dir, ".config", "autostart"),
            Path.build_filename (home_dir, ".local", "share", "flatpak", "exports", "share", "applications")
        };

        this.last_scan_entries = new GenericArray<DesktopEntry> ();
    }

    public string[] get_scan_dirs () {
        return this.scan_dirs;
    }

    public string[] get_delete_roots () {
        return this.user_delete_roots;
    }

    public GenericArray<DesktopEntry> get_last_scan_entries () {
        return this.last_scan_entries;
    }

    public GenericArray<DesktopEntry> scan () {
        var results = new GenericArray<DesktopEntry> ();
        var seen = new HashTable<string, bool> (str_hash, str_equal);
        this.last_scan_entries = new GenericArray<DesktopEntry> ();

        foreach (string dir in this.scan_dirs) {
            scan_directory (dir, results, seen);
        }

        return results;
    }

    public string get_primary_category (DesktopEntry entry) {
        if (entry.categories == null || entry.categories == "") {
            return "Прочее";
        }

        string[] parts = entry.categories.split (";");
        foreach (string raw_part in parts) {
            string part = raw_part.strip ();
            if (part == "") {
                continue;
            }

            switch (part) {
            case "AudioVideo":
                return "Мультимедиа";
            case "Development":
                return "Разработка";
            case "Game":
                return "Игры";
            case "Graphics":
                return "Графика";
            case "Network":
                return "Интернет";
            case "Office":
                return "Офис";
            case "Science":
            case "Education":
                return "Наука";
            case "Settings":
                return "Настройки";
            case "System":
                return "Система";
            case "Utility":
                return "Утилиты";
            default:
                break;
            }
        }

        return "Прочее";
    }

    public string get_source_group (DesktopEntry entry) {
        string home_dir = Environment.get_home_dir ();
        string desktop_dir = Path.build_filename (home_dir, "Desktop");
        string autostart_dir = Path.build_filename (home_dir, ".config", "autostart");

        if (entry.source_dir == desktop_dir) {
            return "Desktop";
        }

        if (entry.source_dir == autostart_dir) {
            return "Autostart";
        }

        return "";
    }

    public bool is_path_user_owned (string path) {
        string canonical = canonicalize_path (path);
        if (canonical == "") {
            canonical = path;
        }

        foreach (string root in this.user_delete_roots) {
            string candidate = canonicalize_path (root);
            if (candidate == "") {
                candidate = root;
            }

            if (path_is_under (canonical, candidate)) {
                return true;
            }
        }

        return Posix.access (path, Posix.W_OK) == 0;
    }

    private void scan_directory (string dir, GenericArray<DesktopEntry> results, HashTable<string, bool> seen) {
        if (!FileUtils.test (dir, FileTest.IS_DIR)) {
            return;
        }

        try {
            var directory = File.new_for_path (dir);
            var enumerator = directory.enumerate_children (
                FileAttribute.STANDARD_NAME + "," + FileAttribute.STANDARD_TYPE,
                FileQueryInfoFlags.NONE,
                null
            );

            FileInfo? info = null;
            while ((info = enumerator.next_file (null)) != null) {
                if (info.get_file_type () != FileType.REGULAR && info.get_file_type () != FileType.SYMBOLIC_LINK) {
                    continue;
                }

                string name = info.get_name ();
                if (!name.has_suffix (".desktop")) {
                    continue;
                }

                string path = Path.build_filename (dir, name);
                var entry = parse_desktop_file (path, dir);
                if (entry == null) {
                    continue;
                }

                if (seen.contains (entry.desktop_id)) {
                    continue;
                }

                seen.insert (entry.desktop_id, true);
                results.add (entry);
                this.last_scan_entries.add (entry);
            }
        } catch (Error err) {
            stderr.printf ("Warning: failed to scan %s: %s\n", dir, err.message);
        }
    }

    private DesktopEntry? parse_desktop_file (string path, string source_dir) {
        try {
            var key_file = new KeyFile ();
            key_file.load_from_file (path, KeyFileFlags.NONE);

            string type_value = get_string_value (key_file, "Type");
            if (type_value != "Application") {
                return null;
            }

            string desktop_id = Path.get_basename (path);
            if (desktop_id.has_suffix (".desktop")) {
                desktop_id = desktop_id.substring (0, desktop_id.length - ".desktop".length);
            }

            var entry = new DesktopEntry ();
            entry.path = path;
            entry.desktop_id = desktop_id;
            entry.name = get_locale_value (key_file, "Name");
            if (entry.name == "") {
                entry.name = desktop_id;
            }
            entry.comment = get_locale_value (key_file, "Comment");
            entry.exec_cmd = get_string_value (key_file, "Exec");
            entry.icon_name = get_string_value (key_file, "Icon");
            entry.categories = get_string_value (key_file, "Categories");
            entry.source_dir = source_dir;
            entry.no_display = get_boolean_value (key_file, "NoDisplay");
            entry.hidden = get_boolean_value (key_file, "Hidden");
            entry.is_user_owned = is_path_user_owned (path);

            return entry;
        } catch (Error err) {
            stderr.printf ("Warning: failed to parse %s: %s\n", path, err.message);
            return null;
        }
    }

    private string get_locale_value (KeyFile key_file, string key) {
        try {
            return key_file.get_locale_string (DESKTOP_GROUP, key, null);
        } catch (Error err) {
            return "";
        }
    }

    private string get_string_value (KeyFile key_file, string key) {
        try {
            return key_file.get_string (DESKTOP_GROUP, key);
        } catch (Error err) {
            return "";
        }
    }

    private bool get_boolean_value (KeyFile key_file, string key) {
        try {
            return key_file.get_boolean (DESKTOP_GROUP, key);
        } catch (Error err) {
            return false;
        }
    }

    private string canonicalize_path (string path) {
        string? canonical = Posix.realpath (path);
        if (canonical == null) {
            return "";
        }

        return canonical;
    }

    private bool path_is_under (string child_path, string parent_path) {
        if (child_path == parent_path) {
            return true;
        }

        string normalized_parent = parent_path;
        if (!normalized_parent.has_suffix ("/")) {
            normalized_parent += "/";
        }

        return child_path.has_prefix (normalized_parent);
    }
}

public class DesktopItemManager : Gtk.Window {
    private const string CATEGORY_ALL = "__all__";
    private const string CATEGORY_USER = "__user__";
    private const int ICON_SIZE = 24;

    private DesktopScanner scanner;

    private GenericArray<FileMonitor> monitors;
    private GenericArray<DesktopEntry> entries;

    private Gtk.SearchEntry search_entry;
    private Gtk.ToggleButton hidden_toggle;
    private Gtk.Button create_button;

    private Gtk.TreeStore category_store;
    private Gtk.TreeView category_view;

    private Gtk.ListStore entry_store;
    private Gtk.TreeModelFilter entry_filter;
    private Gtk.TreeView entry_view;

    private Gtk.Label name_label;
    private Gtk.Label exec_label;
    private Gtk.Label path_label;

    private Gtk.Button launch_button;
    private Gtk.Button edit_button;
    private Gtk.Button delete_button;

    private string selected_category = CATEGORY_ALL;
    private uint rescan_source_id = 0;

    public DesktopItemManager () {
        Object (title: "Менеджер ярлыков");

        this.scanner = new DesktopScanner ();
        this.monitors = new GenericArray<FileMonitor> ();
        this.entries = new GenericArray<DesktopEntry> ();

        build_ui ();
        populate_categories ();
        rescan (); 
        setup_monitors ();

        delete_event.connect (() => {
            return false;
        });

        destroy.connect (() => {
            cleanup_monitors ();

            if (this.rescan_source_id != 0) {
                Source.remove (this.rescan_source_id);
                this.rescan_source_id = 0;
            }

            Gtk.main_quit ();
        });
    }

    private void build_ui () {
        set_default_size (1100, 720);
        set_position (Gtk.WindowPosition.CENTER);

        var header = new Gtk.HeaderBar ();
        header.show_close_button = true;
        header.title = "Менеджер ярлыков";

        this.search_entry = new Gtk.SearchEntry ();
        this.search_entry.placeholder_text = "Поиск...";
        this.search_entry.hexpand = true;
        this.search_entry.changed.connect (() => {
            this.entry_filter.refilter ();
        });
        header.pack_start (this.search_entry);

        this.hidden_toggle = new Gtk.ToggleButton.with_label ("Скрытые");
        this.hidden_toggle.toggled.connect (() => {
            this.entry_filter.refilter ();
        });
        header.pack_end (this.hidden_toggle);

        this.create_button = new Gtk.Button.with_label ("+ Создать");
        this.create_button.clicked.connect (() => {
            on_create_clicked ();
        });
        header.pack_end (this.create_button);

        set_titlebar (header);

        var main_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
        add (main_box);

        var paned = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
        main_box.pack_start (paned, true, true, 0);

        build_category_panel (paned);
        build_entry_panel (paned);

        var detail_panel = build_detail_panel ();
        main_box.pack_end (detail_panel, false, true, 0);
    }

    private void build_category_panel (Gtk.Paned paned) {
        this.category_store = new Gtk.TreeStore (
            3,
            typeof (string),
            typeof (string),
            typeof (string)
        );

        this.category_view = new Gtk.TreeView.with_model (this.category_store);
        this.category_view.headers_visible = false;

        var icon_renderer = new Gtk.CellRendererPixbuf ();
        var icon_column = new Gtk.TreeViewColumn.with_attributes (
            "",
            icon_renderer,
            "icon-name",
            CategoryColumns.ICON_NAME,
            null
        );
        this.category_view.append_column (icon_column);

        var text_renderer = new Gtk.CellRendererText ();
        var text_column = new Gtk.TreeViewColumn.with_attributes (
            "Категория",
            text_renderer,
            "text",
            CategoryColumns.LABEL,
            null
        );
        this.category_view.append_column (text_column);

        var selection = this.category_view.get_selection ();
        selection.set_mode (Gtk.SelectionMode.SINGLE);
        selection.changed.connect (() => {
            on_category_changed ();
        });

        var scrolled = new Gtk.ScrolledWindow (null, null);
        scrolled.set_policy (Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC);
        scrolled.set_min_content_width (250);
        scrolled.add (this.category_view);

        paned.pack1 (scrolled, false, false);
    }

    private void build_entry_panel (Gtk.Paned paned) {
        this.entry_store = new Gtk.ListStore (
            5,
            typeof (Gdk.Pixbuf),
            typeof (string),
            typeof (string),
            typeof (string),
            typeof (DesktopEntry)
        );
        this.entry_store.set_sort_column_id (EntryColumns.NAME, Gtk.SortType.ASCENDING);

        this.entry_filter = new Gtk.TreeModelFilter (this.entry_store, null);
        this.entry_filter.set_visible_func ((model, iter) => {
            return entry_visible (model, iter);
        });

        this.entry_view = new Gtk.TreeView.with_model (this.entry_filter);
        this.entry_view.headers_visible = true;
        this.entry_view.activate_on_single_click = false;
        this.entry_view.row_activated.connect ((path, column) => {
            on_launch_clicked ();
        });

        var icon_renderer = new Gtk.CellRendererPixbuf ();
        var icon_column = new Gtk.TreeViewColumn.with_attributes (
            "",
            icon_renderer,
            "pixbuf",
            EntryColumns.ICON_PIXBUF,
            null
        );
        icon_column.min_width = 34;
        this.entry_view.append_column (icon_column);

        var name_renderer = new Gtk.CellRendererText ();
        var name_column = new Gtk.TreeViewColumn.with_attributes (
            "Имя",
            name_renderer,
            "text",
            EntryColumns.NAME,
            null
        );
        name_column.expand = true;
        this.entry_view.append_column (name_column);

        var comment_renderer = new Gtk.CellRendererText ();
        var comment_column = new Gtk.TreeViewColumn.with_attributes (
            "Описание",
            comment_renderer,
            "text",
            EntryColumns.COMMENT,
            null
        );
        comment_column.expand = true;
        this.entry_view.append_column (comment_column);

        var selection = this.entry_view.get_selection ();
        selection.set_mode (Gtk.SelectionMode.SINGLE);
        selection.changed.connect (() => {
            on_selection_changed ();
        });

        var scrolled = new Gtk.ScrolledWindow (null, null);
        scrolled.set_policy (Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC);
        scrolled.add (this.entry_view);

        paned.pack2 (scrolled, true, false);
    }

    private Gtk.Widget build_detail_panel () {
        var frame = new Gtk.Frame (null);
        frame.shadow_type = Gtk.ShadowType.IN;

        var outer_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 10);
        outer_box.margin = 12;
        frame.add (outer_box);

        var grid = new Gtk.Grid ();
        grid.column_spacing = 12;
        grid.row_spacing = 6;
        outer_box.pack_start (grid, false, false, 0);

        var name_title = new Gtk.Label ("Имя:");
        name_title.halign = Gtk.Align.START;
        grid.attach (name_title, 0, 0, 1, 1);

        this.name_label = new Gtk.Label ("—");
        this.name_label.halign = Gtk.Align.START;
        this.name_label.selectable = true;
        this.name_label.ellipsize = Pango.EllipsizeMode.END;
        grid.attach (this.name_label, 1, 0, 1, 1);

        var exec_title = new Gtk.Label ("Exec:");
        exec_title.halign = Gtk.Align.START;
        grid.attach (exec_title, 0, 1, 1, 1);

        this.exec_label = new Gtk.Label ("—");
        this.exec_label.halign = Gtk.Align.START;
        this.exec_label.selectable = true;
        this.exec_label.ellipsize = Pango.EllipsizeMode.MIDDLE;
        grid.attach (this.exec_label, 1, 1, 1, 1);

        var path_title = new Gtk.Label ("Путь:");
        path_title.halign = Gtk.Align.START;
        grid.attach (path_title, 0, 2, 1, 1);

        this.path_label = new Gtk.Label ("—");
        this.path_label.halign = Gtk.Align.START;
        this.path_label.selectable = true;
        this.path_label.ellipsize = Pango.EllipsizeMode.MIDDLE;
        grid.attach (this.path_label, 1, 2, 1, 1);

        var button_box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 8);
        outer_box.pack_end (button_box, false, false, 0);

        this.launch_button = new Gtk.Button.with_label ("▶ Запустить");
        this.launch_button.sensitive = false;
        this.launch_button.clicked.connect (() => {
            on_launch_clicked ();
        });
        button_box.pack_start (this.launch_button, false, false, 0);

        this.edit_button = new Gtk.Button.with_label ("✎ Изменить");
        this.edit_button.sensitive = false;
        this.edit_button.clicked.connect (() => {
            on_edit_clicked ();
        });
        button_box.pack_start (this.edit_button, false, false, 0);

        this.delete_button = new Gtk.Button.with_label ("🗑 Удалить");
        this.delete_button.sensitive = false;
        this.delete_button.clicked.connect (() => {
            on_delete_clicked ();
        });
        button_box.pack_start (this.delete_button, false, false, 0);

        return frame;
    }

    private void populate_categories () {
        this.category_store.clear ();

        add_category_row ("view-list-symbolic", "Все", CATEGORY_ALL);
        add_category_row ("applications-multimedia", "Мультимедиа", "Мультимедиа");
        add_category_row ("applications-development", "Разработка", "Разработка");
        add_category_row ("applications-games", "Игры", "Игры");
        add_category_row ("applications-graphics", "Графика", "Графика");
        add_category_row ("applications-internet", "Интернет", "Интернет");
        add_category_row ("x-office-document", "Офис", "Офис");
        add_category_row ("applications-science", "Наука", "Наука");
        add_category_row ("preferences-system", "Настройки", "Настройки");
        add_category_row ("applications-system", "Система", "Система");
        add_category_row ("applications-utilities", "Утилиты", "Утилиты");
        add_category_row ("applications-other", "Прочее", "Прочее");
        add_category_row ("media-playlist-repeat", "Autostart", "Autostart");
        add_category_row ("user-desktop", "Desktop", "Desktop");
        add_category_row ("user-home", "Пользовательские", CATEGORY_USER);

        Gtk.TreeIter first_iter;
        if (this.category_store.get_iter_first (out first_iter)) {
            this.category_view.get_selection ().select_iter (first_iter);
        }
    }

    private void add_category_row (string icon_name, string label, string key) {
        Gtk.TreeIter iter;
        this.category_store.append (out iter, null);
        this.category_store.set (
            iter,
            CategoryColumns.ICON_NAME, icon_name,
            CategoryColumns.LABEL, label,
            CategoryColumns.KEY, key
        );
    }

    private void populate_entries () {
        this.entry_store.clear ();
        var scan_entries = this.scanner.get_last_scan_entries ();

        for (uint i = 0; i < scan_entries.length; i++) {
            DesktopEntry entry = scan_entries[i];
            Gdk.Pixbuf? icon = load_entry_icon (entry);
            Gtk.TreeIter iter;
            this.entry_store.append (out iter);
            this.entry_store.set (
                iter,
                EntryColumns.ICON_PIXBUF, icon,
                EntryColumns.NAME, entry.name,
                EntryColumns.COMMENT, entry.comment,
                EntryColumns.PATH, entry.path,
                EntryColumns.ENTRY, entry
            );
        }
    }

    private Gdk.Pixbuf? load_entry_icon (DesktopEntry entry) {
        string icon_name = entry.icon_name;
        if (icon_name == null || icon_name.strip () == "") {
            icon_name = "application-x-executable";
        }

        try {
            if (Path.is_absolute (icon_name) && FileUtils.test (icon_name, FileTest.EXISTS)) {
                return new Gdk.Pixbuf.from_file_at_scale (icon_name, ICON_SIZE, ICON_SIZE, true);
            }
        } catch (Error err) {
        }

        var theme = Gtk.IconTheme.get_default ();
        try {
            return theme.load_icon (icon_name, ICON_SIZE, 0);
        } catch (Error err) {
            try {
                return theme.load_icon ("application-x-executable", ICON_SIZE, 0);
            } catch (Error fallback_err) {
                return null;
            }
        }
    }

    private void setup_monitors () {
        cleanup_monitors ();
        this.monitors = new GenericArray<FileMonitor> ();

        foreach (string dir in this.scanner.get_scan_dirs ()) {
            if (!FileUtils.test (dir, FileTest.IS_DIR)) {
                continue;
            }

            try {
                var monitor = File.new_for_path (dir).monitor_directory (FileMonitorFlags.NONE, null);
                monitor.changed.connect ((file, other_file, event_type) => {
                    on_dir_changed ();
                });
                this.monitors.add (monitor);
            } catch (Error err) {
                stderr.printf ("Warning: failed to monitor %s: %s\n", dir, err.message);
            }
        }
    }

    private void cleanup_monitors () {
        for (uint i = 0; i < this.monitors.length; i++) {
            this.monitors[i].cancel ();
        }

        this.monitors = new GenericArray<FileMonitor> ();
    }

    private void on_dir_changed () {
        if (this.rescan_source_id != 0) {
            Source.remove (this.rescan_source_id);
            this.rescan_source_id = 0;
        }

        this.rescan_source_id = Timeout.add (500, () => {
            this.rescan_source_id = 0;
            rescan ();
            return false;
        });
    }

    private void rescan () {
        string previous_path = get_selected_path ();

        this.entries = this.scanner.scan ();
        populate_entries ();
        this.entry_filter.refilter ();

        if (previous_path != "" && select_entry_by_path (previous_path)) {
            return;
        }

        clear_details ();
    }

    private bool entry_visible (Gtk.TreeModel model, Gtk.TreeIter iter) {
        DesktopEntry? entry = null;
        model.get (iter, EntryColumns.ENTRY, out entry);
        if (entry == null) {
            return false;
        }

        if (!this.hidden_toggle.active && (entry.no_display || entry.hidden)) {
            return false;
        }

        string query = this.search_entry.text.strip ().down ();
        if (query != "") {
            string haystack = (entry.name + "\n" + entry.comment + "\n" + entry.exec_cmd).down ();
            if (!haystack.contains (query)) {
                return false;
            }
        }

        if (this.selected_category == CATEGORY_ALL) {
            return true;
        }

        if (this.selected_category == CATEGORY_USER) {
            return entry.is_user_owned;
        }

        if (this.scanner.get_source_group (entry) == this.selected_category) {
            return true;
        }

        return this.scanner.get_primary_category (entry) == this.selected_category;
    }

    private void on_category_changed () {
        Gtk.TreeModel? model = null;
        Gtk.TreeIter iter;

        if (this.category_view.get_selection ().get_selected (out model, out iter)) {
            string key = CATEGORY_ALL;
            model.get (iter, CategoryColumns.KEY, out key);
            this.selected_category = key;
        } else {
            this.selected_category = CATEGORY_ALL;
        }

        this.entry_filter.refilter ();
        if (get_selected_entry () == null) {
            clear_details ();
        }
    }

    private void on_selection_changed () {
        DesktopEntry? entry = get_selected_entry ();
        if (entry == null) {
            clear_details ();
            return;
        }

        this.name_label.set_text (entry.name != "" ? entry.name : "—");
        this.exec_label.set_text (entry.exec_cmd != "" ? entry.exec_cmd : "—");
        this.path_label.set_text (entry.path != "" ? entry.path : "—");

        this.launch_button.sensitive = true;
        this.edit_button.sensitive = true;
        this.delete_button.sensitive = can_delete_entry (entry);
    }

    private void clear_details () {
        this.name_label.set_text ("—");
        this.exec_label.set_text ("—");
        this.path_label.set_text ("—");

        this.launch_button.sensitive = false;
        this.edit_button.sensitive = false;
        this.delete_button.sensitive = false;
    }

    private DesktopEntry? get_selected_entry () {
        Gtk.TreeModel? model = null;
        Gtk.TreeIter iter;

        if (!this.entry_view.get_selection ().get_selected (out model, out iter)) {
            return null;
        }

        DesktopEntry? entry = null;
        model.get (iter, EntryColumns.ENTRY, out entry);
        return entry;
    }

    private string get_selected_path () {
        DesktopEntry? entry = get_selected_entry ();
        if (entry == null) {
            return "";
        }

        return entry.path;
    }

    private bool select_entry_by_path (string path) {
        Gtk.TreeIter iter;
        if (!this.entry_filter.get_iter_first (out iter)) {
            return false;
        }

        do {
            string row_path = "";
            this.entry_filter.get (iter, EntryColumns.PATH, out row_path);
            if (row_path == path) {
                var selection = this.entry_view.get_selection ();
                selection.select_iter (iter);

                Gtk.TreePath tree_path = this.entry_filter.get_path (iter);
                this.entry_view.scroll_to_cell (tree_path, null, false, 0.0f, 0.0f);
                return true;
            }
        } while (this.entry_filter.iter_next (ref iter));

        return false;
    }

    private void on_launch_clicked () {
        DesktopEntry? entry = get_selected_entry ();
        if (entry == null) {
            return;
        }

        try {
            var info = new DesktopAppInfo.from_filename (entry.path);
            if (info == null) {
                show_error_dialog ("Не удалось открыть ярлык.", entry.path);
                return;
            }

            info.launch (null, null);
        } catch (Error err) {
            show_error_dialog ("Не удалось запустить приложение.", err.message);
        }
    }

    private void on_edit_clicked () {
        DesktopEntry? entry = get_selected_entry ();
        if (entry == null) {
            return;
        }

        try {
            string[] argv = { "gnome-desktop-item-edit", entry.path };
            Pid child_pid;
            Process.spawn_async (null, argv, null, SpawnFlags.SEARCH_PATH, null, out child_pid);
        } catch (Error err) {
            show_error_dialog ("Не удалось открыть редактор ярлыков.", err.message);
        }
    }

    private void on_create_clicked () {
        try {
            string[] argv = { "gnome-desktop-item-edit" };
            Pid child_pid;
            Process.spawn_async (null, argv, null, SpawnFlags.SEARCH_PATH, null, out child_pid);
        } catch (Error err) {
            show_error_dialog ("Не удалось запустить создание ярлыка.", err.message);
        }
    }

    private void on_delete_clicked () {
        DesktopEntry? entry = get_selected_entry ();
        if (entry == null) {
            return;
        }

        if (!can_delete_entry (entry)) {
            show_error_dialog ("Удаление недоступно.", "Разрешено удалять только пользовательские ярлыки из поддерживаемых каталогов.");
            return;
        }

        var dialog = new Gtk.MessageDialog (
            this,
            Gtk.DialogFlags.MODAL,
            Gtk.MessageType.WARNING,
            Gtk.ButtonsType.OK_CANCEL,
            "Удалить %s?\nПуть: %s",
            entry.name,
            entry.path
        );

        int response = dialog.run ();
        dialog.destroy ();
        if (response != Gtk.ResponseType.OK) {
            return;
        }

        if (FileUtils.remove (entry.path) != 0) {
            show_error_dialog ("Не удалось удалить файл.", entry.path);
            return;
        }

        rescan ();
    }

    private bool can_delete_entry (DesktopEntry entry) {
        if (!entry.is_user_owned) {
            return false;
        }

        string canonical = canonicalize_path (entry.path);
        if (canonical == "") {
            return false;
        }

        foreach (string root in this.scanner.get_delete_roots ()) {
            string allowed_root = canonicalize_path (root);
            if (allowed_root == "") {
                allowed_root = root;
            }

            if (path_is_under (canonical, allowed_root)) {
                return true;
            }
        }

        return false;
    }

    private void show_error_dialog (string primary_text, string secondary_text) {
        var dialog = new Gtk.MessageDialog (
            this,
            Gtk.DialogFlags.MODAL,
            Gtk.MessageType.ERROR,
            Gtk.ButtonsType.CLOSE,
            "%s",
            primary_text
        );

        if (secondary_text != "") {
            dialog.format_secondary_text ("%s", secondary_text);
        }

        dialog.run ();
        dialog.destroy ();
    }

    private string canonicalize_path (string path) {
        string? canonical = Posix.realpath (path);
        if (canonical == null) {
            return "";
        }

        return canonical;
    }

    private bool path_is_under (string child_path, string parent_path) {
        if (child_path == parent_path) {
            return true;
        }

        string normalized_parent = parent_path;
        if (!normalized_parent.has_suffix ("/")) {
            normalized_parent += "/";
        }

        return child_path.has_prefix (normalized_parent);
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);
    var window = new DesktopItemManager ();
    window.show_all ();
    Gtk.main ();
    return 0;
}
