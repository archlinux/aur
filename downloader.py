#!/usr/bin/env python3
import gi
gi.require_version("Gtk", "4.0")
from gi.repository import Gtk, Gdk, GLib, Gio, Pango, GObject
import threading, random
import subprocess, socket
import os, sys, re, time
import argparse
import atexit, signal, shutil
import json, tempfile
import hashlib
import SaveManager
import FireAddOns as addOn

yt_dlp = addOn.lazy_import("yt_dlp")
pycurl = addOn.lazy_import("pycurl")
requests = addOn.lazy_import("requests")
TRAY_SOCKET_PATH = os.path.join(addOn.UNITS.RUNTIME_DIR, "flameget_tray_listener.sock")
WINDOWS_TRAY_PORT = 18598
HAS_SIGUSR1 = hasattr(signal, "SIGUSR1")
#for the stupid range detection     
ARIA2_SIZE_RE = re.compile(r"/([0-9.]+)([KMG]i?)B", re.I)

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
        """Called when user clicks THIS node's checkbox."""
        self.set_state_recursive(active)
        if self.parent:
            self.parent.recalculate_state()

    def set_state_recursive(self, active):
        """Sets state for self and all children (downwards)."""
        self.checked_prop = active
        self.inconsistent_prop = False
        
        if self.is_dir:
            n = self.children_store.get_n_items()
            for i in range(n):
                child = self.children_store.get_item(i)
                child.set_state_recursive(active)

    def recalculate_state(self):
        """Checks children to determine own state (upwards)."""
        if not self.is_dir: return

        n = self.children_store.get_n_items()
        if n == 0: return

        all_checked = True
        none_checked = True
        any_inconsistent = False

        for i in range(n):
            child = self.children_store.get_item(i)
            if child.inconsistent_prop:
                any_inconsistent = True
            if child.checked_prop:
                none_checked = False
            else:
                all_checked = False

        if any_inconsistent:
            self.inconsistent_prop = True
            self.checked_prop = False
        elif all_checked:
            self.inconsistent_prop = False
            self.checked_prop = True
        elif none_checked:
            self.inconsistent_prop = False
            self.checked_prop = False
        else:
            self.inconsistent_prop = True
            self.checked_prop = False

        if self.parent:
            self.parent.recalculate_state()


