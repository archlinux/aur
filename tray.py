#!/usr/bin/env python3
import socket
import signal
import os
import gi, json
import threading

gi.require_version('Gtk', '3.0')
gi.require_version('GdkPixbuf', '2.0')
gi.require_version('AppIndicator3', '0.1')

from gi.repository import Gtk, GdkPixbuf, AppIndicator3, GLib

APP_ID = 'flameget-manager-tray'

runtime_dir = os.environ.get("XDG_RUNTIME_DIR", "/tmp")
MAIN_APP_SOCKET = os.path.join(runtime_dir, "flameget_dm_tray.sock")
TRAY_SOCKET_PATH = os.path.join(runtime_dir, "flameget_tray_listener.sock")

# first of all fuck the tray system, this shit is outdated! like how tf it doesn't support GTK4! i hate this even the colors....ugh painful...
class TrayApp:
    def __init__(self):
        print("--- Tray App Starting ---")
        self.pid_menu_items = {}

        self.config_dir = os.path.join(GLib.get_user_config_dir(), "flameget")
        os.makedirs(self.config_dir, exist_ok=True)
        
        self.data_dir = os.path.join(GLib.get_user_data_dir(), "flameget")
        os.makedirs(self.data_dir, exist_ok=True)

        self.settings_file = os.path.join(self.config_dir, "settings.json")
        translations_file = os.path.join(self.config_dir, "translations.json")
        
        install_dir = os.path.dirname(os.path.abspath(__file__))
        self.translations = self.load_translations(translations_file)
        self.app_settings = self.load_settings()
        
        self.icons_dir = os.path.join(install_dir, "icons")
        self.icon_theme = Gtk.IconTheme.get_default()
        
        if os.path.exists(self.icons_dir):
            self.icon_theme.append_search_path(self.icons_dir)
            if hasattr(self.icon_theme, 'rescan_if_needed'):
                self.icon_theme.rescan_if_needed()
            print(f"DEBUG: Added icon path: {self.icons_dir}")
        else:
            print(f"WARNING: Icon folder NOT found at {self.icons_dir}")

        if self.app_settings.get("language") == "ar":
            Gtk.Widget.set_default_direction(Gtk.TextDirection.RTL)
        else:
            Gtk.Widget.set_default_direction(Gtk.TextDirection.LTR)
            
        self.indicator = AppIndicator3.Indicator.new(
            APP_ID,
            "folder-download-symbolic",
            AppIndicator3.IndicatorCategory.APPLICATION_STATUS
        )
        self.indicator.set_status(AppIndicator3.IndicatorStatus.ACTIVE)
        self.indicator.set_secondary_activate_target(None)
        
        self.setup_menu()

        self.running = True
        self.start_server()
        
    def setup_menu(self):
        """Builds the static menu skeleton once."""
        self.menu = Gtk.Menu()

        self.header_item = Gtk.MenuItem(label=self.tr("Info"))
        self.header_item.set_sensitive(False)
        self.header_item.set_no_show_all(True)
        self.header_item.set_visible(False)
        self.menu.append(self.header_item)

        self.dynamic_separator = Gtk.SeparatorMenuItem()
        self.dynamic_separator.set_no_show_all(True)
        self.dynamic_separator.set_visible(False)
        self.menu.append(self.dynamic_separator)

        item_toggle = self.create_icon_menu_item(
            self.tr("Show/Hide"), 
            "xsi-view-reveal-symbolic",
            "view-reveal-symbolic", 
            lambda _: self.send_command("toggle")
        )
        self.menu.append(item_toggle)

        item_quit = self.create_icon_menu_item(
            self.tr("Quit"), 
            "xsi-application-exit-symbolic",
            "application-exit-symbolic", 
            self.on_quit
        )
        self.menu.append(item_quit)

        self.menu.show_all()
        self.indicator.set_menu(self.menu)

    def create_icon_menu_item(self, label_text, icon_name, fallback_name, callback):
        """Creates a menu item, PRIORITIZING direct file loading to keep colors correct."""
        item = Gtk.MenuItem()
        box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
        
        icon_widget = None
        possible_file = os.path.join(self.icons_dir, icon_name + ".svg")

        if os.path.exists(possible_file):
            print(f"DEBUG: Found file directly: {possible_file}")
            try:
                pixbuf = GdkPixbuf.Pixbuf.new_from_file_at_scale(possible_file, 16, 16, True)
                icon_widget = Gtk.Image.new_from_pixbuf(pixbuf)
            except Exception as e:
                print(f"DEBUG: Failed to load Pixbuf: {e}")
                if self.icon_theme.has_icon(icon_name):
                    icon_widget = Gtk.Image.new_from_icon_name(icon_name, Gtk.IconSize.MENU)

        elif self.icon_theme.has_icon(icon_name):
            print(f"DEBUG: File not found, using theme: {icon_name}")
            icon_widget = Gtk.Image.new_from_icon_name(icon_name, Gtk.IconSize.MENU)
        
        elif self.icon_theme.has_icon(fallback_name):
            print(f"DEBUG: Icon missing. Using system fallback: {fallback_name}")
            icon_widget = Gtk.Image.new_from_icon_name(fallback_name, Gtk.IconSize.MENU)
        
        else:
            print("DEBUG: Total failure finding icon.")
            icon_widget = Gtk.Image.new_from_icon_name("image-missing", Gtk.IconSize.MENU)

        if icon_widget is None:
             icon_widget = Gtk.Image.new_from_icon_name("image-missing", Gtk.IconSize.MENU)

        icon_widget.set_pixel_size(16)
        
        css_provider = Gtk.CssProvider()
        css_provider.load_from_data(b"image { color: white; -gtk-icon-style: symbolic; }")
        icon_widget.get_style_context().add_provider(css_provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)
        
        label = Gtk.Label(label=label_text)
        
        box.pack_start(icon_widget, False, False, 0)
        box.pack_start(label, False, False, 0)
        
        item.add(box)
        box.show_all()
        
        item.connect('activate', callback)
        
        return item

    def start_server(self):
        thread = threading.Thread(target=self._server_loop, daemon=True)
        thread.start()

    def _server_loop(self):
        """Listens for UDS updates regarding PIDs."""
        if os.path.exists(TRAY_SOCKET_PATH):
            try:
                os.unlink(TRAY_SOCKET_PATH)
            except OSError:
                pass

        with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as server:
            server.bind(TRAY_SOCKET_PATH)
            server.listen(1)
            
            while self.running:
                try:
                    conn, _ = server.accept()
                    with conn:
                        data = conn.recv(1024)
                        if not data:
                            continue
                        
                        cmd = data.decode('utf-8').strip()
                        
                        if cmd.startswith("pid:"):
                            try:
                                parts = cmd.split(":")
                                if len(parts) >= 5:
                                    _, file_name, progress, proc_id, status = parts
                                    
                                    GLib.idle_add(
                                        self.handle_pid_update, 
                                        proc_id, file_name, progress, status
                                    )
                                    
                            except Exception as e:
                                print(f"Failed to parse PID cmd: {e}")

                except Exception as e:
                    print(f"Tray server error: {e}")

    def handle_pid_update(self, proc_id, filename, progress, status):
        self.send_command("update_footer")
        
        if status == "delete":
            if proc_id in self.pid_menu_items:
                widget = self.pid_menu_items[proc_id]
                self.menu.remove(widget)
                del self.pid_menu_items[proc_id]
                
                if not self.pid_menu_items:
                    self.header_item.set_visible(False)
                    self.dynamic_separator.set_visible(False)
            return

        status_clean = status.strip()
        if status_clean == "Paused":
            status_display = "(Paused)"
        elif status_clean == "Finished":
            status_display = "(Finished)"
        elif status_clean == "Seeding":
            status_display = "(Seeding)"
        else:
            status_display = f"({progress}%)"

        short_name = (filename[:20] + '..') if len(filename) > 20 else filename
        label_text = f"{short_name} {status_display}  "

        if proc_id in self.pid_menu_items:
            self.pid_menu_items[proc_id].set_label(label_text)
        else:
            root_item = Gtk.MenuItem(label=label_text)
            
            submenu = Gtk.Menu()
            
            item_show = Gtk.MenuItem(label=self.tr("Show/Hide Window"))
            item_show.connect('activate', self.toggle, proc_id)
            submenu.append(item_show)
            
            item_pause = Gtk.MenuItem(label=self.tr("Pause / Resume"))
            item_pause.connect('activate', self.send_signal_action, proc_id, signal.SIGUSR1)
            submenu.append(item_pause)
            
            item_stop = Gtk.MenuItem(label=self.tr("Stop Download"))
            item_stop.connect('activate', self.send_signal_action, proc_id, signal.SIGTERM)
            submenu.append(item_stop)
            
            submenu.show_all()
            root_item.set_submenu(submenu)
            root_item.show()

            children = self.menu.get_children()
            try:
                insert_index = children.index(self.dynamic_separator)
                self.menu.insert(root_item, insert_index)
            except ValueError:
                self.menu.append(root_item)

            self.pid_menu_items[proc_id] = root_item
            
            self.header_item.set_visible(True)
            self.dynamic_separator.set_visible(True)

    def send_signal_action(self, widget, pid_str, sig):
        """Sends a signal (Pause or Stop) to the specific downloader process."""
        try:
            pid = int(pid_str)
            os.kill(pid, sig)
            print(f"Sent signal {sig} to Process {pid}")
        except ValueError:
            print(f"Invalid PID: {pid_str}")
        except ProcessLookupError:
            print(f"Process {pid_str} not found (already closed?)")
            self.handle_pid_update(pid_str, "", 0, "delete")
        except Exception as e:
            print(f"Failed to send signal: {e}")

    def send_command(self, cmd, target_socket=None):
        sock_path = target_socket if target_socket else MAIN_APP_SOCKET
        try:
            with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as s:
                s.connect(sock_path)
                s.sendall(cmd.encode('utf-8'))
        except (ConnectionRefusedError, FileNotFoundError):
            print(f"Target not running? ({sock_path})")

    def toggle(self, widget, pid):
        print(f"Toggling PID: {pid}")
        downloader_sock = os.path.join(runtime_dir, f"flameget_dl_{pid}.sock")
        self.send_command("toggle_pid", target_socket=downloader_sock)

    def on_quit(self, _):
        self.running = False

        self.send_command("quit")
        if os.path.exists(TRAY_SOCKET_PATH):
            try: os.unlink(TRAY_SOCKET_PATH)
            except: pass
        Gtk.main_quit()

    def load_settings(self):
        default_css = os.path.join(self.config_dir, "dark_style.css")
        custom_css = os.path.join(self.config_dir, "custom_style.css")

        defaults = {
            "engine": "Aria2",
            "css_path": default_css,
            "custom_css_path": custom_css,
            "default_segments": 8,
            "user_agent": "Mozilla/5.0",
            "confirm_delete": True,
            "notifications": True,
            "default_download_dir": GLib.get_user_special_dir(GLib.UserDirectory.DIRECTORY_DOWNLOAD),
            "theme_mode": "Dark",
            "language": "en",
            "font_name": "Sans Regular 11",
            "ui_scale": 100,
            "start_on_boot": False,
            "show_finish_dialog": True,
            "enable_toasts":True,
            "chk_has_borders": True,
            "enable_integration": True,
            "ctx_menu_offsets": {"x": 100, "y":0},
            "start_in_minimize_mode": False,
            "auto_start": False,
            "global_speed_limit": "0",
            "browser_port": "6800"
        }
        if os.path.exists(self.settings_file):
            try:
                with open(self.settings_file, 'r') as f:
                    data = json.load(f)
                    defaults.update(data)
            except: pass
        return defaults

    def tr(self, text):
        lang = self.app_settings.get("language", "en")
        if lang in self.translations and text in self.translations[lang]:
            return self.translations[lang][text]
        return text

    def load_translations(self, file_path):
        if not os.path.exists(file_path):
            return {"en": {}}
        try:
            with open(file_path, "r", encoding="utf-8") as f:
                return json.load(f)
        except json.JSONDecodeError:
            return {"en": {}}

if __name__ == "__main__":
    signal.signal(signal.SIGINT, signal.SIG_DFL)
    app = TrayApp()
    Gtk.main()