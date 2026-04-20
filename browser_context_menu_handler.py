#!/usr/bin/env python3
import sys
import os
import subprocess
import threading
import gi

gi.require_version("Gtk", "4.0")
from gi.repository import Gtk, GLib, Gio
import argparse
import FireAddOns as addOn
import SaveManager

yt_dlp = addOn.lazy_import("yt_dlp")

# --- CONFIG ---
downloader_script_path = addOn.FireFiles.downloader_script_path
translations = SaveManager.load_translations()
app_settings = SaveManager.load_settings()
SaveManager.load_css(app_settings.get("theme_mode"))
is_flatpak_env = 'FLATPAK_ID' in os.environ or os.path.exists('/.flatpak-info')
worker_type = os.environ.get("FLAMEGET_WORKER")
if "downloader" == worker_type:
    import downloader
    downloader.main()
    sys.exit(0)

def tr(text):
    """Simple translation lookup."""
    lang = app_settings.get("language", "en")
    if lang in translations and text in translations[lang]:
        return translations[lang][text]
    return text

class VideoAnalyzer(Gtk.Application):
    def __init__(self, filename, directory, url, ext=".mp4", audio=False, quality="Best Available", playlist=False):
        super().__init__(application_id="io.github.C_Yassin.FlameGet.Downloader", flags=Gio.ApplicationFlags.NON_UNIQUE)
        self.filename = filename
        self.file_size_bytes = 0
        self.directory = directory
        self.url = url
        self.ext = ext if ext else ".mp4"
        self.info_dict = None
        self.formats = []
        self.is_audio = audio if audio else False
        self.quality = quality if quality else "Best Available"
        self.is_playlist = playlist if playlist else False

    def do_activate(self):
        self.window = Gtk.ApplicationWindow(application=self)
        self.window.set_title("FlameGet - Analyzer")
        self.window.set_icon_name("io.github.C_Yassin.FlameGet" if is_flatpak_env else "flameget")
        self.window.set_default_size(400, -1)
        self.window.set_resizable(False)

        self.main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=15)
        self.main_box.set_margin_top(20)
        self.main_box.set_margin_bottom(20)
        self.main_box.set_margin_start(20)
        self.main_box.set_margin_end(20)
        self.window.set_child(self.main_box)

        self.spinner = Gtk.Spinner()
        self.spinner.set_size_request(50, 50)
        self.spinner.set_halign(Gtk.Align.CENTER)
        
        self.status_label = Gtk.Label(label="Fetching video information...")
        self.status_label.add_css_class("title-4")

        self.main_box.append(self.spinner)
        self.main_box.append(self.status_label)

        self.spinner.start()
        self.window.present()

        threading.Thread(target=self.fetch_metadata, daemon=True).start()

    def is_yt_dlp(self, url):
        clean_url = url.lower()
        return any(site in clean_url for site in addOn.UNITS.SUPPORTED_SITES)

    def normalize_youtube_url(self, url):
        try:
            if "v=" in url:
                return "https://www.youtube.com/watch?v=" + url.split("v=")[1].split("&")[0]
            elif "youtu.be" in url:
                return url
        except IndexError:
            pass
        return url

    def fetch_head_info(self, url, ext, is_audio_mode, quality_mod, download_playlist):
        if download_playlist:
            return True, 0, "Playlist"

        if url in ("youtube.com", "yout.be"):
            url = self.normalize_youtube_url(url)

        shared_data = {'found_size': 0, 'filename': ''}

        def progress_hook(d):
            if d['status'] == 'downloading':
                size = d.get('total_bytes') or d.get('total_bytes_estimate')
                if size:
                    shared_data['found_size'] = size
                
                if d.get('filename'):
                    shared_data['filename'] = d['filename']
                
                raise Exception("SIZE_FOUND")

        save_path_template = os.path.join(addOn.UNITS.RUNTIME_DIR, f'%(title)s{ext}')

        ydl_opts = {
            'quiet': True,
            'no_warnings': True,
            'noplaylist': True,
            'socket_timeout': 20,
            'outtmpl': save_path_template, 
            'ffmpeg_location': addOn.FireFiles.ffmpeg_path,
            'progress_hooks': [progress_hook],
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
                ydl.download([url])
                
        except Exception as e:
            if "SIZE_FOUND" in str(e):
                pass
            else:
                print(f"Quick Info Check Error: {e}")
                return False, 0, ""

        file_size = shared_data['found_size']
        filename = shared_data['filename']

        if not filename:
            with yt_dlp.YoutubeDL(ydl_opts) as ydl:
                info = ydl.extract_info(url, download=False)
                filename = ydl.prepare_filename(info)

        if filename:
            part_file = filename + ".part"
            
            if os.path.exists(part_file):
                try: os.remove(part_file)
                except OSError: pass
            if os.path.exists(filename):
                try: os.remove(filename)
                except OSError: pass

        print(f"Found: {filename} | Size: {file_size}")
        filename_to_use = os.path.basename(filename)
        filename_to_use = filename_to_use.split('.')[0] + ext
        print("final name is ", filename_to_use)
        return True, file_size, filename_to_use

    def fetch_metadata(self):
        try:
            if not self.is_playlist:
                success, size, name = self.fetch_head_info(self.url, self.ext, self.is_audio, self.quality, self.is_playlist)
                if success:
                    self.file_size_bytes = size
                    self.filename = name
                else:
                    self.file_size_bytes = 0
                    self.filename = self.filename if not self.filename.strip() == "" else "Unknown"
            else:
                self.file_size_bytes = 0
                self.filename = self.filename if not self.filename.strip() == "" else "Unknown"

            GLib.idle_add(self.on_metadata_fetched)
        except Exception as e:
            print(f"Error: {e}")
            GLib.idle_add(self.on_error, str(e))

    def on_error(self, message):
        self.spinner.stop()
        self.main_box.remove(self.spinner)
        self.status_label.set_text(tr("Error fetching metadata."))
        
        err_label = Gtk.Label(label=message)
        err_label.set_wrap(True)
        self.main_box.append(err_label)
        
        btn = Gtk.Button(label=tr("Close"))
        btn.connect("clicked", lambda x: self.quit())
        self.main_box.append(btn)

    def on_metadata_fetched(self):
        self.main_box.remove(self.spinner)
        self.main_box.remove(self.status_label)
        
        self.build_options_ui()

    def parse_size(self, size_bytes):
        if not size_bytes: return "Unknown"
        for unit in ['B', 'KB', 'MB', 'GB', 'TB']:
            if size_bytes < 1024.0:
                return f"{size_bytes:.2f} {unit}"
            size_bytes /= 1024.0
        return f"{size_bytes:.2f} PB"

    def build_options_ui(self):
        self.window.set_default_size(550, -1)

        grid = Gtk.Grid()
        grid.set_row_spacing(12)
        grid.set_column_spacing(15)
        self.main_box.append(grid)

        row = 0

        # --- Row 0: Filename ---
        grid.attach(Gtk.Label(label=tr("Filename:"), halign=Gtk.Align.START), 0, row, 1, 1)
        
        self.filename_entry = Gtk.Entry()
        self.filename_entry.set_text(self.filename)
        self.filename_entry.add_css_class("entry")
        self.filename_entry.set_hexpand(True)
        grid.attach(self.filename_entry, 1, row, 1, 1)
        row += 1

        # --- Row 1: URL ---
        grid.attach(Gtk.Label(label=tr("URL:"), halign=Gtk.Align.START), 0, row, 1, 1)
        
        url_entry = Gtk.Entry()
        url_entry.set_text(self.url)
        url_entry.add_css_class("entry")
        url_entry.set_hexpand(True)
        url_entry.set_sensitive(False)
        url_entry.set_tooltip_text(self.url)
        grid.attach(url_entry, 1, row, 1, 1)
        row += 1

        # --- Row 2: Separator ---
        sep1 = Gtk.Separator(orientation=Gtk.Orientation.HORIZONTAL)
        grid.attach(sep1, 0, row, 2, 1)
        row += 1

        # --- Row 3: Estimated Size ---
        grid.attach(Gtk.Label(label=tr("Estimated Size:"), halign=Gtk.Align.START), 0, row, 1, 1)
        
        size_str = self.parse_size(self.file_size_bytes)
        self.lbl_size = Gtk.Label(halign=Gtk.Align.START)
        escaped_str = GLib.markup_escape_text(size_str)
        self.lbl_size.set_markup(f"<b>{escaped_str}</b>")
        self.lbl_size.set_hexpand(True)
        grid.attach(self.lbl_size, 1, row, 1, 1)
        row += 1

        # --- Row 4: Separator ---
        sep2 = Gtk.Separator(orientation=Gtk.Orientation.HORIZONTAL)
        grid.attach(sep2, 0, row, 2, 1)
        row += 1

        # --- Row 5: Format ---
        grid.attach(Gtk.Label(label=tr("Format:"), halign=Gtk.Align.START), 0, row, 1, 1)
        
        self.dd_type = Gtk.DropDown.new_from_strings(["Video", "Audio Only"])
        self.dd_type.set_selected(int(self.is_audio))
        self.dd_type.set_hexpand(True)
        self.dd_type.connect("notify::selected", self.on_type_changed)
        grid.attach(self.dd_type, 1, row, 1, 1)
        row += 1

        # --- Row 6: Quality ---
        grid.attach(Gtk.Label(label=tr("Quality:"), halign=Gtk.Align.START), 0, row, 1, 1)
        
        self.quality_model = Gtk.StringList.new(["Best Available", "4K", "1080p", "720p", "480p"])
        self.dd_quality = Gtk.DropDown.new(model=self.quality_model, expression=None)
        
        self.dd_quality.set_hexpand(True)
        grid.attach(self.dd_quality, 1, row, 1, 1)
        row += 1

        # --- Row 7: Container ---
        lbl_fmt = Gtk.Label(label=tr("Container:"), xalign=0)
        self.dd_fmt = Gtk.DropDown.new_from_strings(["mp4", "mkv", "webm", "mov", "avi"])
        self.dd_fmt.set_hexpand(True)
        grid.attach(lbl_fmt, 0, row, 1, 1)
        grid.attach(self.dd_fmt, 1, row, 1, 1)
        row += 1
        
        self.on_type_changed(self.dd_type, None)
        audio_qualities = ["Best Available", "High", "Medium", "low"]
        video_qualities = ["Best Available", "4K", "1080p", "720p", "480p"]
        selected_quality = audio_qualities if self.is_audio else video_qualities
        
        if self.quality in selected_quality:
            index = selected_quality.index(self.quality)
            self.dd_quality.set_selected(index)
        else:
            self.dd_quality.set_selected(0)

        audio_formats = ["mp3", "opus", "wav", "aac", "flac"]
        video_formats = ["mp4", "mkv", "webm", "mov", "avi"]
        selected_format = audio_formats if self.is_audio else video_formats

        ext_to_find = self.ext.replace(".", "").strip()
        if ext_to_find in selected_format:
            index = selected_format.index(ext_to_find)
            self.dd_fmt.set_selected(index)
        else:
            self.dd_fmt.set_selected(0)


        # --- Row 8: Playlist Checkbox ---
        def on_toggle(btn):
            if btn: self.is_playlist = btn.get_active()

        chk_label = Gtk.Label(label=tr("Playlist:"), xalign=0)
        grid.attach(chk_label, 0, row, 1, 1)
        
        self.chk_playlist = Gtk.CheckButton(label=tr("Download Entire Playlist"))
        self.chk_playlist.set_hexpand(True)
        self.chk_playlist.set_halign(Gtk.Align.START)
        is_youtube = self.is_yt_dlp(self.url)
        check = is_youtube and ("&list=" in self.url)
        self.chk_playlist.set_sensitive(check)
        self.chk_playlist.set_active(self.is_playlist if not check else check)
        self.chk_playlist.connect("toggled", on_toggle) 
        grid.attach(self.chk_playlist, 1, row, 1, 1) 
        row += 1
        
        # --- Buttons ---
        btn_box = Gtk.Box(spacing=10)
        btn_box.set_margin_top(15) 
        
        btn_cancel = Gtk.Button(label=tr("Cancel"))
        btn_cancel.set_hexpand(True)
        btn_cancel.add_css_class("btn_cancel")
        btn_cancel.connect("clicked", lambda x: self.quit())
        
        btn_download = Gtk.Button(label=tr("Download"))
        btn_download.set_hexpand(True)
        btn_download.add_css_class("green-btn")
        btn_download.add_css_class("suggested-action")
        btn_download.connect("clicked", self.launch_downloader)

        btn_box.append(btn_cancel)
        btn_box.append(btn_download)
        self.main_box.append(btn_box)

    def on_type_changed(self, dd, pspec):
        selected = dd.get_selected()
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


    def launch_downloader(self, btn):
        is_audio = self.dd_type.get_selected() == 1 
        quality_str = self.dd_quality.get_selected_item().get_string()
        ext = ""
        file_name = self.filename_entry.get_text().strip()
        ext = "." + self.dd_fmt.get_selected_item().get_string()


        if not file_name: file_name = "video_download"
        
        file_name, _ = os.path.splitext(file_name)
        
        if file_name:
            file_name += ext

        file_size = self.file_size_bytes
        worker_env = os.environ.copy()
        worker_env["FLAMEGET_WORKER"] = "downloader"
        
        executable_path = sys.executable 
        
        is_compiled = getattr(sys, 'frozen', False)
        args = [executable_path]
        if not is_compiled:
            args.append(os.path.abspath(downloader_script_path))
        cmd = [
            *args,
            self.url,
            file_name,
            str(file_size),
            self.directory
        ]

        if is_audio:
            cmd.append("--audio")
        
        if quality_str:
            cmd.extend(["--quality", quality_str])

        if self.is_playlist:
            cmd.append("--playlist")

        cmd.append("--is_yt_dlp")

        print("Launching:", " ".join(cmd))
        
        subprocess.Popen(cmd, env=worker_env)
        self.quit()

def main():
    parser = argparse.ArgumentParser(description="FlameGet Middleman")
    parser.add_argument("url", help="Target URL")
    
    parser.add_argument("--filename", type=str, help="Filename if already known")
    parser.add_argument("--size", type=str, help="File size if already known")
    parser.add_argument("--ext", type=str, help="File extension if already known")
    parser.add_argument("--directory", type=str, help="File directory if already choosen")

    parser.add_argument("--audio", action="store_true", help="Download as audio")
    parser.add_argument("--quality", type=str, help="Quality modifier (e.g. 1080p, High)")
    parser.add_argument("--playlist", action="store_true", help="Download entire playlist")

    args, _ = parser.parse_known_args()
    if not args.filename or args.filename.strip() == "":
        filename = "video_download"
    else: 
        filename = args.filename
    directory = args.directory if args.directory != None and args.directory.strip() != "" else app_settings.get("default_download_dir")
    has_valid_size = False
    if args.size:
        try:
            if int(args.size) > 0:
                has_valid_size = True
        except ValueError:
            pass

    if filename and has_valid_size:
        print("Explicit arguments detected (Filename & Valid Size). Launching downloader directly...")
        worker_env = os.environ.copy()
        worker_env["FLAMEGET_WORKER"] = "downloader"
        
        executable_path = sys.executable 
        
        is_compiled = getattr(sys, 'frozen', False)
        args = [executable_path]
        if not is_compiled:
            args.append(os.path.abspath(downloader_script_path))
        cmd = [
            *args,
            args.url,
            filename,
            args.size,
            directory,
        ]
        cmd.extend(["--segments", str(app_settings.get("default_segments"))])
        cmd.extend(["--id", "-1"])
        if args.audio:
            cmd.append("--audio")
        
        if args.quality:
            cmd.append("--quality")
            cmd.append(args.quality)
        
        if args.playlist:
            cmd.append("--playlist")

        print("Launching:", " ".join(cmd))
        subprocess.Popen(cmd, env=worker_env)
        sys.exit(0)

    app = VideoAnalyzer(filename, directory, args.url, args.ext, args.audio, args.quality, args.playlist)
    app.run(None)

if __name__ == "__main__":
    from multiprocessing import freeze_support
    freeze_support()
    main()
    