class DownloadWindow(Gtk.ApplicationWindow):
    def __init__(self, app_manager, url, FileName, file_size=0, file_directory="", segments=8, id=-1, in_minimize_mode=False, is_audio=False, quality_mod="Best Available", download_playlist=False, is_yt_dlp=False, speed_limit=0, torrent_indices="", torrent_files_data=[], trackers="", cookies=None, user_agent=None, referer=None):
        super().__init__(application=app_manager)

        self.conn = addOn.FireFiles.db.conn
        self.translations = SaveManager.load_translations()
        self.url = url
        self.runtime_dir = addOn.UNITS.RUNTIME_DIR
        # Use port in socket name to prevent collision if multiple windows open in the same process
        self.port = random.randint(50000, 60000)
        self.pid = os.getpid()
        self.DOWNLOADER_SOCKET = os.path.join(self.runtime_dir, f"flameget_dl_{self.pid}_{self.port}.sock")
        self.has_updated_pid = False
        self.can_change_segment_count = True
        self.is_completed = False
        self.is_flatpak_env = 'FLATPAK_ID' in os.environ or os.path.exists('/.flatpak-info')
        
        # for aria2
        self.update_once = False
        self.download_started = False
        # this for yt-dlp pshhhh
        self.has_calculated_total_size = False
        self.pause_event = threading.Event()
        self.pause_event.set()
        self.cancel_event = threading.Event()

        self.app_name = "FlameGet Downloader"

        self.FileName = FileName
        if download_playlist:
            self.FileName = self.FileName.split('.')[0]
        self.base, self.original_ext = os.path.splitext(self.FileName)
        self.download_id = id
        self.file_size_bytes = file_size
        self.cookies = cookies
        self.referer = referer

        # yt_dlp params:
        self.is_yt_dlp = is_yt_dlp if is_yt_dlp else self.does_support_yt_dlp(self.url)
        self.progress = 0
        self.eta_str = "--:--"
        self.speed_str = "--"
        self.has_inserted = False
        self.quality_mod = quality_mod
        
        if is_audio == True: self.is_audio = is_audio 
        else: self.is_audio = False
        if self.quality_mod == None: self.quality_mod = "Best Available"
        if download_playlist == True: self.download_playlist = download_playlist
        else: self.download_playlist = False
        # torrent params
        self.is_torrent = self.url.startswith("magnet:?") or self.url.endswith(".torrent")
        self.torrent_indices = torrent_indices
        self.parsed_indices = set()
        self.custom_trackers = trackers
        self.torrent_files_data = torrent_files_data
        self.torrent_file_size = ""
        self.files_metadata = []
        self.has_fetching_metadata = True
        self.is_seeding = False
        self.torrent_files_box = []

        if self.is_torrent:
            self.category = "Torrent"
        else:
            self.category = addOn.categorize_filename(self.FileName)
        
        self.parse_torrent_indices()
        print("torrent_indices parsed: ", self.parsed_indices)

        if self.file_size_bytes == 0:
            self.file_size_str="UNKNOWN"
        else:
            self.file_size_str = addOn.parse_size(file_size)

        if not self.download_playlist:
            self.is_supporting_range = file_size > 0
        else:
            self.is_supporting_range = True

        if file_directory == "":
            self.app_settings = SaveManager.load_settings()
            saved_dir = self.app_settings.get("default_download_dir")
            if saved_dir and os.path.exists(saved_dir):
                self.download_folder = saved_dir
        else:
            self.download_folder = file_directory
            self.app_settings = SaveManager.load_settings(self.download_folder)

        self.output_file = os.path.join(self.download_folder, self.FileName)
        SaveManager.load_css(self.app_settings.get("theme_mode"))
        self.in_minimize_mode = in_minimize_mode or self.app_settings.get("start_in_minimize_mode", False) 
        self.auto_start = self.in_minimize_mode or self.app_settings.get("auto_start", False)
        self.download_engine = self.app_settings.get("engine").lower()
        self.user_agent = user_agent if user_agent else self.app_settings.get("user_agent")
        
        if segments == 0:
            default_segments = self.app_settings.get("default_segments", 8)
            if default_segments:
                self.segments_count = default_segments
        else:
            self.segments_count = segments
        
        # Support for Arabic RTL
        if self.app_settings.get("language") == "ar":
            Gtk.Widget.set_default_direction(Gtk.TextDirection.RTL)
        else:
            Gtk.Widget.set_default_direction(Gtk.TextDirection.LTR)

        self.part_files = [self.output_file + f"-part{i}" for i in range(self.segments_count)]
        self.lock = threading.Lock()
        self.completed_threads = 0
        self.threads = []
        self.canDownload = True
        self.pulsing = False
        self.progress_bars = []
        self.entry_locked = True
        self.limit_speed = speed_limit
        self.lock_file = ""
        self.download_button = Gtk.Button(label=self.tr("Download"))
        self.download_button.set_hexpand(True)
        self.download_button.add_css_class("green-btn")
        self.download_button.connect("clicked", self.on_download_clicked)
        self.percent_str = ""
        self.get_visible = True
        self.is_paused = False
        self.refresh_pending = False
        self.is_canceled = False
        self.downloaded_str = ""
        # for aria2 it's a stupid bug
        self.UI_total_size = ""
        self.expander = None

        self.report_pid()
        #Ignore this, it's for sudden shutdowns of the application, intended to clear selflock file.... fuuck
        tray_toggle_system_server = threading.Thread(target=self.start_listener, daemon=True)
        tray_toggle_system_server.start()
        atexit.register(self.exit)
        signal.signal(signal.SIGTERM, self.handle_sigterm)
        signal.signal(signal.SIGINT, self.handle_sigterm)
        if HAS_SIGUSR1:
            signal.signal(signal.SIGUSR1, lambda signum, frame : self.on_pause_clicked(None))

        self.set_title(self.app_name)
        self.set_default_size(650, 350)
        self.set_resizable(False)
        GLib.idle_add(addOn.set_titlebar_theme, self.get_title(), self.app_settings.get("theme_mode"))
        self.connect("close-request", self.on_close_request)
        self.set_icon_name("io.github.C_Yassin.FlameGet" if self.is_flatpak_env else "flameget")
        main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)

        self.stack = Gtk.Stack()
        self.stack.set_transition_type(Gtk.StackTransitionType.SLIDE_LEFT_RIGHT)
        self.stack.set_transition_duration(300)

        self.set_child(main_box)

        stack_switcher = Gtk.StackSwitcher()
        stack_switcher.set_stack(self.stack)
        stack_switcher.add_css_class("downloader")
        main_box.append(stack_switcher)
        self.apply_css()
        self.download_view = self.build_download_view()
        self.settings_view = self.build_settings_view()

        self.stack.add_titled(self.download_view, "info", self.tr("Info"))
        self.stack.add_titled(self.settings_view, "settings", self.tr("Settings"))
        main_box.add_css_class("main_buttons")
        main_box.append(self.stack)

        sql_thread = threading.Thread(target=self.database, daemon=True)
        sql_thread.start()
        
        self.fetch_head_info_thread = threading.Thread(target=self.fetch_head_info, args=(self.url, self.file_size_bytes), daemon=True).start()
        
        self.download_button.grab_focus()
        self.apply_cursor_recursive(self, "pointer")
        if self.in_minimize_mode:
            self.toggle_visibility()


    def on_close_request(self, *args):
        if self.download_started:
            self.toggle_visibility()
            return True
        
        self.exit()
        return False

    def toggle_visibility(self):
        self.get_visible = not self.get_visible
        self.set_visible(self.get_visible)

    def exit(self, *args):
        self.download_started = False
        self.is_paused = False
        self.report_pid("delete")
        if hasattr(self, 'DOWNLOADER_SOCKET') and os.path.exists(self.DOWNLOADER_SOCKET):
            try:
                os.remove(self.DOWNLOADER_SOCKET)
                print(f"Removed socket: {self.DOWNLOADER_SOCKET}")
            except Exception as e:
                print(f"Error removing socket: {e}")
                
        if hasattr(self, 'cancel_event'):
            self.cancel_event.set()

        if hasattr(self, 'lock_file') and os.path.exists(self.lock_file):
            os.remove(self.lock_file)

        if hasattr(self, 'aria_proc'):
            self.aria_proc.terminate()
            self.aria_proc.wait(timeout=2)

        if hasattr(self, 'yt_dlp_proc'):
            self.yt_dlp_proc.terminate()
            self.yt_dlp_proc.wait(timeout=2)

        if hasattr(self, 'threads'):
            for t in self.threads:
                if t.is_alive():
                    try:
                        t.join(timeout=2)
                    except Exception as e:
                        print(f"Error joining thread: {e}")

    
        self.pause_download()

        if hasattr(self, 'conn'):
            try:
                cursor = self.conn.cursor()
                cursor.execute("UPDATE downloads SET pid = -1 WHERE id = ?", (self.download_id,))
                self.conn.commit()
                print(f"Database: Marked PID as -1 for Download ID {self.download_id}")
            except Exception as e:
                print(f"Error updating PID on exit: {e}")
        self.destroy()

    def handle_sigterm(self, signum, frame):
        print(f"Received signal {signum}, exiting...")
        self.exit()

    def get_file_info(self, url):
        if self.download_playlist:
            return True, 0, "Playlist"

        supports = False
        file_size = 0
        timeout = 10
        filename = "Unknown"
        start = time.time()
        if self.is_yt_dlp:
            try:
                ydl_opts = {
                    'quiet': True,
                    'no_warnings': True,
                    'ffmpeg_location': addOn.FireFiles.ffmpeg_path,
                    'outtmpl': self.FileName,
                    'socket_timeout': 15,
                    'noplaylist': True
                }

                if self.is_audio:
                    ydl_opts['format'] = 'bestaudio/best'
                else:
                    if self.quality_mod == "Best Available":
                        ydl_opts['format'] = 'bestvideo+bestaudio/best'
                    else:
                        resolution_map = {"4K": 2160, "1080p": 1080, "720p": 720, "480p": 480}
                        if self.quality_mod in resolution_map:
                            self.quality_mod = resolution_map[self.quality_mod]
                        ydl_opts['format'] = f"bestvideo[height<={self.quality_mod}]+bestaudio/best[height<={self.quality_mod}]"

                target_url = self.normalize_youtube_url(url)

                with yt_dlp.YoutubeDL(ydl_opts) as ydl:
                    info_dict = ydl.extract_info(target_url, download=False)
                    
                    if not info_dict:
                        return False, 0, filename

                    name_part = ydl.prepare_filename(info_dict)
                    
                    file_size = info_dict.get('filesize') or info_dict.get('filesize_approx') or 0
                    
                    return True, int(file_size), name_part

            except yt_dlp.utils.DownloadError as e:
                print(f"yt-dlp error: {e}")
                return False, 0, filename
            except Exception as e:
                print(f"Quick Info Check Error: {e}")
                return False, 0, filename
        else:
            if self.download_engine == "aria2":
                save_path_template = tempfile.mkdtemp(prefix="flameget_torrent_", dir=self.runtime_dir)
                aria_cmd = [
                    addOn.FireFiles.aria2c_path,
                    f"-x{self.segments_count}",
                    f"-s{self.segments_count}",
                    "--connect-timeout=5",
                    "--timeout=5",
                    "--max-tries=2",
                    "--file-allocation=none",
                    "--auto-save-interval=0",
                    "--summary-interval=1",
                    "-d", save_path_template
                ]
                if self.cookies:
                    clean_cookies = self.cookies.replace('\n', '').replace('\r', '').strip()
                    aria_cmd.append(f"--header=Cookie: {clean_cookies}")
                if self.user_agent: aria_cmd.append(f"--user-agent={self.user_agent}")
                if self.referer: aria_cmd.append(f"--referer={self.referer}")
                aria_cmd.append(url)
                
                proc = subprocess.Popen(aria_cmd, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True, **({"creationflags": subprocess.CREATE_NO_WINDOW} if os.name == "nt" else {}))

                try:
                    while time.time() - start < timeout:
                        line = proc.stdout.readline()
                        if not line.strip():
                            continue

                        low = line.lower()

                        if "cn:" in low and "cn:1" not in low:
                            supports = True

                        m = ARIA2_SIZE_RE.search(line)
                        if m:
                            val, unit = m.groups()
                            file_size = addOn.range_parse_size(val, unit)

                        is_actively_downloading = "dl:" in low and "0b/0b" not in low

                        if (supports and file_size > 0) or is_actively_downloading:
                            break
                        
                except Exception as e:
                    print("error in get_file_info thread ",e)
                    return False, 0, filename
                
                finally:
                    proc.terminate()
                    try:
                        proc.wait(timeout=1)
                    except subprocess.TimeoutExpired:
                        proc.kill()

                if os.path.exists(save_path_template):
                    for f in os.listdir(save_path_template):
                        if not f.endswith(".aria2"):
                            filename = f
                            break

                if os.path.exists(save_path_template):
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

    def fetch_head_info(self, url, file_size):
        GLib.idle_add(self.prepare_ui_for_fetch)

        try:
            if self.is_torrent:
                self.fetch_torrent_metadata()
                return

            if self.file_size_bytes == 0 or self.file_size_bytes == "":
                self.is_supporting_range, file_size, filename = self.get_file_info(url)
                if self.FileName == "UNKNOWN" or self.FileName == "":
                    self.FileName = filename
            else:
                self.is_supporting_range = True

            self.file_size_bytes = file_size
            self.category = addOn.categorize_filename(self.FileName)
            print("self.category", self.category)
            self.segment_size = self.file_size_bytes // self.segments_count
            
            if self.file_size_bytes == 0:
                file_size_str = self.tr("UNKNOWN")
            else:
                file_size_str = addOn.parse_size(file_size)
            
            size_markup = f"{self.tr('File Size:')} <b>{addOn.parse_size(self.file_size_bytes)}</b>"

            download_label = self.tr("Download")
            
            if self.is_yt_dlp:
                path = self.find_active_part_yt_dlp(self.FileName, self.download_folder)
                if path and os.path.exists(path):
                    download_label = self.tr("Resume")
            else:
                if self.download_engine == "aria2":
                    if os.path.exists(self.output_file) and os.path.exists(self.output_file + ".aria2"):
                        download_label = self.tr("Resume")
                        percent = (os.path.getsize(self.output_file) / self.file_size_bytes) * 100 if self.file_size_bytes > 0 else 0
                        self.progress = float(percent)
                else:
                    if hasattr(self, 'part_files') and self.part_files and os.path.exists(self.part_files[0]):
                        download_label = self.tr("Resume")

            GLib.idle_add(self.on_fetch_complete, size_markup, file_size_str, download_label)

        except Exception as e:
            import traceback
            print(f"Error in fetch thread: {e}")
            traceback.print_exc()

    def parse_torrent_indices(self):
        """Helper to parse the string of indices into a set of integers"""
        self.parsed_indices = set()
        if hasattr(self, 'torrent_indices') and self.torrent_indices and self.torrent_indices != "None":
            try:
                print("self.torrent_indices", self.torrent_indices)
                parts = str(self.torrent_indices).split(',')
                for part in parts:
                    part = part.strip()
                    if not part: continue
                    if '-' in part:
                        s, e = map(int, part.split('-'))
                        self.parsed_indices.update(range(s, e + 1))
                    else:
                        self.parsed_indices.add(int(part))
            except Exception as e:
                print(f"Error parsing indices: {e}")

    def manage_torrent_metadata(self, action="save"):
        if not self.is_torrent: return
        try:
            filename = self.FileName.split('.')[0]
            self.meta_path = os.path.join(self.download_folder, filename + ".meta.json")
            if action == "save":
                if self.torrent_files_data:
                    data = {
                        "files": self.torrent_files_data,
                        "indices": self.torrent_indices
                    }
                    with open(self.meta_path, 'w') as f:
                        json.dump(data, f)
            elif action == "load":
                self.torrent_files_data = []
                if os.path.exists(self.meta_path):
                    with open(self.meta_path, 'r') as f:
                        data = json.load(f)
                        self.torrent_files_data = data.get("files", [])
                        self.torrent_indices = data.get("indices", "")
                        self.parse_torrent_indices()
                else:
                    save_path_template = tempfile.mkdtemp(prefix="flameget_torrent_", dir=self.runtime_dir)
                    get_torrent_file_cmd = [
                        addOn.FireFiles.aria2c_path,
                        "--bt-metadata-only=true",
                        "--bt-save-metadata=true",
                        "-d", save_path_template,
                        self.url
                    ]

                    try:
                        download_proc = subprocess.run(
                            get_torrent_file_cmd, 
                            capture_output=True, 
                            text=True, 
                            timeout=60, 
                            check=True
                        )

                        match = re.search(r"Saved metadata as (.*\.torrent)", download_proc.stdout)

                        if match:
                            generated_filename = match.group(1).strip()
                            if os.path.exists(generated_filename):
                                cmd = [addOn.FireFiles.aria2c_path, "-S", generated_filename]
                                proc = subprocess.run(cmd, capture_output=True, text=True, timeout=15, **({"creationflags": subprocess.CREATE_NO_WINDOW} if os.name == "nt" else {}))
                                
                                output = proc.stdout
                                name = "Unknown"
                                total_size = "Unknown"
                                torrent_files_data = []
                                selected_indices = []
                                lines = output.splitlines()
                                file_mode = False
                                current_path = None
                                current_index = None

                                for line in lines:
                                    stripped = line.strip()
                                    if stripped.startswith("Total Length:"):
                                        total_size = stripped.split(":", 1)[1].strip()

                                    if stripped.startswith("Name:"):
                                        name = stripped.split(":", 1)[1].strip()
                                        
                                    if stripped.lower().startswith("files:"):
                                        file_mode = True
                                        continue
                                    
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
                                                
                                                if name == "Unknown":
                                                    clean_name = current_path
                                                    if clean_name.startswith("./"):
                                                        clean_name = clean_name[2:]
                                                    name = clean_name.split("/")[0] if "/" in clean_name else clean_name
                                                clean_full_path = current_path
                                                if clean_full_path.startswith("./"):
                                                    clean_full_path = clean_full_path[2:]
                                                
                                                torrent_files_data.append([clean_full_path, f_size, current_index])
                                                current_path = None
                                                current_index = None
                                
                                for file_info in torrent_files_data:
                                    if file_info[2]: 
                                        selected_indices.append(file_info[2])
                                indexes_string = ",".join(selected_indices)
                                self.torrent_files_data = torrent_files_data
                                self.torrent_file_size = total_size
                                self.torrent_indices = indexes_string

                                if os.path.exists(save_path_template):
                                    shutil.rmtree(save_path_template, ignore_errors=True)
                    except subprocess.TimeoutExpired:
                        print("The process timed out while fetching metadata.")
                    except subprocess.CalledProcessError as e:
                        print(f"Aria2c crashed or returned an error: {e}")

        except Exception as e:
            print(f"Meta handling error: {e}")

    def fetch_torrent_metadata(self):
        try:
            if not self.has_fetching_metadata: return

            self.manage_torrent_metadata("load")
            self.root_node_store = Gio.ListStore(item_type=TorrentNode)
            
            if self.torrent_files_data:
                def get_or_create_dir(parent_store, dir_name, parent_node):
                    for i in range(parent_store.get_n_items()):
                        item = parent_store.get_item(i)
                        if item.is_dir and item.name == dir_name:
                            return item
                    new_dir = TorrentNode(dir_name, "", -1, is_dir=True, parent=parent_node)
                    parent_store.append(new_dir)
                    return new_dir

                for data_list in self.torrent_files_data:
                    raw_path = data_list[0]
                    size_str = data_list[1]
                    idx = int(data_list[2])

                    path_parts = raw_path.replace("\\", "/").split("/")
                    
                    current_store = self.root_node_store
                    current_parent = None

                    for i in range(len(path_parts) - 1):
                        folder_name = path_parts[i]
                        if folder_name in (".", ""): continue
                        
                        dir_node = get_or_create_dir(current_store, folder_name, current_parent)
                        current_store = dir_node.children_store
                        current_parent = dir_node

                    file_name = path_parts[-1]
                    
                    is_checked = True
                    if self.parsed_indices:
                        is_checked = idx in self.parsed_indices
                        
                    file_node = TorrentNode(file_name, size_str, idx, is_dir=False, parent=current_parent)
                    file_node._checked = is_checked 
                    current_store.append(file_node)

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

            if self.torrent_files_data:
                self.manage_torrent_metadata("save")
                GLib.idle_add(self.populate_torrent_ui)


        except Exception as e:
            print(f"Metadata Fetch Error: {e}")
            GLib.idle_add(self.status_label.set_text, self.tr("Failed to retrieve torrent info."))
        finally:
            self.has_fetching_metadata = False

    def update_counter(self):
        total_files = 0
        selected_files = 0
        total_bytes = 0
        
        def walk_stats(store):
            nonlocal total_files, selected_files, total_bytes
            n = store.get_n_items()
            for i in range(n):
                node = store.get_item(i)
                if node.is_dir:
                    walk_stats(node.children_store)
                else:
                    total_files += 1
                    if node.checked_prop:
                        selected_files += 1
                        total_bytes += self.torrent_parse_size(node.size_str)

        if hasattr(self, 'root_node_store'):
            walk_stats(self.root_node_store)
        
        if hasattr(self, 'header_count_lbl'):
            self.header_count_lbl.set_label(f"{selected_files}/{total_files} {self.tr('Selected')}")
        
        if hasattr(self, 'master_check'):
            self.master_check.blocking = True
            if total_files > 0:
                if selected_files == 0:
                    self.master_check.set_active(False)
                    self.master_check.set_inconsistent(False)
                elif selected_files == total_files:
                    self.master_check.set_active(True)
                    self.master_check.set_inconsistent(False)
                else:
                    self.master_check.set_inconsistent(True)
                    self.master_check.set_active(False) 
            
            self.master_check.blocking = False

        self.file_size_bytes = total_bytes
        size_markup = f"{self.tr('File Size:')} <b>{addOn.parse_size(self.file_size_bytes)}</b>"
        if hasattr(self, 'size_label'):
            self.size_label.set_markup(size_markup)

    def populate_torrent_ui(self):
        self.download_started = False
        while child := self.torrent_files_ui_box.get_first_child():
            self.torrent_files_ui_box.remove(child)

        header_row = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=5)
        header_row.set_margin_top(5)
        header_row.set_margin_start(16)
        self.master_check = Gtk.CheckButton()
        self.master_check.set_tooltip_text(self.tr("Select All"))
        self.master_check.blocking = False
        
        def on_master(btn):
            if getattr(btn, 'blocking', False): return
            
            state = btn.get_active()
            n = self.root_node_store.get_n_items()
            for i in range(n):
                node = self.root_node_store.get_item(i)
                node.toggle(state)
            self.update_counter()
            
        self.master_check.connect("toggled", on_master)
        
        self.header_count_lbl = Gtk.Label()
        self.header_count_lbl.add_css_class("heading")
        
        header_row.append(self.master_check)
        header_row.append(self.header_count_lbl)
        
        self.torrent_files_ui_box.append(header_row)
        self.torrent_files_ui_box.append(Gtk.Separator(orientation=Gtk.Orientation.HORIZONTAL))

        def create_model_func(item):
            return item.children_store if item.is_dir else None

        tree_model = Gtk.TreeListModel.new(self.root_node_store, False, True, create_model_func)
        self.torrent_selection_model = Gtk.NoSelection(model=tree_model)
        factory = Gtk.SignalListItemFactory()

        def setup_row(fact, list_item):
            expander = Gtk.TreeExpander()
            box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=8)
            box.set_margin_bottom(3)
            box.set_margin_top(3)
            chk = Gtk.CheckButton()
            icon = Gtk.Image()
            name = Gtk.Label(xalign=0)
            name.set_ellipsize(Pango.EllipsizeMode.END)
            name.set_hexpand(True)
            size = Gtk.Label()
            size.set_margin_end(3)
            box.append(chk); box.append(icon); box.append(name); box.append(size)
            expander.set_child(box)
            list_item.set_child(expander)

        def bind_row(fact, list_item):
            expander = list_item.get_child()
            row = list_item.get_item()
            node = row.get_item()
            expander.set_list_row(row)

            box = expander.get_child()
            box.get_parent().add_css_class("my-tree-list")
            chk = box.get_first_child()
            icon = chk.get_next_sibling()
            name = icon.get_next_sibling()
            size = name.get_next_sibling()

            name.set_label(node.name)
            name.set_tooltip_text(node.name)
            size.set_label(node.size_str)
            
            if node.is_dir:
                name.set_css_classes(["heading"])
                size.set_css_classes(["heading"])
                icon.set_from_icon_name("xsi-folder-symbolic")
            else:
                name.set_css_classes(["dim-label"])
                size.set_css_classes(["dim-label"])
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

            def on_checked_notify(n, p):
                chk.blocking = True
                chk.set_active(n.checked_prop)
                chk.blocking = False

            def on_inconsistent_notify(n, p):
                chk.blocking = True
                chk.set_inconsistent(n.inconsistent_prop)
                chk.blocking = False

            id1 = node.connect("notify::checked-prop", on_checked_notify)
            id2 = node.connect("notify::inconsistent-prop", on_inconsistent_notify)
            chk.notify_ids.extend([(node, id1), (node, id2)])

            def on_toggle(btn):
                if getattr(btn, 'blocking', False): return
                node.toggle(btn.get_active())
                self.update_counter()

            chk.sig_ids.append(chk.connect("toggled", on_toggle))

        factory.connect("setup", setup_row)
        factory.connect("bind", bind_row)

        list_view = Gtk.ListView(model=self.torrent_selection_model, factory=factory)
        scrolled = Gtk.ScrolledWindow()
        self.expander = list_view
        scrolled.set_child(list_view)
        scrolled.set_vexpand(True)
        
        self.torrent_files_ui_box.append(scrolled)
        
        self.update_counter()
        self.editFileName_entry.set_text(self.FileName)
        size_markup = f"{self.tr('File Size:')} <b>{addOn.parse_size(self.file_size_bytes)}</b>"
        GLib.idle_add(self.on_fetch_complete, size_markup, self.file_size_str, self.tr("Download"))
        
    def torrent_parse_size(self, size_str):
        if not size_str:
            return 0

        m = re.search(r"([0-9.]+)\s*([a-zA-Z]+)", size_str)
        
        if m:
            val, unit = m.groups()
            return addOn.range_parse_size(val, unit)
            
        try:
            return int(float(size_str))
        except ValueError:
            return 0


    def cleanup_torrent_unwanted_files(self):
        if not self.is_torrent or not self.torrent_indices:
            return

        selected_indices = [int(i) for i in self.torrent_indices.split(',')]
        directories_to_check = set()

        protected_paths = {
            os.path.abspath("/"),
            os.path.abspath(os.path.expanduser("~")),
            os.path.abspath(self.download_folder)
        }
        for file_info in self.current_download.files:
            if file_info.index not in selected_indices:
                file_path = os.path.join(self.download_folder, file_info.path)
                if os.path.exists(file_path):
                    try:
                        os.remove(file_path)
                        print(f"Removed ghost file: {file_path}")
                    except Exception as e:
                        print(f"Could not remove {file_path}: {e}")
                
                dir_path = os.path.dirname(file_path)
                directories_to_check.add(dir_path)

        for dir_path in sorted(directories_to_check, key=len, reverse=True):
            print(dir_path)
            if os.path.exists(dir_path) and not os.listdir(dir_path):
                try:
                    safe_dir = os.path.abspath(dir_path)
                    if safe_dir not in protected_paths:
                        os.rmdir(safe_dir)
                except Exception:
                    pass

    def prepare_ui_for_fetch(self):
        self.download_button.set_sensitive(False)
        GLib.idle_add(self.download_button.remove_css_class, "green-btn")
        GLib.idle_add(self.download_button.add_css_class, "generic-button")
        self.download_button.set_label(self.tr("Fetching Data..."))
        return False

    def on_torrent_chk_toggled(self, checkbox):
        """Called every time a user clicks a checkbox in the list."""
        self.recalculate_torrent_total_size()

    def recalculate_torrent_total_size(self):
        """Iterates through UI rows to sum up sizes of selected files."""
        new_total_bytes = 0
        selected_indices = []
        
        size_map = {f[2]: f[1] for f in self.torrent_files_data}

        for chk in self.torrent_files_box:
            if chk.get_active():
                idx = getattr(chk, 'torrent_index', None)
                size_str = size_map.get(idx, "0")
                new_total_bytes += self.torrent_parse_size(size_str)
                selected_indices.append(idx)

        self.file_size_bytes = new_total_bytes
        self.torrent_indices = ",".join(selected_indices)
        
        self.size_label.set_markup(f"{self.tr("File Size:")} <b>{addOn.parse_size(new_total_bytes)}</b>")
        
        if self.segments_count > 0:
            self.segment_size = self.file_size_bytes // self.segments_count

    def on_fetch_complete(self, size_markup, file_size_str, download_label):
        self.size_label.set_markup(size_markup)
        self.file_size_str = file_size_str
        
        self.update_resume_status()

        GLib.idle_add(self.download_button.add_css_class, "green-btn")
        GLib.idle_add(self.download_button.remove_css_class, "generic-button")
        if self.canDownload:
            GLib.idle_add(self.download_button.set_sensitive, True)
        self.download_button.set_label(download_label)

        self.create_db_entry()
        if self.auto_start:
            GLib.idle_add(self.on_download_clicked,"*_*")
        return False

    def create_db_entry(self):
        if self.download_id != -1:
            print("Resuming download ID:", self.download_id)
            cursor = self.conn.cursor()
            cursor.execute("""
                UPDATE downloads SET
                    status = ?,
                    pid = ?
                WHERE id = ?
            """, ("downloading", self.pid, self.download_id))
            self.conn.commit()
        else:
            timestamp = time.time()
            save_name = self.FileName
            if self.is_torrent or self.download_playlist:
                save_name = self.FileName.split('.')[0]
            self.create_download(save_name, addOn.parse_size(self.file_size_bytes), timestamp, self.category, self.download_folder, self.url, self.pid, self.file_size_bytes, self.segments_count, self.is_audio, self.quality_mod, self.download_playlist)

    def database(self):
        GLib.timeout_add(500, self.update_download_safe)

    def apply_css(self):
        if self.app_settings.get("language") == "ar":
            Gtk.Widget.set_default_direction(Gtk.TextDirection.RTL)
        else:
            Gtk.Widget.set_default_direction(Gtk.TextDirection.LTR)
            
        mode = self.app_settings.get("theme_mode", "Dark")
        SaveManager.load_css(mode)

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

    def build_settings_view(self):
        box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10, margin_top=20, margin_bottom=20, margin_start=20, margin_end=20)

        grid = Gtk.Grid()
        grid.set_column_spacing(12)
        grid.set_row_spacing(12)
        grid.set_margin_top(10)
        grid.set_margin_bottom(10)
        
        row = 0

        limit_label = Gtk.Label(label=self.tr("Speed Limit:"))
        limit_label.add_css_class("small-text")
        limit_label.set_halign(Gtk.Align.START)
        
        self.speed_limit_entry = Gtk.Entry()
        self.speed_limit_entry.add_css_class("small-text")
        self.speed_limit_entry.set_placeholder_text(self.tr("Speed Limit"))
        self.speed_limit_entry.add_css_class("entry")
        self.speed_limit_entry.set_text(str(int(self.limit_speed)) if self.limit_speed else "0")
        self.speed_limit_entry.set_tooltip_text(self.tr("Enter speed limit in K, e.g., 400 for 400 K"))
        self.speed_limit_entry.connect("changed", self.set_entry_text)
        self.speed_limit_entry.set_hexpand(True)

        grid.attach(limit_label, 0, row, 1, 1)
        grid.attach(self.speed_limit_entry, 1, row, 1, 1)
        row += 1

        connections_label = Gtk.Label(label=self.tr("Connections:"))
        connections_label.set_halign(Gtk.Align.START)

        adjustment = Gtk.Adjustment.new(7, 1, 10, 1, 0, 0)
        self.connections_spin = Gtk.SpinButton()
        self.connections_spin.set_adjustment(adjustment)
        self.connections_spin.set_numeric(True)
        self.connections_spin.set_value(self.segments_count)
        self.connections_spin.set_hexpand(True)
        self.connections_spin.set_tooltip_text(self.tr("Enter the maximum number of connections for downloading"))
        self.connections_spin.add_css_class("entry")
        self.connections_spin.connect("value-changed", self.on_connections_changed)

        grid.attach(connections_label, 0, row, 1, 1)
        grid.attach(self.connections_spin, 1, row, 1, 1)
        row += 1

        if self.is_torrent:
            ratio_label = Gtk.Label(label=self.tr("Seed Ratio:"))
            ratio_label.add_css_class("small-text")
            ratio_label.set_halign(Gtk.Align.START)
            
            self.seed_ratio_entry = Gtk.Entry()
            self.seed_ratio_entry.add_css_class("small-text")
            self.seed_ratio_entry.add_css_class("entry")
            self.seed_ratio_entry.set_text(self.app_settings.get("seed_ratio", "1.0"))
            self.seed_ratio_entry.set_hexpand(True)
            self.seed_ratio_entry.connect("changed", lambda e: self.app_settings.update({"seed_ratio": e.get_text()}) or SaveManager.save_settings(self.app_settings))

            grid.attach(ratio_label, 0, row, 1, 1)
            grid.attach(self.seed_ratio_entry, 1, row, 1, 1)
            row += 1

            time_label = Gtk.Label(label=self.tr("Seed Time (min):"))
            time_label.add_css_class("small-text")
            time_label.set_halign(Gtk.Align.START)
            
            self.seed_time_entry = Gtk.Entry()
            self.seed_time_entry.add_css_class("small-text")
            self.seed_time_entry.add_css_class("entry")
            self.seed_time_entry.set_text(self.app_settings.get("seed_time", "0"))
            self.seed_time_entry.set_hexpand(True)
            self.seed_time_entry.connect("changed", lambda e: self.app_settings.update({"seed_time": e.get_text()}) or SaveManager.save_settings(self.app_settings))

            grid.attach(time_label, 0, row, 1, 1)
            grid.attach(self.seed_time_entry, 1, row, 1, 1)
            row += 1

        box.append(grid)

        if not self.is_torrent:
            checksum_label = Gtk.Label(label=self.tr("Verify SHA256 Checksum:"))
            checksum_label.add_css_class("heading")
            checksum_label.set_halign(Gtk.Align.START)
            box.append(checksum_label)

            self.checksum_entry = Gtk.Entry()
            self.checksum_entry.set_placeholder_text("e.g. a591a6d40bf420404a011733cfb7b190d62c...")
            self.checksum_entry.add_css_class("entry")
            self.checksum_entry.add_css_class("small-text")
            box.append(self.checksum_entry)

        finish_label = Gtk.Label(label=self.tr("On Completion:"))
        finish_label.add_css_class("heading")
        finish_label.set_halign(Gtk.Align.START)
        box.append(finish_label)

        self.finish_options = ["Use Global Setting", "Do Nothing", "Shutdown System", "Restart System", "Suspend System", "Run Custom Command"]
        
        self.dd_finish = Gtk.DropDown.new_from_strings([self.tr(opt) for opt in self.finish_options])
        self.dd_finish.set_hexpand(True)
        
        self.local_finish_action = "Use Global Setting" 

        def on_finish_change(dd, p):
            idx = dd.get_selected()
            self.local_finish_action = self.finish_options[idx]
            self.local_cmd_box.set_visible(self.local_finish_action == "Run Custom Command")

        self.dd_finish.connect("notify::selected", on_finish_change)
        box.append(self.dd_finish)

        self.local_cmd_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=5)
        self.local_cmd_box.set_visible(False)
        
        cmd_lbl = Gtk.Label(label=self.tr("Custom Command (this download only):"), xalign=0)
        self.local_cmd_entry = Gtk.Entry()
        self.local_cmd_entry.set_placeholder_text("notify-send 'Done'")
        self.local_cmd_entry.add_css_class("entry")
        
        self.local_cmd_box.append(cmd_lbl)
        self.local_cmd_box.append(self.local_cmd_entry)
        box.append(self.local_cmd_box)

        return box

    def on_connections_changed(self, spinbutton):
        self.segments_count = spinbutton.get_value_as_int()
        self.segment_size = self.file_size_bytes // self.segments_count
        self.last_segment_size = self.file_size_bytes - (self.segment_size * (self.segments_count - 1))
        self.part_files = [self.output_file + f"-part{i}" for i in range(self.segments_count)]
        if self.download_engine == "curl":
            for pb in self.progress_bars:
                self.progress_box.remove(pb)
            self.progress_bars.clear()
            for i in range(self.segments_count):
                pb = Gtk.ProgressBar()
                pb.set_show_text(False)
                pb.set_hexpand(True)
                if i != 0:
                    pb.add_css_class("segment-line")
                self.progress_bars.append(pb)
                self.progress_box.append(pb)
            css_provider = Gtk.CssProvider()
            if self.segments_count in (8, 9, 10):
                css_data = {
                    8: b"""
                        progressbar {
                            padding: 0;
                            margin: 0;
                        }
                        progressbar trough {
                            min-width: 70px;
                            min-height: 10px;
                            border-radius: 0;
                            padding: 0;
                        }
                        progressbar progress {
                            min-height: 10px;
                            border-radius: 0;
                        }
                    """,
                    9: b"""
                        progressbar {
                            padding: 0;
                            margin: 0;
                        }
                        progressbar trough {
                            min-width: 62.2222222222px;
                            min-height: 10px;
                            border-radius: 0;
                            padding: 0;
                        }
                        progressbar progress {
                            min-height: 10px;
                            border-radius: 0;
                        }
                    """,
                    10: b"""
                        progressbar {
                            padding: 0;
                            margin: 0;
                        }
                        progressbar trough {
                            min-width: 56px;
                            min-height: 10px;
                            border-radius: 0;
                            padding: 0;
                        }
                        progressbar progress {
                            min-height: 10px;
                            border-radius: 0;
                        }
                    """,
                }
                css_provider.load_from_data(css_data[self.segments_count])
                Gtk.StyleContext.add_provider_for_display(
                    Gdk.Display.get_default(),
                    css_provider,
                    Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
                )
            print(f"Segment count updated to {self.segments_count}")

    def set_entry_text(self, entry):
        if self.entry_locked:
            return
        self.entry_locked = True
        text = entry.get_text()
        ascii_digits_only = ''.join(c for c in text if c in '0123456789')
        if ascii_digits_only:
            self.limit_speed = float(ascii_digits_only)
            GLib.idle_add(entry.set_text,ascii_digits_only)
            GLib.idle_add(entry.set_position,len(ascii_digits_only))
        self.entry_locked = False

    def build_download_view(self):
        box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10, margin_top=10, margin_bottom=10, margin_start=20, margin_end=20)
        box.set_size_request(450, -1)
        self.info_label = Gtk.Label(label=self.tr("Download Menu"))
        self.info_label.set_markup(f"<big><b>{self.tr('Download Menu')}</b></big>")
        self.info_label.set_halign(Gtk.Align.CENTER)
        box.append(self.info_label)

        grid = Gtk.Grid()
        grid.set_column_spacing(12)
        grid.set_row_spacing(10)
        grid.set_hexpand(True)

        row = 0

        if self.is_torrent:
            label = Gtk.Label(label=self.tr("Files:"))
            label.set_halign(Gtk.Align.START)
            label.set_valign(Gtk.Align.START)
            grid.attach(label, 0, row, 1, 1)

            scrolled = Gtk.ScrolledWindow()
            scrolled.set_policy(Gtk.PolicyType.EXTERNAL, Gtk.PolicyType.EXTERNAL)
            scrolled.set_min_content_height(150)
            scrolled.set_hexpand(True)
            scrolled.set_vexpand(True)
            scrolled.add_css_class("frame")
            
            self.torrent_files_ui_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=5)
            scrolled.set_child(self.torrent_files_ui_box)
            
            loading_lbl = Gtk.Label(label=self.tr("Retrieving file list..."))
            self.torrent_files_ui_box.append(loading_lbl)

            grid.attach(scrolled, 1, row, 1, 1)
            
            label = Gtk.Label(label=self.tr("File Name:"))
            label.add_css_class("small-text")
            label.set_halign(Gtk.Align.START)
            grid.attach(label, 0, row+1, 1, 1)

            self.editFileName_entry = Gtk.Entry()
            self.editFileName_entry.add_css_class("entry")
            self.editFileName_entry.add_css_class("small-text")

            self.editFileName_entry.set_text(self.FileName)
            self.editFileName_entry.set_hexpand(True)
            self.editFileName_entry.set_sensitive(False)
            self.editFileName_entry.connect("changed", self.on_filename_changed)
            self.editFileName_entry.connect("activate", self.on_download_clicked)
            grid.attach(self.editFileName_entry, 1, row+1, 1, 1)

        else:
            label = Gtk.Label(label=self.tr("File Name:"))
            label.add_css_class("small-text")
            label.set_halign(Gtk.Align.START)
            grid.attach(label, 0, row, 1, 1)

            self.editFileName_entry = Gtk.Entry()
            self.editFileName_entry.add_css_class("entry")
            self.editFileName_entry.add_css_class("small-text")

            self.editFileName_entry.set_text(self.FileName)
            self.editFileName_entry.set_hexpand(True)
            self.editFileName_entry.connect("changed", self.on_filename_changed)
            self.editFileName_entry.connect("activate", self.on_download_clicked)
            grid.attach(self.editFileName_entry, 1, row, 1, 1)

        row += 2

        label = Gtk.Label(label=self.tr("Saving to:"))
        label.add_css_class("small-text")
        label.set_halign(Gtk.Align.START)
        folder_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
        self.folder_entry = Gtk.Entry()
        self.folder_entry.connect("changed", self.on_folder_entry_changed)
        self.folder_entry.add_css_class("entry")
        self.folder_entry.add_css_class("small-text")
        self.folder_entry.set_text(self.download_folder)
        self.folder_entry.set_hexpand(True)

        folder_box.append(self.folder_entry)

        url_label = Gtk.Label(label=self.tr("File URL:"))
        url_label.add_css_class("small-text")
        url_label.set_halign(Gtk.Align.START)

        self.url_entry = Gtk.Entry()
        self.url_entry.add_css_class("small-text")
        self.url_entry.add_css_class("entry")
        self.url_entry.set_text(self.url)
        self.url_entry.set_sensitive(False)
        self.url_entry.add_css_class("monospace")
        self.url_entry.set_hexpand(True)

        # this is so fucking stupid but it works
        if self.is_torrent:
            grid.attach(url_label, 0, row, 1, 1)
            grid.attach(self.url_entry, 1, row, 1, 1)
            row += 1
            grid.attach(label, 0, row, 1, 1)
            grid.attach(folder_box, 1, row, 1, 1)
        else:
            grid.attach(label, 0, row, 1, 1)
            grid.attach(folder_box, 1, row, 1, 1)
            row += 1
            grid.attach(url_label, 0, row, 1, 1)
            grid.attach(self.url_entry, 1, row, 1, 1)

        box.append(grid)

        self.status_label = Gtk.Label(label="")
        self.status_label.add_css_class("small-text")
        box.append(self.status_label)

        save_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=20)
        save_box.set_halign(Gtk.Align.CENTER)
        self.size_label = Gtk.Label()
        self.size_label.add_css_class("small-text")
        self.size_label.set_markup(f"{self.tr('File Size:')} <b>{self.file_size_str}</b>")
        
        self.size_label.set_hexpand(True)

        self.resume_ability = Gtk.Label()
        self.resume_ability.add_css_class("small-text")
        save_box.append(self.size_label)
        save_box.append(self.resume_ability)
        self.update_resume_status(True)

        box.append(save_box)

        self.select_folder_button = Gtk.Button(label=self.tr("Choose Download Folder"))
        self.select_folder_button.add_css_class("generic-button")
        self.select_folder_button.connect("clicked", self.on_select_folder_clicked)
        box.append(self.select_folder_button)

        css_provider = Gtk.CssProvider()
        css_provider.load_from_data(b"""
            progressbar {
                padding: 0;
                margin: 0;
            }
            progressbar trough {
                min-width: 80px;
                min-height: 10px;
                border-radius: 0;
                padding: 0;
            }
            progressbar progress {
                min-height: 10px;
                border-radius: 0;
            }
        """)
        Gtk.StyleContext.add_provider_for_display(
            Gdk.Display.get_default(),
            css_provider,
            Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
        )
        self.est_time_label = Gtk.Label(label="")
        self.est_time_label.add_css_class("small-text")
        self.est_time_label.set_hexpand(True)

        self.est_time_label.set_ellipsize(Pango.EllipsizeMode.END)

        self.est_time_label.set_lines(1) 
        self.est_time_label.set_markup(f"{self.tr('Downloaded:')} <b>--:--/--:--</b> | Speed: <b>--:--</b> | ETA: <b>--:--</b>")
        self.est_time_label.set_visible(False)
        box.append(self.est_time_label)
        self.progress_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=0)
        if self.download_engine == "aria2":
            pb = Gtk.ProgressBar()
            pb.set_show_text(False)
            pb.set_hexpand(False)
            self.progress_bars.append(pb)
            self.progress_box.append(pb)
        else:
             for i in range(self.segments_count):
                pb = Gtk.ProgressBar()
                pb.set_show_text(False)
                pb.set_hexpand(False)
                if i != 0:
                    pb.add_css_class("segment-line")
                self.progress_bars.append(pb)
                self.progress_box.append(pb)

        self.progress_box.set_visible(False)
        box.append(self.progress_box)

        button_box = Gtk.Box(spacing=10)
        
        self.pause_button = Gtk.Button(label=self.tr("Pause"))
        self.pause_button.add_css_class("generic-button")
        self.pause_button.set_visible(False)
        self.pause_button.set_hexpand(True)
        self.pause_handler_id = self.pause_button.connect("clicked", self.on_pause_clicked)

        self.cancel_button = Gtk.Button(label=self.tr("Cancel"))
        self.cancel_button.add_css_class("btn_cancel")
        self.cancel_button.set_hexpand(True)
        self.cancel_button.set_visible(False)
        self.cancel_button.connect("clicked", lambda *args : GLib.idle_add(self.confirm_cancelation))

        self.openFile_button = Gtk.Button(label=self.tr("Open File"))
        self.openFile_button.add_css_class("green-btn")
        self.openFile_button.set_hexpand(True)
        self.openFile_button.set_visible(False)
        self.openFile_button.connect("clicked", self.open_file)

        button_box.append(self.download_button)
        button_box.append(self.openFile_button)
        button_box.append(self.pause_button)
        button_box.append(self.cancel_button)

        box.append(button_box)
        self.on_filename_changed(self.editFileName_entry)
        return box

    def shorten_filename(self, name: str, max_len: int = 60) -> str:
        if len(name) <= max_len:
            return name

        base, ext = os.path.splitext(name)

        if not ext:
            return name[: max_len - 1] + "…"

        keep = max_len - len(ext) - 1 
        if keep <= 0:
            return "…" + ext

        head = keep // 2
        tail = keep - head

        return f"{base[:head]}…{base[-tail:]}{ext}"

    def on_filename_changed(self, entry):
        raw_input = entry.get_text().strip()
        
        entry.remove_css_class("error")
        self.status_label.set_text("")
        
        if not raw_input:
            self.status_label.set_text(self.tr("Filename cannot be empty."))
            self.status_label.set_name("red-text")
            self.canDownload = False
            GLib.idle_add(self.download_button.set_sensitive, False)
            return

        illegal_pattern = r'[<>:"/\\|?*\x00-\x1F]'
        if re.search(illegal_pattern, raw_input):
            entry.add_css_class("error")
            self.status_label.set_text(self.tr("Filename contains invalid characters (e.g., \\ / : * ? \" < > |)."))
            self.status_label.set_name("red-text")
            entry.set_tooltip_text(self.tr("Please remove forbidden characters."))
            GLib.idle_add(self.download_button.set_sensitive, False)
            self.canDownload = False
            return
            
        if raw_input.endswith('.') or raw_input.endswith(' '):
            entry.add_css_class("error")
            self.status_label.set_text(self.tr("Filename cannot end with a space or period."))
            self.status_label.set_name("red-text")
            GLib.idle_add(self.download_button.set_sensitive, False)
            self.canDownload = False
            return

        _base, _ = os.path.splitext(raw_input)
        if not _base:
            self.status_label.set_text(self.tr("Filename cannot be empty."))
            self.status_label.set_name("red-text")
            GLib.idle_add(self.download_button.set_sensitive, False)
            self.canDownload = False
            return

        entry.set_tooltip_text(self.tr("Valid filename."))
        self.status_label.set_name("")
        GLib.idle_add(self.download_button.set_sensitive, True)
        self.canDownload = True
        
        self.FileName = _base + self.original_ext
        safe_filename = os.path.basename(self.FileName)
        self.output_file = os.path.join(self.download_folder, safe_filename)
        self.part_files = [self.output_file + f"-part{i}" for i in range(self.segments_count)]
        print("SECURE OUTPUT:", self.output_file)

    def on_folder_entry_changed(self, entry):
        path = entry.get_text().strip()
        entry.remove_css_class("error")
        
        if not path:
            return

        try:
            full_path = os.path.expanduser(path)
            if os.path.isdir(full_path):
                self.download_folder = full_path
                self.canDownload = True
                GLib.idle_add(self.download_button.set_sensitive, True)
            elif os.path.isdir(os.path.dirname(full_path)):
                entry.set_tooltip_text(self.tr("Directory does not exist. It will be created."))
                self.download_folder = full_path
                self.canDownload = True
                GLib.idle_add(self.download_button.set_sensitive, True)
            else:
                entry.add_css_class("error")
                self.status_label.set_text(self.tr("Invalid path or parent directory missing."))
                self.status_label.set_name("red-text")
                self.canDownload = False
                self.download_button.set_sensitive(False)
                
        except Exception as e:
            entry.add_css_class("error")
            self.canDownload = False
            self.download_button.set_sensitive(False)
            entry.set_tooltip_text(f"{self.tr('Invalid path')}: {str(e)}")

    def on_select_folder_clicked(self, button):
        dialog = Gtk.FileDialog()
        dialog.set_title(self.tr("Select Download Folder"))
        dialog.set_modal(True)

        def on_done(source, result, data=None):
            try:
                folder = dialog.select_folder_finish(result)
                self.download_folder = folder.get_path()
                self.folder_entry.set_text(self.download_folder)
                self.output_file = os.path.join(self.download_folder, self.FileName)
                self.part_files = [self.output_file + f"-part{i}" for i in range(self.segments_count)]
            except Exception as e:
                print("Cancelled folder select", e)

        dialog.select_folder(self, None, on_done)

    def on_download_clicked(self, button):
        if not self.download_button.get_sensitive():
            print("you think you're smart, huh?")
            return

        if not self.canDownload:
            self.status_label.set_text(self.tr("Fix filename before downloading."))
            return
        self.folder_entry.remove_css_class("error")
        self.folder_entry.remove_css_class("success")

        if self.is_torrent:
            selected_indices = []
            self.expander.set_sensitive(False)
            self.master_check.set_sensitive(False)
            def collect_indices(store):
                if not store: return
                n = store.get_n_items()
                for i in range(n):
                    node = store.get_item(i)
                    if node.is_dir:
                        collect_indices(node.children_store)
                    else:
                        if node.checked_prop:
                            selected_indices.append(str(node.index))

            if hasattr(self, 'root_node_store'):
                collect_indices(self.root_node_store)
            
            if selected_indices:
                self.torrent_indices = ",".join(selected_indices)
                self.parsed_indices = {int(i) for i in selected_indices}
                print(f"User reselected indices: {self.torrent_indices}")
                self.manage_torrent_metadata("save")
            else:
                self.status_label.set_text(self.tr("Please select at least one file."))
                return
        try:
            cursor = self.conn.cursor()
            cursor.execute("""
                UPDATE downloads SET
                    filename = ?,
                    file_directory = ?,
                    segments = ?
                WHERE id = ?
            """, (self.FileName, self.download_folder, self.segments_count, self.download_id))
            self.conn.commit()
        except Exception as e:
            print(f"Failed to update DB before download: {e}")

        if self.is_yt_dlp:
            self.lock_file = self.output_file + '.lock'
            if not os.path.exists(self.lock_file):
                open(self.lock_file, 'w').close()
            else:
                # wtf! how did you even get here!
                self.status_label.set_label(self.tr("File is Already Downloading!"))
                self.status_label.set_name("red-text")
                return
            
            self.download_started = True
            self.status_label.set_name("")
            self.is_canceled = False
            self.status_label.set_text(self.tr("Downloading Video..."))
            self.editFileName_entry.set_sensitive(False)
            self.folder_entry.set_sensitive(False)
            self.download_button.set_visible(False)
            self.select_folder_button.set_sensitive(False)
            self.pause_button.set_visible(True)
            self.cancel_button.set_visible(True)
            self.progress_box.set_visible(True)
            self.est_time_label.set_visible(True)
            self.start_time = time.time()
            self.pause_event.set()
            self.cancel_event.clear()
            self.threads = []

            t = threading.Thread(target=self.download_using_YTDLP)
            t.start()
            self.threads.append(t)
            return
        if not self.is_torrent:
            if self.download_engine == "aria2":
                if os.path.exists(self.lock_file) or (os.path.exists(self.output_file) and os.path.getsize(self.output_file) >= self.file_size_bytes):
                    self.status_label.set_markup(f'<b><span underline="low" color="#ff0026">{self.tr("File already exists.")}</span></b>')
                    self.on_shake(self.editFileName_entry)
                    return
            else:
                if os.path.exists(self.lock_file) or os.path.exists(self.output_file):
                    self.status_label.set_markup(f'<b><span underline="low" color="#ff0026">{self.tr("File already exists.")}</span></b>')
                    self.on_shake(self.editFileName_entry)
                    return

        # TO fix a really stupid bug, fucking create a lock file
        self.lock_file = self.output_file + '.lock'
        if not os.path.exists(self.lock_file):
            open(self.lock_file, 'w').close()

        self.status_label.set_name("")
        self.segment_size = self.file_size_bytes // self.segments_count
        self.download_started = True
        self.is_canceled = False
        self.status_label.set_text(self.tr("Downloading..."))
        self.editFileName_entry.set_sensitive(False)
        self.folder_entry.set_sensitive(False)
        self.download_button.set_visible(False)
        self.select_folder_button.set_sensitive(False)
        
        if self.is_supporting_range or self.is_torrent:
            self.pause_button.set_visible(True)
        
        self.cancel_button.set_visible(True)
        self.progress_box.set_visible(True)
        self.est_time_label.set_visible(True)
        self.connections_spin.set_sensitive(False)
        self.speed_limit_entry.set_sensitive(False)
        self.start_time = time.time()
        self.pause_event.set()
        self.cancel_event.clear()
        self.threads = []

        if self.is_supporting_range or self.is_torrent:
            if self.download_engine == "aria2":
                t = threading.Thread(target=self.download_using_ARIA2)
                t.start()
                self.threads.append(t)
            else:
                for i in range(self.segments_count):
                    start = i * self.segment_size
                    end = self.file_size_bytes - 1 if i == self.segments_count - 1 else (start + self.segment_size - 1)
                    t = threading.Thread(target=self.download_segment, args=(start, end, i))
                    t.start()
                    self.threads.append(t)
        else:
            for pb in self.progress_bars:
                self.progress_box.remove(pb)
            self.progress_bars.clear()
            
            pb = Gtk.ProgressBar()
            pb.set_show_text(False)
            pb.set_hexpand(True)
            self.progress_bars.append(pb)
            self.progress_box.append(pb)

            self.part_files.clear()
            self.part_files.append(self.output_file)
            
            if self.download_engine == "aria2":
                t = threading.Thread(target=self.download_using_ARIA2)
                t.start()
                self.threads.append(t)
            else:
                t = threading.Thread(target=self.download_single_thread)
                t.start()
                self.threads.append(t)

    def download_single_thread(self):        
        self.connections_spin.set_sensitive(False)
        self.status_label.set_text(self.tr("Downloading..."))
        self.start_pulsing()

        c = pycurl.Curl()
        c.setopt(c.URL, self.url)
        c.setopt(c.FOLLOWLOCATION, 1)
        c.setopt(c.NOPROGRESS, 0)
        c.setopt(c.FAILONERROR, True)
        
        c.setopt(c.BUFFERSIZE, 1024 * 32) 

        if self.user_agent: c.setopt(c.USERAGENT, self.user_agent)
        if self.cookies: c.setopt(c.COOKIEFILE, self.cookies)
        if self.referer: c.setopt(c.REFERER, self.referer)
        
        if self.limit_speed:
            try:
                speed_val = int(self.limit_speed)
                if speed_val > 0:
                    c.setopt(c.MAX_RECV_SPEED_LARGE, speed_val * 1024)
            except ValueError:
                pass

        last_update_time = 0

        def progress_callback(dltotal, dlnow, ultotal, ulnow):
            nonlocal last_update_time
            
            if self.cancel_event.is_set() or not self.pause_event.is_set():
                return 1

            current_time = time.time()
            if current_time - last_update_time > 0.2:
                last_update_time = current_time
                self.calculate_time(dlnow)

        c.setopt(c.XFERINFOFUNCTION, progress_callback)

        try:
            with open(self.output_file, "wb") as f:
                c.setopt(c.WRITEDATA, f)
                c.perform()
                
        except pycurl.error as e:
            err_code, err_msg = e.args[0], e.args[1]
            
            if err_code == pycurl.E_ABORTED_BY_CALLBACK:
                print("Download paused cleanly by user.")
                return 
            else:
                print(f"PycURL Error {err_code}: {err_msg}")
                if "resolve" in str(err_msg).lower() or "timeout" in str(err_msg).lower() or "connect" in str(err_msg).lower():
                    GLib.idle_add(self.download_button.add_css_class, "btn_cancel")
                    GLib.idle_add(self.download_button.set_label, self.tr("No internet connection. Please reconnect"))
                
                GLib.idle_add(self.reset_ui)
                if os.path.exists(self.lock_file):
                    try: os.remove(self.lock_file)
                    except: pass
                return
        finally:
            c.close()
            self.stop_pulsing()

        with self.lock:
            GLib.idle_add(self.on_segment_finished)
            
    def resume_download_segment(self, start, end, index):
        if not self.is_connected():
            self.reset_ui()
            GLib.idle_add(self.download_button.add_css_class, "btn_cancel")
            GLib.idle_add(self.download_button.set_label, self.tr("No internet connection. Please reconnect"))
            print("No internet connection. Please reconnect")
            if os.path.exists(self.lock_file):
                os.remove(self.lock_file)
            return

        self.connections_spin.set_sensitive(False)
        part_file = self.part_files[index]
        resume_from = start
        already_downloaded = 0
        
        headers = {'Range': f'bytes={resume_from}-{end}'}
        try:
            with requests.get(self.url, stream=True, headers=headers) as r:
                if r.status_code != 206:
                    print(f"Server did not honor Range header for part {index}")
                    return
                with open(part_file, 'ab') as f:
                    downloaded_this_session = 0
                    for chunk in r.iter_content(chunk_size=8192):
                        if self.cancel_event.is_set():
                            if os.path.exists(self.lock_file):
                                os.remove(self.lock_file)
                            return
                        while not self.pause_event.is_set():
                            GLib.usleep(100_000)
                            return
                        if chunk:
                            f.write(chunk)
                            downloaded_this_session += len(chunk)

                            total_downloaded = already_downloaded + downloaded_this_session
                            total_part_size = end - start + 1

                            GLib.idle_add(self.progress_bars[index].set_fraction, total_downloaded / total_part_size)

                            all_downloaded = sum(os.path.getsize(p) if os.path.exists(p) else 0 for p in self.part_files)
                            
                            self.calculate_time(all_downloaded)

                            if total_downloaded >= total_part_size:
                                break
        except Exception as e:
            print("Network error:", e)

        with self.lock:
            GLib.idle_add(self.on_segment_finished)

    def download_segment(self, start, end, index):
        if not self.is_connected():
            self.handle_disconnect()
            return
        self.download_using_CURL(start, end, index)
        
    #fuck you curl (jk)!
    def download_using_ARIA2(self):
        self.connections_spin.set_sensitive(False)

        for pb in self.progress_bars:
            self.progress_box.remove(pb)
        self.progress_bars.clear()

        pb = Gtk.ProgressBar()
        pb.set_show_text(False)
        pb.set_hexpand(True)
        self.progress_bars.append(pb)
        self.progress_box.append(pb)
        GLib.idle_add(self.progress_bars[0].set_fraction, float(self.progress) /100)
        found = False
        while not found:
            rpc_port_candidates = random.randint(7000, 9001)
            torrent_listening_port_candidates = random.randint(40000, 50000)

            if self.is_port_free(rpc_port_candidates) and self.is_port_free(torrent_listening_port_candidates):
                self.rpc_port = rpc_port_candidates
                self.torrent_listening_port = torrent_listening_port_candidates
                found = True
        self.rpc_secret = os.urandom(16).hex()
        
        if self.is_torrent:
            self.status_label.set_text(self.tr("Checking Integrity..."))
            GLib.idle_add(self.progress_bars[0].set_fraction, 1.0)
            self.progress_bars[0].add_css_class("dashed-bar")
            cmd = [
                addOn.FireFiles.aria2c_path,
                "--enable-rpc",
                f"--rpc-listen-port={self.rpc_port}",
                f"--rpc-secret={self.rpc_secret}",
                f"--dht-listen-port={torrent_listening_port_candidates}",
                f"--listen-port={torrent_listening_port_candidates}",
                "--enable-dht=true",
                "--bt-enable-lpd=true",
                "--peer-id-prefix=-qb6969-",
                "--enable-mmap=true",
                "--file-allocation=none",
                "--check-integrity=true",
                "--pause-metadata=true",
                "-d", self.download_folder,
            ]
            if self.app_settings.get("seed_limiting"):
                ratio = self.app_settings.get("seed_ratio", "1.0")
                seed_time = self.app_settings.get("seed_time", "0")
                cmd.append(f"--seed-ratio={ratio}")
                cmd.append(f"--seed-time={seed_time}")
            if self.custom_trackers:
                cmd.append(f"--bt-tracker={self.custom_trackers}")
        else:
            cmd = [
                addOn.FireFiles.aria2c_path,
                "--continue=true",
                "--enable-rpc",
                f"--rpc-listen-port={self.rpc_port}",
                f"--rpc-secret={self.rpc_secret}",
                "--file-allocation=none",
                "--enable-mmap=true",
                f"--save-session={os.devnull}",
                f"--input-file={os.devnull}",
                "-d", self.download_folder
            ]
            if self.is_supporting_range:
                cmd.extend([
                    f"-x{self.segments_count}",
                    f"-s{self.segments_count}"
                ])
            else:
                self.start_pulsing()
                cmd.extend([
                    "-x1",
                    "-s1",
                    "--allow-overwrite=true",
                    "--continue=false"
                ])
                            
            if self.cookies:
                clean_cookies = self.cookies.replace('\n', '').replace('\r', '').strip()
                cmd.append(f"--header=Cookie: {clean_cookies}")
            if self.user_agent: cmd.append(f"--user-agent={self.user_agent}")
            if self.referer: cmd.append(f"--referer={self.referer}")

        if self.limit_speed > 0:
            cmd.append(f"--max-download-limit={int(self.limit_speed)}K")

        self.aria_proc = subprocess.Popen(cmd, **({"creationflags": subprocess.CREATE_NO_WINDOW} if os.name == "nt" else {}))

        def connect_aria():
            retries = 10
            last_error = None
            from aria2p import Client, API 
            
            while retries > 0:
                try:
                    client = API(
                        Client(
                            host="http://127.0.0.1",
                            port=int(self.rpc_port),
                            secret=str(self.rpc_secret) if self.rpc_secret else ""
                        )
                    )
                    client.get_global_options() 
                    return client
                
                except Exception as e:
                    last_error = e
                    time.sleep(0.2)
                    retries -= 1
                    
            print(f"Aria2 Connection Failed! Last error was: {repr(last_error)}")
            return None

        t = threading.Thread(target=self._init_aria_download, args=(connect_aria,), daemon=True)
        t.start()
        self.threads.append(t)

    def _init_aria_download(self, connect_func):
        """Helper to initialize download after process starts"""
        self.aria_client = connect_func()
        if not self.aria_client:
            print("aria2c_path ", addOn.FireFiles.aria2c_path)
            print("Failed to connect to Aria2 RPC")
            if self.aria_proc:
                self.aria_proc.terminate()
            GLib.idle_add(self.download_button.add_css_class, "btn_cancel")
            GLib.idle_add(self.status_label.set_text, f"{self.tr('Connection Error')}(RPC)")
            GLib.idle_add(self.reset_ui)
            return

        try:
            options = {}
            if self.is_torrent:
                if self.torrent_indices:
                    options['select-file'] = self.torrent_indices
            else:
                output_path = os.path.join(self.download_folder, self.FileName)
                self.aria2_control = output_path + ".aria2"
                can_resume = (
                    os.path.exists(output_path) and
                    os.path.exists(self.aria2_control)
                )

                options["out"] = self.FileName
                options["continue"] = "true" if can_resume else "false"
                options["split"] = str(self.segments_count) if self.is_supporting_range else "1"
                options["max-connection-per-server"] = str(self.segments_count) if self.is_supporting_range else "1"

            self.current_download = self.aria_client.add_uris([self.url], options=options)
            
            if os.path.exists(self.output_file):
                try:
                    current_size = os.path.getsize(self.output_file)
                    total_size = self.file_size_bytes
                    start_progress = int((current_size / total_size) * 100) if total_size > 0 else 0
                    
                    GLib.idle_add(
                        self.est_time_label.set_markup,
                        f"<span font_features='tnum=1'>"
                        f"{self.tr('Downloaded:')} <b>{addOn.parse_size(current_size)}/{addOn.parse_size(total_size)}</b> | "
                        f"{self.tr('Progress:')} <b>{start_progress}%</b> | "
                        f"{self.tr('Speed:')} <b>--</b> | "
                        f"ETA: <b>{self.eta_str}</b>"
                        f"</span>"
                    )
                    
                except OSError:
                    pass

            self.download_started = True
            self.monitor_aria_rpc()

        except Exception as e:
            print(f"Error adding download: {e}")
            if self.aria_proc:
                self.aria_proc.terminate()
                GLib.idle_add(self.download_button.add_css_class, "btn_cancel")
            GLib.idle_add(self.status_label.set_text, self.tr("Error adding download"))
            GLib.idle_add(self.reset_ui)
    
    def monitor_aria_rpc(self):
        try:
            UI_speed = ""
            UI_size_str = ""
            start_val = 0
            for pb in self.progress_bars:
                if pb.get_parent() == self.progress_box:
                    self.progress_box.remove(pb)
            self.progress_bars.clear()
            
            pb = Gtk.ProgressBar()
            pb.set_show_text(False)
            pb.set_hexpand(True)
            self.progress_bars.append(pb)
            self.progress_box.append(pb)
            start_val = 0
            try:
                start_val = float(self.progress) / 100.0
            except (ValueError, TypeError):
                start_val = 0.0

            self.current_fraction = start_val
            self.target_fraction = start_val
            new_target = 0
            self.animation_source_id = None
            GLib.idle_add(pb.set_fraction, self.current_fraction)

            GLib.idle_add(self.cancel_button.set_label, self.tr("Cancel"))

            while True:
                while not self.pause_event.is_set():
                    if os.path.exists(self.lock_file):
                        try: os.remove(self.lock_file)
                        except: pass
                    self.aria_proc.terminate()
                    return

                try:
                    self.current_download.update()
                except Exception as e:
                    print(f"Update error: {e}")
                    if os.path.exists(self.lock_file):
                        try: os.remove(self.lock_file)
                        except: pass
                    self.aria_proc.terminate()
                    break

                status = self.current_download.status
                
                if status == "complete" and self.current_download.followed_by_ids:
                    print("Metadata downloaded. Switching to actual torrent download...")
                    self.update_download("Verifying Checksum", "--", "--", "--")
                    new_gid = self.current_download.followed_by_ids[0]
                    
                    if hasattr(self, 'torrent_indices') and self.torrent_indices:
                        try:
                            self.aria_client.client.change_option(new_gid, {'select-file': str(self.torrent_indices)})
                            print(f"Successfully applied select-file indices: {self.torrent_indices}")
                        except Exception as e:
                            print(f"Failed to set select-file on followed download: {e}")

                    try:
                        self.aria_client.client.unpause(new_gid)
                    except Exception as e:
                        print(f"Failed to unpause followed download: {e}")

                    self.current_download = self.aria_client.get_download(new_gid)
                    if self.current_download.name:
                        self.FileName = os.path.basename(self.current_download.name)
                        GLib.idle_add(self.editFileName_entry.set_text, self.FileName)
                    continue

                aria_completed = self.current_download.completed_length
                total_len = self.current_download.total_length

                if total_len > 0:
                    self.progress = min(100.0, round((aria_completed / total_len) * 100, 1))
                else:
                    self.progress = 0.0

                if total_len > 0:
                    self.progress = round((aria_completed / total_len) * 100, 1)
                else:
                    self.progress = 0.0

                self.size_str = addOn.parse_size(aria_completed)

                is_seeding = self.current_download.seeder and status == "active" and self.progress >= 100

                if is_seeding:
                    self.is_completed = True
                    if not self.is_seeding:
                        self.cleanup_torrent_unwanted_files()

                    self.is_seeding = True
                    peers = self.current_download.connections
                    seeders = self.current_download.num_seeders
                    if self.app_settings.get("disable_seeding", False):
                        print("hit and run!")
                        break
                    uploaded = self.current_download.upload_length
                    completed = self.current_download.completed_length
                    ratio = uploaded / completed if completed > 0 else 0.0
                    
                    up_speed_str = self.current_download.upload_speed_string()

                    uploaded_str = addOn.parse_size(uploaded)

                    GLib.idle_add(self.status_label.set_markup, f"<b><span foreground='#00ACC1'>{self.tr('Seeding')}...</span></b> ({self.tr('Ratio')}: {ratio:.2f})")
                    GLib.idle_add(self.progress_bars[0].set_fraction, 1.0)
                    self.progress_bars[0].add_css_class("dashed-bar")
                    
                    markup_text = (
                        f"{self.tr('Seeding')} | "
                        f"{self.tr('Up Speed')}: <b>{up_speed_str}</b> | "
                        f"{self.tr('Uploaded')}: <b>{uploaded_str}</b> | "
                        f"{self.tr('Peers:')} <b>{peers}</b> | {self.tr('Seeds:')} <b>{seeders}</b>"
                    )
                    GLib.idle_add(self.est_time_label.set_markup, markup_text)
                    if self.pause_button.get_label() != self.tr("Start Seeding"):
                        self.update_download("Seeding", "--", "--", "--", finished_downloading=True)
                    
                    if self.pause_button.get_label() != self.tr("Stop Seeding"):
                        if self.pause_handler_id and self.pause_button.handler_is_connected(self.pause_handler_id):
                            self.pause_button.disconnect(self.pause_handler_id)
                            self.pause_handler_id = None
                        self.download_started = False
                        self.pause_button.connect("clicked", self.on_stop_seeding_clicked)
                        GLib.idle_add(self.pause_button.set_label, self.tr("Stop Seeding"))
                        GLib.idle_add(self.download_button.set_visible, False)
                        GLib.idle_add(self.cancel_button.set_visible, False)
                        GLib.idle_add(self.openFile_button.set_visible, True)

                else:
                    self.speed_str = self.current_download.download_speed_string() 
                    self.eta_str = self.current_download.eta_string()
                    self.size_str = self.current_download.completed_length_string()
                        
                    if status == "complete":
                        output_path = os.path.join(self.download_folder, self.FileName)
                        if os.path.exists(output_path):
                            break 
                        else:
                            aria_name = self.current_download.name
                            if aria_name:
                                possible_path = os.path.join(self.download_folder, aria_name)
                                if os.path.exists(possible_path):
                                    self.FileName = aria_name
                                    break
                            status = "error"

                    if status == "error":
                        print(f"Aria2 Error: {self.current_download.error_message}")
                        GLib.idle_add(self.status_label.set_text, self.tr("Error Occurred"))
                        def set_error_ui():
                            self.reset_ui()
                            GLib.idle_add(self.download_button.add_css_class, "btn_cancel")
                            self.download_button.set_label(self.tr("Retry"))
                        GLib.idle_add(set_error_ui)
                        return
                    if status == "active" and (self.is_supporting_range or self.is_torrent):
                        curr_conns = int(getattr(self.current_download, "connections", 0) or 0)
                        curr_speed = int(getattr(self.current_download, "download_speed", 0) or 0)
                        ver_len = int(getattr(self.current_download, "verified_length", 0) or 0)
                        total_len = int(getattr(self.current_download, "total_length", 0) or 1)
                        
                        status_text = ""
                        is_verifying = False
                        if curr_conns == 0 and curr_speed == 0:
                            if ver_len > 0:
                                status_text = self.tr("Waiting to Verify...")
                            else:
                                if self.progress == 0:
                                    status_text = self.tr("Searching for Peers...")
                                else:
                                    status_text = self.tr("Stalled / No Peers")
                            is_verifying = True
                            self.update_download("Verifying Checksum", "--", "--", "--")
                            GLib.idle_add(self.progress_bars[0].add_css_class, "dashed-bar")
                            GLib.idle_add(self.progress_bars[0].set_fraction, 1.0)
                        else:
                            status_text = self.tr("Downloading...")
                            self.progress_bars[0].remove_css_class("dashed-bar")
                            is_verifying = False

                        if self.status_label.get_text() != status_text:
                            self.status_label.set_text(status_text)

                        if self.is_torrent:
                            total_str = self.file_size_bytes
                        else:
                            total_str = self.current_download.total_length_string()
                        
                        if not self.update_once:
                            if not self.is_torrent:
                                x = total_str.replace(" ", "")
                                m = re.compile(r"([0-9.]+)([KMG]i?)B", re.I).search(x)
                                if m:
                                    val, unit = m.groups()
                                    parsed_total_str = addOn.range_parse_size(val, unit)
                                    self.UI_total_size = addOn.parse_size(parsed_total_str)
                                    self.update_once = True
                                else:
                                    self.UI_total_size = total_str
                            else:
                                self.UI_total_size = addOn.parse_size(total_str)
                                self.update_once = True
                        
                        UI_size_str, UI_speed = self.get_parsed_UI()
                        if not is_verifying:
                            if curr_speed <= 0:
                                continue
                            new_target = self.progress / 100.0
                            
                            if new_target != self.target_fraction:
                                self.target_fraction = new_target
                                if self.animation_source_id is None:
                                    self.animation_source_id = GLib.timeout_add(16, self._animate_progress)
                            
                            GLib.idle_add(
                                self.est_time_label.set_markup,
                                f"<span font_features='tnum=1'>"
                                f"{self.tr('Downloaded:')} <b>{UI_size_str}/{self.UI_total_size}</b> | "
                                f"{self.tr('Progress:')} <b>{self.progress:.0f}%</b> | "
                                f"{self.tr('Speed:')} <b>{UI_speed}</b> | "
                                f"ETA: <b>{self.eta_str}</b>"
                                f"</span>"
                            )
                        else:
                            ver_percent = (ver_len / total_len) * 100
                            self.update_download("Verifying Checksum", "--", "--", "--")
                            GLib.idle_add(self.est_time_label.set_markup, f"{self.tr('Verifying Checksum')} <b><span font_features='tnum=1'>{ver_percent:.1f}%</span></b>")
                    else:
                        UI_size_str = self.size_str
                        UI_speed = self.speed_str
                        UI_size_str, UI_speed = self.get_parsed_UI()
                        GLib.idle_add(
                            self.est_time_label.set_markup,
                            f"{self.tr('Downloaded:')} <b><span font_features='tnum=1'>{UI_size_str}</span></b>| {self.tr('Speed:')} <b><span font_features='tnum=1'>{UI_speed}</span></b> | ETA: <b>--:--</b>"
                        )
                time.sleep(0.1)

        except Exception as e:
            print(f"Monitor Loop Crash: {e}")
        
        finally:
            if self.aria_proc:
                self.aria_proc.terminate()
                try:
                    self.aria_proc.wait(timeout=1)
                except subprocess.TimeoutExpired:
                    self.aria_proc.kill()
            
            if self.current_download: 
                is_finished_seeding = getattr(self.current_download, 'seeder', False)
                if is_finished_seeding or self.current_download.status == "complete":
                    with self.lock:
                        if not self.is_torrent: GLib.idle_add(self.on_download_finished)

    def download_using_CURL(self, start, end, index):
        for bar in self.progress_bars:
            bar.set_hexpand(True)
        self.connections_spin.set_sensitive(False)
        
        part_file = self.part_files[index]
        total_part_size = end - start + 1
        
        if not hasattr(self, 'segment_progress'):
            self.segment_progress = {}

        while True:
            if self.cancel_event.is_set():
                return

            already_downloaded = os.path.getsize(part_file) if os.path.exists(part_file) else 0
            
            if already_downloaded >= total_part_size:
                break

            resume_from = start + already_downloaded

            c = pycurl.Curl()
            c.setopt(c.URL, self.url)
            c.setopt(c.FOLLOWLOCATION, 1)
            c.setopt(c.NOPROGRESS, 0)
            c.setopt(c.FAILONERROR, True)
            c.setopt(c.FORBID_REUSE, 1)
            c.setopt(c.BUFFERSIZE, 1024 * 128)
            
            c.setopt(c.RANGE, f"{resume_from}-{end}")
            
            if self.user_agent: c.setopt(c.USERAGENT, self.user_agent)
            if self.cookies: c.setopt(c.COOKIEFILE, self.cookies)
            if self.referer: c.setopt(c.REFERER, self.referer)
            
            if self.limit_speed:
                try:
                    speed_val = int(self.limit_speed)
                    if speed_val > 0:
                        c.setopt(c.MAX_RECV_SPEED_LARGE, speed_val * 1024)
                except ValueError:
                    pass

            last_update_time = 0

            def progress_callback(dltotal, dlnow, ultotal, ulnow):
                nonlocal last_update_time

                if self.cancel_event.is_set() or not self.pause_event.is_set():
                    return 1

                current_total = already_downloaded + dlnow
                self.segment_progress[index] = current_total

                current_time = time.time()
                if current_time - last_update_time > 0.2:
                    last_update_time = current_time
                    
                    fraction = min(current_total / total_part_size, 1.0)
                    GLib.idle_add(self.progress_bars[index].set_fraction, fraction)
                    try:
                        all_downloaded = sum(self.segment_progress.values())
                        self.calculate_time(all_downloaded)
                    except Exception:
                        pass

            c.setopt(c.XFERINFOFUNCTION, progress_callback)

            try:
                with open(part_file, "ab") as f:
                    c.setopt(c.WRITEDATA, f)
                    c.perform()
                    
            except pycurl.error as e:
                err_code, err_msg = e.args[0], e.args[1]
                
                if err_code == pycurl.E_ABORTED_BY_CALLBACK:
                    print("Download paused cleanly by user.")
                    return 
                else:
                    print(f"PycURL Error {err_code}: {err_msg}")
                    if "resolve" in str(err_msg).lower() or "timeout" in str(err_msg).lower() or "connect" in str(err_msg).lower():
                        GLib.idle_add(self.download_button.add_css_class, "btn_cancel")
                        GLib.idle_add(self.download_button.set_label, self.tr("No internet connection. Please reconnect"))
                    
                    GLib.idle_add(self.reset_ui)
                    if os.path.exists(self.lock_file):
                        try: os.remove(self.lock_file)
                        except: pass
                    return
            finally:
                c.close()

        with self.lock:
            GLib.idle_add(self.on_segment_finished)

    def download_using_YTDLP(self):
        self.connections_spin.set_sensitive(False)
        for pb in self.progress_bars:
            if pb.get_parent() == self.progress_box:
                self.progress_box.remove(pb)
        self.progress_bars.clear()
        
        pb = Gtk.ProgressBar()
        pb.set_show_text(False)
        pb.set_hexpand(True)
        self.progress_bars.append(pb)
        self.progress_box.append(pb)
        start_val = 0
        try:
            start_val = float(self.progress) / 100.0
        except (ValueError, TypeError):
            start_val = 0.0

        self.current_fraction = start_val
        self.target_fraction = start_val
        self.animation_source_id = None
        pb.set_fraction(self.current_fraction)
        base_name = os.path.splitext(self.FileName)[0]
        target_ext = os.path.splitext(self.FileName)[1].replace(".", "").lower()
        if not target_ext: target_ext = "mp4"
        paths = {'home': self.download_folder}
        outtmpl = f"{base_name}.%(ext)s"

        if self.download_playlist:
            folder_name = os.path.splitext(self.FileName)[0]
            paths['home'] = os.path.join(self.download_folder, folder_name)
            outtmpl = "%(title)s.%(ext)s"

        def progress_hook(d):
            if self.cancel_event.is_set() or not self.pause_event.is_set():
                raise yt_dlp.utils.DownloadError("Cancelled by user")

            if d['status'] == 'downloading':
                GLib.idle_add(self.progress_bars[0].remove_css_class, "dashed-bar")
                
                if self.download_playlist:
                    GLib.idle_add(self.status_label.set_text, self.tr("Downloading Playlist..."))
                else:
                    GLib.idle_add(self.status_label.set_text, self.tr("Downloading Video..."))

                total = d.get('total_bytes') or d.get('total_bytes_estimate') or 0
                downloaded = d.get('downloaded_bytes', 0)
                
                if total > 0:
                    new_target = downloaded / total
                    percent = new_target * 100
                    self.progress = float(percent)
                    if new_target != self.target_fraction:
                        self.target_fraction = new_target
                        
                        if self.animation_source_id is None:
                            self.animation_source_id = GLib.timeout_add(16, self._animate_progress)
                else:
                    percent = 0
                    self.progress = 0.0

                def strip_ansi(text):
                    return re.sub(r'\x1b\[[0-9;]*m', '', str(text)).strip()

                self.speed_str = strip_ansi(d.get('_speed_str', '--'))
                self.eta_str = strip_ansi(d.get('_eta_str', '--'))
                
                playlist_info = ""
                if self.download_playlist and 'info_dict' in d:
                    idx = d.get('info_dict', {}).get('playlist_index', '?')
                    count = d.get('info_dict', {}).get('n_entries', '?')
                    playlist_info = f"<b>{self.tr('Item')} {idx}/{count}</b> | "

                total_str = addOn.parse_size(total)
                down_str = addOn.parse_size(downloaded)

                GLib.idle_add(
                    self.est_time_label.set_markup,
                    f"{playlist_info}{self.tr('Downloaded')}: <span font_features='tnum=1'><b>{down_str}/{total_str}</b> ({percent:.1f}%)</span> | "
                    f"{self.tr('Speed')}: <span font_features='tnum=1'><b>{self.speed_str}</b></span> | "
                    f"ETA: <span font_features='tnum=1'><b>{self.eta_str}</b></span>"
                )

            elif d['status'] == 'finished':
                GLib.idle_add(self.progress_bars[0].add_css_class, "dashed-bar")
                GLib.idle_add(self.progress_bars[0].set_fraction, 1.0)
                GLib.idle_add(self.status_label.set_text, self.tr("Converting / Merging..."))
        
        rate_limit_bytes = (self.limit_speed * 1024) if self.limit_speed > 0 else None
        ydl_opts = {
            'outtmpl': outtmpl,
            'paths': paths,
            'ffmpeg_location': addOn.FireFiles.ffmpeg_path,
            'progress_hooks': [progress_hook],
            'noplaylist': not self.download_playlist,
            'concurrent_fragment_downloads': self.segments_count,
            'quiet': True,
            'no_warnings': True,
            'ratelimit': rate_limit_bytes,
            'cachedir': False,
            'extractor_args': {
                'youtube': ['player_client=android,web']
            },
            'http_headers': {
                'User-Agent': self.user_agent if self.user_agent else 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
            }
        }

        if self.is_audio:
            valid_audio_codecs = {'mp3', 'm4a', 'wav', 'flac', 'opus', 'aac', 'vorbis', 'alac'}
            
            audio_codec = target_ext
            if audio_codec not in valid_audio_codecs:
                if audio_codec == "mp4": audio_codec = "m4a"
                else: audio_codec = "mp3"

            fmt = "bestaudio/best"
            audio_quality_map = {"High": 160, "Medium": 128, "Low": 96}
            abr = audio_quality_map.get(self.quality_mod)
            if abr: fmt = f"bestaudio[abr<={abr}]/bestaudio"
            
            ydl_opts['format'] = fmt
            ydl_opts['postprocessors'] = [{
                'key': 'FFmpegExtractAudio',
                'preferredcodec': audio_codec,
            }]
        else:
            requires_reencoding = target_ext in ['mov', 'avi', 'flv']
            if requires_reencoding:
                ydl_opts['merge_output_format'] = 'mkv'

                ydl_opts['postprocessors'] = [{
                    'key': 'FFmpegVideoConvertor', 
                    'preferedformat': target_ext
                }]

                ydl_opts['postprocessor_args'] = {
                    'FFmpegVideoConvertor': ['-c:v', 'libx264', '-c:a', 'aac']
                }
            else:
                ydl_opts['merge_output_format'] = target_ext
                
                if self.quality_mod == "Best Available":
                    fmt = "bestvideo+bestaudio/best"
                else:
                    res_map = {"4K": 2160, "1080p": 1080, "720p": 720, "480p": 480}
                    res = res_map.get(self.quality_mod, self.quality_mod)
                    fmt = f"bestvideo[height<={res}]+bestaudio/best[height<={res}]"

                ydl_opts['format'] = fmt
                
                ydl_opts['postprocessors'] = [{
                    'key': 'FFmpegVideoConvertor', 
                    'preferedformat': target_ext
                }]

        try:
            with yt_dlp.YoutubeDL(ydl_opts) as ydl:
                ydl.download([self.url])
                
            with self.lock:
                GLib.idle_add(self.on_download_finished)

        except yt_dlp.utils.DownloadError as e:
            err_msg = str(e)
            if "Cancelled by user" in err_msg:
                print("Download Cancelled")
            else:
                print(f"YTDLP Error: {e}")
                GLib.idle_add(self.status_label.set_text, self.tr("Error during YouTube download"))
                
        except Exception as e:
            print(f"Critical Error: {e}")

    def _animate_progress(self):
        diff = self.target_fraction - self.current_fraction
        
        if abs(diff) < 0.001:
            self.current_fraction = self.target_fraction
            self.progress_bars[0].set_fraction(self.current_fraction)
            self.animation_source_id = None 
            return False
        self.current_fraction += diff * 0.1
        
        self.progress_bars[0].set_fraction(self.current_fraction)
        return True

    def verify_checksum(self):
        target_hash = self.checksum_entry.get_text().strip().lower()
        if not target_hash:
            return

        GLib.idle_add(self.status_label.set_text, self.tr("Verifying Checksum..."))
        
        t = threading.Thread(target=self._run_sha256_calc, args=(target_hash,))
        t.start()

    def _run_sha256_calc(self, target_hash):
        file_path = os.path.join(self.download_folder, self.FileName)
        
        if not os.path.exists(file_path):
            GLib.idle_add(self.status_label.set_markup, f"<span foreground='red'>{self.tr('File not found for verification')}</span>")
            return

        sha256_hash = hashlib.sha256()
        try:
            with open(file_path, "rb") as f:
                for byte_block in iter(lambda: f.read(4096), b""):
                    sha256_hash.update(byte_block)
            
            calculated_hash = sha256_hash.hexdigest()
            
            if calculated_hash == target_hash:
                GLib.idle_add(self.status_label.set_markup, f"<b>{self.tr('Checksum Verified')}</b>")
                GLib.idle_add(self.status_label.set_name, "green-text")
            else:
                print(f"Hash Mismatch! Expected: {target_hash}, Got: {calculated_hash}")
                GLib.idle_add(self.status_label.set_markup, f"<b>{self.tr('Checksum Mismatch')}</b>")
                GLib.idle_add(self.status_label.set_name, "red-text")
                
        except Exception as e:
            print(f"Checksum error: {e}")
            GLib.idle_add(self.status_label.set_text, self.tr("Error during verification"))

    def normalize_youtube_url(self, url):
        try:
            if "v=" in url:
                return "https://www.youtube.com/watch?v=" + url.split("v=")[1].split("&")[0]
            elif "youtu.be" in url:
                return url
        except IndexError:
            pass
        return url

    def handle_disconnect(self):
        self.reset_ui()
        GLib.idle_add(self.download_button.add_css_class, "btn_cancel")
        GLib.idle_add(self.download_button.set_label, self.tr("No internet connection. Please reconnect"))
        print("No internet connection. Please reconnect")

    def on_segment_finished(self):
        if self.is_supporting_range:
            self.completed_threads += 1
            if self.completed_threads == self.segments_count:
                self.progress = 100
                self.merge_segments()
        else:
            GLib.idle_add(self.on_download_finished)

    def start_pulsing(self):
        self.pulsing = True
        self.progress_bars[0].set_pulse_step(0.1)
        GLib.timeout_add(100, self.pulse_bar)

    def stop_pulsing(self):
        self.pulsing = False

    def pulse_bar(self):
        if self.pulsing:
            self.progress_bars[0].pulse()
            return True
        return False

    def start_merge_thread(self):
        try:
            if self.download_engine == "curl":
                if self.is_supporting_range:
                    actual_total = sum(os.path.getsize(p) for p in self.part_files if os.path.exists(p))
                    if self.file_size_bytes > 0 and actual_total < self.file_size_bytes:
                        raise Exception(f"Corrupt parts detected! Expected {self.file_size_bytes} bytes, got {actual_total}.")

                with open(self.output_file, 'wb') as out_file:
                    for part in sorted(self.part_files, key=lambda x: int(x.split('-part')[-1])):
                        if not os.path.exists(part):
                            raise Exception(f"Missing part file: {part}")
                        with open(part, 'rb') as pf:
                            shutil.copyfileobj(pf, out_file) 
                
                for part in self.part_files:
                    if os.path.exists(part):
                        try: os.remove(part)
                        except: pass
                
                GLib.idle_add(self.on_download_finished)
                return

            aria_file = self.output_file + ".aria2"
            if os.path.exists(aria_file):
                try: os.remove(aria_file)
                except: pass
            
            GLib.idle_add(self.on_download_finished)

        except Exception as e:
            print(f"Merge Error: {e}")
            GLib.idle_add(self.status_label.set_text, f"{self.tr('Merge Error:')} {e}")
            GLib.idle_add(self.status_label.set_name, "red-text")
            GLib.idle_add(self.download_button.add_css_class, "btn_cancel")
            GLib.idle_add(self.download_button.set_label, self.tr("Failed - Check Log"))

    def merge_segments(self):
        self.is_paused = True
        self.is_completed = True
        self.pause_button.set_visible(False)
        self.cancel_button.set_visible(False)
        self.progress_box.set_visible(False)
        self.est_time_label.set_visible(False)
        self.status_label.set_text(self.tr("Finishing up..."))
        merge_thread = threading.Thread(target=self.start_merge_thread)
        merge_thread.start()

    def on_download_finished(self):
        self.is_completed = True
        GLib.idle_add(self.status_label.set_text, self.tr("Download Completed."))
        self.pause_button.set_visible(False)
        self.cancel_button.set_visible(False)
        self.progress_box.set_visible(False)
        self.est_time_label.set_visible(False)
        self.download_started = False

        if os.path.exists(self.lock_file):
            os.remove(self.lock_file)

        if self.is_yt_dlp:
            path = self.find_active_part_yt_dlp(self.FileName, self.download_folder)
            if path and os.path.exists(path):
                os.remove(path)

        GLib.idle_add(self.openFile_button.set_visible, True)
        self.update_download("Finished", "--", "--", "--", finished_downloading=True)
        
        if self.app_settings.get("notifications"):
           title = self.tr("Download Finished")
           body = f"{self.FileName}"

           if os.name == 'nt':
               try:
                   from winotify import Notification
                   icon_path = os.path.abspath("icon.png")

                   toast = Notification(
                       app_id="FlameGet",
                       title="Download Finished",
                       msg="Your video has been downloaded!",
                       icon=icon_path
                   )

                   toast.show()
               except:
                   print(f"Windows doesn't support modern Action Center toasts.")
                   
           else:
               notification = Gio.Notification.new(title)
               notification.set_body(body)
               notification.set_icon(Gio.ThemedIcon.new("emblem-ok-symbolic"))
               self.get_application().send_notification("download-complete", notification)

        self.cleanup_torrent_unwanted_files()
        if not self.is_torrent and hasattr(self, 'checksum_entry'):
            if self.checksum_entry.get_text().strip():
                self.verify_checksum()
                
        if not self.app_settings.get("show_finish_dialog"):
            self.exit()
        
        self.trigger_post_download_action()

    def on_stop_seeding_clicked(self, button):
        if self.pause_event.is_set():
            self.pause_event.clear()
            self.is_paused = True
            self.progress_bars[0].set_visible(False)
            self.pause_button.set_label(self.tr("Start Seeding"))
            self.status_label.set_text(self.tr("Paused Seeding"))
            self.pause_download()
            if os.path.exists(self.lock_file):
                try: os.remove(self.lock_file)
                except: pass
        else:
            if not os.path.exists(self.lock_file):
                self.lock_file = self.output_file + '.lock'
                open(self.lock_file, 'w').close()
            else:
                self.status_label.set_label(self.tr("File is Already Downloading!"))
                self.status_label.set_name("red-text")
                return
            self.is_paused = False
            self.progress_bars[0].set_visible(True)
            self.pause_event.set()
            self.pause_button.set_label(self.tr("Stop Seeding"))
            self.status_label.set_text(self.tr("Started Seeding..."))
            
            self.threads.clear()
            self.completed_threads = 0

            t = threading.Thread(target=self.download_using_ARIA2)
            t.start()
            self.threads.append(t)

    def on_pause_clicked(self, button):
        if self.pause_event.is_set():
            GLib.idle_add(self.pause_button.set_sensitive,False)
            self.pause_event.clear()
            self.is_paused = True
            self.pause_button.set_label(self.tr("Updating..."))
            self.status_label.set_text(self.tr("Paused."))
            self.download_started = False
            self.pause_download()
            if os.path.exists(self.lock_file):
                try: os.remove(self.lock_file)
                except: pass
            GLib.timeout_add(100, lambda: self.show_pause_button("Resume"))
        else:
            if not os.path.exists(self.lock_file):
                self.lock_file = self.output_file + '.lock'
                open(self.lock_file, 'w').close()
            else:
                self.status_label.set_label(self.tr("File is Already Downloading!"))
                self.status_label.set_name("red-text")
                return
            self.is_paused = False
            GLib.idle_add(self.pause_button.set_sensitive,False)
            self.pause_event.set()
            self.pause_button.set_label(self.tr("Updating..."))
            self.status_label.set_text(self.tr("Downloading..."))
            self.download_started = True
            
            self.threads.clear()
            self.completed_threads = 0
            if self.is_yt_dlp:
                t = threading.Thread(target=self.download_using_YTDLP)
                t.start()
                self.threads.append(t)
            elif self.download_engine == "aria2":
                t = threading.Thread(target=self.download_using_ARIA2)
                t.start()
                self.threads.append(t)
            else:
                for i in range(self.segments_count):
                    part_path = self.part_files[i]
                    original_start = i * self.segment_size
                    end = self.file_size_bytes - 1 if i == self.segments_count - 1 else (original_start + self.segment_size - 1)

                    if os.path.exists(part_path):
                        downloaded = os.path.getsize(part_path)
                    else:
                        downloaded = 0

                    if downloaded >= (end - original_start + 1):
                        self.completed_threads += 1
                        print(f"Part {i} already downloaded. Skipping.")
                        continue

                    start = original_start + downloaded
                    if start <= end:
                        t = threading.Thread(target=self.resume_download_segment, args=(start, end, i))
                        t.start()
                        self.threads.append(t)
            GLib.timeout_add(100, lambda: self.show_pause_button("Pause"))

    def show_pause_button(self, stat):
        self.pause_button.set_label(self.tr(stat))
        self.pause_button.set_sensitive(True)
        return False

    def reset_ui(self):
        self.is_paused = False
        self.refresh_pending = False
        self.is_canceled = False
        self.status_label.set_text("")
        
        self.download_button.set_visible(True)
        self.select_folder_button.set_sensitive(True)
        self.editFileName_entry.set_sensitive(True)
        self.pause_button.set_visible(False)
        self.cancel_button.set_visible(False)
        self.progress_box.set_visible(False)
        self.est_time_label.set_visible(False)

    def calculate_time(self, downloaded):
        elapsed = time.time() - self.start_time
        speed = downloaded / elapsed if elapsed > 0 else 0
        eta = (self.file_size_bytes - downloaded) / speed if speed > 0 else 0

        if speed < 1024 ** 2:
            self.speed_str = f"{speed / 1024:.2f} KB/s"
        else:
            self.speed_str = f"{speed / (1024 ** 2):.2f} MB/s"

        self.eta_str = time.strftime("%M:%S", time.gmtime(eta))

        self.downloaded_str = addOn.parse_size(downloaded)
        total_str = addOn.parse_size(self.file_size_bytes)

        percent = (downloaded / self.file_size_bytes) * 100 if self.file_size_bytes > 0 else 0
        self.progress = float(percent)
        if self.is_supporting_range:
            GLib.idle_add(
                self.est_time_label.set_markup,
                f"{self.tr('Downloaded')}: <span font_features='tnum=1'><b>{self.downloaded_str}/{total_str}</b> ({self.progress:.0f}%)</span> | "
                f"{self.tr('Speed')}: <span font_features='tnum=1'><b>{self.speed_str}</b></span> | "
                f"ETA: <span font_features='tnum=1'><b>{self.eta_str}</b></span>"
            )
        else:
            GLib.idle_add(
                self.est_time_label.set_markup,
                f"{self.tr('Downloaded')}: <span font_features='tnum=1'><b>{self.downloaded_str}/--:--</b></span> | "
                f"{self.tr('Speed')}: <span font_features='tnum=1'><b>{self.speed_str}</b></span> | "
                f"ETA: <span font_features='tnum=1'><b>--:--</b></span>"
            )

    def update_download_safe(self):
        if self.is_paused:
            msg = "Paused"
        elif self.is_seeding:
            msg = "Seeding" 
        elif self.is_completed or self.progress >= 100:
            msg = "Finished" 
        else:
            msg=""

        self.report_pid(msg)
        if self.download_started and not self.is_paused:
            self.update_download("downloading", self.progress, self.speed_str, self.eta_str)
        return True
        
    def open_file(self, widget):
        path = self.output_file.strip().replace("“", "").replace("”", "").replace("‘", "").replace("’", "")
        
        if os.path.isdir(path):
            self.open_file_direct(path)
            self.exit()
            return

        if not os.path.isfile(path):
            print(f"File does not exist: {path}")
            return

        file = Gio.File.new_for_path(path)
        uri = file.get_uri()

        try:
            Gio.AppInfo.launch_default_for_uri(uri, None)
        except Exception as e:
            print("Failed to launch file via Gio, fallback to xdg-open:", e)
            if os.name == 'nt':
                os.startfile(path)
            else:
                subprocess.run(["xdg-open", path])
        self.exit()

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

    def on_shake(self, button):
        button.add_css_class("shake")
        GLib.timeout_add(500, lambda: button.remove_css_class("shake") or False)

    def create_download(self, filename, size, today_time, cat, directory_folder, raw_file_url, pid, file_size_bytes, segments, is_audio=False, quality_mode="Best Available", is_playlist=False):
        cursor = self.conn.cursor()

        cursor.execute("""
            INSERT INTO downloads
            (filename, size, status, progress, speed, time_left, date_added, category, file_directory, url, pid, file_size_bytes, segments, is_audio, quality_mod, download_playlist, scheduled_time, finished_downloading)
            VALUES (?, ?, 'Paused', 0, '--', '--', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0, 0)
        """, (filename, size, today_time, cat, directory_folder, raw_file_url, pid, file_size_bytes, segments, is_audio, quality_mode, is_playlist))

        self.conn.commit()
        self.download_id = cursor.lastrowid
        print(self.download_id)

    def update_download(self, status, progress, speed, time_left, finished_downloading=False):
        try:
            cursor = self.conn.cursor()
            cursor.execute("""
                UPDATE downloads SET
                    status = ?,
                    progress = ?,
                    speed = ?,
                    time_left = ?,
                    pid = ?,
                    finished_downloading = ?
                WHERE id = ?
            """, (status, progress, speed, time_left, self.pid, finished_downloading, self.download_id))
            self.conn.commit()
            
        except Exception as e:
            print(f"DB Update Error: {e}")

    def confirm_cancelation(self):
        dialog = Gtk.Dialog(title=self.tr("Cancel Confirmation"), transient_for=self, modal=True)
        dialog.set_default_size(400, 125)
        dialog.set_resizable(False)
        GLib.idle_add(addOn.set_titlebar_theme, dialog.get_title(), self.app_settings.get("theme_mode"))
        box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10,
                    margin_top=20, margin_bottom=20, margin_start=20, margin_end=20)
        buttons_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
        Label = Gtk.Label(label=self.tr("Do you want to cancel the download?"))
        Label.add_css_class("small-text")
        Label.set_hexpand(True)
        box.append(Label)

        confirm_button = Gtk.Button(label=self.tr("Confirm"))
        confirm_button.add_css_class("generic-button")
        confirm_button.set_hexpand(True)
        confirm_button.connect("clicked", lambda *args: self.on_confirm_cancelation_response(dialog))
        confirm_button.connect("activate", lambda *args: self.on_confirm_cancelation_response(dialog))
        confirm_button.grab_focus()
        cancel_button = Gtk.Button(label=self.tr("Cancel"))
        cancel_button.set_hexpand(True)
        cancel_button.add_css_class("btn_cancel")
        cancel_button.connect("clicked", lambda w : GLib.idle_add(dialog.destroy))
        
        self.delete_files_also_check_btn = Gtk.CheckButton(label=self.tr(" Delete Associated Files?"))
        self.delete_files_also_check_btn.set_active(self.app_settings.get("confirm_delete", True))

        def on_toggled(btn):
            self.app_settings["confirm_delete"] = btn.get_active()
            SaveManager.save_settings(self.app_settings)
        self.delete_files_also_check_btn.connect("toggled", on_toggled)

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

    def on_confirm_cancelation_response(self, dialog):
        self.cancel_event.set()
        self.is_canceled = True
        self.pause_event.set()
        self.connections_spin.set_sensitive(True)
        self.status_label.set_text(self.tr("Cancelled."))
        self.is_completed = False
        self.download_started = False
        self.download_button.set_label(self.tr("Download"))
        if hasattr(self, 'aria_proc'):
            self.aria_proc.terminate()
            self.aria_proc.wait(timeout=2)
        if self.delete_files_also_check_btn.get_active():
            if self.is_torrent:
                full_path = os.path.join(self.download_folder, self.FileName)
                meta_junk = Gio.File.new_for_path(self.meta_path)
                torrent_folder = Gio.File.new_for_path(full_path)
                meta_junk.trash(None)
                torrent_folder.trash(None)
                try: 
                    os.remove(self.output_file)
                except: pass
            if self.is_yt_dlp:
                path = self.find_active_part_yt_dlp(self.FileName, self.download_folder)
                if path and os.path.exists(path):
                    os.remove(path)
            else:
                if self.download_engine == "aria2":
                    aria_file = self.output_file + ".aria2"
                    if os.path.exists(self.output_file):
                        try: os.remove(self.output_file)
                        except: pass
                    if os.path.exists(aria_file):
                        try: os.remove(aria_file)
                        except: pass
                else:
                    for f in self.part_files:
                        try:
                            os.remove(f)
                        except:
                            pass
            
        self.reset_ui()
        dialog.destroy()
        self.exit()

    def pause_download(self):
        has_finished = False
        if self.is_seeding:
            status = "Paused" if self.is_paused else "Finished"
            has_finished = True if status == "Finished" else False
            self.update_download(status, self.progress, "--", "--", finished_downloading=has_finished)
            return
            
        if self.progress >= 100 and self.is_completed:
            has_finished = True
            status = "Finished"
        else: 
            status = "Paused" if self.is_paused else "Stopped"
    
        self.update_download(status, self.progress, "--", "--", finished_downloading=has_finished)
    
    def find_active_part_yt_dlp(self, filename, directory):
        base_name = os.path.splitext(filename)[0]
        for name in os.listdir(directory):
            if name.startswith(base_name) and (name.endswith(".part") or name.endswith(".ytdl")):
                return os.path.join(directory, name)
        return None

    def is_network_error(self, error_str):
        error_str = error_str.lower()
        return any(msg in error_str for msg in [
            "could not resolve host",
            "failed to connect",
            "timed out",
            "network is unreachable",
            "connection reset",
            "operation timed out",
            "name or service not known",
            "connection refused"
        ])

    def get_parsed_UI(self):
        SIZE_RE_aria2 = re.compile(r"([0-9.]+)([KMG]i?)B", re.I)
        speed = self.speed_str.replace(" ", "")
        m_speed = SIZE_RE_aria2.search(speed)
        
        if m_speed:
            val, unit = m_speed.groups()
            parsed_speed = addOn.range_parse_size(val, unit)
            UI_speed = addOn.parse_size(parsed_speed)
        else:
            UI_speed = self.speed_str

        size_str = self.size_str.replace(" ", "")
        m_size_str= SIZE_RE_aria2.search(size_str)
        if m_size_str:
            val, unit = m_size_str.groups()
            parsed_size_str = addOn.range_parse_size(val, unit)
            UI_size_str = addOn.parse_size(parsed_size_str)
        else:
            UI_size_str = self.size_str
        
        return UI_size_str, UI_speed

    def tr(self, text):
        """Simple translation lookup."""
        lang = self.app_settings.get("language", "en")
        if lang in self.translations and text in self.translations[lang]:
            return self.translations[lang][text]
        return text

    def update_resume_status(self, init=False):
        if init:
            self.resume_ability.set_markup(f"{self.tr('Resume Support:')} <b>---</b>")
            return

        if self.is_supporting_range or self.is_torrent:
            self.resume_ability.set_markup(f"{self.tr('Resume Support:')} <b><span foreground='#4CAF50'>{self.tr('YES')}</span></b>")
        else:
            self.resume_ability.set_markup(f"{self.tr('Resume Support:')} <b><span foreground='#e53935'>{self.tr('NO')}</span></b>")

    def is_connected(self):
        try:
            socket.create_connection(("8.8.8.8", 53), timeout=1.0)
            return True
        except OSError:
            return False

    def start_listener(self):
        def _listen_loop():
            if os.name != 'nt':
                if os.path.exists(self.DOWNLOADER_SOCKET):
                    try: os.unlink(self.DOWNLOADER_SOCKET)
                    except OSError: pass
                
                server = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
                server.bind(self.DOWNLOADER_SOCKET)
            else:
                server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                server.bind(('127.0.0.1', 0))
                _, port = server.getsockname()
                with open(self.DOWNLOADER_SOCKET, 'w') as f:
                    f.write(str(port))

            with server:
                server.listen(1)
                while True:
                    try:
                        conn, _ = server.accept()
                        with conn:
                            data = conn.recv(1024).decode('utf-8').strip()
                            if data == "toggle_pid":
                                print("recieved a toggle")
                                GLib.idle_add(self.toggle_visibility)
                            elif data == "pause":
                                GLib.idle_add(self.on_pause_clicked, None)
                            elif data == "stop":
                                GLib.idle_add(self.exit)
                    except Exception as e:
                        print(f"Listener error: {e}")
                        break

        t = threading.Thread(target=_listen_loop, daemon=True)
        t.start()

    def report_pid(self, can_delete="", msg=""):        
        try:
            msg_progress = msg if msg.strip() != "" else str(self.progress) if self.progress else "0"
            message = f"pid:{self.FileName}:{msg_progress}:{self.pid}:{self.port}:{can_delete}"

            if os.name != 'nt':
                if os.path.exists(TRAY_SOCKET_PATH):
                    with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as client:
                        client.connect(TRAY_SOCKET_PATH)
                        client.sendall(message.encode())
            else:
                with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as client:
                    client.connect(('127.0.0.1', WINDOWS_TRAY_PORT))
                    client.sendall(message.encode())
                    
        except ConnectionRefusedError:
            pass
        except Exception as e:
            print(f"Tray update failed: {e}")

    def is_port_free(self, port):
        """Try to bind to the port to see if it's available."""
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(('', port))
                return True
            except OSError:
                return False

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

    def does_support_yt_dlp(self, url):
        found = False
        clean_url = url.lower()
        if any(site in clean_url for site in addOn.UNITS.SUPPORTED_SITES):
            found = True
        return found

    def is_safe_command(self, command):
        """Basic safeguard against dangerous commands, disable it at your own risk"""
        forbidden = [
            "rm -rf", "mkfs", "dd if=", ":(){:|:&};:", 
            "mv /", "> /dev/sd", "> /dev/nvme", "chmod -x /"
        ]
        cmd_lower = command.lower().strip()
        
        if not cmd_lower: 
            return True
            
        for bad in forbidden:
            if bad in cmd_lower:
                return False
                
        return True

    def run_post_download_command(self, raw_cmd):
        if not raw_cmd or not raw_cmd.strip(): return

        if not self.is_safe_command(raw_cmd):
            print("Command blocked by safety filter.")
            return

        full_path = os.path.abspath(self.output_file)
        directory = os.path.dirname(full_path)
        filename = os.path.basename(full_path)

        replacements = {
            "{{downloaded_file}}": f'"{full_path}"',
            "{{filename}}":        f'"{filename}"',
            "{{directory}}":       f'"{directory}"',
            "{{url}}":             f'"{self.url}"',
            "{{size_bytes}}":      str(self.file_size_bytes)
        }

        final_cmd = raw_cmd
        for placeholder, value in replacements.items():
            final_cmd = final_cmd.replace(placeholder, value)

        return final_cmd
        
    def trigger_post_download_action(self):
        """Executes action. Checks local override first, then falls back to global settings."""
        action = self.local_finish_action
        command_to_run = ""

        if action == "Use Global Setting":
            action = self.app_settings.get("on_finish_action", "Do Nothing")
            command_to_run = self.app_settings.get("custom_finish_cmd", "")
        elif action == "Run Custom Command":
            command_to_run = self.local_cmd_entry.get_text()

        if action == "Do Nothing":
            return

        print(f"Download finished. Triggering action: {action}")

        if action == "Shutdown System":
            try:
                subprocess.run(["shutdown", "now"], check=True)
            except FileNotFoundError:
                subprocess.run(["systemctl", "poweroff"])
            
        elif action == "Restart System":
            try:
                subprocess.run(["reboot"], check=True)
            except FileNotFoundError:
                subprocess.run(["systemctl", "reboot"])
            
        elif action == "Suspend System":
            subprocess.run(["systemctl", "suspend"])
            
        elif action == "Run Custom Command":
            if self.is_safe_command(command_to_run) and command_to_run.strip():
                try:
                    subprocess.Popen(self.run_post_download_command(command_to_run), shell=True) 
                except Exception as e:
                    print(f"Failed to run custom command: {e}")
            else:
                print(f"Blocked unsafe or empty command: {command_to_run}")

