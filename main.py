#!/usr/bin/env python3
import sys, os
from multiprocessing import freeze_support
if __name__ == '__main__':
    freeze_support() 
    worker_type = os.environ.get("FLAMEGET_WORKER")
    if "downloader" == worker_type:
        import downloader
        downloader.main()
        sys.exit(0)
    elif "browser" == worker_type:
        import browser_context_menu_handler
        browser_context_menu_handler.main()
        sys.exit(0)

import gi, signal, subprocess, shutil, time, json, re, socket, threading, tempfile
gi.require_version('Gtk', '4.0')
from gi.repository import Gtk, Gio, GObject, Gdk, GLib, Graphene, Pango

import Toast as toast
import FireAddOns as addOn
import SaveManager
yt_dlp = addOn.lazy_import("yt_dlp")
requests = addOn.lazy_import("requests")

WINDOWS_PORT = 18597
WINDOWS_TRAY_PORT = 18598
SOCKET_PATH = os.path.join(addOn.UNITS.RUNTIME_DIR, "flameget_dm_tray.sock")
HAS_SIGUSR1 = hasattr(signal, "SIGUSR1")

os.environ['GTK_CSD'] = '0'

class TorrentNode(GObject.Object):
    __gtype_name__ = 'TorrentNode'

    def __init__(self, name, size_str, index, is_dir=False, parent=None):
        super().__init__()
        self.name = name
        self.size_str = size_str
        self.index = index
        self.is_dir = is_dir
        self.parent = parent
        self.children_store = Gio.ListStore(item_type=TorrentNode) if is_dir else None
        
        self._checked = True
        self._inconsistent = False

    @GObject.Property(type=str)
    def name_prop(self): return self.name

    @GObject.Property(type=str)
    def size_prop(self): return self.size_str

    @GObject.Property(type=bool, default=True)
    def checked_prop(self): return self._checked

    @checked_prop.setter
    def checked_prop(self, value): 
        self._checked = value
        self.notify("checked-prop")

    @GObject.Property(type=bool, default=False)
    def inconsistent_prop(self): return self._inconsistent

    @inconsistent_prop.setter
    def inconsistent_prop(self, value):
        self._inconsistent = value
        self.notify("inconsistent-prop")

    def toggle(self, active):
        self.set_state_recursive(active)
        if self.parent:
            self.parent.recalculate_state()

    def set_state_recursive(self, active):
        self.checked_prop = active
        self.inconsistent_prop = False
        if self.is_dir:
            n = self.children_store.get_n_items()
            for i in range(n):
                self.children_store.get_item(i).set_state_recursive(active)

    def recalculate_state(self):
        if not self.is_dir: return
        n = self.children_store.get_n_items()
        if n == 0: return

        all_checked = True; none_checked = True; any_inconsistent = False

        for i in range(n):
            child = self.children_store.get_item(i)
            if child.inconsistent_prop: any_inconsistent = True
            if child.checked_prop: none_checked = False
            else: all_checked = False

        if any_inconsistent:
            self.inconsistent_prop = True; self.checked_prop = False
        elif all_checked:
            self.inconsistent_prop = False; self.checked_prop = True
        elif none_checked:
            self.inconsistent_prop = False; self.checked_prop = False
        else:
            self.inconsistent_prop = True; self.checked_prop = False

        if self.parent: self.parent.recalculate_state()

class TrackerItem(GObject.Object):
    __gtype_name__ = 'TrackerItem'
    url = GObject.Property(type=str, default="")
    def __init__(self, url):
        super().__init__()
        self.url = url

class DownloadItem(GObject.Object):
    __gtype_name__ = 'DownloadItem'

    def __init__(self, row):
        super().__init__()
        self.id = row['id']  
        self.filename = row['filename']
        self.size = row['size']
        self.status = row['status']
        self.progress = row['progress']
        self.speed = row['speed']
        self.time_left = row['time_left']
        self.date_added = row['date_added']
        try: self.scheduled_time = row['scheduled_time']
        except (IndexError, KeyError): self.scheduled_time = 0
        self.category = row['category']
        self.file_directory = row['file_directory']
        self.url = row['url']
        self.pid = row['pid']
        self.file_size_bytes = row['file_size_bytes']
        self.segments = row['segments']
        self.is_audio = bool(row['is_audio'])
        self.quality_mod = row['quality_mod']
        self.download_playlist = bool(row['download_playlist'])
        self.finished_downloading = bool(row['finished_downloading'])

    @GObject.Property(type=str)
    def name_prop(self): return self.filename
    
    @GObject.Property(type=str)
    def status_prop(self): return self.status

    @GObject.Property(type=int)
    def progress_prop(self): return self.progress

    @GObject.Property(type=str)
    def speed_prop(self): return self.speed

    @GObject.Property(type=str)
    def date_prop(self):
        return time.strftime("%d %b %Y", time.localtime(float(self.date_added))) if str(self.date_added).replace('.','',1).isdigit() else "UNKNOWN"

    @GObject.Property(type=str)
    def pid_prop(self): return self.pid

    def update_data(self, row):
        """Update data and notify UI only if changed. No splice needed."""
        if self.filename != row['filename']:
            self.filename = row['filename']
            self.notify("name-prop")

        if self.file_directory != row['file_directory']:
            self.file_directory = row['file_directory']

        if self.status != row['status']:
            self.status = row['status']
            self.notify("status-prop") 
        
        try:
            safe_progress = float(row['progress'])
        except (ValueError, TypeError):
            safe_progress = 0.0

        if self.progress != safe_progress:
            self.progress = safe_progress
            self.notify("progress-prop") 
            
        if self.speed != row['speed']:
            self.speed = row['speed']
            self.notify("speed-prop")
        
        if self.time_left != row['time_left']:
            self.time_left = row['time_left']

        if self.pid != row['pid']:
            self.pid = row['pid']
            self.notify("pid-prop")

        new_finished_state = bool(row['finished_downloading'])
        if self.finished_downloading != new_finished_state:
            self.finished_downloading = new_finished_state

