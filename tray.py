#!/usr/bin/env python3
import socket
import signal
import os, sys
import json
import threading

is_flatpak_env = 'FLATPAK_ID' in os.environ or os.path.exists('/.flatpak-info')

if os.name == 'nt':
    import pystray
    from PIL import Image
else:
    if is_flatpak_env:
        # soon...
        pass
    else:
        import gi
        gi.require_version('Gtk', '3.0')
        gi.require_version('GdkPixbuf', '2.0')
        from gi.repository import Gtk, GdkPixbuf, GLib
        gi.require_version('AppIndicator3', '0.1')
        from gi.repository import AppIndicator3

WINDOWS_TRAY_PORT = 18598
WINDOWS_MAIN_PORT = 18597
APP_ID = 'flameget-manager-tray'

def get_temp_dir():
    if os.name == 'nt':
        base_data = os.getenv('LOCALAPPDATA', os.path.expanduser('~'))
        RUNTIME_DIR = os.path.join(base_data, "flameget", "run")
        os.makedirs(RUNTIME_DIR, exist_ok=True)
        return RUNTIME_DIR
    else:
        return os.environ.get("XDG_RUNTIME_DIR", "/tmp")

runtime_dir = get_temp_dir()
MAIN_APP_SOCKET = os.path.join(runtime_dir, "flameget_dm_tray.sock")
TRAY_SOCKET_PATH = os.path.join(runtime_dir, "flameget_tray_listener.sock")