class DownloaderAppManager(Gtk.Application):
    def __init__(self):
        super().__init__(
            application_id="io.github.C_Yassin.FlameGet.Downloader",  
            flags=Gio.ApplicationFlags.HANDLES_COMMAND_LINE
        )
        GLib.set_prgname('FlameGet')
        GLib.set_application_name('FlameGet')

    def do_command_line(self, command_line):
        args_list = command_line.get_arguments()
        
        parser = argparse.ArgumentParser(description="Downloader App CLI")
        def safe_float(value):
            try:
                if not value or value.strip() == "":
                    return 0
                return float(value)
            except ValueError:
                return 0
                
        parser.add_argument("file_url", type=str, help="URL of the file")
        parser.add_argument("file_name", type=str, help="Name of the file")
        parser.add_argument("file_size", type=safe_float, help="Size of file in bytes")
        parser.add_argument("file_directory", type=str, help="Save directory")
        parser.add_argument("--segments", type=int, default=8, help="Number of segments")
        parser.add_argument("--id", type=int, default=-1, help="Download ID")
        parser.add_argument("--in_minimize_mode", action="store_true", default=False, help="start app in minimize mod")
        parser.add_argument("--audio", action="store_true", default=False, help="Download as audio")
        parser.add_argument("--playlist", action="store_true", default=False, help="Download entire playlist")
        parser.add_argument("--is_yt_dlp", action="store_true", default=False, help="Is it a video?")
        parser.add_argument("--quality", type=str, default="Best Available", help="Quality modifier")
        parser.add_argument("--speed-limit", type=safe_float, default=0.0, help="Speed limit in kB/s")    
        parser.add_argument("--torrent-indices", type=str, default="", help="Comma separated indices")
        parser.add_argument("--torrent-data", type=str, default="[]", help="Stringified list of torrent file data")
        parser.add_argument("--trackers", type=str, default="", help="Comma separated trackers")
        parser.add_argument("--cookies", type=str, default=None, help="Path to cookies file")
        parser.add_argument("--user-agent", type=str, default=None, help="User agent string")
        parser.add_argument("--referer", type=str, default=None, help="Referer URL")

        # Parse from index 1 to ignore the executable name itself which is very fat on the ram
        args, _ = parser.parse_known_args(args_list[1:])

        try:
            if args.torrent_data and args.torrent_data != "None":
                torrent_data_list = json.loads(args.torrent_data)
            else:
                torrent_data_list = []
        except json.JSONDecodeError:
            print("Error: Could not parse torrent data JSON.")
            torrent_data_list = []

        win = DownloadWindow(
            app_manager=self,
            url=args.file_url, 
            FileName=args.file_name, 
            file_size=int(args.file_size), 
            file_directory=args.file_directory, 
            segments=args.segments, 
            id=args.id, 
            in_minimize_mode=args.in_minimize_mode,
            is_audio=args.audio, 
            quality_mod=args.quality, 
            download_playlist=args.playlist,
            is_yt_dlp=args.is_yt_dlp,
            speed_limit=args.speed_limit, 
            torrent_indices=args.torrent_indices, 
            torrent_files_data=torrent_data_list,
            trackers=args.trackers,
            cookies=args.cookies,
            user_agent=args.user_agent,
            referer=args.referer
        )
        win.present()
        
        return 0


def main():
    app = DownloaderAppManager()
    app.run(sys.argv)

if __name__ == "__main__":
    from multiprocessing import freeze_support
    freeze_support()
    main()