class FlameGetManager(Gtk.Application):
    def __init__(self):
        super().__init__(application_id='io.github.C_Yassin.FlameGet', flags=Gio.ApplicationFlags.FLAGS_NONE)
        GLib.set_prgname('FlameGet')
        GLib.set_application_name('FlameGet')
        self.app_name = "FlameGet Download Manager"
        self.select_all_btn = []
        self.all_selected = False
        self.has_settedup_events = False
        self._syncing = False
        self.search_text = ""
        self.raw_file_url = ""
        self.last_click_index = None
        self.currently_selected_items = []
        self.pid_list = {}
        self.selection_model = None 
        self.selection_models_map = {} 
        self.store_caches = {}
        self.view_registry = {}
        self.torrent_files_data = []
        self.is_programmatic_sort = False
        self.start_minimized = False

        self.add_url_dialog = None
        self.can_delete_dialog = None
        self.is_flatpak_env = 'FLATPAK_ID' in os.environ or os.path.exists('/.flatpak-info')

        fire_files = addOn.FireFiles
        self.db = fire_files.db
        self.db.clean_startup()
        self.install_dir = fire_files.install_dir
        self.downloader_script_path = fire_files.downloader_script_path
        self.browser_context_menu_handler_script_path = fire_files.browser_context_menu_handler_script_path

        self.tray_script_path = fire_files.tray_script_path
        self.server_script_path = fire_files.server_script_path
        
        self.download_folder = GLib.get_user_special_dir(GLib.UserDirectory.DIRECTORY_DOWNLOAD)
        self.translations = SaveManager.load_translations()
        self.prev_statuses = {} 

        self.tray_process = None
        self.server_process = None
        self.server_socket = None
        self.server_running = False

        self.app_settings = SaveManager.load_settings(self.download_folder)
        self.download_engine = self.app_settings.get("engine").lower()
        saved_dir = self.app_settings.get("default_download_dir")
        if saved_dir and os.path.exists(saved_dir):
            self.download_folder = saved_dir

        self.context_popover = None
        self.context_menu_box = None
        self.context_menu_btns = []
        self.current_toast = None
        self.is_rtl = False
        self.setup_signal_handlers()

    def tr(self, text):
        """Simple translation lookup."""
        lang = self.app_settings.get("language", "en")
        if lang in self.translations and text in self.translations[lang]:
            return self.translations[lang][text]
        return text

    def do_activate(self):
        self.window = Gtk.ApplicationWindow(application=self, title=self.app_name)
        self.window.set_default_size(1200, 700)
        self.window.set_icon_name("io.github.C_Yassin.FlameGet" if self.is_flatpak_env else "flameget")

        drop_target = Gtk.DropTarget.new(Gio.File, Gdk.DragAction.COPY)
        drop_target.connect("enter", self.on_drag_enter)
        drop_target.connect("leave", self.on_drag_leave)
        drop_target.connect("drop", self.on_file_drop)
        self.window.add_controller(drop_target)

        key_controller = Gtk.EventControllerKey()
        key_controller.connect("key-pressed", self.on_window_key_pressed)
        self.window.add_controller(key_controller)

        self.window.connect("close-request", self.on_window_close_request)

        self.apply_theme_and_font()
        self.toggle_autostart(self.app_settings.get("start_on_boot", False))
        
        root_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)

        self.overlay = Gtk.Overlay()
        self.overlay.set_child(root_box)
        self.window.set_child(self.overlay)

        self.drop_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        self.drop_box.set_halign(Gtk.Align.FILL)
        self.drop_box.set_valign(Gtk.Align.FILL)
        self.drop_box.set_visible(False)
        self.drop_box.add_css_class("drop-zone")

        inner_content = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=20)
        inner_content.set_halign(Gtk.Align.CENTER)
        inner_content.set_valign(Gtk.Align.CENTER)
        inner_content.set_hexpand(True)
        inner_content.set_vexpand(True)

        self.drop_icon = Gtk.Image.new_from_icon_name("xsi-document-new-symbolic")
        self.drop_icon.set_pixel_size(128)
        
        self.drop_label = Gtk.Label(label=self.tr("Drop Here"))
        self.drop_label.add_css_class("drop-text") 

        inner_content.append(self.drop_icon)
        inner_content.append(self.drop_label)

        self.drop_box.append(inner_content)
        self.overlay.add_overlay(self.drop_box)

        root_box.append(self.create_toolbar())
        sep = Gtk.Separator(orientation=Gtk.Orientation.HORIZONTAL)
        sep.add_css_class("h-separator")
        root_box.append(sep)
        
        content_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL)
        content_box.set_vexpand(True)
        root_box.append(content_box)
        self.build_custom_context_menu()

        footer = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=12)
        footer.set_hexpand(True)
        footer.add_css_class("footer")
        self.active_label = Gtk.Label(label=f"{self.tr("Active")}: 0")
        self.paused_label = Gtk.Label(label=f"{self.tr("Paused")}: 0")
        self.total_label = Gtk.Label(label=f"{self.tr("Total")}: 0")
        stats_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=16)
        stats_box.append(self.active_label)
        stats_box.append(self.paused_label)
        stats_box.append(self.total_label)
        stats_box.set_hexpand(True)
        stats_box.set_halign(Gtk.Align.START)
        footer.append(stats_box)
        root_box.append(footer)

        self.stack = Gtk.Stack()
        self.stack.set_transition_type(Gtk.StackTransitionType.CROSSFADE)
        
        sidebar_frame = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        sidebar_frame.set_size_request(200, -1)
        if self.app_settings.get("language") == "ar":
            sidebar_frame.add_css_class("arabic-sidebar-bg")
            self.is_rtl = True
        else:
            sidebar_frame.add_css_class("sidebar-bg")
        
        content_box.append(sidebar_frame)
        content_box.append(self.stack)

        main_cats = [
            ("All", "xsi-folder-open-symbolic", "All"),
            ("Compressed", "xsi-package-x-generic-symbolic", "Compressed"),
            ("Programs", "xsi-executable-symbolic", "Programs"),
            ("Videos", "xsi-folder-videos-symbolic", "Videos"),
            ("Music", "xsi-folder-music-symbolic", "Music"),
            ("Pictures", "xsi-folder-pictures-symbolic", "Pictures"),
            ("Documents", "xsi-x-office-document-symbolic", "Documents"),
        ]
        
        status_cats = [
            ("Torrents", "xsi-folder-templates-symbolic", "Torrents"),
            ("Finished", "xsi-emblem-ok-symbolic", "Finished"),
            ("Unfinished", "xsi-emblem-synchronizing-symbolic", "Unfinished"),
        ]

        sidebar_frame.set_orientation(Gtk.Orientation.VERTICAL)
        sidebar_frame.set_spacing(5)

        first_row = None

        def build_sidebar_group(cat_list):
            nonlocal first_row
            lbox = Gtk.ListBox()
            lbox.set_selection_mode(Gtk.SelectionMode.SINGLE)
            lbox.add_css_class("navigation-sidebar")
            lbox.add_css_class("sidebar-background")
            
            for label, icon, cat_id in cat_list:
                row = Gtk.ListBoxRow()
                row.cat_id = cat_id
                
                box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
                box.set_margin_start(10); box.set_margin_end(10)
                box.set_margin_top(8); box.set_margin_bottom(8)
                
                img = Gtk.Image.new_from_icon_name(icon)
                lbl = Gtk.Label(label=self.tr(label), xalign=0)
                if label == "Unfinished":
                    row.add_css_class("unfinished-label")
                elif label == "Finished":
                    row.add_css_class("Finished-label")
                elif label == "Torrents":
                    row.add_css_class("Torrents-label")
                box.append(img); 
                box.append(lbl)
                row.set_child(box)
                lbox.append(row)
                
                if not first_row: first_row = row
                
                page = self.create_download_view(cat_id)
                self.stack.add_named(page, cat_id)
                self.set_cursor_for_widget(row, "pointer")
            lbox.connect("row-selected", self.on_sidebar_row_selected)
            return lbox

        self.listbox_main = build_sidebar_group(main_cats)
        self.listbox_status = build_sidebar_group(status_cats)
        
        sidebar_frame.append(self.listbox_main)
        sidebar_frame.append(self.listbox_status)

        self.listbox_main.select_row(first_row)
        
        if self.start_minimized:
            self.window.set_visible(True)
            addOn.set_titlebar_theme(self.app_name, self.app_settings.get("theme_mode"))
            self.window.set_visible(False)
        else:
            self.window.present()
        
        self.check_and_install_ffmpeg(self.window, self.install_dir)
        self.apply_cursor_recursive(self.window, "pointer")
        
        GLib.idle_add(self.update_stats_labels)
        GLib.timeout_add(200, self.on_global_tick)
        
        self.start_server()
        self.start_tray_subprocess()

        if len(sys.argv) > 1:
            arg = sys.argv[1]
            if arg.startswith("magnet:?") or arg.endswith(".torrent"):
                GLib.timeout_add(500, self.handle_external_url, arg)

    def on_file_drop(self, target, value, x, y):
        GLib.idle_add(self.drop_box.set_visible, False)
        if isinstance(value, Gio.File):
            path = value.get_path()
            print(path)
            if path and path.lower().endswith(".torrent"):
                self.add_url_button(None, is_torrent_ready=path)
                self.entry_url.set_text(path)
                return True
        return False

    def on_drag_enter(self, target, x, y):
        GLib.idle_add(self.drop_box.set_visible, True)
        return Gdk.DragAction.COPY

    def on_drag_leave(self, target):
        GLib.idle_add(self.drop_box.set_visible, False)

    def build_custom_context_menu(self):
        """Creates a custom Popover with styled buttons."""
        self.context_popover = Gtk.Popover()
        self.context_popover.add_css_class("context_popover")
        self.context_popover.set_has_arrow(False)
        self.context_popover.set_parent(self.overlay)
        self.context_popover.set_autohide(True)
        
        self.context_menu_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=2)
        self.context_menu_box.set_margin_top(5)
        self.context_menu_box.set_margin_bottom(5)
        self.context_menu_box.set_margin_start(5)
        self.context_menu_box.set_margin_end(5)
        self.context_popover.set_child(self.context_menu_box)

        self._add_menu_item("Open File", "xsi-folder-symbolic", self.ctx_open_file)
        self._add_menu_item("Open Folder", "xsi-folder-open-symbolic", self.ctx_open_folder)
        self._add_menu_item("Copy Download Link", "xsi-edit-copy-symbolic", self.ctx_copy_url)
        
        self._add_separator()
        
        self._add_menu_item("Pause Download", "xsi-media-playback-pause-symbolic", self.ctx_pause)
        self._add_menu_item("Resume Download", "xsi-media-playback-start-symbolic", self.ctx_resume)
        self._add_menu_item("Stop Download", "xsi-media-playback-stop-symbolic", self.ctx_stop)
        
        self._add_separator()
        
        self._add_menu_item("Retry Download", "xsi-view-refresh-symbolic", self.ctx_redo_download)
        self._add_menu_item("Delete File", "xsi-user-trash-symbolic", self.ctx_delete_file, "destructive-action")

    def _add_menu_item(self, label, icon_name, callback, css_class=None):
        """Helper to create a flat button that looks like a menu item."""
        btn = Gtk.Button()
        btn.add_css_class("flat")
        if css_class:
            btn.add_css_class(css_class)
            
        box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
        img = Gtk.Image.new_from_icon_name(icon_name)
        lbl = Gtk.Label(label=self.tr(label), xalign=0)
        
        box.append(img)
        box.append(lbl)
        btn.set_child(box)
        btn.lbl = lbl
        def on_click(b):
            self.context_popover.popdown()
            callback()
            
        btn.connect("clicked", on_click)
        btn.add_css_class("context-btn")
        btn.lbl.add_css_class("context-btn")
        btn.add_css_class("generic-button")
        self.context_menu_btns.append(btn)
        self.context_menu_box.append(btn)
        self.context_menu_box.add_css_class("ctx-menu")

    def _add_separator(self):
        sep = Gtk.Separator(orientation=Gtk.Orientation.HORIZONTAL)
        sep.add_css_class("separator")
        sep.set_margin_top(4)
        sep.set_margin_bottom(4)
        self.context_menu_box.append(sep)

    def _get_first_selected(self):
        """Helper to get the actual DownloadItem object of the first selected row."""
        if not self.selection_model: return None
        selection = self.selection_model.get_selection()
        if selection.is_empty(): return None
        idx = selection.get_nth(0)
        return self.selection_model.get_model().get_item(idx)

    def ctx_open_file(self):
        item = self._get_first_selected()
        if item and item.status == "Finished":
            full_path = os.path.join(item.file_directory, item.filename)
            if os.path.exists(full_path):
                self.open_file_direct(full_path)
                self.show_toast_popup(f"{self.tr("Opening File: ")}{item.filename}")
            else:
                self.show_toast_popup(f"{self.tr("Couldn't Open File:")} {item.filename}", color="red_toast")

    def ctx_open_folder(self):
        item = self._get_first_selected()
        if item:
            full_path = os.path.join(item.file_directory, item.filename)
            if os.path.exists(full_path):
                self.show_file_in_folder(full_path)
                self.show_toast_popup(f"{self.tr("Opening File's Folder...")}")
            else:
                self.show_toast_popup(f"{self.tr("Couldn't Open Folder")}", color="red_toast")

    def ctx_copy_url(self):
        item = self._get_first_selected()
        if item and item.url:
            clipboard = Gdk.Display.get_default().get_clipboard()
            clipboard.set(item.url)
            self.show_toast_popup(f"{self.tr("Copied to clipboard:")} {self.shorten_filename(item.url)}")

    def ctx_pause(self):
        self.stop_download(None, self.selection_model)

    def ctx_resume(self):
        self.resume_download(None, self.selection_model)

    def ctx_stop(self):
        self.stop_download(None, self.selection_model, True)

    def ctx_delete_file(self):
        self.delete_selected_items(None, self.selection_model, files_too=True)

    def test(self):
        self.stop_download(None, self.selection_model, True)

    def ctx_redo_download(self):
        cursor = self.db.conn.cursor() 
        selection = self.selection_model.get_selection()
        
        if selection.is_empty():
            return

        redo_list = []
        size = selection.get_size()

        for i in range(size):
            idx = selection.get_nth(i)
            item = self.selection_model.get_model().get_item(idx)
            
            if not item:
                continue
            
            restart_data = {
                "url": item.url,
                "filename": item.filename,
                "file_size": item.file_size_bytes if hasattr(item, "file_size_bytes") else 0,
                "directory": item.file_directory if item.file_directory else self.download_folder,
                "segments": item.segments if hasattr(item, "segments") else 8,
                "is_audio": str(item.is_audio) if hasattr(item, "is_audio") else "False",
                "quality": item.quality_mod if hasattr(item, "quality_mod") else "Best Available",
                "playlist": str(item.download_playlist) if hasattr(item, "download_playlist") else "False"
            }
            redo_list.append((item, restart_data))
        for item, _ in redo_list:
            if not item or item.filename.strip() == "":
                continue

            cursor.execute("DELETE FROM downloads WHERE id = ?", (item.id,))
            pid = int(item.pid)
            if pid > 0 and addOn.is_pid_alive(pid):
                os.kill(item.pid, signal.SIGTERM)
                
            if self.is_yt_dlp(item.url):
                ytdlp_leftovers = self.find_active_part_yt_dlp(item.filename, item.file_directory)

                downloaded_item_path = os.path.join(item.file_directory, item.filename)

                if item.download_playlist:
                    playlist_dir = Gio.File.new_for_path(downloaded_item_path)
                    if self.is_safe_path(playlist_dir):
                        try:
                            playlist_dir.trash(None)
                            print(f"Trashed: {playlist_dir.get_path()}")
                        except:
                            shutil.rmtree(playlist_dir.get_path())

                    continue
                if ytdlp_leftovers and os.path.exists(ytdlp_leftovers):
                    os.remove(ytdlp_leftovers)

                if downloaded_item_path and os.path.exists(downloaded_item_path):
                    os.remove(downloaded_item_path)
                continue

            full_path = os.path.join(item.file_directory, item.filename)
            f = Gio.File.new_for_path(full_path)
            try:
                f.trash(None)
            except:
                try:
                    os.remove(f.get_path())
                except:
                    pass
            if item.status != "Finished":
                base_path = f.get_path()
                if base_path:
                    for x in range(15):
                        part_file = f"{base_path}-part{x}"
                        try: 
                            if os.path.exists(part_file): os.remove(part_file)
                        except: pass
                    
                    aria2_file = base_path + ".aria2"
                    try:
                        if os.path.exists(aria2_file): os.remove(aria2_file)
                    except: pass

        self.db.conn.commit() 
        # if "__compiled__" in globals():
        #     exe_c = [self.downloader_script_path]
        # else:
        #     exe_c = [sys.executable, self.downloader_script_path]
        
        worker_env = os.environ.copy()
        worker_env["PYINSTALLER_RESET_ENVIRONMENT"] = "1"
        worker_env["FLAMEGET_WORKER"] = "downloader"
        
        executable_path = sys.executable 
        
        is_compiled = getattr(sys, 'frozen', False)
        args = [executable_path]
        if not is_compiled:
            args.append(os.path.abspath(self.downloader_script_path))
        for _, data in redo_list:
            cmd = [
                *args,
                data["url"],
                data["filename"],
                str(data["file_size"]),
                data["directory"],
            ]

            cmd.extend(["--segments", str(int(data["segments"]))])
            cmd.extend(["--id", "-1"])
            cmd.extend(["--speed-limit", str(self.app_settings.get("global_speed_limit"))])

            print("data[is_audio]: ",data["is_audio"])
            if data["is_audio"] == "True":
                cmd.append("--audio")
            if data["playlist"] == "True":
                cmd.append("--playlist")
            if data["quality"]:
                cmd.extend(["--quality", data["quality"]])

            subprocess.Popen(cmd, env=worker_env)

    def find_active_part_yt_dlp(self, filename, directory):
        clean_name = os.path.basename(filename)
        stem = os.path.splitext(clean_name)[0]

        for name in os.listdir(directory):
            if name.endswith(".part"):
                if name.startswith(stem + "."):
                    return os.path.join(directory, name)
                    
        return None

    def create_toolbar(self):
        toolbar_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
        toolbar_box.set_margin_top(3)
        toolbar_box.set_margin_bottom(6)
    
        btn_new = Gtk.Button()
        box_new = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=8)
        icon_new = Gtk.Image.new_from_icon_name("xsi-list-add-symbolic")
        lbl_new = Gtk.Label(label=self.tr("New Download"))
        box_new.append(icon_new)
        box_new.append(lbl_new)
        btn_new.set_child(box_new)
        btn_new.add_css_class("add-url-button")
        btn_new.add_css_class("generic-button")
        btn_new.connect("clicked", self.add_url_button)
        btn_new.set_size_request(200, -1)
        toolbar_box.append(btn_new)

        box_controls = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL)
        box_controls.set_direction(Gtk.TextDirection.LTR)
        box_controls.add_css_class("linked")
        self.btn_resume = Gtk.Button(icon_name="xsi-media-playback-start-symbolic")
        self.btn_pause = Gtk.Button(icon_name="xsi-media-playback-pause-symbolic")
        self.btn_stop = Gtk.Button(icon_name="xsi-media-playback-stop-symbolic")

        self.btn_resume.add_css_class("connected-button")
        self.btn_pause.add_css_class("connected-button")
        self.btn_stop.add_css_class("connected-button")
        self.btn_pause.add_css_class("no-border-left")
        self.btn_stop.add_css_class("no-border-left")

        self.btn_resume.set_sensitive(False)
        self.btn_pause.set_sensitive(False)
        self.btn_stop.set_sensitive(False)
        self.btn_resume.set_direction(Gtk.TextDirection.LTR)
        self.btn_stop.set_direction(Gtk.TextDirection.LTR)
        self.btn_pause.set_direction(Gtk.TextDirection.LTR)

        box_controls.append(self.btn_resume)
        box_controls.append(self.btn_pause)
        box_controls.append(self.btn_stop)
        toolbar_box.append(box_controls)

        box_manage = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL)
        box_manage.add_css_class("linked")
        box_manage.set_direction(Gtk.TextDirection.LTR)

        self.btn_delete = Gtk.Button(icon_name="xsi-user-trash-symbolic")
        self.btn_folder = Gtk.Button(icon_name="xsi-folder-symbolic")
        self.btn_folder.set_direction(Gtk.TextDirection.LTR)
        self.btn_delete.set_direction(Gtk.TextDirection.LTR)

        self.btn_delete.add_css_class("connected-button")
        self.btn_delete.add_css_class("btn_cancel")
        self.btn_delete.add_css_class("delete-connected-btn")
        self.btn_delete.set_sensitive(False)
        self.btn_folder.set_sensitive(False)

        first_sep, second_sep = [Gtk.Separator(orientation=Gtk.Orientation.VERTICAL, css_classes=["separator"]) for _ in range(2)]
        
        self.btn_folder.add_css_class("connected-button")
        self.btn_folder.add_css_class("open-folder-connected-btn")
        
        tools_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL)
        tools_box.add_css_class("linked")
        tools_box.set_direction(Gtk.TextDirection.LTR)
        self.btn_select_all = Gtk.Button(icon_name="xsi-edit-select-all-symbolic")
        self.btn_select_all.add_css_class("connected-button")
        self.btn_select_all.add_css_class("no-border-right")
        self.btn_select_all.set_tooltip_text(self.tr("Select All"))
        self.btn_select_all.set_direction(Gtk.TextDirection.LTR)

        self.copy_url_btn = Gtk.Button(icon_name="xsi-edit-copy-symbolic")
        self.copy_url_btn.set_direction(Gtk.TextDirection.LTR)
        self.copy_url_btn.add_css_class("connected-button")
        self.copy_url_btn.set_sensitive(False)
        self.copy_url_btn.set_tooltip_text(self.tr("Copy URL"))
        self.copy_url_btn.connect("clicked", lambda btn : self.ctx_copy_url())

        tools_box.append(self.btn_select_all)
        tools_box.append(self.copy_url_btn)

        toolbar_box.append(first_sep)
        toolbar_box.append(tools_box)
        box_manage.append(self.btn_delete)
        box_manage.append(self.btn_folder)
        toolbar_box.append(second_sep)
        toolbar_box.append(box_manage)

        spacer = Gtk.Label()
        spacer.set_hexpand(True)
        toolbar_box.append(spacer)

        search = Gtk.SearchEntry()
        search.add_css_class("search-bar")
        search.set_placeholder_text(self.tr("Search in the List"))
        search.connect('search-changed', self.on_search_changed)
        toolbar_box.append(search)
        
        btn_settings = Gtk.Button(icon_name="xsi-emblem-system-symbolic")
        btn_settings.add_css_class("generic-button")

        btn_settings.connect("clicked", self.open_settings_window)
        toolbar_box.append(btn_settings)
        btn_help = Gtk.MenuButton(icon_name="xsi-sign-info-symbolic")
        btn_help.add_css_class("generic-button")
        btn_help.set_tooltip_text(self.tr("Help & About"))

        help_popover = Gtk.Popover()
        help_popover.add_css_class("about-menu")
        help_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=2)
        help_box.set_margin_top(5)
        help_box.set_margin_bottom(5)
        help_box.set_margin_start(5)
        help_box.set_margin_end(5)

        def add_help_item(label, icon_name, callback):
            btn = Gtk.Button()
            if label == "Donate":
                btn.add_css_class("donate-btn")
            btn.add_css_class("generic-button")
            box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
            box.append(Gtk.Image.new_from_icon_name(icon_name))
            box.append(Gtk.Label(label=self.tr(label), xalign=0))
            btn.set_child(box)
            
            def on_click(b):
                help_popover.popdown()
                callback()
                
            btn.connect("clicked", on_click)
            help_box.append(btn)

        add_help_item("About FlameGet", "xsi-dialog-information-symbolic", self.show_about_dialog)
        
        sep = Gtk.Separator(orientation=Gtk.Orientation.HORIZONTAL)
        sep.add_css_class("separator")
        sep.set_margin_top(4); sep.set_margin_bottom(4)
        help_box.append(sep)
        
        # change later
        add_help_item("Report a Bug", "xsi-github-symbolic", lambda: self.open_url("https://github.com/C-Yassin/flameget/issues"))
        add_help_item("Donate", "xsi-emblem-favorite-symbolic", lambda: self.open_url("https://github.com/C-Yassin/flameget"))

        help_popover.set_child(help_box)
        btn_help.set_popover(help_popover)
        toolbar_box.append(btn_help)
        return toolbar_box

    def open_settings_window(self, btn):
        dialog = Gtk.Window(title=self.tr("Settings"))
        dialog.set_transient_for(self.window)
        dialog.set_modal(True)
        dialog.set_default_size(800, 600)
        dialog.set_resizable(False)
        
        self._listening_btn = None
        self._listening_controller = None
        self._listening_action = None

        key_controller = Gtk.EventControllerKey()
        key_controller.connect("key-pressed", self.on_window_key_pressed, dialog)
        dialog.add_controller(key_controller)

        main_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL)
        sidebar = Gtk.ListBox()
        sidebar.set_selection_mode(Gtk.SelectionMode.SINGLE)
        sidebar.set_size_request(200, -1)
        sidebar.add_css_class("navigation-sidebar")
        
        stack = Gtk.Stack()
        stack.set_transition_type(Gtk.StackTransitionType.SLIDE_UP_DOWN)
        stack.set_hexpand(True)

        panels = ["General", "Network", "Appearance", "Browser", "Shortcuts"]
        icons = ["xsi-preferences-symbolic", "xsi-network-transmit-receive-symbolic", "xsi-graphics-symbolic", "xsi-help-browser-symbolic", "xsi-input-keyboard-symbolic"]

        def stop_listening_safe():
            if self._listening_btn and self._listening_controller:
                current_data = self.app_settings["shortcuts"].get(self._listening_action, [0, 0])
                self._listening_btn.set_label(get_key_string(current_data[0], current_data[1]))
                self._listening_btn.remove_css_class("accent")
                self._listening_btn.remove_controller(self._listening_controller)
                self._listening_btn = None
                self._listening_controller = None
                self._listening_action = None
        
        def get_key_string(keyval, state):
            if keyval == 0: return self.tr("Disabled")
            accelerator = Gtk.accelerator_name(keyval, Gdk.ModifierType(state))
            return accelerator.replace("<Primary>", "Ctrl+").replace("<Control>", "Ctrl+").replace("<Shift>", "Shift+").replace("<Alt>", "Alt+")

        gen_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=15)
        gen_box.set_margin_top(20); gen_box.set_margin_bottom(20); gen_box.set_margin_start(20); gen_box.set_margin_end(20)
        
        gen_box.append(self.create_settings_label("Default Download Directory"))
        dir_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
        dir_entry = Gtk.Entry(); dir_entry.set_hexpand(True); dir_entry.set_editable(False)
        dir_entry.add_css_class("entry")
        dir_entry.set_text(self.app_settings.get("default_download_dir", ""))
        btn_dir = Gtk.Button(icon_name="xsi-folder-open-symbolic")
        btn_dir.add_css_class("blue-btn")
        def on_dir_pick(b):
            fd = Gtk.FileDialog()
            def on_d_done(s, r):
                try:
                    f = fd.select_folder_finish(r)
                    path = f.get_path()
                    dir_entry.set_text(path)
                    self.app_settings["default_download_dir"] = path
                    self.download_folder = path
                    SaveManager.save_settings(self.app_settings)
                except: pass
            fd.select_folder(dialog, None, on_d_done)
        btn_dir.connect("clicked", on_dir_pick)
        dir_box.append(dir_entry); dir_box.append(btn_dir)
        gen_box.append(dir_box)

        gen_box.append(self.create_settings_label(self.tr("Language (Requires Restart)")))
        dd_lang = Gtk.DropDown.new_from_strings(["English (en)", "French (fr)", "Spanish (es)","Arabic (ar)", "Russian (ru)"])
        if self.is_rtl: dd_lang.add_css_class("dropmenu-rtl")
        langs = ["en", "fr", "es", "ar", "ru"]
        curr_lang = self.app_settings.get("language", "en")
        try: dd_lang.set_selected(langs.index(curr_lang))
        except: dd_lang.set_selected(0)
        def on_lang_change(dd, p):
            self.app_settings["language"] = langs[dd.get_selected()]
            SaveManager.save_settings(self.app_settings)
        dd_lang.connect("notify::selected", on_lang_change)
        gen_box.append(dd_lang)

        gen_box.append(self.create_settings_label(self.tr("When All Downloads Finish")))
        action_options = ["Do Nothing", "Shutdown System", "Restart System", "Suspend System", "Run Custom Command"]
        dd_action = Gtk.DropDown.new_from_strings([self.tr(opt) for opt in action_options])
        if self.is_rtl: dd_action.add_css_class("dropmenu-rtl")
        curr_action = self.app_settings.get("on_finish_action", "Do Nothing")
        try: dd_action.set_selected(action_options.index(curr_action))
        except: dd_action.set_selected(0)

        cmd_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=5)
        header_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=5)
        
        cmd_lbl = Gtk.Label(label=self.tr("Custom Command (Shell):"), xalign=0)
        cmd_lbl.add_css_class("caption")
        header_box.append(cmd_lbl)

        btn_help = Gtk.MenuButton()
        btn_help.set_icon_name("xsi-utilities-terminal-symbolic")
        btn_help.set_valign(Gtk.Align.CENTER)
        btn_help.add_css_class("flat")
        btn_help.set_tooltip_text(self.tr("View available placeholders"))

        popover = Gtk.Popover()
        pop_content = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=5)
        pop_content.set_margin_top(10); pop_content.set_margin_bottom(10)
        pop_content.set_margin_start(10); pop_content.set_margin_end(10)

        lbl_info = Gtk.Label(label=self.tr("Variables you can use:"))
        lbl_info.add_css_class("heading")
        lbl_info.set_halign(Gtk.Align.START)
        pop_content.append(lbl_info)

        variables = [
            ("{{downloaded_file}}", self.tr("Full path to file")),
            ("{{filename}}", self.tr("Filename only")),
            ("{{directory}}", self.tr("Folder path only")),
            ("{{url}}", self.tr("Download URL")),
            ("{{size_bytes}}", self.tr("Size in bytes")),
        ]

        for var, desc in variables:
            row = Gtk.Box(spacing=12)
            lbl_var = Gtk.Label(label=var, xalign=0)
            lbl_var.set_markup(f"<span font_family='monospace' weight='bold' color='#3584E4'>{var}</span>")
            lbl_desc = Gtk.Label(label=desc, xalign=0)
            
            row.append(lbl_var)
            row.append(lbl_desc)
            pop_content.append(row)

        popover.set_child(pop_content)
        btn_help.set_popover(popover)
        
        header_box.append(btn_help)
        cmd_lbl = Gtk.Label(label=f"{self.tr("Custom Command (Shell):")}", xalign=0)
        cmd_lbl.add_css_class("caption")
        cmd_entry = Gtk.Entry(); cmd_entry.add_css_class("entry")
        cmd_entry.set_placeholder_text(self.tr("WARNING! DANGEROUS TERRITORY!"))
        cmd_entry.set_text(self.app_settings.get("custom_finish_cmd", ""))
        cmd_box.append(header_box)
        cmd_box.append(cmd_entry)
        cmd_box.set_visible(curr_action == "Run Custom Command")

        def on_action_change(dd, p):
            action = action_options[dd.get_selected()]
            self.app_settings["on_finish_action"] = action
            SaveManager.save_settings(self.app_settings)
            cmd_box.set_visible(action == "Run Custom Command")
        dd_action.connect("notify::selected", on_action_change)
        
        def on_cmd_change(e):
            text = e.get_text()
            
            if self.is_safe_command(text):
                self.app_settings["custom_finish_cmd"] = text
                SaveManager.save_settings(self.app_settings)
                e.remove_css_class("error") 
            else:
                e.add_css_class("error")

            attrs = Pango.AttrList()
            
            pattern = re.compile(r"\{\{.*?\}\}")
            
            for match in pattern.finditer(text):
                start_byte = len(text[:match.start()].encode('utf-8'))
                end_byte = len(text[:match.end()].encode('utf-8'))
                
                attr_color = Pango.attr_foreground_new(13621, 33924, 58496)
                attr_color.start_index = start_byte
                attr_color.end_index = end_byte
                attrs.insert(attr_color)
                
                attr_bold = Pango.attr_weight_new(Pango.Weight.BOLD)
                attr_bold.start_index = start_byte
                attr_bold.end_index = end_byte
                attrs.insert(attr_bold)

            e.set_attributes(attrs)

        cmd_entry.connect("changed", on_cmd_change)
        on_cmd_change(cmd_entry)
        gen_box.append(dd_action); gen_box.append(cmd_box)

        chk_del = Gtk.CheckButton(label=self.tr("Confirm before deleting tasks"))
        chk_del.set_active(self.app_settings.get("confirm_delete", True))
        chk_del.connect("toggled", lambda b: self.app_settings.update({"confirm_delete": b.get_active()}) or SaveManager.save_settings(self.app_settings))
        gen_box.append(chk_del)

        chk_notif = Gtk.CheckButton(label=self.tr("Show Desktop Notifications (When finished)"))
        chk_notif.set_active(self.app_settings.get("notifications", True))
        chk_notif.connect("toggled", lambda b: self.app_settings.update({"notifications": b.get_active()}) or SaveManager.save_settings(self.app_settings))
        gen_box.append(chk_notif)

        enable_toasts = Gtk.CheckButton(label=self.tr("Show Short Pop-up Messages (Toasts)"))
        enable_toasts.set_active(self.app_settings.get("enable_toasts", True))
        enable_toasts.connect("toggled", lambda b: self.app_settings.update({"enable_toasts": b.get_active()}) or SaveManager.save_settings(self.app_settings))
        gen_box.append(enable_toasts)

        chk_finish = Gtk.CheckButton(label=self.tr("Show Dialog when Download Finishes"))
        chk_finish.set_active(self.app_settings.get("show_finish_dialog", True))
        chk_finish.connect("toggled", lambda b: self.app_settings.update({"show_finish_dialog": b.get_active()}) or SaveManager.save_settings(self.app_settings))
        gen_box.append(chk_finish)

        chk_boot = Gtk.CheckButton(label=self.tr("Start on Boot"))
        chk_boot.set_active(self.app_settings.get("start_on_boot", False))
        def on_boot_change(btn):
            self.app_settings["start_on_boot"] = btn.get_active()
            SaveManager.save_settings(self.app_settings)
            self.toggle_autostart(btn.get_active())
        chk_boot.connect("toggled", on_boot_change)
        gen_box.append(chk_boot)

        auto_start = Gtk.CheckButton(label=self.tr("Start Download Immediately"))
        auto_start.set_tooltip_text(self.tr("If checked, the downloads will begin instantly when added, skipping the 'Download' button."))
        auto_start.set_active(self.app_settings.get("auto_start", False))
        auto_start.connect("toggled", lambda b: self.app_settings.update({"auto_start": b.get_active()}) or SaveManager.save_settings(self.app_settings))
        gen_box.append(auto_start)

        start_minimized = Gtk.CheckButton(label=self.tr("Start in Minimized Mode"))
        start_minimized.set_sensitive(not self.is_flatpak_env)
        start_minimized.set_tooltip_text(self.tr("If checked, The downloads will begin in the background."))
        start_minimized.set_active(self.app_settings.get("start_in_minimize_mode", False))
        start_minimized.connect("toggled", lambda b: self.app_settings.update({"start_in_minimize_mode": b.get_active()}) or SaveManager.save_settings(self.app_settings))
        gen_box.append(start_minimized)

        stack.add_named(gen_box, "General")

        net_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=15)
        net_box.set_margin_top(20); net_box.set_margin_bottom(20); net_box.set_margin_start(20); net_box.set_margin_end(20)

        net_box.append(self.create_settings_label("Download Engine (Backend)"))
        dd_eng = Gtk.DropDown.new_from_strings(["Aria2", "Curl"])
        if self.is_rtl: dd_eng.add_css_class("dropmenu-rtl")
        curr_eng = self.app_settings.get("engine", "Aria2")
        dd_eng.set_selected(1 if curr_eng == "Curl" else 0)
        def on_eng_change(dd, p):
            self.app_settings["engine"] = "Curl" if dd.get_selected() == 1 else "Aria2"
            self.download_engine = self.app_settings["engine"].lower()
            SaveManager.save_settings(self.app_settings)
        dd_eng.connect("notify::selected", on_eng_change)
        net_box.append(dd_eng)

        net_box.append(self.create_settings_label("User Agent"))
        ua_entry = Gtk.Entry(); ua_entry.add_css_class("entry")
        ua_entry.set_text(self.app_settings.get("user_agent", ""))
        ua_entry.connect("changed", lambda e: self.app_settings.update({"user_agent": e.get_text()}) or SaveManager.save_settings(self.app_settings))
        net_box.append(ua_entry)

        net_box.append(self.create_settings_label("Default Segments (Connections)"))
        spin_seg = Gtk.SpinButton.new_with_range(1, 32, 1)
        spin_seg.add_css_class("entry")
        spin_seg.set_value(self.app_settings.get("default_segments", 8))
        spin_seg.connect("value-changed", lambda s: self.app_settings.update({"default_segments": int(s.get_value())}) or SaveManager.save_settings(self.app_settings))
        net_box.append(spin_seg)

        net_box.append(self.create_settings_label("Global Speed Limit (e.g. 500, Only numbers (value auto converts to K)"))
        speed_entry = Gtk.Entry(); speed_entry.add_css_class("entry")
        speed_entry.set_text(str(self.app_settings.get("global_speed_limit", "0")))
        speed_entry.connect("changed", lambda e: self.app_settings.update({"global_speed_limit": e.get_text()}) or SaveManager.save_settings(self.app_settings))
        net_box.append(speed_entry)

        stack.add_named(net_box, "Network")

        app_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        app_box.set_margin_top(20); app_box.set_margin_bottom(20); app_box.set_margin_start(20); app_box.set_margin_end(20)
        
        app_box.append(self.create_settings_label("Global Theme"))
        dd_theme = Gtk.DropDown.new_from_strings([self.tr("Dark"), self.tr("Light"), self.tr("Custom")])
        if self.is_rtl: dd_theme.add_css_class("dropmenu-rtl")
        theme_map = ["Dark", "Light", "Custom"]
        curr_theme = self.app_settings.get("theme_mode", "Dark")
        try: dd_theme.set_selected(theme_map.index(curr_theme))
        except: dd_theme.set_selected(0)
        
        customize = (curr_theme == "Custom")

        def on_theme_change(dd, p):
            new_theme = theme_map[dd.get_selected()]
            self.app_settings["theme_mode"] = new_theme
            SaveManager.save_settings(self.app_settings)
            addOn.set_titlebar_theme(dialog.get_title(), self.app_settings.get("theme_mode"))
            self.apply_theme_and_font()
            if hasattr(self, "css_editor_box"):
                is_visible = new_theme == "Custom"
                self.css_editor_box.set_visible(is_visible)
                self.css_editor_box_sep.set_visible(is_visible)
        dd_theme.connect("notify::selected", on_theme_change)
        app_box.append(dd_theme)

        ctx_offsets_label = self.create_settings_label("Context Menu Offset")
        ctx_offsets_label.set_tooltip_text(self.tr("Change This if You Have Troubles With Your Context Menu."))
        app_box.append(ctx_offsets_label)

        offset_box = Gtk.Box(spacing=10); offset_box.set_hexpand(True)
        label_x = Gtk.Label(label=self.tr("Offset X:"))
        spin_x = Gtk.SpinButton.new_with_range(-1000, 1000, 1)
        spin_x.add_css_class("entry"); spin_x.set_value(self.app_settings.get("ctx_menu_offsets")["x"]); spin_x.set_hexpand(True)
        spin_x.connect("value-changed", lambda w: self.app_settings["ctx_menu_offsets"].update({"x": w.get_value()}) or SaveManager.save_settings(self.app_settings))
        
        label_y = Gtk.Label(label=self.tr("Offset Y:"))
        spin_y = Gtk.SpinButton.new_with_range(-1000, 1000, 1)
        spin_y.add_css_class("entry"); spin_y.set_value(self.app_settings.get("ctx_menu_offsets")["y"]); spin_y.set_hexpand(True)
        spin_y.connect("value-changed", lambda w: self.app_settings["ctx_menu_offsets"].update({"y": w.get_value()}) or SaveManager.save_settings(self.app_settings))

        offset_box.append(label_x); offset_box.append(spin_x); offset_box.append(label_y); offset_box.append(spin_y)
        app_box.append(offset_box)

        chk_has_borders = Gtk.CheckButton(label=self.tr("Disable cell borders"))
        chk_has_borders.set_active(self.app_settings.get("chk_has_borders", True))
        chk_has_borders.connect("toggled", lambda b: self.app_settings.update({"chk_has_borders": b.get_active()}) or SaveManager.save_settings(self.app_settings))
        app_box.append(chk_has_borders)

        label_cells_size = Gtk.Label(label=self.tr("Row size (px):"))
        cells_size_box = Gtk.Box(spacing=10); offset_box.set_hexpand(True)
        cells_size = Gtk.Entry()
        cells_size.set_hexpand(True)
        cells_size.set_text(f"{self.app_settings.get("cells_size", 1)}")
        cells_size.add_css_class("entry")
        cells_size.set_placeholder_text(self.tr("Set the size of your rows in pixels"))
        cells_size.connect("changed", lambda b: self.app_settings.update({"cells_size": b.get_text()}) or SaveManager.save_settings(self.app_settings))
        cells_size_box.append(label_cells_size)
        cells_size_box.append(cells_size)
        app_box.append(cells_size_box)

        app_box.append(self.create_settings_label("Application Font"))
        font_dialog = Gtk.FontDialog()

        font_btn = Gtk.FontDialogButton(dialog=font_dialog)
        saved_font_name = self.app_settings.get("font_name")
        if saved_font_name:
            font_desc = Pango.FontDescription.from_string(saved_font_name)
            font_btn.set_font_desc(font_desc)
        def on_font_changed(button, param_spec):
            new_font_desc = button.get_font_desc()
            new_font_string = new_font_desc.to_string()
            self.app_settings["font_name"] = new_font_string
            SaveManager.save_settings(self.app_settings)
            self.apply_theme_and_font()

        font_btn.connect("notify::font-desc", on_font_changed)
        app_box.append(font_btn)

        app_box.append(self.create_settings_label("UI Scale (%)"))
        scale_spin = Gtk.SpinButton.new_with_range(50, 200, 10)
        scale_spin.add_css_class("entry"); scale_spin.set_value(self.app_settings.get("ui_scale", 100))
        def on_scale_change(s):
            self.app_settings["ui_scale"] = int(s.get_value())
            SaveManager.save_settings(self.app_settings)
            self.apply_theme_and_font()
        scale_spin.connect("value-changed", on_scale_change)
        app_box.append(scale_spin)
        
        self.css_editor_box_sep = Gtk.Separator(orientation=Gtk.Orientation.HORIZONTAL); self.css_editor_box_sep.add_css_class("separator")
        app_box.append(self.css_editor_box_sep)

        self.css_editor_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        self.css_editor_box.append(self.create_settings_label(("Custom Theme CSS File")))

        css_row = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
        css_entry = Gtk.Entry(); css_entry.set_hexpand(True); css_entry.set_editable(False)
        css_entry.add_css_class("entry"); css_entry.set_text(self.app_settings.get("custom_css_path", ""))
        btn_css = Gtk.Button(icon_name="xsi-folder-open-symbolic"); btn_css.add_css_class("blue-btn")
        css_row.append(css_entry); css_row.append(btn_css); self.css_editor_box.append(css_row)

        frame = Gtk.Frame(); scroll = Gtk.ScrolledWindow(); scroll.set_min_content_height(150)
        scroll.set_hexpand(True); scroll.set_vexpand(True)
        txt_view = Gtk.TextView(); txt_view.set_monospace(True)
        try:
            with open(self.app_settings.get("css_path", ""), 'r') as f: txt_view.get_buffer().set_text(f.read())
        except: pass
        scroll.set_child(txt_view); frame.set_child(scroll); self.css_editor_box.append(frame)

        def on_css_pick(b):
            fd = Gtk.FileDialog()
            def on_c_open(s, r):
                try:
                    f = fd.open_finish(r)
                    path = f.get_path()
                    self.app_settings["css_path"] = path
                    SaveManager.save_settings(self.app_settings)
                    css_entry.set_text(path)
                    with open(path, 'r') as fr: txt_view.get_buffer().set_text(fr.read())
                    SaveManager.load_css(self.app_settings.get("theme_mode"))
                    addOn.set_titlebar_theme(self.app_name, self.app_settings.get("theme_mode"))
                except: pass
            fd.open(dialog, None, on_c_open)
        btn_css.connect("clicked", on_css_pick)
        
        btn_save_css = Gtk.Button(label=self.tr("Save & Apply CSS"))
        btn_save_css.add_css_class("generic-button")
        def on_save_css(b):
            p = self.app_settings.get("css_path", "")
            if not p: return
            buf = txt_view.get_buffer()
            txt = buf.get_text(buf.get_start_iter(), buf.get_end_iter(), True)
            try:
                with open(p, 'w') as f: f.write(txt)
                SaveManager.load_css(self.app_settings.get("theme_mode"))
                addOn.set_titlebar_theme(self.app_name, self.app_settings.get("theme_mode"))
            except: pass
        btn_save_css.connect("clicked", on_save_css)
        self.css_editor_box.append(btn_save_css)

        self.css_editor_box.set_visible(customize)
        self.css_editor_box_sep.set_visible(customize)
        app_box.append(self.css_editor_box)
        stack.add_named(app_box, "Appearance")

        brower_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        brower_box.set_margin_top(20); brower_box.set_margin_bottom(20); brower_box.set_margin_start(20); brower_box.set_margin_end(20)
        url = "https://github.com/C-Yassin/FlameGet"
        brower_box.append(self.create_settings_label("for browser integration", markup=f"{self.tr("Browser Integration (Don't have it?)")} <a href='{url}'>{self.tr("click here")}</a>!"))
        enable_integration = Gtk.CheckButton(label=self.tr("Enable Browser Integration"))
        enable_integration.set_active(self.app_settings["enable_integration"])
        enable_integration.connect("toggled", lambda b: self.app_settings.update({"enable_integration": b.get_active()}) or SaveManager.save_settings(self.app_settings))
        brower_box.append(enable_integration)

        brower_box.append(self.create_settings_label("Browser Integration Port"))
        port_entry = Gtk.Entry(); port_entry.add_css_class("entry")
        port_entry.set_text(str(self.app_settings.get("browser_port", 6812)))
        port_entry.connect("changed", lambda e: self.app_settings.update({"browser_port": e.get_text()}) or SaveManager.save_settings(self.app_settings))
        brower_box.append(port_entry)
        stack.add_named(brower_box, "Browser")

        shortcuts_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        shortcuts_box.set_margin_top(20); shortcuts_box.set_margin_bottom(20)
        shortcuts_box.set_margin_start(20); shortcuts_box.set_margin_end(20)

        shortcuts_box.append(self.create_settings_label("Keyboard Shortcuts"))
        lbl_hint = Gtk.Label(label=self.tr("Click a button to change its shortcut. Press Backspace to disable."))
        lbl_hint.add_css_class("caption"); lbl_hint.set_halign(Gtk.Align.START)
        shortcuts_box.append(lbl_hint)

        grid = Gtk.Grid(); grid.set_column_spacing(20); grid.set_row_spacing(10); grid.set_hexpand(True)
        shortcut_map = [("new_download", self.tr("New Download")), ("delete", self.tr("Delete Selected")), ("select_all", self.tr("Select All")), ("open_file", self.tr("Open File")), ("quit", self.tr("Quit Application")), ("close_window", self.tr("Close Window"))]

        def start_listening(btn, action_key):
            stop_listening_safe()
            btn.set_label(self.tr("Press keys..."))
            btn.add_css_class("accent") 
            controller = Gtk.EventControllerKey()
            self._listening_btn = btn; self._listening_controller = controller; self._listening_action = action_key
            
            def on_key_pressed(ctrl, keyval, keycode, state):
                if keyval == Gdk.KEY_Escape:
                    stop_listening_safe(); return True
                if keyval == Gdk.KEY_BackSpace:
                    self.app_settings["shortcuts"][action_key] = [0, 0]; SaveManager.save_settings(self.app_settings)
                    btn.set_label(self.tr("Disabled")); btn.remove_css_class("accent")
                    btn.remove_controller(ctrl)
                    self._listening_btn = None; self._listening_controller = None
                    return True
                is_modifier = keyval in [Gdk.KEY_Control_L, Gdk.KEY_Control_R, Gdk.KEY_Shift_L, Gdk.KEY_Shift_R, Gdk.KEY_Alt_L, Gdk.KEY_Alt_R, Gdk.KEY_Super_L, Gdk.KEY_Super_R, Gdk.KEY_Meta_L, Gdk.KEY_Meta_R, Gdk.KEY_ISO_Level3_Shift]
                valid_mods = Gdk.ModifierType.CONTROL_MASK | Gdk.ModifierType.SHIFT_MASK | Gdk.ModifierType.ALT_MASK | Gdk.ModifierType.SUPER_MASK
                clean_state = state & valid_mods
                btn.set_label(get_key_string(keyval, clean_state))
                if is_modifier: return True 
                self.app_settings["shortcuts"][action_key] = [keyval, int(clean_state)]; SaveManager.save_settings(self.app_settings)
                btn.remove_css_class("accent"); btn.remove_controller(ctrl)
                self._listening_btn = None; self._listening_controller = None
                return True
            controller.connect("key-pressed", on_key_pressed)
            btn.add_controller(controller)
            btn.grab_focus()

        for i, (action_key, desc) in enumerate(shortcut_map):
            lbl_desc = Gtk.Label(label=desc, xalign=0); lbl_desc.set_hexpand(True)
            current_data = self.app_settings["shortcuts"].get(action_key, [0, 0])
            btn_key = Gtk.Button(label=get_key_string(current_data[0], current_data[1]))
            btn_key.add_css_class("generic-button"); btn_key.set_halign(Gtk.Align.END)
            btn_key.connect("clicked", lambda b, ak=action_key: start_listening(b, ak))
            sep = Gtk.Separator(orientation=Gtk.Orientation.HORIZONTAL); sep.add_css_class("separator")
            grid.attach(lbl_desc, 0, i * 2, 1, 1); grid.attach(btn_key, 1, i * 2, 1, 1)
            if i < len(shortcut_map) - 1: grid.attach(sep, 0, (i * 2) + 1, 2, 1)

        scrolled_sc = Gtk.ScrolledWindow(); scrolled_sc.set_policy(Gtk.PolicyType.NEVER, Gtk.PolicyType.AUTOMATIC)
        scrolled_sc.set_child(grid); scrolled_sc.set_vexpand(True)
        shortcuts_box.append(scrolled_sc)
        stack.add_named(shortcuts_box, "Shortcuts")
        
        def on_row_sel(b, r):
            if r:
                stop_listening_safe()
                stack.set_visible_child_name(r.panel_name)
        sidebar.connect("row-selected", on_row_sel)
        stack.connect("notify::visible-child", lambda w, p: stop_listening_safe())
        dialog.connect("close-request", lambda w: stop_listening_safe())

        for i, (name, icon) in enumerate(zip(panels, icons)):
            row = Gtk.ListBoxRow()
            box = Gtk.Box(spacing=10); box.set_margin_top(10); box.set_margin_bottom(10); box.set_margin_start(10)
            box.append(Gtk.Image.new_from_icon_name(icon))
            box.append(Gtk.Label(label=self.tr(name)))
            row.set_child(box); row.panel_name = name
            self.set_cursor_for_widget(row, "pointer")
            sidebar.append(row)
            if i == 0: sidebar.select_row(row)

        main_box.append(sidebar)
        sep = Gtk.Separator(orientation=Gtk.Orientation.VERTICAL); sep.add_css_class("separator")
        main_box.append(sep); main_box.append(stack)
        sidebar.add_css_class("content-area"); main_box.add_css_class("content-background")

        dialog.set_child(main_box)
        dialog.present()
        addOn.set_titlebar_theme(dialog.get_title(), self.app_settings.get("theme_mode"))
        self.apply_cursor_recursive(dialog, "pointer")
        
    def create_settings_label(self, text, markup=""):
        lbl = Gtk.Label(label=self.tr(text))
        lbl.set_halign(Gtk.Align.START) 
        lbl.set_valign(Gtk.Align.CENTER)
        lbl.add_css_class("settings-label")
        if markup != "":
            lbl.set_markup(markup)
        return lbl

    def apply_theme_and_font(self):
        if self.app_settings.get("language") == "ar":
            Gtk.Widget.set_default_direction(Gtk.TextDirection.RTL)
            self.is_rtl = True
        else:
            Gtk.Widget.set_default_direction(Gtk.TextDirection.LTR)
            
        mode = self.app_settings.get("theme_mode", "Dark")
        SaveManager.load_css(mode)
        GLib.idle_add(addOn.set_titlebar_theme, self.app_name, self.app_settings.get("theme_mode"))
        display = Gdk.Display.get_default()

        if hasattr(self, 'font_provider') and self.font_provider:
            Gtk.StyleContext.remove_provider_for_display(display, self.font_provider)

        font_name = self.app_settings.get("font_name") 
        scale_percent = self.app_settings.get("ui_scale", 100)
        
        css_rules = []
        css_rules.append("* {")

        if font_name:
            try:
                desc = Pango.FontDescription.from_string(font_name)
                
                family = desc.get_family()
                
                print(f"Pango selected {family}")
                size = desc.get_size() 
                if not desc.get_size_is_absolute():
                    size //= Pango.SCALE
                
                final_size = int(size * (scale_percent / 100.0))
                
                if family:
                    css_rules.append(f"font-family: '{family}';")
                if final_size > 0:
                    css_rules.append(f"font-size: {final_size}pt;")

            except Exception as e:
                print(f"Font parsing error: {e}")
        
        css_rules.append("}")
        if len(css_rules) > 2:
            self.font_provider = Gtk.CssProvider()
            css_string = "\n".join(css_rules)

            print()
            try:
                self.font_provider.load_from_data(css_string.encode())
                Gtk.StyleContext.add_provider_for_display(
                    display, 
                    self.font_provider, 
                    Gtk.STYLE_PROVIDER_PRIORITY_USER
                )
            except Exception as e:
                print(f"Font CSS Error: {e}")

    def update_buttons_state(self):
        if not self.selection_model: 
            return
        
        selection = self.selection_model.get_selection()
        if selection.is_empty():
            self.btn_delete.set_sensitive(False)
            self.btn_folder.set_sensitive(False)
            self.btn_resume.set_sensitive(False)
            self.copy_url_btn.set_sensitive(False)
            self.btn_stop.set_sensitive(False)
            self.btn_pause.set_sensitive(False)
            self.btn_delete.remove_css_class("btn_delete")
            self.btn_folder.remove_css_class("btn_folder")
            return

        self.btn_delete.add_css_class("btn_delete")
        self.btn_folder.add_css_class("btn_folder")
        self.btn_delete.set_sensitive(True)
        self.btn_folder.set_sensitive(True)

        can_start = False
        can_pause = False
        can_stop = False
        can_copy_url = False
        model = self.selection_model.get_model()
        n_items = model.get_n_items()

        for i in range(selection.get_size()):
            idx = selection.get_nth(i)
            if idx >= n_items: continue
            
            item = model.get_item(idx)
            if not item: continue
            
            if item.status in ("Paused", "Stopped"):
                can_start = True
            if item.url.strip() != "" and i < 1:
                can_copy_url = True
            else:
                can_copy_url = False

            if item.status in ("downloading", "Verifying Checksum", "Seeding"):
                can_pause = True
            
            is_process_running = item.status in ("Paused", "downloading", "Verifying Checksum","Seeding")
            
            if item.status != "Stopped" and is_process_running:
                can_stop = True

        self.btn_resume.set_sensitive(can_start)
        self.btn_pause.set_sensitive(can_pause)
        self.btn_stop.set_sensitive(can_stop)
        self.copy_url_btn.set_sensitive(can_copy_url)

    def on_search_changed(self, entry):
        text = entry.get_text().lower()
        self.search_text = text

    def add_url_button(self, btn, is_torrent_ready=None):
        self.add_url_dialog = Gtk.Dialog(title=self.tr("New Download"), transient_for=self.window, modal=True)
        GLib.idle_add(addOn.set_titlebar_theme, self.add_url_dialog.get_title(), self.app_settings.get("theme_mode"))

        key_controller = Gtk.EventControllerKey()
        key_controller.connect("key-pressed", self.on_window_key_pressed, self.add_url_dialog)
        self.add_url_dialog.connect("close-request", lambda x: setattr(self, 'add_url_dialog', None))
        self.add_url_dialog.add_controller(key_controller)
        self.add_url_dialog.set_default_size(550, 300)
        self.add_url_dialog.set_resizable(False)
        self.has_selected_audio = False 

        content_area = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=12)
        content_area.set_margin_top(20)
        content_area.set_margin_bottom(20)
        content_area.set_margin_start(20)
        content_area.set_margin_end(20)

        common_grid = Gtk.Grid()
        common_grid.set_column_spacing(12)
        common_grid.set_row_spacing(12)
        
        lbl_url = Gtk.Label(label="URL:", xalign=0)
        self.entry_url = Gtk.Entry()
        self.entry_url.add_css_class("entry")
        self.entry_url.set_placeholder_text(f"https://example.com/file.zip {self.tr('or any yt_dlp supported Link')}")
        self.entry_url.set_hexpand(True)
        
        common_grid.attach(lbl_url, 0, 0, 1, 1)
        common_grid.attach(self.entry_url, 1, 0, 2, 1)
        
        lbl_dir = Gtk.Label(label=self.tr("Save To:"), xalign=0)
        self.entry_dir = Gtk.Entry()
        self.entry_dir.add_css_class("entry")

        self.entry_dir.set_text(self.download_folder) 
        self.entry_dir.set_hexpand(True)
        btn_browse = Gtk.Button(icon_name="xsi-folder-open-symbolic")
        btn_browse.add_css_class("blue-btn")

        btn_browse.set_tooltip_text(self.tr("Choose Directory"))
        btn_browse.connect("clicked", self.on_select_folder_clicked)

        common_grid.attach(lbl_dir, 0, 1, 1, 1)
        common_grid.attach(self.entry_dir, 1, 1, 1, 1)
        common_grid.attach(btn_browse, 2, 1, 1, 1)

        content_area.append(common_grid)
        sep = Gtk.Separator(orientation=Gtk.Orientation.HORIZONTAL)
        sep.add_css_class("separator")
        content_area.append(sep)

        self.dialog_stack = Gtk.Stack()
        self.dialog_stack.set_transition_type(Gtk.StackTransitionType.SLIDE_LEFT_RIGHT)
        self.dialog_stack.set_transition_duration(300) 

        self.cached_grids = {}

        grid_std = Gtk.Grid(column_spacing=12, row_spacing=12)
        
        lbl_name = Gtk.Label(label=f"{self.tr('File Name')}:", xalign=0)
        self.entry_name = Gtk.Entry()
        self.entry_name.add_css_class("entry")
        self.entry_name.set_placeholder_text(f"({self.tr('Auto-detected')})")
        self.entry_name.set_hexpand(True)

        lbl_seg = Gtk.Label(label=f"{self.tr('Segments')}:", xalign=0)
        self.spin_seg = Gtk.SpinButton.new_with_range(1, 16, 1)
        self.spin_seg.add_css_class("entry")
        self.spin_seg.set_value(8)
        self.spin_seg.add_css_class("entry")
        grid_std.attach(lbl_name, 0, 0, 1, 1)
        grid_std.attach(self.entry_name, 1, 0, 1, 1)
        grid_std.attach(lbl_seg, 0, 1, 1, 1)
        grid_std.attach(self.spin_seg, 1, 1, 1, 1)

        self.cached_grids["standard"] = grid_std

        grid_yt = Gtk.Grid(column_spacing=12, row_spacing=12)

        lbl_mode = Gtk.Label(label=f"{self.tr('Mode')}:", xalign=0)
        self.dd_mode = Gtk.DropDown.new_from_strings(["Video + Audio", "Audio Only"])
        if self.is_rtl: self.dd_mode.add_css_class("dropmenu-rtl")
        self.dd_mode.set_valign(Gtk.Align.CENTER)
        self.dd_mode.set_hexpand(True)

        lbl_quality = Gtk.Label(label=self.tr("Quality:"), xalign=0)
        self.dd_quality = Gtk.DropDown.new_from_strings(["Best Available", "4K", "1080p", "720p", "480p"])
        if self.is_rtl: self.dd_quality.add_css_class("dropmenu-rtl")
        self.dd_quality.set_valign(Gtk.Align.CENTER)
        self.dd_quality.set_hexpand(True)

        lbl_fmt = Gtk.Label(label=self.tr("Container:"), xalign=0)
        self.dd_fmt = Gtk.DropDown.new_from_strings(["mp4", "mkv", "webm", "mov", "avi"])
        if self.is_rtl: self.dd_fmt.add_css_class("dropmenu-rtl")
        self.dd_fmt.set_valign(Gtk.Align.CENTER)
        self.dd_fmt.set_hexpand(True)

        self.check_playlist = Gtk.CheckButton(label=self.tr("Download Playlist"))
        self.check_playlist.set_tooltip_text(self.tr("If the link is a playlist, download all videos"))
        self.check_playlist.set_active(True)
        
        self.check_subs = Gtk.CheckButton(label=self.tr("Embed Subtitles"))
        self.check_thumb = Gtk.CheckButton(label=self.tr("Embed Thumbnail"))

        check_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=6)
        check_box.append(self.check_playlist)
        check_box.append(self.check_subs)
        check_box.append(self.check_thumb)
        check_box.set_valign(Gtk.Align.CENTER) 
        
        yt_lbl_name = Gtk.Label(label=f"{self.tr('File Name')}:", xalign=0)
        self.yt_entry_name = Gtk.Entry()
        self.yt_entry_name.add_css_class("entry")
        self.yt_entry_name.set_placeholder_text(f"({self.tr('Auto-detected')})")
        self.yt_entry_name.set_hexpand(True)
        
        grid_yt.attach(yt_lbl_name, 0, 0, 1, 1)
        grid_yt.attach(self.yt_entry_name, 1, 0, 2, 1)

        grid_yt.attach(lbl_mode, 0, 1, 1, 1)
        grid_yt.attach(lbl_quality, 0, 2, 1, 1)
        grid_yt.attach(lbl_fmt, 0, 3, 1, 1)

        grid_yt.attach(self.dd_mode, 1, 1, 1, 1)
        grid_yt.attach(self.dd_quality, 1, 2, 1, 1)
        grid_yt.attach(self.dd_fmt, 1, 3, 1, 1)

        grid_yt.attach(check_box, 2, 1, 1, 3)

        self.cached_grids["youtube"] = grid_yt

        grid_torrent_prompt = Gtk.Grid(column_spacing=12, row_spacing=12)
        grid_torrent_prompt.set_halign(Gtk.Align.CENTER)
        grid_torrent_prompt.set_valign(Gtk.Align.CENTER)
        lbl_t_prompt = Gtk.Label(label=self.tr("Torrent Detected."))
        lbl_t_prompt.add_css_class("heading")
        lbl_t_prompt2 = Gtk.Label(label=self.tr("Click 'Process Link' to fetch metadata."))
        grid_torrent_prompt.attach(lbl_t_prompt, 0, 0, 1, 1)
        grid_torrent_prompt.attach(lbl_t_prompt2, 0, 1, 1, 1)
        self.cached_grids["torrent_prompt"] = grid_torrent_prompt

        self.grid_torrent_meta = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        
        summary_grid = Gtk.Grid(column_spacing=12, row_spacing=12)
        self.lbl_meta_name = Gtk.Label(label=self.tr("Retrieving data. Wait a few seconds"), selectable=True)
        self.lbl_meta_name.set_hexpand(True)

        self.lbl_meta_size = Gtk.Label(label=self.tr("Size: -"))
        self.lbl_meta_size.set_halign(Gtk.Align.START)
        self.lbl_meta_size.set_hexpand(True)
        summary_grid.attach(self.lbl_meta_name, 0, 0, 2, 1)
        summary_grid.attach(self.lbl_meta_size, 0, 1, 2, 1)
        
        self.grid_torrent_meta.append(summary_grid)

        self.expander_files = Gtk.Expander()
        self.expander_files.set_expanded(False)
        self.expander_files.set_sensitive(False)
        self.lbl_files_expander = Gtk.Label(label=f"{self.tr('Files')} (0)")
        self.lbl_files_expander.set_hexpand(True)
        self.lbl_files_expander.set_halign(Gtk.Align.CENTER)
        
        self.expander_files.set_label_widget(self.lbl_files_expander)
        
        self.root_node_store = Gio.ListStore(item_type=TorrentNode)

        def create_model_func(item):
            return item.children_store if item.is_dir else None

        tree_model = Gtk.TreeListModel.new(self.root_node_store, False, True, create_model_func)
        self.files_selection_model = Gtk.NoSelection(model=tree_model)

        files_list_view = Gtk.ListView(model=self.files_selection_model)
        factory = Gtk.SignalListItemFactory()
        
        factory.connect("setup", self._setup_file_row)
        factory.connect("bind", self._bind_file_row)
        files_list_view.set_factory(factory)
        
        files_scroll = Gtk.ScrolledWindow()
        files_scroll.set_min_content_height(120)
        files_scroll.set_vexpand(True)
        files_scroll.set_child(files_list_view)
        files_scroll.set_policy(Gtk.PolicyType.EXTERNAL, Gtk.PolicyType.EXTERNAL)
        
        self.expander_files.set_child(files_scroll)
        self.expander_files.add_css_class("trackers-parent")

        self.grid_torrent_meta.append(self.expander_files)

        tracker_header_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
        tracker_header_box.set_hexpand(True)
        self.tracker_label = Gtk.Label(label=self.tr("Show Trackers"))
        self.tracker_label.set_hexpand(True)
        self.tracker_label.set_halign(Gtk.Align.START)
        btn_add_tracker = Gtk.Button()
        icon = Gtk.Image.new_from_icon_name("xsi-list-add-symbolic")
        icon.set_pixel_size(12)
        btn_add_tracker.set_child(icon)
        btn_add_tracker.add_css_class("add-new-tracker-button")
        btn_add_tracker.set_halign(Gtk.Align.END)

        btn_add_tracker.set_tooltip_text(self.tr("Add New Tracker"))
        btn_add_tracker.connect("clicked", self.on_add_tracker_clicked)

        tracker_header_box.append(self.tracker_label)
        tracker_header_box.append(btn_add_tracker)
        
        self.expander_trackers = Gtk.Expander()
        self.expander_trackers.set_label_widget(tracker_header_box)
        self.expander_trackers.add_css_class("trackers-parent")
        self.expander_trackers.set_sensitive(False)
        self.expander_trackers.set_expanded(False)

        self.trackers_store = Gio.ListStore(item_type=TrackerItem)
        trackers_sel_model = Gtk.SingleSelection(model=self.trackers_store)
        trackers_list_view = Gtk.ListView(model=trackers_sel_model)
        self.trackers_store.remove_all()
        
        ft = Gtk.SignalListItemFactory()
        
        ft.connect("setup", self._setup_tracker_row)
        ft.connect("bind", self._bind_tracker_row)
        trackers_list_view.set_factory(ft)
        
        trackers_scroll = Gtk.ScrolledWindow()
        trackers_scroll.set_policy(Gtk.PolicyType.EXTERNAL, Gtk.PolicyType.EXTERNAL)
        trackers_scroll.set_min_content_height(100)
        trackers_scroll.set_child(trackers_list_view)
        
        self.expander_trackers.set_child(trackers_scroll)
        self.grid_torrent_meta.append(self.expander_trackers)
        self.cached_grids["torrent_meta"] = self.grid_torrent_meta

        self.dialog_stack.add_named(grid_std, "standard")

        content_area.append(self.dialog_stack)
        sep = Gtk.Separator(orientation=Gtk.Orientation.HORIZONTAL)
        sep.add_css_class("separator")
        content_area.append(sep)
        action_container = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)

        self.expander_schedule = Gtk.Expander(label=self.tr("Schedule Start Time"))
        schedule_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        schedule_box.set_margin_top(15)
        
        dt_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
        dt_box.set_halign(Gtk.Align.CENTER)

        now = time.localtime()

        self.spin_day = Gtk.SpinButton.new_with_range(1, 31, 1)
        self.spin_day.set_value(now.tm_mday)
        self.spin_day.add_css_class("entry")
        
        self.spin_month = Gtk.SpinButton.new_with_range(1, 12, 1)
        self.spin_month.set_value(now.tm_mon)
        self.spin_month.add_css_class("entry")

        self.spin_year = Gtk.SpinButton.new_with_range(now.tm_year, now.tm_year + 5, 1)
        self.spin_year.set_value(now.tm_year)
        self.spin_year.add_css_class("entry")

        self.spin_hour = Gtk.SpinButton.new_with_range(0, 23, 1)
        self.spin_hour.set_value(now.tm_hour)
        self.spin_hour.add_css_class("entry")

        self.spin_min = Gtk.SpinButton.new_with_range(0, 59, 1)
        self.spin_min.set_value(now.tm_min) 
        self.spin_min.add_css_class("entry")

        def sep_lbl(txt): return Gtk.Label(label=txt)

        dt_box.append(self.spin_day)
        dt_box.append(sep_lbl("/"))
        dt_box.append(self.spin_month)
        dt_box.append(sep_lbl("/"))
        dt_box.append(self.spin_year)
        dt_box.append(sep_lbl("   @   "))
        dt_box.append(self.spin_hour)
        dt_box.append(sep_lbl(":"))
        dt_box.append(self.spin_min)

        schedule_box.append(dt_box)

        self.lbl_schedule_info = Gtk.Label(label=self.tr("Download will start immediately."))
        self.lbl_schedule_info.add_css_class("caption")
        self.lbl_schedule_info.add_css_class("dim-label")
        schedule_box.append(self.lbl_schedule_info)

        self.expander_schedule.set_child(schedule_box)
        
        for s in [self.spin_day, self.spin_month, self.spin_year, self.spin_hour, self.spin_min]:
            s.connect("value-changed", self.update_schedule_label)
        self.expander_schedule.connect("notify::expanded", self.update_schedule_label)
        content_area.append(self.expander_schedule)
        
        row_actions = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)

        self.btn_queue = Gtk.Button(label=self.tr("Add To Queue"))
        self.btn_queue.add_css_class("generic-button")
        self.btn_queue.set_hexpand(True)
        self.btn_queue.connect("clicked", self.on_queue_clicked, self.entry_dir, self.add_url_dialog)

        self.btn_download = Gtk.Button(label=self.tr("Download Now"))
        GLib.idle_add(self.btn_download.set_hexpand, True)
        GLib.idle_add(self.btn_download.add_css_class, "green-btn")
        self.btn_download.connect("clicked", self.on_start_download_clicked, self.add_url_dialog, is_torrent_ready)
        self.entry_url.connect("activate", self.on_start_download_clicked, self.add_url_dialog, is_torrent_ready)
        self.entry_dir.connect("changed", self.on_folder_entry_changed)

        row_actions.append(self.btn_queue)
        row_actions.append(self.btn_download)
        
        btn_cancel = Gtk.Button(label=self.tr("Cancel"))
        GLib.idle_add(btn_cancel.add_css_class, "btn_cancel")
        btn_cancel.connect("clicked", lambda x: (self.add_url_dialog.destroy(), setattr(self, 'add_url_dialog', None)))
        btn_cancel.set_hexpand(True)

        action_container.append(row_actions)
        action_container.append(btn_cancel)

        content_area.append(action_container)
        
        self.entry_url.connect("changed", self.on_url_input_changed)
        self.dd_mode.connect("notify::selected", self.on_yt_mode_changed)
        self.add_url_dialog.set_child(content_area)
        self.add_url_dialog.set_visible(True)
        self.apply_cursor_recursive(self.add_url_dialog, "pointer")

    def _setup_file_row(self, fact, list_item):
        expander = Gtk.TreeExpander()
        box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=8)
        chk = Gtk.CheckButton()
        chk.set_valign(Gtk.Align.CENTER)
        icon = Gtk.Image()
        name = Gtk.Label(xalign=0)
        name.set_ellipsize(Pango.EllipsizeMode.MIDDLE)
        name.set_hexpand(True)
        size = Gtk.Label(xalign=1)
        
        box.append(chk); box.append(icon); box.append(name); box.append(size)
        expander.set_child(box)
        list_item.set_child(expander)

    def _bind_file_row(self, fact, list_item):
        expander = list_item.get_child()
        row = list_item.get_item()
        node = row.get_item()
        expander.set_list_row(row)

        box = expander.get_child()
        chk = box.get_first_child()
        icon = chk.get_next_sibling()
        name = icon.get_next_sibling()
        size = name.get_next_sibling()

        name.set_label(node.name)
        name.set_tooltip_text(node.name)
        size.set_label(node.size_str)
        
        if node.is_dir:
            name.add_css_class("heading")
            size.add_css_class("heading")
            icon.set_from_icon_name("xsi-folder-symbolic")
        else:
            name.remove_css_class("heading")
            size.remove_css_class("heading")
            name.add_css_class("dim-label")
            size.add_css_class("dim-label")
            icon.set_from_icon_name("xsi-text-x-generic-symbolic")

        if hasattr(chk, "sig_ids"):
            for sig in chk.sig_ids: chk.disconnect(sig)
        if hasattr(chk, "notify_ids"):
            for obj, sig in chk.notify_ids: 
                if obj.handler_is_connected(sig): obj.disconnect(sig)

        chk.sig_ids = []
        chk.notify_ids = []

        chk.set_inconsistent(node.inconsistent_prop)
        chk.blocking = True
        chk.set_active(node.checked_prop)
        chk.blocking = False

        id1 = node.connect("notify::checked-prop", self._on_node_checked_notify, chk)
        id2 = node.connect("notify::inconsistent-prop", self._on_node_inconsistent_notify, chk)
        chk.notify_ids.extend([(node, id1), (node, id2)])

        sig_id = chk.connect("toggled", self._on_chk_toggled, node)
        chk.sig_ids.append(sig_id)

    def _on_node_checked_notify(self, node, param, chk):
        chk.blocking = True
        chk.set_active(node.checked_prop)
        chk.blocking = False

    def _on_node_inconsistent_notify(self, node, param, chk):
        chk.blocking = True
        chk.set_inconsistent(node.inconsistent_prop)
        chk.blocking = False

    def _on_chk_toggled(self, btn, node):
        if getattr(btn, 'blocking', False): return
        node.toggle(btn.get_active())
        self.update_torrent_counter()

    def _setup_tracker_row(self, fact, item):
        box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
        
        l = Gtk.Label(xalign=0, selectable=True)
        l.set_hexpand(True)
        l.set_ellipsize(Pango.EllipsizeMode.MIDDLE)
        l.set_max_width_chars(25)
        
        btn_del = Gtk.Button()
        icon = Gtk.Image.new_from_icon_name("xsi-window-close-symbolic")
        icon.set_pixel_size(12)
        btn_del.set_child(icon)
        btn_del.add_css_class("del-tracker-item")
        
        box.append(btn_del)
        box.append(l)
        box.add_css_class("tracker-item")
        self.set_cursor_for_widget(btn_del, "pointer")
        item.set_child(box)

    def _bind_tracker_row(self, fact, item):
        box = item.get_child()
        btn_del = box.get_first_child()
        lbl = box.get_last_child()
        
        obj = item.get_item()
        if obj and hasattr(obj, 'url'):
            lbl.set_label(obj.url)
            
            if hasattr(btn_del, "handler_id"):
                btn_del.disconnect(btn_del.handler_id)
            
            btn_del.handler_id = btn_del.connect("clicked", self._on_tracker_remove_clicked, obj)

    def _on_tracker_remove_clicked(self, btn, obj):
        for i in range(self.trackers_store.get_n_items()):
            if self.trackers_store.get_item(i) == obj:
                self.trackers_store.remove(i)
                self.update_tracker_count()
                break

    def on_yt_mode_changed(self, dropdown, pspec):
        selected = dropdown.get_selected()
        
        audio_formats = ["mp3", "opus", "wav", "aac", "flac"]
        video_formats = ["mp4", "mkv", "webm", "mov", "avi"]

        audio_qualities = ["Best Available", "High", "Medium", "low"]
        video_qualities = ["Best Available", "4K", "1080p", "720p", "480p"]

        if selected == 1:
            self.dd_fmt.set_model(Gtk.StringList.new(audio_formats))
            self.dd_fmt.set_selected(0)

            self.dd_quality.set_model(Gtk.StringList.new(audio_qualities))
            self.dd_quality.set_selected(0)
        else:
            self.dd_fmt.set_model(Gtk.StringList.new(video_formats))
            self.dd_fmt.set_selected(0)

            self.dd_quality.set_model(Gtk.StringList.new(video_qualities))
            self.dd_quality.set_selected(0)
        
    def on_url_input_changed(self, entry):
        url = entry.get_text().lower().strip()
        is_youtube = self.is_yt_dlp(url)
        is_torrent = url.startswith("magnet:?") or url.endswith(".torrent")
        check = is_youtube and ("&list=" in url)
        self.check_playlist.set_sensitive(check)
        self.check_playlist.set_active(check)
        
        target_page = "standard"
        if is_youtube:
            target_page = "youtube"
        elif is_torrent:
            self.torrent_files_data = []
            target_page = "torrent_prompt"
            
        current_page = self.dialog_stack.get_visible_child_name()
        
        if current_page != target_page:
            if current_page and self.dialog_stack.get_child_by_name(current_page):
                self.dialog_stack.remove(self.dialog_stack.get_child_by_name(current_page))
            
            if target_page in self.cached_grids:
                self.dialog_stack.add_named(self.cached_grids[target_page], target_page)
                self.dialog_stack.set_visible_child_name(target_page)

        if is_youtube or is_torrent:
            GLib.idle_add(self.btn_download.set_label, self.tr("Process Link"))
        else:
            GLib.idle_add(self.btn_download.set_label, self.tr("Download Now"))

        self.on_url_entry_changed(entry)
        
    def on_start_download_clicked(self, btn, dialog, is_torrent_ready):
        """Determines which logic to run based on the visible stack page."""
        url = self.entry_url.get_text().strip()
        if url == "":
            return

        mode = self.dialog_stack.get_visible_child_name()

        if mode == "youtube":
            is_audio = (self.dd_mode.get_selected() == 1)
            quality_mod = self.dd_quality.get_model().get_string(self.dd_quality.get_selected())
            download_playlist = self.check_playlist.get_active()
            selected_item = self.dd_fmt.get_selected_item()
            ext = ""
            if selected_item:
                ext = f".{selected_item.get_string()}"
            print(f"Starting YouTube DL: {url} | Audio: {is_audio} | Playlist: {download_playlist}")
            threading.Thread(
                target=self.start_yt_dlp_download_url,
                args=(dialog, ext, is_audio, quality_mod, download_playlist),
                daemon=True
            ).start()
        elif mode == "torrent_prompt":
            threading.Thread(
                target=self.fetch_torrent_metadata,
                args=(url, is_torrent_ready),
                daemon=True
            ).start()
            GLib.idle_add(self.btn_download.set_sensitive, False)
            GLib.idle_add(self.btn_queue.set_sensitive, False)
            self.dialog_stack.remove(self.dialog_stack.get_child_by_name("torrent_prompt"))
            self.dialog_stack.add_named(self.cached_grids["torrent_meta"], "torrent_meta")
            self.dialog_stack.set_visible_child_name("torrent_meta")
            GLib.idle_add(self.btn_download.set_label, self.tr("Download Now"))
        elif mode == "torrent_meta":
            GLib.idle_add(self.btn_download.set_sensitive, True)
            GLib.idle_add(self.btn_queue.set_sensitive, True)
            selected_indices = []
            def collect_indices(store):
                if not store: return
                for i in range(store.get_n_items()):
                    node = store.get_item(i)
                    if node.is_dir:
                        collect_indices(node.children_store)
                    else:
                        if node.checked_prop:
                            selected_indices.append(str(node.index))
            
            collect_indices(self.root_node_store)
            
            if not selected_indices:
                self.show_toast_popup(self.tr("Please select at least one file to download."), color="red_toast")
                return

            indexes_string = ",".join(selected_indices)
            filename = self.get_unique_filename(os.path.splitext(self.entry_name.get_text())[0])
            meta_path = os.path.join(self.download_folder, filename + ".meta.json")
            if self.torrent_files_data:
                data = {
                    "files": self.torrent_files_data,
                    "indices": indexes_string
                }
                with open(meta_path, 'w') as f:
                    json.dump(data, f)
            
            self.start_download_url(None, dialog, filename, 8, torrent_indices=indexes_string, torrent_files_data=self.torrent_files_data)
        else:
            segments = self.spin_seg.get_value_as_int()
            filename = self.get_unique_filename(self.entry_name.get_text())
            print(f"Starting Standard DL: {url} | Segments: {segments}")
            self.start_download_url(btn, dialog, filename, segments)
        
        if mode != "torrent_prompt":
            self.show_toast_popup(f"{self.tr("Starting The Downloader Please Wait...")}")
            self.add_url_dialog = None
            dialog.destroy()

    def fetch_torrent_metadata(self, url, is_torrent_ready=None):
        """
        Main entry point to fetch metadata. 
        If is_torrent_ready (which is a silly name for a torrent file but uhh it does the jobe done) is provided, it uses that file.
        Otherwise, it attempts to download metadata from the magnet link first.
        """
        from urllib.parse import urlparse, parse_qs
        self.trackers_store.remove_all()
        self.torrent_files_data = []

        if is_torrent_ready == None:
            print("is_torrent_ready", is_torrent_ready)
            parsed = urlparse(url)
            qs = parse_qs(parsed.query)
            trackers = qs.get("tr", [])
            for tr in trackers:
                t_item = TrackerItem(tr)
                self.trackers_store.append(t_item)
            self.update_tracker_count()

        try:
            torrent_path = is_torrent_ready
            print("is_torrent_ready", torrent_path)
            if torrent_path is None:
                torrent_path = self._download_magnet_metadata(url)
                if not torrent_path:
                    print("Metadata not found. The torrent might be dead or timeout was too short.")
                    GLib.idle_add(self.lbl_meta_name.set_text, self.tr("Metadata was not found. The torrent might be dead or timeout was too short"))
                    return

            if os.path.exists(torrent_path):
                self._parse_torrent_file(torrent_path)
            else:
                print(f"Error: Torrent file not found at {torrent_path}")

        except subprocess.TimeoutExpired:
            GLib.idle_add(self.lbl_meta_size.set_text, self.tr("Size: Timeout (Metadata not found)"))
            print("The process timed out while fetching metadata.")
        except subprocess.CalledProcessError as e:
            print(f"Aria2c crashed or returned an error: {e}")
        except Exception as e:
            print(f"Metadata error: {e}")

    def _download_magnet_metadata(self, url):
        save_path_template = tempfile.mkdtemp(prefix="flameget_torrent_", dir=addOn.UNITS.RUNTIME_DIR)
        cmd = [
            addOn.FireFiles.aria2c_path,
            "--bt-metadata-only=true",
            "--bt-save-metadata=true",
            "-d", save_path_template,
            url
        ]

        download_proc = subprocess.run(
            cmd, capture_output=True, text=True, timeout=60, check=True, **({"creationflags": subprocess.CREATE_NO_WINDOW} if os.name == "nt" else {})
        )

        match = re.search(r"Saved metadata as (.*\.torrent)", download_proc.stdout)
        if match:
            generated_filename = match.group(1).strip()
            if os.path.exists(generated_filename):
                return generated_filename
            else:
                print(f"Error: Aria2 said it saved {generated_filename}, but file was not found.")
        
        return None

    def _parse_torrent_file(self, file_path):
        """Helper: Runs aria2c -S, parses the output, and updates the UI."""
        cmd = [addOn.FireFiles.aria2c_path, "-S", file_path]
        proc = subprocess.run(cmd, capture_output=True, text=True, timeout=15, **({"creationflags": subprocess.CREATE_NO_WINDOW} if os.name == "nt" else {}))
        
        output = proc.stdout
        
        files_count = 0
        total_size = "Unknown"
        name = "Unknown"

        lines = output.splitlines()
        file_mode = False
        current_path = None
        current_index = None
        trackers = []
        self.trackers_store.remove_all()
        for line in lines:
            stripped = line.strip()
            
            if stripped.startswith("Total Length:"):
                total_size = stripped.split(":", 1)[1].strip()

            if stripped.startswith("Name:"):
                name = stripped.split(":", 1)[1].strip()
            
            if stripped.lower().startswith("files:"):
                file_mode = True
                continue
                
            url = self.extract_magnet(stripped)
            if url != None:
                self.raw_file_url = url
                parsed = urlparse(url)
                qs = parse_qs(parsed.query)
                trackers = qs.get("tr", [])
                for tr in trackers:
                    t_item = TrackerItem(tr)
                    self.trackers_store.append(t_item)
                self.update_tracker_count()
            
            if file_mode:
                if line.startswith("===") or line.startswith("---") or line.startswith("idx|"):
                    continue

                parts = line.split("|")
                
                if len(parts) >= 2:
                    col_idx = parts[0].strip()
                    if col_idx.isdigit():
                        current_index = col_idx
                        current_path = parts[1].strip()
                    elif col_idx == "" and current_path and current_index:
                        raw_size = parts[1].strip()
                        f_size = raw_size.split("(")[0].strip()
                        lower_path = current_path.lower()
                        
                        if "padding_file" in lower_path and "____" in lower_path:
                            current_path = None; current_index = None; continue
                        if lower_path.endswith("thumbs.db") or lower_path.endswith(".ds_store") or lower_path.endswith("desktop.ini"):
                            current_path = None; current_index = None; continue
                            
                        files_count += 1
                        if name == "Unknown":
                            clean_name = current_path
                            if clean_name.startswith("./"): clean_name = clean_name[2:]
                            name = clean_name.split("/")[0] if "/" in clean_name else clean_name
                        
                        GLib.idle_add(self.entry_name.set_text, self.get_unique_filename(name))
                        GLib.idle_add(self.entry_name.set_sensitive, False)

                        path_parts = current_path.replace("\\", "/").split("/")
                        if path_parts[0] in (".", ""): path_parts = path_parts[1:]
                            
                        current_store = self.root_node_store
                        current_parent = None

                        def get_or_create_dir(parent_store, dir_name, parent_node):
                            for i in range(parent_store.get_n_items()):
                                item = parent_store.get_item(i)
                                if item.is_dir and item.name == dir_name: return item
                            new_dir = TorrentNode(dir_name, "", -1, is_dir=True, parent=parent_node)
                            parent_store.append(new_dir)
                            return new_dir

                        for i in range(len(path_parts) - 1):
                            folder_name = path_parts[i]
                            if folder_name in (".", ""): continue
                            dir_node = get_or_create_dir(current_store, folder_name, current_parent)
                            current_store = dir_node.children_store
                            current_parent = dir_node

                        file_name = path_parts[-1]
                        file_node = TorrentNode(file_name, f_size, current_index, is_dir=False, parent=current_parent)
                        current_store.append(file_node)
                        self.torrent_files_data.append([current_path, f_size, current_index])

                        current_path = None
                        current_index = None
        
        for i in range(self.root_node_store.get_n_items()):
            node = self.root_node_store.get_item(i)
            if node.is_dir: node.recalculate_state()

        def calc_dir_size(store):
            total_bytes = 0
            for j in range(store.get_n_items()):
                child_node = store.get_item(j)
                if child_node.is_dir:
                    dir_bytes = calc_dir_size(child_node.children_store)
                    child_node.size_str = addOn.parse_size(dir_bytes)
                    total_bytes += dir_bytes
                else:
                    total_bytes += self.torrent_parse_size(child_node.size_str)
            return total_bytes

        calc_dir_size(self.root_node_store)
        self.update_torrent_counter()

        GLib.idle_add(self.lbl_meta_size.set_text, f"{self.tr("Size:")} {total_size}")
        GLib.idle_add(self.lbl_meta_name.set_text, f"{self.tr("Name:")} {name}")
        GLib.idle_add(self.expander_files.set_label, f"{self.tr("Files")} ({files_count})")
        GLib.idle_add(self.expander_files.set_sensitive, True)
        GLib.idle_add(self.expander_files.set_expanded, True)

        GLib.idle_add(self.expander_trackers.set_sensitive, True)
        GLib.idle_add(self.expander_trackers.set_expanded, True)
        GLib.idle_add(self.btn_download.set_sensitive, True)
        GLib.idle_add(self.btn_queue.set_sensitive, True)

    def update_torrent_counter(self):
        total_files = 0
        selected_files = 0
        
        def walk_stats(store):
            nonlocal total_files, selected_files
            n = store.get_n_items()
            for i in range(n):
                node = store.get_item(i)
                if node.is_dir:
                    walk_stats(node.children_store)
                else:
                    total_files += 1
                    if node.checked_prop:
                        selected_files += 1

        if hasattr(self, 'root_node_store'):
            walk_stats(self.root_node_store)
        
        if hasattr(self, 'lbl_files_expander'):
            GLib.idle_add(self.lbl_files_expander.set_label, f"{self.tr("Files")} ({selected_files}/{total_files})")

    def torrent_parse_size(self, size_str):
        if not size_str: return 0
        m = re.search(r"([0-9.]+)\s*([a-zA-Z]+)", size_str)
        if m:
            val, unit = m.groups()
            return addOn.range_parse_size(val, unit)
        try:
            return int(float(size_str))
        except ValueError:
            return 0

    def on_add_tracker_clicked(self, btn):
        dialog = Gtk.Dialog(title=self.tr("Add Trackers"), transient_for=self.add_url_dialog, modal=True)
        GLib.idle_add(addOn.set_titlebar_theme, dialog.get_title(), self.app_settings.get("theme_mode"))
        dialog.set_default_size(450, 300)
        key_controller = Gtk.EventControllerKey()
        key_controller.connect("key-pressed", self.on_window_key_pressed, dialog)
        dialog.add_controller(key_controller)
        content = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        content.set_margin_top(10); content.set_margin_bottom(10); 
        content.set_margin_start(10); content.set_margin_end(10)
        
        lbl = Gtk.Label(label=self.tr("Enter Tracker URLs (One per line):"))
        lbl.set_xalign(0)

        scrolled = Gtk.ScrolledWindow()
        scrolled.set_policy(Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC)
        scrolled.set_vexpand(True)
        scrolled.set_min_content_height(150)
        
        text_view = Gtk.TextView()
        text_view.set_left_margin(5)
        text_view.set_top_margin(5)
        text_view.add_css_class("entry")
        
        scrolled.set_child(text_view)

        btn_add = Gtk.Button(label=self.tr("Add Trackers"))
        btn_add.add_css_class("green-btn")
        
        def on_confirm(b):
            buffer = text_view.get_buffer()
            start, end = buffer.get_bounds()
            raw_text = buffer.get_text(start, end, True)
            
            lines = [line.strip() for line in raw_text.splitlines() if line.strip()]
            
            if not lines:
                return

            existing_urls = set()
            for i in range(self.trackers_store.get_n_items()):
                item = self.trackers_store.get_item(i)
                if hasattr(item, 'url'):
                    existing_urls.add(item.url)

            added_count = 0
            skipped_count = 0
            
            for url in lines:
                if not (url.startswith("udp://") or url.startswith("http")):
                    continue
                
                if url in existing_urls:
                    skipped_count += 1
                    continue
                
                item = TrackerItem(url)
                self.trackers_store.append(item)
                existing_urls.add(url)
                added_count += 1

            if added_count > 0:
                self.update_tracker_count()
                
                msg = f"{self.tr("Added")} {added_count} {self.tr("trackers.")}"
                if skipped_count > 0:
                    msg += f" ({skipped_count} {self.tr("skipped")})"
                
                self.show_toast_popup(msg, color="blue_toast")
                dialog.destroy()
            
            elif skipped_count > 0:
                self.show_toast_popup(self.tr("Trackers already exist."), color="red_toast")
            else:
                self.show_toast_popup(self.tr("No valid trackers found."), color="red_toast")
        
        btn_add.connect("clicked", on_confirm)
        
        content.append(lbl)
        content.append(scrolled)
        content.append(btn_add)
        dialog.set_child(content)
        dialog.set_visible(True)
        self.apply_cursor_recursive(dialog, "pointer")

    def update_tracker_count(self):
        count = self.trackers_store.get_n_items()
        self.tracker_label.set_label(f"{self.tr("Show Trackers")} ({count})")

    def on_select_folder_clicked(self, button):
        dialog = Gtk.FileDialog()
        dialog.set_title(self.tr("Select Download Folder"))
        dialog.set_modal(True)

        def on_done(source, result, data=None):
            try:
                folder = dialog.select_folder_finish(result)
                self.download_folder = folder.get_path()
                self.entry_dir.set_text(self.download_folder)
            except Exception as e:
                print("Cancelled folder select", e)

        dialog.select_folder(self.window, None, on_done)

    def on_toolbar_select_all(self, btn, selection_model):
        selection = selection_model.get_selection()
        
        n_items = selection_model.get_model().get_n_items()
        n_selected = selection.get_size()

        if n_selected < n_items:
            print("Selecting all")
            selection_model.select_all()
            for check_btn in self.select_all_btn:
                check_btn.set_active(True)
        else:
            print("Unselecting all")
            selection_model.unselect_all()
            for check_btn in self.select_all_btn:
                check_btn.set_active(False)

    def on_sidebar_row_selected(self, box, row):
        if not row:
            return

        if box == self.listbox_main:
            self.listbox_status.select_row(None)
        else:
            self.listbox_main.select_row(None)

        self.stack.set_visible_child_name(row.cat_id)
        
        if row.cat_id in self.selection_models_map:
            self.selection_model = self.selection_models_map[row.cat_id]

    def parse_size_val(self, size_str):
        if not size_str: return 0
        val = 0.0
        try:
            num_match = re.match(r"([0-9\.]+)", size_str)
            if num_match:
                val = float(num_match.group(1))
            if "GB" in size_str.upper(): val *= 1024**3
            elif "MB" in size_str.upper(): val *= 1024**2
            elif "KB" in size_str.upper(): val *= 1024
        except:
            return 0
        return val

    def get_custom_sorter(self, key_type):
        if key_type == "name":
            expression = Gtk.PropertyExpression.new(DownloadItem, None, "name_prop")
            return Gtk.StringSorter(expression=expression)
        elif key_type == "status":
            expression = Gtk.PropertyExpression.new(DownloadItem, None, "status_prop")
            return Gtk.StringSorter(expression=expression)
        elif key_type == "date":
            def compare_date(a, b, user_data):
                try:
                    val_a = float(a.date_added)
                except: val_a = 0
                try:
                    val_b = float(b.date_added)
                except: val_b = 0
                
                if val_a < val_b: return -1
                if val_a > val_b: return 1
                return 0
            return Gtk.CustomSorter.new(compare_date, None)
        elif key_type == "size":
            def compare_size(a, b, user_data):
                val_a = self.parse_size_val(a.size)
                val_b = self.parse_size_val(b.size)
                if val_a < val_b: return -1
                if val_a > val_b: return 1
                return 0
            return Gtk.CustomSorter.new(compare_size, None)
        return None

    def create_download_view(self, category_filter):
        scrolled = Gtk.ScrolledWindow()
        scrolled.set_policy(Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC)

        store = Gio.ListStore(item_type=DownloadItem)
        sort_model = Gtk.SortListModel(model=store) 
        selection_model = Gtk.MultiSelection(model=sort_model)
        
        self.selection_models_map[category_filter] = selection_model
        if category_filter == "All":
            self.selection_model = selection_model

        self.view_registry[category_filter] = (store, selection_model)
        self.store_caches[category_filter] = {}

        if not self.has_settedup_events:
            self.btn_delete.connect("clicked", lambda b: self.delete_selected_items(b, self.selection_model))
            self.btn_folder.connect("clicked", lambda b: self.open_folder(b, self.selection_model))
            self.btn_resume.connect("clicked", lambda b: self.resume_download(b, self.selection_model))
            self.btn_pause.connect("clicked", lambda b: self.stop_download(b, self.selection_model))
            self.btn_stop.connect("clicked", lambda b: self.stop_download(b, self.selection_model, True))
            self.btn_select_all.connect("clicked", lambda b: self.on_toolbar_select_all(b, self.selection_model))
            
            self.has_settedup_events = True

        selection_model.connect("selection-changed", self.on_selection_changed)

        column_view = Gtk.ColumnView(model=selection_model)
        column_view.set_hexpand(True)
        
        if self.get_windowing_system() == "wayland" or os.name == "nt":
            column_view.add_css_class("wayland-headers")

        sort_model.set_sorter(column_view.get_sorter())

        if not self.app_settings.get("chk_has_borders", True):
            column_view.set_show_row_separators(True)
            column_view.set_show_column_separators(True)

        self.add_checkbox_column(column_view, selection_model)

        self.add_column(column_view, self.tr("Name"), 
            self._setup_name, self._bind_name, unbind_func=self._unbind_name, 
            sorter=self.get_custom_sorter("name"), expand=True)

        self.add_column(column_view, self.tr("Size"), 
            self._setup_label, lambda f,i: self._bind_label(f,i,"size"),
            sorter=self.get_custom_sorter("size"), width=100)

        self.add_column(column_view, self.tr("Speed"), 
            self._setup_label, 
            lambda f,i: self._bind_label(f, i, "speed", "speed-prop"),
            unbind_func=self._unbind_label,
            width=100)

        self.add_column(column_view, self.tr("Status"), 
            self._setup_status, 
            self._bind_status, 
            unbind_func=self._unbind_status,
            width=200,
            sorter=self.get_custom_sorter("status"))
        
        self.add_column(column_view, self.tr("Date Added"), 
            self._setup_label, lambda f,i: self._bind_label(f,i,"date_prop"),
            sorter=self.get_custom_sorter("date"))

        sorter = column_view.get_sorter()
        sort_model.set_sorter(sorter)
        sorter.connect("changed", self.on_sort_changed, column_view)
        saved_col_name = self.app_settings.get("sort_column", "Date Added")
        saved_direction = self.app_settings.get("sort_direction", 1)

        target_col = None
        columns_list_model = column_view.get_columns()
        for i in range(columns_list_model.get_n_items()):
            col = columns_list_model.get_item(i)
            if col.get_title() == self.tr(saved_col_name):
                target_col = col
                break
        
        if target_col:
            self.is_programmatic_sort = True
            direction_enum = Gtk.SortType(saved_direction)
            column_view.sort_by_column(target_col, direction_enum)
            self.is_programmatic_sort = False

        scrolled.set_child(column_view)
        return scrolled

    def on_row_double_click(self, gesture, n_press, x, y, list_item):
        if n_press != 2:
            return
            
        item = list_item.get_item()
        if not item or item.filename.strip() == "": 
            return

        target_widget = list_item.get_child()
        while target_widget:
            if target_widget.get_css_name() == "row":
                break
            target_widget = target_widget.get_parent()
        if target_widget:
            target_widget.add_css_class("flash-impact")
            GLib.timeout_add(500, lambda: target_widget.remove_css_class("flash-impact") or False)

        if item.status == "Finished":
            full_path = os.path.join(item.file_directory, item.filename)
            if os.path.exists(full_path):
                self.open_file_direct(full_path)
                self.show_toast_popup(f"{self.tr("Opening File:")} {item.filename}")
            else:
                self.show_toast_popup(f"{self.tr("Couldn't Open File:")} {item.filename}", color="red_toast")
        elif item.status in ("Paused", "Stopped"):
            self.resume_download(None, self.selection_model)

    def on_row_right_click(self, gesture, n_press, x, y, list_item):
        """Handle right click: Select item + Calc position + Popup"""
        item = list_item.get_item()
        if item is None: return

        position = list_item.get_position()
        if position != Gtk.INVALID_LIST_POSITION:
            self.selection_model.select_item(position, unselect_rest=True)

        btn_open   = self.context_menu_btns[0]
        btn_pause  = self.context_menu_btns[3]
        btn_resume = self.context_menu_btns[4]
        btn_stop   = self.context_menu_btns[5]

        btn_pause.lbl.set_text(self.tr("Pause Download"))
        btn_resume.lbl.set_text(self.tr("Resume Download"))
        btn_stop.lbl.set_text(self.tr("Stop Download"))

        is_finished = (item.status == "Finished")
        is_downloading = (item.status == "downloading")
        is_seeding = (item.status == "Seeding")
        is_paused_or_stopped = item.status in ("Paused", "Stopped") and not item.finished_downloading
        is_paused = item.status == "Paused"

        if item.category == "Torrent" and item.finished_downloading:
            btn_pause.lbl.set_text(self.tr("Pause Seeding"))
            btn_resume.lbl.set_text(self.tr("Start Seeding"))
            btn_stop.lbl.set_text(self.tr("Stop Seeding"))
            
            btn_pause.set_sensitive(is_seeding)
            btn_resume.set_sensitive(not is_seeding)
        else:
            btn_pause.set_sensitive(is_downloading)
            btn_resume.set_sensitive(is_paused_or_stopped)

        btn_open.set_sensitive(is_finished)

        is_process_running = False
        try:
            pid = int(item.pid)
            if pid > 0 and addOn.is_pid_alive(pid):
                is_process_running = True
        except (ValueError, TypeError):
            pass

        can_stop = is_downloading or is_seeding or is_paused or is_process_running
        btn_stop.set_sensitive(can_stop)

        row_widget = list_item.get_child()
        click_point = Graphene.Point().init(x, y)
        success, out_point = row_widget.compute_point(self.overlay, click_point)

        if success:
            rect = Gdk.Rectangle()
            rect.x = int(out_point.x) + self.app_settings.get("ctx_menu_offsets", {}).get("x", 0)
            rect.y = int(out_point.y) + self.app_settings.get("ctx_menu_offsets", {}).get("y", 0)
            rect.width = 1
            rect.height = 1
            
            self.context_popover.set_pointing_to(rect)
            self.context_popover.popup()

    def add_checkbox_column(self, view, selection_model):
        col = Gtk.ColumnViewColumn(title=self.tr("All"))
        
        row_factory = Gtk.SignalListItemFactory()

        def setup_checkbox(factory, list_item):
            hitbox = Gtk.Box()
            hitbox.set_hexpand(True)
            hitbox.set_vexpand(True)
            hitbox.set_halign(Gtk.Align.CENTER)
            hitbox.set_valign(Gtk.Align.CENTER)
            
            check = Gtk.CheckButton()
            hitbox.append(check)
            list_item.set_child(hitbox)
            self.set_cursor_for_widget(check, "pointer")

        def bind_checkbox(factory, list_item):
            hitbox = list_item.get_child()
            check = hitbox.get_first_child()
            item = list_item.get_item()
            
            if check not in self.select_all_btn:
                check._model_item = item
                check._list_item = list_item      
                self.select_all_btn.append(check)

            if hasattr(check, "handler_id"):
                check.disconnect(check.handler_id)

            pos = list_item.get_position()
            if pos != Gtk.INVALID_LIST_POSITION:
                check.set_active(selection_model.is_selected(pos))

            def on_toggled(btn):
                if self._syncing or btn is None: return
                idx = list_item.get_position()
                if idx == Gtk.INVALID_LIST_POSITION: return

                if btn.get_active():
                    selection_model.select_item(idx, unselect_rest=False)
                else:
                    selection_model.unselect_item(idx)
                self.last_click_index = idx

            check.handler_id = check.connect("toggled", on_toggled)

            def update_color(item, pspec):
                parent_cell = hitbox.get_parent()
                child_check = hitbox.get_first_child()

                if not parent_cell or not child_check:
                    return

                if item.status == "downloading":
                    parent_cell.add_css_class("active-row-green")
                    parent_cell.remove_css_class("seeding-row-green")
                    parent_cell.remove_css_class("paused-row-green")
                elif item.status == "Seeding" or item.status == "Verifying Checksum":
                    parent_cell.add_css_class("seeding-row-green")
                    parent_cell.remove_css_class("active-row-green")
                    parent_cell.remove_css_class("paused-row-green")
                elif item.status == "Paused":
                    parent_cell.add_css_class("paused-row-green")
                    parent_cell.remove_css_class("seeding-row-green")
                    parent_cell.remove_css_class("active-row-green")
                else:
                    parent_cell.remove_css_class("active-row-green")
                    parent_cell.remove_css_class("paused-row-green")
                    parent_cell.remove_css_class("seeding-row-green")

            update_color(item, None)

            if hasattr(hitbox, "_sig_color"):
                if item.handler_is_connected(hitbox._sig_color):
                    item.disconnect(hitbox._sig_color)
            
            hitbox._sig_color = item.connect("notify::status-prop", update_color)

        def unbind_checkbox(factory, list_item):
            hitbox = list_item.get_child()
            item = list_item.get_item()
            
            if item and hitbox and hasattr(hitbox, "_sig_color"):
                 if item.handler_is_connected(hitbox._sig_color):
                    item.disconnect(hitbox._sig_color)

        row_factory.connect("setup", setup_checkbox)
        row_factory.connect("bind", bind_checkbox)
        row_factory.connect("unbind", unbind_checkbox)
        
        col.set_factory(row_factory)
        view.append_column(col)

    def add_column(self, view, title, setup_func, bind_func, unbind_func=None, expand=False, width=None, sorter=None):        
        col = Gtk.ColumnViewColumn(title=title)
        if expand: col.set_expand(True)
        if width: col.set_fixed_width(width)
        if sorter: col.set_sorter(sorter)

        factory = Gtk.SignalListItemFactory()

        def setup_wrapper(factory, list_item):
            setup_func(factory, list_item)
            content_widget = list_item.get_child()
            
            hitbox = Gtk.Box()
            hitbox.set_hexpand(True)
            hitbox.set_vexpand(True)
            if self.get_windowing_system() == "wayland" or os.name == "nt":
                user_padding = self.app_settings.get("cells_size", 1) 
                custom_css = f".wayland-fix {{ padding: {user_padding}px; }}"
                
                provider = Gtk.CssProvider()
                provider.load_from_data(custom_css.encode('utf-8'))
                display = Gdk.Display.get_default()
                Gtk.StyleContext.add_provider_for_display(display, provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)
                hitbox.add_css_class("wayland-fix")
            
            if content_widget:
                list_item.set_child(None) 
                content_widget.set_hexpand(True)
                content_widget.set_vexpand(True)
                content_widget.set_halign(Gtk.Align.FILL)
                content_widget.set_valign(Gtk.Align.FILL)
                hitbox.append(content_widget)

            gesture = Gtk.GestureClick()
            gesture.set_button(3)
            gesture.connect("pressed", self.on_row_right_click, list_item)
            
            gesture_double = Gtk.GestureClick()
            gesture_double.set_button(1)
            gesture_double.connect("pressed", self.on_row_double_click, list_item)

            hitbox.add_controller(gesture)
            hitbox.add_controller(gesture_double)
            
            list_item.set_child(hitbox)
            self.set_cursor_for_widget(hitbox, "pointer")
        factory.connect("setup", setup_wrapper)
        factory.connect("bind", bind_func)
        if unbind_func:
            factory.connect("unbind", unbind_func)
            
        col.set_factory(factory)
        view.append_column(col)

    def on_selection_changed(self, selection_model, position, n_items):
        self._syncing = True
        self.sync_checkboxes(selection_model)
        self._syncing = False
        
        self.update_buttons_state()
        
        self.all_selected = not self.all_selected

    def open_folder(self, button, selection_model):
        selection = selection_model.get_selection()
        if selection.is_empty(): return

        index = selection.get_nth(0)
        item = selection_model.get_model().get_item(index)
        if item and item.filename.strip() != "":
            full_path = os.path.join(item.file_directory, item.filename)
            if os.path.exists(item.file_directory):
                self.show_file_in_folder(full_path)
                self.show_toast_popup(f"{self.tr("Opening File's Folder...")}")
            else:
                self.show_toast_popup(f"{self.tr("Couldn't Open Folder")}", color="red_toast")

    def show_file_in_folder(self, full_file_path):
        uri = GLib.filename_to_uri(full_file_path)
        try:
            bus = Gio.bus_get_sync(Gio.BusType.SESSION, None)
            
            bus.call_sync(
                "org.freedesktop.FileManager1",
                "/org/freedesktop/FileManager1",
                "org.freedesktop.FileManager1",
                "ShowItems",
                GLib.Variant("(ass)", ([uri], "")), # ass hehe
                None,
                Gio.DBusCallFlags.NONE,
                -1,
                None
            )
        except Exception as e:
            print(f"Could not highlight file: {e}")
            parent_folder = os.path.dirname(full_file_path)
            file = Gio.File.new_for_path(parent_folder)
            Gio.AppInfo.launch_default_for_uri(file.get_uri(), None)
            
    def open_file_direct(self, full_file_path):
        try:
            file = Gio.File.new_for_path(full_file_path)
            Gio.AppInfo.launch_default_for_uri(file.get_uri(), None)
        except Exception as e:
            print(f"Could not open file: {e}")
            if os.name == 'nt':
                os.startfile(full_file_path)
            else:
                subprocess.run(["xdg-open", full_file_path])

    def delete_selected_items(self, button, selection_model, files_too=None):
        selection = selection_model.get_selection()
        if selection.is_empty(): return
        i = 0
        can_delete = True
        while i < selection.get_size():
            idx = selection.get_nth(i)
            item = selection_model.get_model().get_item(idx)
            can_delete = item.status in ("Paused", "Stopped", "Finished")
            i += 1
        if not can_delete:
            self.show_toast_popup(f"{self.tr("You Can't Delete Items During a Download. Please Stop The Operation First.")}", color="red_toast")
            return
        count = selection.get_size()
        
        dialog = Gtk.Dialog(title=self.tr("Delete Confirmation"), transient_for=self.window, modal=True)
        GLib.idle_add(addOn.set_titlebar_theme, dialog.get_title(), self.app_settings.get("theme_mode"))
        dialog.set_default_size(400, 125)
        dialog.connect("close-request", lambda x: setattr(self, 'can_delete_dialog', None))
        self.can_delete_dialog = dialog
        dialog.set_resizable(False)
        key_controller = Gtk.EventControllerKey()
        key_controller.connect("key-pressed", self.on_window_key_pressed, dialog)
        dialog.add_controller(key_controller)
        box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10, margin_top=10, margin_bottom=10, margin_start=10, margin_end=10)
        buttons_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
        
        Label = Gtk.Label()
        if count == 1:
            idx = selection.get_nth(0)
            item = selection_model.get_model().get_item(idx)
            Label.set_markup(f'<span size="large">{self.tr("Do you want to delete")} <b>{GLib.markup_escape_text(self.shorten_filename(item.filename, 30))}</b>?</span>')
        else:
            Label.set_markup(f'<span size="large">{self.tr("Do you want to delete")} <b>{count} {self.tr("items")}</b>?</span>')
            
        Label.set_hexpand(True)
        box.append(Label)

        confirm_button = Gtk.Button(label=self.tr("Confirm"))
        confirm_button.add_css_class("generic-button")
        confirm_button.set_hexpand(True)
        
        confirm_button.connect("clicked", lambda *args: self.on_confirm_delete(dialog, selection_model))

        cancel_button = Gtk.Button(label=self.tr("Cancel"))
        cancel_button.set_hexpand(True)
        cancel_button.add_css_class("btn_cancel")
        cancel_button.connect("clicked", lambda *args: self.on_cancel_responce(dialog))
        
        self.delete_files_also_check_btn = Gtk.CheckButton(label=self.tr(" Delete Associated Files?"))
        
        if files_too is not None:
            self.delete_files_also_check_btn.set_active(files_too)
        else:
            self.delete_files_also_check_btn.set_active(True)
            
        self.delete_files_also_check_btn.set_hexpand(True)
        self.delete_files_also_check_btn.set_halign(Gtk.Align.CENTER)
        self.delete_files_also_check_btn.add_css_class("check_btn")
        
        buttons_box.append(confirm_button)
        buttons_box.append(cancel_button)
        box.append(self.delete_files_also_check_btn)
        box.append(buttons_box)
        dialog.set_child(box)
        dialog.set_visible(True)
        self.apply_cursor_recursive(dialog, "pointer")
        confirm_button.grab_focus()

    def on_cancel_responce(self, dialog):
        setattr(self, 'can_delete_dialog', None)
        dialog.destroy()
        
    def on_confirm_delete(self, dialog, selection_model):
        selection = selection_model.get_selection()
        
        items_to_delete = []
        i = 0
        while i < selection.get_size():
            idx = selection.get_nth(i)
            item = selection_model.get_model().get_item(idx)
            items_to_delete.append(item)
            i += 1
            
        cursor = self.db.conn.cursor() 
        can_delete_associated_files = self.delete_files_also_check_btn.get_active()

        for item in items_to_delete:
            # for saftey!
            if not item or item.filename.strip() == "":
                continue
            if item.status == "downloading" or item.status == "Seeding":
                continue

            cursor.execute( "DELETE FROM downloads WHERE id = ?", (item.id,) )
            if can_delete_associated_files:
                if self.is_yt_dlp(item.url):
                    if item.download_playlist:
                        playlist_dir = Gio.File.new_for_path(os.path.join(item.file_directory, item.filename))
                        if self.is_safe_path(playlist_dir):
                            try:
                                playlist_dir.trash(None)
                            except:
                                shutil.rmtree(playlist_dir.get_path())
                        continue
                    ytdlp_leftovers = self.find_active_part_yt_dlp(item.filename, item.file_directory)
                    if ytdlp_leftovers and os.path.exists(ytdlp_leftovers):
                        os.remove(ytdlp_leftovers)
                        continue

            f = Gio.File.new_for_path(os.path.join(item.file_directory, item.filename))
            try:
                f.trash(None)
            except:
                try:
                    os.remove(f.get_path())
                except:
                    pass
                
            base_path = f.get_path()
            if item.url.startswith("magnet:?") or item.url.endswith(".torrent"):
                gio_meta_path = Gio.File.new_for_path(os.path.join(item.file_directory, item.filename + ".meta.json"))
                try:
                    gio_meta_path.trash(None)
                except:
                    try:
                        os.remove(gio_meta_path.get_path())
                    except:
                        pass

            if base_path:
                for x in range(15):
                    part_file = f"{base_path}-part{x}"
                    try: 
                        if os.path.exists(part_file):
                            os.remove(part_file)
                    except Exception as e:
                        print(f"Warning: failed to remove {part_file}: {e}")

            aria2_file = base_path + ".aria2"
            try:
                if os.path.exists(aria2_file):
                    os.remove(aria2_file)
            except Exception as e:
                print(f"Warning: failed to remove {aria2_file}: {e}")
                
        if i == 1:
            self.show_toast_popup(f"{self.tr("Deleted Selected File Successfully.")}", color="red_toast")
        else:
            self.show_toast_popup(f"{self.tr("Deleted Selected Files Successfully.")}", color="red_toast")
        self.db.conn.commit()
        setattr(self, 'can_delete_dialog', None) 
        GLib.idle_add(self.update_stats_labels)
        dialog.destroy()
        
    def on_global_tick(self):
        visible_category = self.stack.get_visible_child_name()
        self.check_scheduled_tasks()
        if not visible_category or visible_category not in self.view_registry:
            return True

        store, selection_model = self.view_registry[visible_category]

        self.refresh_store(store, visible_category, selection_model)
        return True

    def check_scheduled_tasks(self):
        try:
            now = time.time()
            cursor = self.db.conn.cursor()
            
            cursor.execute("""
                SELECT id, url, filename, file_size_bytes, file_directory, segments, 
                    is_audio, quality_mod, download_playlist 
                FROM downloads 
                WHERE status = 'Scheduled' AND scheduled_time > 0 AND scheduled_time <= ?
            """, (now,))
            
            due_tasks = cursor.fetchall()
            
            for task in due_tasks:
                print(f"⏰ Scheduled time reached for: {task['filename']}. Starting download...")
                
                cursor.execute("UPDATE downloads SET status = 'downloading' WHERE id = ?", (task['id'],))
                self.db.conn.commit()

                speed_limit = self.app_settings.get("global_speed_limit", "0")
                # if "__compiled__" in globals():
                #     exe_c = [self.downloader_script_path]
                # else:
                #     exe_c = [sys.executable, self.downloader_script_path]
                worker_env = os.environ.copy()
                worker_env["FLAMEGET_WORKER"] = "downloader"
                worker_env["PYINSTALLER_RESET_ENVIRONMENT"] = "1"
                
                executable_path = sys.executable 
                
                is_compiled = getattr(sys, 'frozen', False)
                args = [executable_path]
                if not is_compiled:
                    args.append(os.path.abspath(self.downloader_script_path))
                cmd = [
                    *args,
                    task['url'],
                    task['filename'],
                    str(task['file_size_bytes']),
                    task['file_directory']
                ]

                cmd.extend(["--segments", str(int(task['segments']))])
                cmd.extend(["--id", str(task['id'])])
                cmd.extend(["--speed-limit", str(speed_limit)])
                cmd.append("--in_minimize_mode")

                if task['is_audio']: cmd.append("--audio")
                if task['download_playlist']: cmd.append("--playlist")
                if task['quality_mod']: cmd.extend(["--quality", task['quality_mod']])

                subprocess.Popen(cmd, env=worker_env)
                
                self.show_toast_popup(f"{self.tr('Scheduled Start:')} {task['filename']}")
                
            if due_tasks:
                GLib.idle_add(self.update_stats_labels)

        except Exception as e:
            print(f"Error checking scheduled tasks: {e}")

    def update_stats_labels(self):
        try:
            cursor = self.db.conn.cursor()
            cursor.execute("SELECT COUNT(*) FROM downloads")
            total = cursor.fetchone()[0]

            cursor.execute("SELECT COUNT(*) FROM downloads WHERE status='downloading'")
            active = cursor.fetchone()[0]

            cursor.execute("SELECT COUNT(*) FROM downloads WHERE status='Paused'")
            paused = cursor.fetchone()[0]

            self.active_label.set_label(f"{self.tr("Active")}: {active}")
            self.paused_label.set_label(f"{self.tr("Paused")}: {paused}")
            self.total_label.set_label(f"{self.tr("Total")}: {total}")
        except Exception as e:
            print(f"Stats update error: {e}")

    def refresh_store(self, store, category_filter, selection_model):
        visible_child = self.stack.get_visible_child_name()
        if visible_child != category_filter:
            return True

        rows = self.fetch_data(category_filter)
        if self.selection_model == selection_model:
            self.update_buttons_state()

        if self.search_text:
            rows = [r for r in rows if self.search_text in r['filename'].lower()]

        cache = self.store_caches.get(category_filter)
        seen_ids = set()

        for row in rows:
            rid = row['id']
            seen_ids.add(rid)

            item = None
            if rid in cache:
                item = cache[rid]
                item.update_data(row)
            else:
                item = DownloadItem(row)
                cache[rid] = item
                store.append(item)

        if store.get_n_items() != len(seen_ids):
            for i in reversed(range(store.get_n_items())):
                item = store.get_item(i)
                if item.id not in seen_ids:
                    if item.id in cache:
                        del cache[item.id]
                    store.remove(i)
                
        return True

    def fetch_data(self, cat):
        if cat in ["Finished", "Unfinished"]:
            all_rows = self.db.get_downloads("All")
            return [r for r in all_rows if (r[4] == "Finished") == (cat == "Finished")]
        elif cat == "Torrents":
            return self.db.get_downloads("Torrent")
        elif cat == "All":
            return self.db.get_downloads("All")
        return self.db.get_downloads(cat)
                
    def _setup_label(self, factory, item):
        label = Gtk.Label()
        label.set_halign(Gtk.Align.CENTER)
        label.set_valign(Gtk.Align.CENTER)
        label.set_hexpand(True)
        item.set_child(label)
    
    def _bind_status(self, factory, item):
        download_obj = item.get_item()
        hitbox = item.get_child()
        stack = hitbox.get_first_child()
        if not download_obj: return

        self._update_status_ui(stack, download_obj)

        if hasattr(stack, "sig_id_stat") and stack.sig_id_stat:
            if download_obj.handler_is_connected(stack.sig_id_stat):
                download_obj.disconnect(stack.sig_id_stat)
        if hasattr(stack, "sig_id_prog") and stack.sig_id_prog:
            if download_obj.handler_is_connected(stack.sig_id_prog):
                download_obj.disconnect(stack.sig_id_prog)

        stack.sig_id_stat = download_obj.connect("notify::status-prop", lambda obj, pspec: self._update_status_ui(stack, obj))
        stack.sig_id_prog = download_obj.connect("notify::progress-prop", lambda obj, pspec: self._update_status_ui(stack, obj))

    def _unbind_status(self, factory, item):
        hitbox = item.get_child()
        if not hitbox: return
        stack = hitbox.get_first_child()
        
        download_obj = item.get_item()
        if stack and download_obj:
            if hasattr(stack, "sig_id_stat") and stack.sig_id_stat:
                if download_obj.handler_is_connected(stack.sig_id_stat):
                    download_obj.disconnect(stack.sig_id_stat)
                stack.sig_id_stat = None
            if hasattr(stack, "sig_id_prog") and stack.sig_id_prog:
                if download_obj.handler_is_connected(stack.sig_id_prog):
                    download_obj.disconnect(stack.sig_id_prog)
                stack.sig_id_prog = None

    def _bind_label(self, factory, item, attr, prop_name=None):
        hitbox = item.get_child()
        label = hitbox.get_first_child() 
        download_obj = item.get_item()
        if not download_obj or not label: return

        label.set_text(str(getattr(download_obj, attr)))
        
        if prop_name:
            if hasattr(label, "sig_id") and label.sig_id:
                if download_obj.handler_is_connected(label.sig_id):
                    download_obj.disconnect(label.sig_id)
            
            label.sig_id = download_obj.connect(f"notify::{prop_name}", 
                lambda obj, pspec: label.set_text(str(getattr(obj, attr))))

    def _unbind_label(self, factory, item):
        hitbox = item.get_child()
        if not hitbox: return
        label = hitbox.get_first_child()
        
        download_obj = item.get_item()
        if label and download_obj and hasattr(label, "sig_id") and label.sig_id:
            if download_obj.handler_is_connected(label.sig_id):
                download_obj.disconnect(label.sig_id)
            label.sig_id = None

    def _update_status_ui(self, stack, data):
        markup = None
        try:
            safe_progress = float(data.progress)
        except (ValueError, TypeError):
            safe_progress = 0.0

        if data.status == "Seeding":
            markup = f"<span color='#00ACC1'>{self.tr('Seeding')}</span>"
        
        elif data.status == "Verifying Checksum":
            markup = f"<span color='#00ACC1'>{self.tr('Verifying Checksum')}</span>"

        elif data.status == "Scheduled":
            markup = f"<span color='#fb8c00'>{self.tr('Scheduled')}</span>"
            
        elif data.status == "Paused":
            if data.finished_downloading:
                markup = f"<span color='#fb8c00'>{self.tr('Seeding is Paused')}</span>"
            else:
                markup = f"<span color='#fb8c00'>{self.tr('Paused at')} <b>{safe_progress:.0f}%</b></span>"
                
        elif data.status == "Stopped":
            if data.finished_downloading:
                markup = f"<span color='#4CAF50'>{self.tr('Finished')}</span>"
            else:
                markup = f"<span color='#fb8c00'>{self.tr('Stopped at')} <b>{safe_progress:.0f}%</b></span>"
                
        elif data.finished_downloading or data.status == "Finished":
            markup = f"<span color='#4CAF50'>{self.tr('Finished')}</span>"

        if markup is not None:
            stack.set_visible_child_name("label")
            lbl = stack.get_child_by_name("label")
            if lbl:
                GLib.idle_add(lbl.set_markup, markup)
        else:
            stack.set_visible_child_name("progress")
            overlay = stack.get_child_by_name("progress")
            bar = overlay.get_child()
            
            lbl = None
            child = overlay.get_first_child()
            while child:
                if child != bar and isinstance(child, Gtk.Label):
                    lbl = child
                    break
                child = child.get_next_sibling()
                
            try:
                if bar: GLib.idle_add(bar.set_fraction, safe_progress / 100.0)
                if lbl: GLib.idle_add(lbl.set_label, f"{safe_progress:.1f}%")
            except (ValueError, TypeError):
                pass
    
    def _setup_name(self, factory, item):
        box = Gtk.Box(spacing=12)
        icon = Gtk.Image(pixel_size=24)
        vbox = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        vbox.append(Gtk.Label(xalign=0, css_classes=["heading"]))
        vbox.append(Gtk.Label(xalign=0, css_classes=["caption"]))
        box.append(icon)
        box.append(vbox)
        item.set_child(box)

    def _bind_name(self, factory, item):
        data = item.get_item()
        if data:
            hitbox = item.get_child()
            box = hitbox.get_first_child()
            
            icon_widget = box.get_first_child()
            vbox = box.get_last_child()
            
            name_lbl = vbox.get_first_child()
            name_lbl.set_label(self.shorten_filename(data.filename))
            vbox.get_last_child().set_label(self.tr(data.category))
            
            icon_name = "xsi-package-x-generic-symbolic"
            
            ICON_MAP = {
                "Compressed": "xsi-package-x-generic-symbolic",
                "Programs": "xsi-executable-symbolic",
                "Videos": "xsi-folder-videos-symbolic",
                "Music": "xsi-folder-music-symbolic",
                "Pictures": "xsi-folder-pictures-symbolic",
                "Documents": "xsi-x-office-document-symbolic",
                "Torrent": "xsi-folder-templates-symbolic",
            }
            
            if data.category in ICON_MAP:
                icon_name = ICON_MAP[data.category]
            
            icon_widget.set_from_icon_name(icon_name)

            if hasattr(name_lbl, "sig_id") and name_lbl.sig_id:
                if data.handler_is_connected(name_lbl.sig_id):
                    data.disconnect(name_lbl.sig_id)
            
            name_lbl.sig_id = data.connect("notify::name-prop", lambda obj, pspec: name_lbl.set_label(self.shorten_filename(obj.filename)))
            
    def _unbind_name(self, factory, item):
        data = item.get_item()
        if data:
            hitbox = item.get_child()
            box = hitbox.get_first_child()
            vbox = box.get_last_child()
            name_lbl = vbox.get_first_child()
            
            if hasattr(name_lbl, "sig_id") and name_lbl.sig_id:
                if data.handler_is_connected(name_lbl.sig_id):
                    data.disconnect(name_lbl.sig_id)
                name_lbl.sig_id = None

    def shorten_filename(self, name: str, max_len: int = 40) -> str:
        if len(name) <= max_len: return name
        base, ext = os.path.splitext(name)
        if not ext: return name[: max_len - 1] + "…"
        keep = max_len - len(ext) - 1 
        if keep <= 0: return "…" + ext
        head = keep // 2
        tail = keep - head
        return f"{base[:head]}…{base[-tail:]}{ext}"

    def _setup_status(self, factory, item):
        stack = Gtk.Stack()
        stack.set_hexpand(True)
        stack.set_halign(Gtk.Align.FILL)
        stack.set_vexpand(True)
        lbl = Gtk.Label(xalign=0)
        lbl.set_hexpand(True)
        lbl.set_halign(Gtk.Align.CENTER)
        stack.add_named(lbl, "label")
        overlay = Gtk.Overlay()
        overlay.set_hexpand(True)
        overlay.set_halign(Gtk.Align.FILL)
        bar = Gtk.ProgressBar()
        bar.set_hexpand(True)
        bar.set_halign(Gtk.Align.FILL)
        bar.set_valign(Gtk.Align.CENTER)
        plbl = Gtk.Label()
        plbl.set_halign(Gtk.Align.CENTER)
        plbl.set_valign(Gtk.Align.CENTER)
        plbl.set_name("percent_label")
        overlay.set_child(bar)
        overlay.add_overlay(plbl)
        stack.add_named(overlay, "progress")
        item.set_child(stack)

    def sync_checkboxes(self, selection_model):
        selection = selection_model.get_selection()
        self._syncing = True
        for check in self.select_all_btn:
            idx = check._list_item.get_position()
            if idx != Gtk.INVALID_LIST_POSITION:
                check.set_active(selection.contains(idx))
        self._syncing = False

    def start_download_url(self, btn, dialog, filename, segments, torrent_indices="None", torrent_files_data="None"):
        url = self.raw_file_url
            
        if not filename:
            filename = self.get_filename(url)

        filename = self.get_unique_filename(filename)
        base, ext = os.path.splitext(filename)
        is_torrent = url.startswith("magnet:?") or url.endswith(".torrent")

        if ext == "":
            url_filename = self.get_filename(url)
            _, url_ext = os.path.splitext(url_filename)
            if not is_torrent:
                if url_ext:
                    filename = base + url_ext
            else:
                filename = base
        speed_limit = self.app_settings.get("global_speed_limit", "0")
        if is_torrent: 
            tracker_list = []
            if hasattr(self, "trackers_store") and self.trackers_store:
                n_items = self.trackers_store.get_n_items()
                for i in range(n_items):
                    item = self.trackers_store.get_item(i)
                    if item and item.url:
                        tracker_list.append(item.url)
            
            trackers_arg = ",".join(tracker_list)
        try:
            print(self.download_folder)
            # if "__compiled__" in globals():
            #     exe_c = [self.downloader_script_path]
            # else:
            #     exe_c = [sys.executable, self.downloader_script_path]
            worker_env = os.environ.copy()
            worker_env["FLAMEGET_WORKER"] = "downloader"
            worker_env["PYINSTALLER_RESET_ENVIRONMENT"] = "1"
            
            executable_path = sys.executable 
            
            is_compiled = getattr(sys, 'frozen', False)
            args = [executable_path]
            if not is_compiled:
                args.append(os.path.abspath(self.downloader_script_path))
            cmd = [
                *args,
                url,
                filename,
                "0",
                self.download_folder
            ]

            cmd.extend(["--segments", str(int(segments))])
            cmd.extend(["--id", "-1"])
            cmd.extend(["--speed-limit", str(speed_limit)])

            if is_torrent: 
                if torrent_indices:
                    cmd.extend(["--torrent-indices", str(torrent_indices)])
                if torrent_files_data:
                    cmd.extend(["--torrent-data", json.dumps(torrent_files_data)])
                if trackers_arg:
                    cmd.extend(["--trackers", trackers_arg])
                    
            subprocess.Popen(cmd, env=worker_env)
            if dialog: 
                self.add_url_dialog = None
                dialog.destroy()
        except:
            print("Starting failed")

    def start_yt_dlp_download_url(self, dialog, ext, is_audio, quality_mod, download_playlist):
        print("test /////////////////////////////////////////////////")
        segments = self.spin_seg.get_value_as_int()
        speed_limit = self.app_settings.get("global_speed_limit", "0")
        custom_name = self.yt_entry_name.get_text().strip()
        try:
            # if "__compiled__" in globals():
            #     exe_c = [self.browser_context_menu_handler_script_path]
            # else:
            #     exe_c = [sys.executable, self.browser_context_menu_handler_script_path]

            worker_env = os.environ.copy()
            worker_env["PYINSTALLER_RESET_ENVIRONMENT"] = "1"
            worker_env["FLAMEGET_WORKER"] = "browser"
            
            executable_path = sys.executable 
            
            is_compiled = getattr(sys, 'frozen', False)
            args = [executable_path]
            if not is_compiled:
                args.append(os.path.abspath(self.browser_context_menu_handler_script_path))
            cmd = [
                *args,
                self.raw_file_url,
            ]
            cmd.extend(["--filename", custom_name])
            cmd.extend(["--directory", self.download_folder])
            cmd.extend(["--ext", ext])
            cmd.extend(["--segments", str(int(segments))])
            cmd.extend(["--id", "-1"])
            cmd.extend(["--speed-limit", str(speed_limit)])

            if is_audio:
                cmd.append("--audio")
            if download_playlist:
                cmd.append("--playlist")
            if quality_mod:
                cmd.extend(["--quality", quality_mod])

            print(cmd)
            subprocess.Popen(cmd, env=worker_env)
            GLib.idle_add(dialog.destroy)
        except Exception as e:
            print(f"Starting failed {e}")

    def update_schedule_label(self, *args):
        if not self.expander_schedule.get_expanded():
            self.lbl_schedule_info.set_text(self.tr("Download will start immediately."))
            return

        try:
            ts = self.get_schedule_timestamp()
            now = time.time()
            
            if ts <= now:
                self.lbl_schedule_info.set_text(self.tr("Time is in the past. Will start immediately."))
            else:
                diff = ts - now
                mins = int(diff / 60)
                hours = int(mins / 60)
                mins = mins % 60
                
                readable_date = time.strftime("%a, %d %b %H:%M", time.localtime(ts))
                self.lbl_schedule_info.set_text(f"{self.tr('Starts on:')} {readable_date} ({self.tr("in")} {hours}{self.tr("h")} {mins}{self.tr("m")})")
        except:
            self.lbl_schedule_info.set_text(self.tr("Invalid Date"))

    def get_schedule_timestamp(self):
        """Constructs unix timestamp from the spinners"""
        day = self.spin_day.get_value_as_int()
        month = self.spin_month.get_value_as_int()
        year = self.spin_year.get_value_as_int()
        hour = self.spin_hour.get_value_as_int()
        minute = self.spin_min.get_value_as_int()
        
        return time.mktime((year, month, day, hour, minute, 0, 0, 0, -1))

    def on_queue_clicked(self, btn, directory, dialogue):
        scheduled_time = 0
        
        if self.expander_schedule.get_expanded():
            try:
                target_ts = self.get_schedule_timestamp()
                if target_ts > time.time():
                    scheduled_time = target_ts
            except:
                pass

        mode = self.dialog_stack.get_visible_child_name()
        
        is_audio = False
        quality_mod = "Best Available"
        download_playlist = False
        ext = None

        if mode == "youtube":
            is_audio = (self.dd_mode.get_selected() == 1)
            quality = self.dd_quality.get_model().get_string(self.dd_quality.get_selected())
            quality_mod = quality if quality.strip() != "" else "Best Available"
            download_playlist = self.check_playlist.get_active()
            ext = "."+self.dd_fmt.get_model().get_string(self.dd_fmt.get_selected())
            
        self.process_queue_entry(btn, directory, dialogue, ext, is_audio, quality_mod, download_playlist, scheduled_time)

    def process_queue_entry(self, btn, directory, dialogue, ext, is_audio, quality_mod, download_playlist, scheduled_time=0):
        if self.raw_file_url.strip() == "":
            return
        cursor = self.db.conn.cursor()
        segments = self.spin_seg.get_value()

        filename = self.entry_name.get_text().strip()
        is_torrent = self.raw_file_url.startswith("magnet:?") or self.raw_file_url.endswith(".torrent")
        support, file_size_bytes, fetched_name = self.fetch_head_info(self.raw_file_url, ext, is_audio, quality_mod, download_playlist)
        size_str = "UNKNOWN" if not support else addOn.parse_size(file_size_bytes)
        
        if not fetched_name and is_torrent:
            try:
                qs = parse_qs(urlparse(self.raw_file_url).query)
                if 'dn' in qs:
                    filename = qs['dn'][0]
            except:
                pass
        else:
            filename = fetched_name

        selected_indices = []
        def collect_indices(store):
            if not store: return
            for i in range(store.get_n_items()):
                node = store.get_item(i)
                if node.is_dir:
                    collect_indices(node.children_store)
                else:
                    if node.checked_prop:
                        selected_indices.append(str(node.index))
        
        if hasattr(self, 'root_node_store') and is_torrent:
            collect_indices(self.root_node_store)
            
        indexes_string = ",".join(selected_indices)
        filename = self.get_unique_filename(filename)
        meta_path = os.path.join(directory.get_text(), filename + ".meta.json")
        
        if hasattr(self, 'torrent_files_data') and self.torrent_files_data:
            data = {
                "files": self.torrent_files_data,
                "indices": indexes_string
            }
            try:
                with open(meta_path, 'w') as f:
                    json.dump(data, f)
            except Exception as e:
                print("Failed to save meta json for queue:", e)

        print("fetched_name", fetched_name)
        
        if not filename or filename == "index.html":
            filename = fetched_name or "download.dat"
            
        filename = self.get_unique_filename(filename)
        base = filename.split('.')[0]
        if ext != None and not download_playlist:
            filename = base + ext
        elif download_playlist:
            filename = base
            
        cat = self.categorize_filename(filename, is_torrent)
        directory_folder = directory.get_text()
        
        date_added = time.time()
        
        initial_status = "Paused"
        if scheduled_time > 0:
            initial_status = "Scheduled"
        
        cursor.execute("""
            INSERT INTO downloads
            (filename, size, status, progress, speed, time_left, date_added, category, file_directory, url, pid, file_size_bytes, segments, is_audio, quality_mod, download_playlist, scheduled_time)
            VALUES (?, ?, ?, 0, '--', '--', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        """, (filename, size_str, initial_status, date_added, cat, directory_folder, self.raw_file_url, -1, file_size_bytes, segments, is_audio, quality_mod, download_playlist, scheduled_time))

        self.db.conn.commit()
        self.add_url_dialog = None
        dialogue.destroy()

    def send_command(self, cmd, target_socket=None):
        # ONLY FOR WINDOWS
        try:
            if target_socket:
                if os.path.exists(target_socket):
                    try:
                        with open(target_socket, 'r') as f:
                            target_port = int(f.read().strip())
                    except ValueError:
                        print(f"Error: Invalid port data in {target_socket}")
                        return
                else:
                    print(f"Target socket file missing: {target_socket}")
                    return

            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                s.connect(('127.0.0.1', target_port))
                s.sendall(cmd.encode('utf-8'))
                    
        except (ConnectionRefusedError, FileNotFoundError):
            print(f"Target not running? ({target_socket})")
        except OSError as e:
            print(f"Socket error while sending command: {e}")

    def resume_download(self, btn, selection_model, in_minimize_mode=False):
        selection = selection_model.get_selection()
        if selection.is_empty(): return
        items_to_resume = []
        for i in range(selection.get_size()):
            idx = selection.get_nth(i)
            item = selection_model.get_model().get_item(idx)
            items_to_resume.append(item)
        
        speed_limit = self.app_settings.get("global_speed_limit", "0")
        is_torrent = False
        for item in items_to_resume:
            if not item or item.filename.strip() == "":
                continue
            if item.finished_downloading and item.category != "Torrent":
                continue
            elif item.category == "Torrent":
                is_torrent = True
            pid = int(item.pid)
            if HAS_SIGUSR1 and item.status == "Paused" and pid > 0:
                try:
                    os.kill(pid, signal.SIGUSR1)
                    print("Resumed existing process!")
                    continue 
                except OSError:
                    pass
            try:
                worker_env = os.environ.copy()
                worker_env["FLAMEGET_WORKER"] = "downloader"
                worker_env["PYINSTALLER_RESET_ENVIRONMENT"] = "1"
                executable_path = sys.executable 
                
                is_compiled = getattr(sys, 'frozen', False)
                args = [executable_path]
                if not is_compiled:
                    args.append(os.path.abspath(self.downloader_script_path))
                cmd = [
                    *args,
                    item.url,
                    item.filename,
                    str(item.file_size_bytes),
                    item.file_directory
                ]

                cmd.extend(["--segments", str(int(item.segments))])
                cmd.extend(["--id", str(item.id)])
                cmd.extend(["--speed-limit", str(speed_limit)])

                if in_minimize_mode:
                    cmd.append("--in_minimize_mode")
                if item.is_audio:
                    cmd.append("--audio")
                if item.download_playlist:
                    cmd.append("--playlist")
                if item.quality_mod:
                    cmd.extend(["--quality", item.quality_mod])

                popup_text = self.tr("Resuming Download:")
                if is_torrent: 
                    popup_text = self.tr("Seeding the Torrent File in The Backgound:")
                    cmd.append("--in_minimize_mode")

                subprocess.Popen(cmd, env=worker_env)
                self.show_toast_popup(f"{popup_text} {item.filename}")
            except Exception as e:
                print(f"Resume failed for {item.id}: {e}")

        GLib.idle_add(self.update_stats_labels)

    def stop_download(self, btn, selection_model, kill=False):
        selection = selection_model.get_selection()
        if selection.is_empty():
            return

        items_to_process = []
        model = selection_model.get_model()
        for i in range(selection.get_size()):
            idx = selection.get_nth(i)
            item = model.get_item(idx)
            if item: 
                items_to_process.append(item)

        for item in items_to_process:
            if item.finished_downloading and item.category != "Torrent":
                continue

            try:
                pid = int(item.pid)
            except (ValueError, TypeError):
                continue

            if pid <= 0 or not addOn.is_pid_alive(pid):
                continue

            try:
                downloader_sock = os.path.join(addOn.UNITS.RUNTIME_DIR, f"flameget_dl_{pid}.sock")
                if kill:
                    print(f"Stopping PID {pid} for {item.filename}")
                    if os.name == 'nt':
                        self.send_command("stop", target_socket=downloader_sock)
                    else:
                        os.kill(pid, signal.SIGTERM)
                        
                else:
                    if item.status != "Paused":
                        print(f"Pausing PID {pid} for {item.filename}")
                        if os.name == 'nt':
                            if HAS_SIGUSR1:
                                self.send_command("pause", target_socket=downloader_sock)
                            else: 
                                self.send_command("stop", target_socket=downloader_sock)
                        else:
                            if HAS_SIGUSR1:
                                print(f"Pausing (SIGUSR1) PID {pid} for {item.filename}")
                                os.kill(pid, signal.SIGUSR1)
                            else:
                                os.kill(pid, signal.SIGTERM) 
                        
            except ProcessLookupError:
                pass
            except Exception as e:
                print(f"Failed to signal PID {pid}: {e}")
        
        GLib.idle_add(self.update_stats_labels)

    def show_toast_popup(self, message, duration=3000, color="green_toast"):
        if not self.app_settings.get("enable_toasts"):
            return

        if self.current_toast:
            try:
                self.current_toast.unparent()
            except Exception:
                pass
            self.current_toast = None

        t_box = toast.ToastBox(message, duration, color)
        
        self.overlay.add_overlay(t_box)
        self.current_toast = t_box

    def on_sort_changed(self, sorter, change, column_view):
        if self.is_programmatic_sort:
            return

        main_sorter = column_view.get_sorter()
        
        if not hasattr(main_sorter, "get_primary_sort_column"):
            print("Warning: Saving sort state requires GTK 4.10+")
            return

        col = main_sorter.get_primary_sort_column()
        if not col:
            return

        order = main_sorter.get_primary_sort_order()
        
        direction_int = 0 if order == Gtk.SortType.ASCENDING else 1
        title = col.get_title()

        print(f"Saving Sort: {title} ({'Desc' if direction_int == 1 else 'Asc'})")
        
        self.app_settings["sort_column"] = title
        self.app_settings["sort_direction"] = direction_int
        SaveManager.save_settings(self.app_settings)

    def get_filename(self, url):
        print(f"got url : {url}")
        fallback = "index.html"
        if url.startswith("magnet:?") or url.endswith(".torrent"):
            fallback = "torrent_folder"
            
        from urllib.parse import urlparse, unquote
        path = unquote(os.path.basename(urlparse(url).path)) or fallback
        print(path)
        os.path.basename(path)
        return path

    def get_unique_filename(self, original_name):
        base, ext = os.path.splitext(original_name)
        candidate = original_name
        counter = 1

        while self.filename_exists(candidate):
            candidate = f"{base}({counter}){ext}"
            counter += 1

        return candidate

    def filename_exists(self, filename):
        cursor = self.db.conn.cursor()
        cursor.execute("SELECT 1 FROM downloads WHERE status = 'Finished' AND filename = ?", (filename,))
        return cursor.fetchone() is not None

    def on_url_entry_changed(self, entry):
        raw_input = entry.get_text().strip()
        self.raw_file_url = raw_input

    def fetch_head_info(self, url, ext=None, is_audio_mode=None, quality_mod=None, download_playlist=False):
        if download_playlist:
            return True, 0, "Playlist"

        supports = False
        file_size = 0
        filename = ""
        start = time.time()
        if self.is_yt_dlp(url):
            url = self.normalize_youtube_url(url)

            ydl_opts = {
                'quiet': True,
                'no_warnings': True,
                'noplaylist': True,
                'skip_download': True,
                'socket_timeout': 10,
                'outtmpl': f'%(title)s{ext}',
            }
            if is_audio_mode:
                ydl_opts['format'] = "bestaudio/best"
            else:
                if quality_mod == "Best Available":
                    ydl_opts['format'] = "bestvideo+bestaudio/best"
                else:
                    resolution_map = {"4K": 2160, "1080p": 1080, "720p": 720, "480p": 480}
                    target_height = resolution_map.get(quality_mod, quality_mod)
                    ydl_opts['format'] = f"bestvideo[height<={target_height}]+bestaudio/best[height<={target_height}]"

            try:
                with yt_dlp.YoutubeDL(ydl_opts) as ydl:
                    info = ydl.extract_info(url, download=False)
                    
                    filename = ydl.prepare_filename(info)
                    
                    file_size = info.get('filesize') or info.get('filesize_approx') or 0
                    
                    print(f"Found: {filename} | Size: {file_size}")
                    return True, file_size, filename

            except Exception as e:
                print(f"Quick Info Check Error: {e}")
                return False, 0, ""
        else:
            if self.download_engine == "aria2":
                timeout = 10
                save_path_template = os.path.join(addOn.UNITS.RUNTIME_DIR, "temp_torrent")
                os.makedirs(save_path_template, exist_ok=True)
                cmd =  [
                    addOn.FireFiles.aria2c_path,
                    f"-x{self.app_settings.get("default_segments")}",
                    f"-s{self.app_settings.get("default_segments")}",
                    "--file-allocation=none",
                    "--connect-timeout=5",
                    "--timeout=5",
                    "--max-tries=2",
                    "--auto-save-interval=0",
                    "--summary-interval=1",
                    "-d", save_path_template,
                    url
                ]
                proc = subprocess.Popen(
                    cmd,
                    stdout=subprocess.PIPE,
                    stderr=subprocess.DEVNULL,
                    text=True,
                    **({"creationflags": subprocess.CREATE_NO_WINDOW} if os.name == "nt" else {})
                )
                try:
                    while time.time() - start < timeout:
                        line = proc.stdout.readline()
                        if not line.strip():
                            continue

                        low = line.lower()

                        if "cn:" in low and "cn:1" not in low:
                            supports = True

                        m = addOn.UNITS.SIZE_RE.search(line)
                        if m:
                            val, unit = m.groups()
                            file_size = addOn.range_parse_size(val, unit)

                        is_actively_downloading = "dl:" in low and "0b/0b" not in low
                        if (supports and file_size > 0) or is_actively_downloading:
                            break

                except:
                    return False, 0, ""

                finally:
                    proc.terminate()
                    try:
                        proc.wait(timeout=1)
                    except subprocess.TimeoutExpired:
                        proc.kill()
                
                if os.path.exists(save_path_template):
                    for f in os.listdir(save_path_template):
                        print(f)
                        if f.endswith(".aria2"):
                            filename = f.replace(".aria2", "")
                            break
                
                if self.is_safe_path(save_path_template):
                    shutil.rmtree(save_path_template, ignore_errors=True)

                return supports, file_size, filename
            else:
                try:
                    headers = {
                        "Accept-Encoding": "identity",
                        "Accept": "*/*"
                    }
                    
                    if self.user_agent:
                        headers["User-Agent"] = self.user_agent
                    else:
                        headers["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
                        
                    if self.cookies: headers["Cookie"] = self.cookies.replace('\n', '').replace('\r', '').strip()
                    if self.referer: headers["Referer"] = self.referer

                    response = requests.head(url, headers=headers, allow_redirects=True, timeout=10)
                    
                    if response.status_code not in (200, 206) or 'Content-Length' not in response.headers:
                        response = requests.get(url, headers=headers, stream=True, allow_redirects=True, timeout=10)

                    file_size = int(response.headers.get('Content-Length', 0))
                    supports = response.headers.get('Accept-Ranges') == 'bytes' or file_size > 0

                    cd = response.headers.get('Content-Disposition')
                    if cd and 'filename=' in cd:
                        m = re.search(r'filename=["\']?([^"\';]+)["\']?', cd)
                        if m: filename = m.group(1)
                    else:
                        from urllib.parse import urlparse
                        parsed = urlparse(response.url)
                        name = os.path.basename(parsed.path)
                        if name: filename = name

                    return supports, file_size, filename

                except Exception as e:
                    print(f"Error getting precise file info: {e}")
                    return False, 0, filename

    def on_window_key_pressed(self, controller, keyval, keycode, state, dialog=None):
        """Global keyboard shortcut handler using customized keys."""
        
        valid_mods = Gdk.ModifierType.CONTROL_MASK | Gdk.ModifierType.SHIFT_MASK | Gdk.ModifierType.ALT_MASK | Gdk.ModifierType.SUPER_MASK
        clean_state = state & valid_mods

        def is_match(action_name):
            sc = self.app_settings["shortcuts"].get(action_name)
            if not sc: return False
            saved_key, saved_mod = sc
            return keyval == saved_key and clean_state == saved_mod

        if is_match("delete") and self.can_delete_dialog == None:
            if self.selection_model and not self.selection_model.get_selection().is_empty():
                self.delete_selected_items(None, self.selection_model)
                return True

        elif is_match("select_all"):
            if self.selection_model:
                self.on_toolbar_select_all(None, self.selection_model)
                return True

        elif is_match("new_download") and self.add_url_dialog == None:
            self.add_url_button(None)
            return True

        elif is_match("open_file"):
            self.ctx_open_file()
            return True

        elif is_match("quit"):
            if self.server_process:
                print("Stopping Browser Integration Server...")
                try:
                    self.server_process.terminate()
                    self.server_process.wait(timeout=2)
                except Exception as e:
                    print(f"Error killing server: {e}")
                    try: self.server_process.kill()
                    except: pass
                
            GLib.idle_add(self.emergency_cleanup, None, None)
            return True
            
        elif is_match("close_window"):
            if dialog:
                if self.add_url_dialog == dialog:
                    self.add_url_dialog = None
                elif self.can_delete_dialog == dialog:
                    self.can_delete_dialog = None
                GLib.idle_add(dialog.destroy)
            else:
                self.window.close()
            return True

        return False

    def toggle_autostart(self, enable):
        """Creates or removes the XDG autostart entry for FlameGet."""
        if os.name == 'nt':
            import winreg
            try:
                reg_path = r"Software\Microsoft\Windows\CurrentVersion\Run"
                app_name = "FlameGet"

                if getattr(sys, "frozen", False):
                    exec_cmd = f'"{sys.executable}"'
                else:
                    script_path = os.path.abspath(sys.argv[0])
                    exec_cmd = f'"{sys.executable}" "{script_path}"'

                exec_cmd += " --start-minimized"

                with winreg.OpenKey(
                    winreg.HKEY_CURRENT_USER,
                    reg_path,
                    0,
                    winreg.KEY_SET_VALUE
                ) as key:

                    if enable:
                        winreg.SetValueEx(key, app_name, 0, winreg.REG_SZ, exec_cmd)
                        print("Autostart enabled (Windows).")
                    else:
                        try:
                            winreg.DeleteValue(key, app_name)
                            print("Autostart disabled (Windows).")
                        except FileNotFoundError:
                            pass
            except Exception as e:
                print(f"Windows autostart failed: {e}")
            return
        autostart_dir = os.path.join(GLib.get_user_config_dir(), "autostart")
        desktop_file = os.path.join(autostart_dir, "flameget.desktop")

        if self.is_flatpak_env:
            try:
                action_word = "enable" if enable else "disable"
                
                print(f"Requesting to {action_word} Flatpak Autostart...")
                
                bus = Gio.bus_get_sync(Gio.BusType.SESSION, None)

                options = {
                    'autostart': GLib.Variant('b', enable), 
                    'background': GLib.Variant('b', True) 
                }
                options_variant = GLib.Variant('a{sv}', options)

                parent_window = GLib.Variant('s', "")
                params = GLib.Variant.new_tuple(parent_window, options_variant)

                bus.call_sync(
                    "org.freedesktop.portal.Desktop",
                    "/org/freedesktop/portal/desktop",
                    "org.freedesktop.portal.Background",
                    "RequestBackground",
                    params,
                    None,
                    Gio.DBusCallFlags.NONE,
                    -1,
                    None
                )
                print(f"Portal request to {action_word} autostart sent successfully.")
                
            except Exception as e:
                print(f"Failed to {action_word} autostart portal via Gio: {e}")
        else:
            if enable:
                os.makedirs(autostart_dir, exist_ok=True)
                if getattr(sys, 'frozen', False):
                    exec_cmd = f"{sys.executable}"
                else:
                    script_path = os.path.abspath(sys.argv[0])
                    exec_cmd = f"{sys.executable} {script_path}"
                
                exec_cmd += " --start-minimized"
                content = f"""
                    [Desktop Entry]
                    Type=Application
                    Name=FlameGet
                    Comment=FlameGet Download Manager
                    Exec={exec_cmd}
                    Icon=flameget
                    Terminal=false
                    Categories=Network;FileTransfer;
                    StartupNotify=false
                """
                try:
                    with open(desktop_file, "w") as f:
                        f.write(content)
                    print(f"Autostart enabled: {desktop_file}")
                except Exception as e:
                    print(f"Failed to enable autostart: {e}")
            else:
                if os.path.exists(desktop_file):
                    try:
                        os.remove(desktop_file)
                        print("Autostart disabled.")
                    except Exception as e:
                        print(f"Failed to disable autostart: {e}")

    def on_folder_entry_changed(self, entry):
        path = entry.get_text().strip()
        entry.remove_css_class("error")
        if not hasattr(self, "btn_download") and not hasattr(self, "btn_queue"):
            return
        if not path:
            return

        try:
            full_path = os.path.expanduser(path)
            if os.path.isdir(full_path):
                self.download_folder = full_path
                GLib.idle_add(self.btn_download.set_sensitive, True)
                GLib.idle_add(self.btn_queue.set_sensitive, True)
            elif os.path.isdir(os.path.dirname(full_path)):
                entry.set_tooltip_text(self.tr("Directory does not exist. It will be created."))
                self.download_folder = full_path
                GLib.idle_add(self.btn_download.set_sensitive, True)
                GLib.idle_add(self.btn_queue.set_sensitive, True)
            else:
                entry.add_css_class("error")
                self.status_label.set_text(self.tr("Invalid path or parent directory missing."))
                self.status_label.set_name("red-text")
                GLib.idle_add(self.btn_download.set_sensitive, True)
                GLib.idle_add(self.btn_queue.set_sensitive, True)
                
        except Exception as e:
            entry.add_css_class("error")
            GLib.idle_add(self.btn_download.set_sensitive, False)
            GLib.idle_add(self.btn_queue.set_sensitive, False)
            entry.set_tooltip_text(f"{self.tr('Invalid path')}: {str(e)}")

    def is_yt_dlp(self, url): 
        found = False
        clean_url = url.lower()
        if any(site in clean_url for site in addOn.UNITS.SUPPORTED_SITES):
            found = True
        return found

    def normalize_youtube_url(self, url):
        try:
            if "v=" in url:
                return "https://www.youtube.com/watch?v=" + url.split("v=")[1].split("&")[0]
            elif "youtu.be" in url:
                return url
        except IndexError:
            pass
        return url

    def start_server(self):
        threading.Thread(target=server_main, daemon=True).start()
        self.server_running = True
        thread = threading.Thread(target=self._server_loop, daemon=True)
        thread.start()

    def _server_loop(self):
        try:
            if os.name != 'nt':
                if os.path.exists(SOCKET_PATH):
                    os.unlink(SOCKET_PATH)
                self.server_socket = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
                self.server_socket.bind(SOCKET_PATH)
            else:
                self.server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                self.server_socket.bind(('127.0.0.1', WINDOWS_PORT))

            self.server_socket.listen(1)

            while self.server_running:
                try:
                    conn, _ = self.server_socket.accept()
                    with conn:
                        data = conn.recv(4096)
                        if not data:
                            break
                        
                        cmd = data.decode().strip()

                        if cmd.startswith("open_url:"):
                            url = cmd.split("open_url:", 1)[1]
                            GLib.idle_add(self.handle_external_url, url)
                            
                        elif cmd.startswith("toast:"):
                            msg = cmd.split("toast:", 1)[1]
                            GLib.idle_add(self.show_toast_popup, msg, 4000, "green_toast")
                            
                        elif cmd.startswith("error_toast:"):
                            msg = cmd.split("error_toast:", 1)[1]
                            GLib.idle_add(self.show_toast_popup, msg, 6000, "red_toast")
                        
                        elif cmd == "toggle":
                            GLib.idle_add(self.toggle_window)
                        elif cmd == "update_footer":
                            GLib.idle_add(self.update_stats_labels)
                        elif cmd == "quit":
                            GLib.idle_add(self.emergency_cleanup, None, None)
                except OSError:
                    break
        finally:
            if os.name != 'nt':
                try:
                    os.unlink(SOCKET_PATH)
                except FileNotFoundError:
                    pass

    def check_and_install_ffmpeg(self, parent_window, install_dir):
        if os.path.exists(addOn.FireFiles.ffmpeg_path):
            return True 

        dialog = Gtk.Window(
            transient_for=parent_window,
            modal=True,
            title="Missing FFmpeg Component !",
            resizable=False,
            default_width=400
        )
        GLib.idle_add(addOn.set_titlebar_theme, dialog.get_title(), self.app_settings.get("theme_mode"))

        dialog.add_css_class("dialog")

        content_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=12)
        content_box.set_margin_top(18)
        content_box.set_margin_bottom(18)
        content_box.set_margin_start(25)
        content_box.set_margin_end(25)
        dialog.set_child(content_box)

        desc_label = Gtk.Label(
            label="FlameGet needs FFmpeg to merge high-quality video and audio tracks.\nWould you like to download and install it automatically (~30MB)?",
            wrap=True,
            xalign=0
        )
        content_box.append(desc_label)

        progress_bar = Gtk.ProgressBar()
        progress_bar.set_fraction(0.0)
        progress_bar.set_visible(False)
        progress_label = Gtk.Label(label="Downloading...")
        progress_label.set_visible(False)
        content_box.append(progress_bar)
        content_box.append(progress_label)

        button_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
        button_box.set_halign(Gtk.Align.FILL)
        button_box.set_margin_top(12)
        button_box.set_hexpand(True)
        content_box.append(button_box)

        cancel_btn = Gtk.Button(label="Cancel")
        install_btn = Gtk.Button(label="Download & Install")
        cancel_btn.set_hexpand(True)
        install_btn.set_hexpand(True)
        
        cancel_btn.add_css_class("btn_cancel")
        install_btn.add_css_class("green-btn")

        button_box.append(cancel_btn)
        button_box.append(install_btn)

        def on_install_clicked(btn):
            progress_bar.set_visible(True)
            cancel_btn.set_visible(False)
            install_btn.set_visible(False)
            progress_label.set_visible(True)
            threading.Thread(
                target=self.download_ffmpeg, 
                args=(dialog, install_dir, progress_bar),
                daemon=True
            ).start()

        def on_cancel_clicked(btn):
            dialog.destroy()
            self.show_toast_popup(f"{self.tr("FFmpeg is required, Please install it!")}", color="red_toast")

        install_btn.connect("clicked", on_install_clicked)
        cancel_btn.connect("clicked", on_cancel_clicked)

        dialog.present()

        if os.name == 'nt':
            GLib.timeout_add(50, addOn.force_center_dialog, "Missing FFmpeg Component !", self.app_name)
            
        return False
    
    def update_ffmpeg_progress(self, progress_bar, fraction):
        """Safely updates the GTK progress bar from the main thread"""
        progress_bar.set_fraction(fraction)
        progress_bar.set_text(f"{int(fraction * 100)}%")
        return False

    def download_ffmpeg(self, dialog, install_dir, progress_bar):
        import urllib.request
        import zipfile
        import io
        
        url = "https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip"
        
        try:
            req = urllib.request.urlopen(url)
            
            total_size = int(req.headers.get('content-length', 0))
            downloaded = 0
            chunk_size = 8192
            
            zip_buffer = io.BytesIO()
            
            while True:
                chunk = req.read(chunk_size)
                if not chunk:
                    break
                    
                zip_buffer.write(chunk)
                downloaded += len(chunk)
                
                if total_size > 0:
                    fraction = downloaded / total_size
                    GLib.idle_add(self.update_ffmpeg_progress, progress_bar, fraction)
            
            zip_buffer.seek(0)
            
            with zipfile.ZipFile(zip_buffer) as z:
                for file_info in z.infolist():
                    if file_info.filename.endswith("ffmpeg.exe") or file_info.filename.endswith("ffprobe.exe"):
                        file_info.filename = os.path.basename(file_info.filename)
                        z.extract(file_info, addOn.FireFiles.binaries_path)
            
            GLib.idle_add(self.on_download_success, dialog)
            
        except Exception as e:
            GLib.idle_add(self.on_download_error, dialog, str(e))

    def on_download_success(self, dialog):
        dialog.destroy()
        self.show_toast_popup(f"{self.tr("FFmpeg installed successfully!")}")
        return False

    def on_download_error(self, dialog, error_msg):
        dialog.destroy()
        self.show_toast_popup(f"{self.tr("FFmpeg is required, Please install it!")}", color="red_toast")
        return False

    def start_tray_subprocess(self):
        if self.is_flatpak_env:
            # soon....
            return

        if getattr(sys, 'frozen', False):
            self.tray_process = subprocess.Popen([self.tray_script_path], **({"creationflags": subprocess.CREATE_NO_WINDOW} if os.name == "nt" else {}))
        else:
            self.tray_process = subprocess.Popen([sys.executable, self.tray_script_path])

    def handle_external_url(self, url):
        print(f"Received external URL: {url}")
        if self.add_url_dialog is None:
            self.add_url_button(None)
        
        self.entry_url.set_text(url)
        
        self.on_url_input_changed(self.entry_url)

    def toggle_window(self, *args):
        if self.window.is_visible():
            self.window.set_visible(False)
        else:
            self.window.set_visible(True)

    def on_window_close_request(self, win):
        """Override the close button to minimize to tray."""
        if self.tray_process and self.tray_process.poll() is None:
            self.window.set_visible(False)
            return True
        return False
    
    
    def is_safe_path(self, path_obj):
        try:
            if not path_obj:
                return False

            path = path_obj.get_path() if hasattr(path_obj, "get_path") else path_obj

            if not path:
                return False

            path = path.strip()
            
            unsafe_paths = {
                "/", 
                os.path.expanduser("~")
            }

            return path not in unsafe_paths and os.path.isdir(path)

        except Exception:
            return False

    def get_windowing_system(self):
        session_type = os.environ.get('XDG_SESSION_TYPE', 'Unknown')
        return session_type

    def extract_magnet(self, text):
        pattern = r"magnet:\?xt=urn:btih:[a-zA-Z0-9]+[^\s]*"
        
        match = re.search(pattern, text)
        if match:
            return match.group(0)
        return None

    def set_cursor_for_widget(self, widget, cursor_name="pointer"):
        cursor = Gdk.Cursor.new_from_name(cursor_name)
        widget.set_cursor(cursor)

    def apply_cursor_recursive(self, widget, cursor_name="pointer"):
        if isinstance(widget, (Gtk.Button, Gtk.CheckButton, Gtk.MenuButton, Gtk.DropDown)):
            self.set_cursor_for_widget(widget, cursor_name)

        child = widget.get_first_child()
        while child:
            self.apply_cursor_recursive(child, cursor_name)
            child = child.get_next_sibling()

    #i'm scared okay!
    def is_safe_command(self, command):
        if not command or not command.strip(): 
            return True
            
        cmd_lower = command.lower().strip()

        forbidden_triggers = [
            "rm -rf /",
            "rm -rf ~",
            "rm -rf $home",
            "mkfs",
            ":(){:|:&};:",
            "> /dev/sd",
            "dd if="
        ]
        
        for bad in forbidden_triggers:
            if bad in cmd_lower:
                print(f"Blocked potentially catastrophic command: {bad}")
                return False
                
        return True

    def setup_signal_handlers(self):
        """Registers system signal handlers for clean shutdown."""
        signal.signal(signal.SIGINT, self.emergency_cleanup)
        signal.signal(signal.SIGTERM, self.emergency_cleanup)

    def emergency_cleanup(self, signum, frame):
        if self.tray_process: self.stop_tray_subprocess()

        if self.server_process:
            print(" - Stopping Server Process...")
            try:
                self.server_process.terminate()
                self.server_process.wait(timeout=1)
            except Exception as e:
                print(f"   Error killing server: {e}")
                try: self.server_process.kill() 
                except: pass

        try:
            cursor = self.db.conn.cursor()
            cursor.execute("SELECT id, filename, pid FROM downloads WHERE status IN ('downloading', 'Seeding', 'Paused')")
            active_tasks = cursor.fetchall()

            for row in active_tasks:
                pid = row['pid']
                filename = row['filename']
                
                if pid and pid > 0:
                    if addOn.is_pid_alive(pid):
                        print(f" - Killing PID {pid} ({filename})...")
                        os.kill(pid, signal.SIGTERM)
            
            print(" - Updating Database Statuses...")
            cursor.execute("""
                UPDATE downloads 
                SET status = 'Stopped' 
                WHERE status = 'downloading' OR status = 'Paused'
            """)
            
            cursor.execute("""
                UPDATE downloads 
                SET status = 'Finished' 
                WHERE status = 'Seeding'
            """)
            
            self.db.conn.commit()

        except Exception as e:
            print(f"Error during DB cleanup: {e}")

        if os.path.exists(SOCKET_PATH):
            try:
                os.unlink(SOCKET_PATH)
                print(" - Socket file removed.")
            except: pass

        print("Cleanup Complete. Exiting.")
        sys.exit(0)

    def stop_tray_subprocess(self):
        TRAY_SOCKET_PATH = os.path.join(addOn.UNITS.RUNTIME_DIR, "flameget_tray_listener.sock")
        try:
            if os.name == 'nt':
                with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as client:
                    client.connect(('127.0.0.1', WINDOWS_TRAY_PORT))
                    client.sendall("kill_tray".encode())
                    self.tray_process = None
            else:
                with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as client:
                    client.connect(TRAY_SOCKET_PATH) 
                    client.sendall("kill_tray".encode())
                    self.tray_process = None
        except (ConnectionRefusedError, FileNotFoundError):
            pass
        except Exception as e:
            print(f"Socket graceful shutdown failed: {e}")

        if hasattr(self, 'tray_process') and self.tray_process:
            try:
                self.tray_process.wait(timeout=1) 
            except subprocess.TimeoutExpired:
                print("Tray process frozen. Forcing kill...")
                self.tray_process.kill()
                self.tray_process.wait()
            
            self.tray_process = None

    def open_url(self, url):
        """Opens a web link in the user's default browser."""
        try:
            Gio.AppInfo.launch_default_for_uri(url, None)
        except Exception as e:
            print(f"Failed to open URL {url}: {e}")

    def show_about_dialog(self):
        about = Gtk.AboutDialog()
        about.set_transient_for(self.window)
        about.set_modal(True)
        
        about.set_program_name("FlameGet")
        about.set_version("1.0.0") 
        
        about.set_comments(self.tr("A fast, modern download manager.\n\nIcons provided by the XApp Project under the LGPL-3.0 License."))
        
        about.set_website("https://github.com/C-Yassin/flameget")
        about.set_website_label(self.tr("Visit FlameGet Repository"))
        about.set_logo_icon_name("flameget_about_dialog") 
        
        about.set_license_type(Gtk.License.MIT_X11) 
        
        about.set_authors(["C-Yassin \nhttps://github.com/C-Yassin"])
        
        about.add_credit_section(
            self.tr("Icon Design"), 
            ["XApp Project (LGPL-3.0)\nhttps://github.com/xapp-project/xapp-symbolic-icons"]
        )
        about.add_credit_section(
            self.tr("Backend Download Engines"), 
            [
                "aria2 (GPL-2.0)\nhttps://aria2.github.io/",
                "yt-dlp (The Unlicense)\nhttps://github.com/yt-dlp/yt-dlp",
                "PycURL (Dual MIT/LGPL)\nhttp://pycurl.io/"
            ]
        )
        about.add_css_class("about-helper")
        about.present()
    
def check_if_running():
    if os.name != 'nt' and not os.path.exists(SOCKET_PATH):
        return False

    try:
        if os.name != 'nt':
            client_socket = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
            client_socket.connect(SOCKET_PATH)
        else:
            client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            client_socket.connect(('127.0.0.1', WINDOWS_PORT))
            
        print(sys.argv)
        
        if len(sys.argv) > 1:
            url_arg = sys.argv[1]
            print(f"got url! {url_arg}")
            msg = f"open_url:{url_arg}"
            client_socket.sendall(msg.encode())
        else:
            client_socket.sendall(b"toggle")
        
        client_socket.close()
        print("FlameGet is already running. Sent command to existing instance.")
        return True
    except (ConnectionRefusedError, OSError):
        return False

def main():
    if check_if_running():
        sys.exit(0)
        
    app = FlameGetManager()
    is_minimized = "--start-minimized" in sys.argv

    if is_minimized:
        sys.argv.remove("--start-minimized")
    app.start_minimized = is_minimized
    
    initial_url = None
    if len(sys.argv) > 1:
        initial_url = sys.argv[1]
    
    app.run([sys.argv[0]])
    
    if getattr(sys, 'frozen', False) and os.name == 'nt':
        try:
            parent_pid = os.getppid()
            os.kill(parent_pid, signal.SIGTERM)
        except Exception:
            pass


from flask import Flask, request, jsonify
from werkzeug.utils import secure_filename 
from waitress import serve

flask_app = Flask(__name__)

downloader_script_path = addOn.FireFiles.downloader_script_path
browser_context_menu_handler_script_path = addOn.FireFiles.browser_context_menu_handler_script_path

app_settings = SaveManager.load_settings()

def notify_main_ui(message, is_error=False):
    try:
        prefix = "error_toast:" if is_error else "toast:"
        cmd = f"{prefix}{message}".encode('utf-8')
        
        if os.name == 'nt':
            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                s.settimeout(1)
                s.connect(('127.0.0.1', 18597))
                s.sendall(cmd)
        else:
            sock_path = os.path.join(addOn.UNITS.RUNTIME_DIR, "flameget_dm_tray.sock")
            with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as s:
                s.settimeout(1)
                s.connect(sock_path)
                s.sendall(cmd)
    except Exception:
        pass

@flask_app.after_request
def add_cors_headers(response):
    response.headers.add('Access-Control-Allow-Origin', '*')
    response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
    response.headers.add('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS')
    return response

@flask_app.route('/sync')
def sync():
    data = {
        "status": "ok",
        "enabled": True,
        "fileExts": ["*"], 
        "blockedHosts": [],
        "tabsWatcher": [],
        "videoList": [],
        "mediaExts": [""],
        "matchingHosts": [],
        "mediaTypes": [],
        "message": "Hello from Python!"
    }
    return jsonify(data)
    
@flask_app.route("/video_download", methods=["POST", "OPTIONS"])
def handle_video_download():
    if request.method == "OPTIONS":
        return jsonify({"status": "ok"}), 200

    print("captured video_download!")
    
    data = request.get_json(force=True, silent=True)
    if not data:
        return jsonify({"error": "No JSON data received"}), 400

    url = data.get("url")
    isAuto = data.get("isAuto")
    if not url:
        return jsonify({"error": "Missing 'url' parameter"}), 400

    if not browser_context_menu_handler_script_path:
        return jsonify({"error": "Server configuration error"}), 500
    
    worker_env = os.environ.copy()
    worker_env["FLAMEGET_WORKER"] = "browser"
    
    executable_path = sys.executable 
    is_compiled = getattr(sys, 'frozen', False)
    args = [executable_path]
    
    if not is_compiled:
        args.append(os.path.abspath(browser_context_menu_handler_script_path))
    cmd = [*args, url]

    if isAuto:
        autoType = data.get("autoType")
        autoQuality = data.get("autoQuality")
        autoFormat = data.get("autoFormat")
        chkPlaylist = data.get("chkPlaylist")
        if autoType: cmd.append("--audio")
        if chkPlaylist: cmd.append("--playlist")
        if autoFormat: cmd.extend(["--ext", "." + autoFormat])
        if autoQuality: cmd.extend(["--quality", autoQuality])

    subprocess.Popen(cmd, env=worker_env)
    return jsonify({"status": "ok"})

@flask_app.route("/download", methods=["POST", "OPTIONS"])
def handle_download():
    if request.method == "OPTIONS":
        return jsonify({"status": "ok"}), 200

    data = request.get_json(force=True, silent=True)
    if data == None:
        return jsonify({"error": "No JSON data received"}), 400
        
    url = data.get("url")
    raw_name = data.get("filename")
    if raw_name:
        raw_name = os.path.basename(raw_name)

    filename = secure_filename(raw_name or "download.dat")
    
    raw_size = data.get("fileSize")
    try:
        size_str = str(int(raw_size)) if raw_size is not None and int(raw_size) >= 0 else "0"
    except (ValueError, TypeError):
        size_str = "0"

    cookies = data.get("cookies", None)
    user_agent = data.get("userAgent", None)
    referer = data.get("referer", None)

    worker_env = os.environ.copy()
    worker_env["FLAMEGET_WORKER"] = "downloader"
    
    executable_path = sys.executable 
    is_compiled = getattr(sys, 'frozen', False)
    args = [executable_path]
    if not is_compiled:
        args.append(os.path.abspath(downloader_script_path))
        
    cmd = [
        *args, url, filename, size_str,
        app_settings.get("default_download_dir")
    ]

    cmd.extend(["--segments", str(app_settings.get("default_segments"))])
    cmd.extend(["--id", "-1"])
    cmd.extend(["--speed-limit", str(app_settings.get("global_speed_limit"))])

    if cookies: cmd.append(f"--cookies={cookies}")
    if user_agent: cmd.append(f"--user-agent={user_agent}")
    if referer: cmd.append(f"--referer={referer}")

    subprocess.Popen(cmd, env=worker_env)
    return jsonify({"status": "ok", "filename": filename})

def diagnose_server_port(port):
    import urllib.request
    import urllib.error

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.settimeout(0.5)
        is_occupied = (s.connect_ex(('127.0.0.1', port)) == 0)
        
    if not is_occupied:
        return "DEAD"

    try:
        url = f"http://127.0.0.1:{port}/sync"
        req = urllib.request.Request(url, method="GET")
        
        with urllib.request.urlopen(req, timeout=1.0) as response:
            if response.status == 200:
                return "HEALTHY"
                
    except (urllib.error.URLError, ConnectionResetError, TimeoutError):
        pass

    return "HIJACKED_OR_FROZEN"

def server_main():
    base_port = int(app_settings.get("browser_port", 6812))
    try:
        print(f"Attempting to start server on 127.0.0.1:{base_port}...")   
        status = diagnose_server_port(base_port)
        
        if status == "HEALTHY":
            print(f"Server is already running and healthy on port {base_port}.")
            return
            
        elif status == "HIJACKED_OR_FROZEN":
            print(f"CRITICAL: Port {base_port} is hijacked by another app!")
            notify_main_ui(f"Port {base_port} is busy! Please change it in settings.", is_error=True)
            return
            
        elif status == "DEAD":
            print("Port is free. Starting server...")
        serve(flask_app, host='127.0.0.1', port=base_port, threads=4)
        
    except OSError as e:
        if "Address already in use" in str(e) or getattr(e, 'errno', 0) == 98:
            print(f"Port {base_port} is busy.")
            notify_main_ui(f"Port {base_port} is busy! Please change it in settings.", is_error=True)
        else:
            notify_main_ui(f"Browser integration crashed: {str(e)}", is_error=True)
            raise e

if __name__ == '__main__':
    main()