class TrayApp:
    def __init__(self):
        self.pid_menu_items = {}
        self.is_flatpak = is_flatpak_env

        if os.name == 'nt':
            base_config = os.getenv('APPDATA', os.path.expanduser('~'))
            base_data = os.getenv('LOCALAPPDATA', base_config)
            self.config_dir = os.path.join(base_data, "flameget")
            self.data_dir = os.path.join(base_data, "flameget")
        else:
            if not self.is_flatpak:
                self.config_dir = os.path.join(GLib.get_user_config_dir(), "flameget")
                self.data_dir = os.path.join(GLib.get_user_data_dir(), "flameget")
            else:
                self.config_dir = os.path.expanduser("~/.config/flameget")
                self.data_dir = os.path.expanduser("~/.local/share/flameget")
            
        self.is_compiled = getattr(sys, 'frozen', False) or "__compiled__" in globals()
        
        if self.is_compiled:
            self.current_exe = sys.executable
            self.install_dir = os.path.dirname(self.current_exe)
        else:
            self.current_exe = sys.executable
            self.install_dir = os.path.dirname(os.path.abspath(__file__))

        self.settings_file = os.path.join(self.config_dir, "settings.json")
        translations_file = os.path.join(self.config_dir, "translations.json")
        self.translations = self.load_translations(translations_file)
        self.app_settings = self.load_settings()
        self.icons_dir = os.path.join(self.install_dir, "icons")
        self.running = True

        if os.name == 'nt':
            self.parent_pid = os.getppid()
            threading.Thread(target=self._monitor_parent, daemon=True).start()
            self.setup_windows_tray()
            
        elif self.is_flatpak:
            # soon...
            pass
            
        else:
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
            self.icon_theme = Gtk.IconTheme.get_default()
            if self.icon_theme and os.path.exists(self.icons_dir):
                self.icon_theme.append_search_path(self.icons_dir)
            
            self.setup_menu()

        self.start_server()

    def get_resource_path(self, relative_path):
        if getattr(sys, 'frozen', False) and hasattr(sys, '_MEIPASS'):
            base_path = sys._MEIPASS
        else:
            base_path = os.path.dirname(os.path.abspath(__file__))
            
        return os.path.join(base_path, relative_path)

    def setup_windows_tray(self):
        possible_file = self.get_resource_path("flameget.png")
        if os.path.exists(possible_file):
            image = Image.open(possible_file)
        else:
            image = Image.new('RGB', (64, 64), color=(73, 109, 137))
            
        self.windows_pid_data = {}
        self.icon = pystray.Icon("FlameGet", image, "FlameGet", menu=pystray.Menu(self._generate_windows_menu))
        
    def _generate_windows_menu(self):
        def make_toggle_cb(p, pt):
            return lambda icon, item: self.toggle(None, p, pt)
            
        def make_pause_cb(p, pt):
            return lambda icon, item: self.send_signal_action(None, p, pt, getattr(signal, "SIGUSR1", 10))

        def make_stop_cb(p, pt):
            return lambda icon, item: self.send_signal_action(None, p, pt, signal.SIGTERM)

        try:
            safe_data = dict(self.windows_pid_data)
            
            # FIXED: Correctly unpack the tuple key!
            for (pid, port), label in safe_data.items():
                submenu = pystray.Menu(
                    pystray.MenuItem(self.tr("Show/Hide Window"), make_toggle_cb(pid, port)),
                    pystray.MenuItem(self.tr("Pause / Resume"), make_pause_cb(pid, port)),
                    pystray.MenuItem(self.tr("Stop Download"), make_stop_cb(pid, port)) 
                )
                yield pystray.MenuItem(str(label), submenu)

            if len(safe_data) > 0:
                yield pystray.Menu.SEPARATOR
                
            yield pystray.MenuItem(self.tr("Show/Hide Window"), lambda icon, item: self.send_command("toggle"), default=True)
            yield pystray.MenuItem(self.tr("Quit"), lambda icon, item: self.on_quit())

        except Exception as e:
            print(f"\n--- CRITICAL MENU ERROR ---")
            yield pystray.MenuItem("Error loading menu (See console)", lambda icon, item: None)
            yield pystray.MenuItem(self.tr("Quit"), lambda icon, item: self.on_quit())

    def setup_menu(self):
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
            "xsi-window-close-symbolic",
            "application-exit-symbolic", 
            self.on_quit
        )
        self.menu.append(item_quit)

        self.menu.show_all()
        self.indicator.set_menu(self.menu)

    def create_icon_menu_item(self, label_text, icon_name, fallback_name, callback):
        item = Gtk.MenuItem()
        box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
        
        icon_widget = None
        is_compiled = getattr(sys, 'frozen', False) or "__compiled__" in globals()
        
        if is_compiled:
            current_exe = sys.executable
            install_dir = os.path.dirname(current_exe)
            possible_file = os.path.join(install_dir, icon_name + ".svg")
        else:
            possible_file = os.path.join(self.icons_dir, icon_name + ".svg")

        if os.path.exists(possible_file):
            try:
                pixbuf = GdkPixbuf.Pixbuf.new_from_file_at_scale(possible_file, 16, 16, True)
                icon_widget = Gtk.Image.new_from_pixbuf(pixbuf)
            except Exception as e:
                if self.icon_theme.has_icon(icon_name):
                    icon_widget = Gtk.Image.new_from_icon_name(icon_name, Gtk.IconSize.MENU)

        elif self.icon_theme.has_icon(icon_name):
            icon_widget = Gtk.Image.new_from_icon_name(icon_name, Gtk.IconSize.MENU)
        
        elif self.icon_theme.has_icon(fallback_name):
            icon_widget = Gtk.Image.new_from_icon_name(fallback_name, Gtk.IconSize.MENU)
        
        else:
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
        if os.name != 'nt':
            if os.path.exists(TRAY_SOCKET_PATH):
                try:
                    os.unlink(TRAY_SOCKET_PATH)
                except OSError:
                    pass
            server = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
            server.bind(TRAY_SOCKET_PATH)
        else:
            server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
            server.bind(('127.0.0.1', WINDOWS_TRAY_PORT))

        with server:
            server.listen(1)
            
            while self.running:
                try:
                    conn, _ = server.accept()
                    with conn:
                        data = conn.recv(1024)
                        if not data:
                            continue
                        
                        cmd = data.decode('utf-8').strip()
                        
                        if cmd == "kill_tray":
                            self.on_quit()
                        elif cmd.startswith("pid:"):
                            try:
                                parts = cmd.split(":", 5) 

                                if len(parts) >= 6: # FIXED: 6 parts now (pid, name, prog, id, port, status)
                                    _, file_name, progress, proc_id, proc_port, status = parts
                                    
                                    if os.name == 'nt':
                                        self.handle_pid_update(proc_id, proc_port, file_name, progress, status)
                                    elif self.is_flatpak:
                                        # soon...
                                        pass
                                    else:
                                        # FIXED: Pass proc_port to GTK idle_add
                                        GLib.idle_add(
                                            self.handle_pid_update, 
                                            proc_id, proc_port, file_name, progress, status
                                        )
                                else:
                                    print(f"DEBUG Not enough parts! len={len(parts)}")
                                    
                            except Exception as e:
                                print(f"Failed to parse PID cmd: {e}")

                except Exception as e:
                    if self.running:
                        print(f"Tray server error: {e}")

    def handle_pid_update(self, proc_id, proc_port, filename, progress, status):
        self.send_command("update_footer")
        
        status_clean = status
        if status_clean == "Paused":
            status_display = "(Paused)"
        elif status_clean == "Finished":
            status_display = "(Finished)"
        elif status_clean == "Seeding":
            status_display = "(Seeding)"
        else:
            prog_val = float(progress)
            status_display = f"({prog_val:.0f}%)"

        short_name = (filename[:20] + '..') if len(filename) > 20 else filename
        label_text = f"{short_name} {status_display}  "
        
        if os.name == 'nt':
            if status_clean == "delete":
                self.windows_pid_data.pop((proc_id, proc_port), None)
            else:
                self.windows_pid_data[(proc_id, proc_port)] = label_text
                
            if hasattr(self, 'icon'):
                try:
                    self.icon.update_menu()
                except Exception:
                    pass
                    
        elif getattr(self, 'is_flatpak', False):
            # soon...
            pass
        else:
            if status == "delete":
                if proc_id in self.pid_menu_items:
                    widget = self.pid_menu_items[proc_id]
                    self.menu.remove(widget)
                    del self.pid_menu_items[proc_id]
                    
                    if not self.pid_menu_items:
                        self.header_item.set_visible(False)
                        self.dynamic_separator.set_visible(False)
                return

            if proc_id in self.pid_menu_items:
                self.pid_menu_items[proc_id].set_label(label_text)
            else:
                root_item = Gtk.MenuItem(label=label_text)
                
                submenu = Gtk.Menu()
                
                item_show = Gtk.MenuItem(label=self.tr("Show/Hide Window"))
                item_show.connect('activate', self.toggle, proc_id, proc_port)
                submenu.append(item_show)
                
                if hasattr(signal, "SIGUSR1"):
                    item_pause = Gtk.MenuItem(label=self.tr("Pause / Resume"))
                    item_pause.connect('activate', self.send_signal_action, proc_id, proc_port, signal.SIGUSR1)
                    submenu.append(item_pause)
                
                item_stop = Gtk.MenuItem(label=self.tr("Stop Download"))
                item_stop.connect('activate', self.send_signal_action, proc_id, proc_port, signal.SIGTERM)
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

    def send_signal_action(self, widget, pid_str, port_str, sig):
        try:
            pid = int(pid_str)
            port = int(port_str)
            print(f"Sent signal {sig} to Process {pid} with port {port}")

            if os.name == 'nt':
                downloader_sock = os.path.join(runtime_dir, f"flameget_dl_{pid}_{port}.sock")
                if sig == getattr(signal, "SIGUSR1", 10): 
                    self.send_windows_command("pause", target_socket=downloader_sock) 
                elif sig == signal.SIGTERM:
                    self.send_windows_command("stop", target_socket=downloader_sock)
            else:
                os.kill(pid, sig)
            
            if sig == signal.SIGTERM:
                self.handle_pid_update(pid_str, port_str, "", 0, "delete")
                
        except ValueError:
            print(f"Invalid PID or Port: {pid_str} / {port_str}")
        except ProcessLookupError:
            print(f"Process {pid_str} not found (already closed?)")
            self.handle_pid_update(pid_str, port_str, "", 0, "delete")
        except Exception as e:
            print(f"Failed to send signal: {e}")

    def send_command(self, cmd, target_socket=None):
        sock_path = target_socket if target_socket else MAIN_APP_SOCKET
        try:
            if os.name != 'nt':
                with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as s:
                    s.connect(sock_path)
                    s.sendall(cmd.encode('utf-8'))
            else:
                with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                    s.connect(('127.0.0.1', WINDOWS_MAIN_PORT))
                    s.sendall(cmd.encode('utf-8'))
        except (ConnectionRefusedError, FileNotFoundError):
            print(f"Target not running? ({sock_path})")
        except OSError as e:
            print(f"Socket error while sending command: {e}")

    def toggle(self, widget, pid, port):
        print(f"Toggling PID: {pid}")
        if os.name == 'nt':
            downloader_sock = os.path.join(runtime_dir, f"flameget_dl_{pid}_{port}.sock")
            self.send_windows_command("toggle_pid", target_socket=downloader_sock)
            return
        downloader_sock = os.path.join(runtime_dir, f"flameget_dl_{pid}_{port}.sock")
        self.send_command("toggle_pid", target_socket=downloader_sock)

    def send_windows_command(self, cmd, target_socket=None):
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

    def on_quit(self, *args):
        self.running = False
        self.send_command("quit")
        if os.name == 'nt':
            self.icon.stop()
        elif getattr(self, 'is_flatpak', False):
            # soon...
            pass
        else:
            if os.path.exists(TRAY_SOCKET_PATH):
                try: os.unlink(TRAY_SOCKET_PATH)
                except: pass
            Gtk.main_quit()

    def load_settings(self):
        defaults = {}
        if os.path.exists(self.settings_file):
            try:
                with open(self.settings_file, 'r') as f:
                    data = json.load(f)
                    defaults.update(data)
                    return defaults
            except json.JSONDecodeError as e:
                print(f"Settings file is empty or corrupted ({e}). Recreating defaults...")
            except Exception as e:
                print(f"Error loading settings: {e}")
                
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

    def _monitor_parent(self):
        import time, ctypes
        while self.running:
            time.sleep(2)
            try:
                PROCESS_QUERY_LIMITED_INFORMATION = 0x1000
                STILL_ACTIVE = 259
                
                handle = ctypes.windll.kernel32.OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION, False, self.parent_pid)
                if not handle:
                    os._exit(0)
                    
                exit_code = ctypes.c_ulong()
                ctypes.windll.kernel32.GetExitCodeProcess(handle, ctypes.byref(exit_code))
                ctypes.windll.kernel32.CloseHandle(handle)
                
                if exit_code.value != STILL_ACTIVE:
                    os._exit(0)
            except OSError:
                os._exit(0)

def main():
    signal.signal(signal.SIGINT, signal.SIG_DFL)
    app = TrayApp()
    
    if os.name == 'nt':
        app.icon.run()
    else:
        Gtk.main()

if __name__ == "__main__":
    main()