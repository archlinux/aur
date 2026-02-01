#!/usr/bin/env python3
import gi, subprocess, threading, time, urllib.request, os, hashlib, json
from pathlib import Path

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk, Gdk, GLib, GdkPixbuf, Pango

# Unicode icons
BACK_ICON = "⏮"
NEXT_ICON = "⏭"
PLAY_SYMBOL = "▶"
PAUSE_SYMBOL = "⏸"
SETTINGS_ICON = "⚙"

FONT_NAME = "BigBlueTerm437 Nerd Font"
CACHE_DIR = Path.home() / ".cache" / "now_playing"
CONFIG_FILE = CACHE_DIR / "config.json"
CACHE_DIR.mkdir(parents=True, exist_ok=True)

DEFAULT_CONFIG = {
    "bg_color": "rgba(20, 20, 30, 0.85)",
    "border_color": "rgba(139, 92, 246, 0.3)",
    "accent_color": "rgba(139, 92, 246, 0.9)",
    "text_color": "#e0e0ff",
    "text_secondary": "#b4b4d4",
    "text_tertiary": "#8888aa"
}

class SettingsDialog(Gtk.Window):
    def __init__(self, parent, config, on_save):
        super().__init__(title="Settings")
        self.set_transient_for(parent)
        self.set_modal(True)
        self.set_default_size(400, 500)
        self.set_border_width(20)
        self.config = config.copy()
        self.on_save = on_save

        # Set dark background for settings window
        self.override_background_color(Gtk.StateFlags.NORMAL, Gdk.RGBA(0.1, 0.1, 0.1, 1.0))

        vbox = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=15)
        self.add(vbox)

        # Title
        title = Gtk.Label(label="<big><b>Customize Colors</b></big>")
        title.set_use_markup(True)
        vbox.pack_start(title, False, False, 0)

        # Color pickers
        self.color_buttons = {}

        colors = [
            ("bg_color", "Background Color", "Main window background"),
            ("border_color", "Border Color", "Window border"),
            ("accent_color", "Accent Color", "Progress bar and highlights"),
            ("text_color", "Primary Text", "Song title"),
            ("text_secondary", "Secondary Text", "Artist name"),
            ("text_tertiary", "Tertiary Text", "Album name")
        ]

        for key, label, description in colors:
            frame = Gtk.Frame()
            frame.set_shadow_type(Gtk.ShadowType.IN)

            hbox = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
            hbox.set_margin_top(10)
            hbox.set_margin_bottom(10)
            hbox.set_margin_start(10)
            hbox.set_margin_end(10)

            info_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=3)
            name_label = Gtk.Label(label=f"<b>{label}</b>")
            name_label.set_use_markup(True)
            name_label.set_halign(Gtk.Align.START)
            desc_label = Gtk.Label(label=f"<small>{description}</small>")
            desc_label.set_use_markup(True)
            desc_label.set_halign(Gtk.Align.START)
            info_box.pack_start(name_label, False, False, 0)
            info_box.pack_start(desc_label, False, False, 0)

            color_button = Gtk.ColorButton()
            color = self.parse_color(self.config[key])
            color_button.set_rgba(color)
            color_button.set_use_alpha(True)
            color_button.connect("color-set", self.on_color_changed, key)
            self.color_buttons[key] = color_button

            hbox.pack_start(info_box, True, True, 0)
            hbox.pack_start(color_button, False, False, 0)
            frame.add(hbox)

            vbox.pack_start(frame, False, False, 0)

        # Buttons
        button_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
        button_box.set_margin_top(10)

        reset_btn = Gtk.Button(label="Reset to Default")
        reset_btn.connect("clicked", self.on_reset)
        button_box.pack_start(reset_btn, True, True, 0)

        cancel_btn = Gtk.Button(label="Cancel")
        cancel_btn.connect("clicked", lambda w: self.destroy())
        button_box.pack_start(cancel_btn, True, True, 0)

        save_btn = Gtk.Button(label="Save")
        save_btn.connect("clicked", self.on_save_clicked)
        button_box.pack_start(save_btn, True, True, 0)

        vbox.pack_start(button_box, False, False, 0)

        self.show_all()

    def parse_color(self, color_str):
        """Parse rgba() or hex color string to Gdk.RGBA"""
        rgba = Gdk.RGBA()
        if color_str.startswith("rgba("):
            # Parse rgba(r, g, b, a)
            parts = color_str[5:-1].split(",")
            rgba.red = int(parts[0]) / 255.0
            rgba.green = int(parts[1]) / 255.0
            rgba.blue = int(parts[2]) / 255.0
            rgba.alpha = float(parts[3])
        else:
            # Hex color
            rgba.parse(color_str)
            rgba.alpha = 1.0
        return rgba

    def rgba_to_string(self, rgba):
        """Convert Gdk.RGBA to rgba() string"""
        r = int(rgba.red * 255)
        g = int(rgba.green * 255)
        b = int(rgba.blue * 255)
        return f"rgba({r}, {g}, {b}, {rgba.alpha:.2f})"

    def on_color_changed(self, button, key):
        rgba = button.get_rgba()
        self.config[key] = self.rgba_to_string(rgba)

    def on_reset(self, button):
        self.config = DEFAULT_CONFIG.copy()
        for key, color_button in self.color_buttons.items():
            color = self.parse_color(self.config[key])
            color_button.set_rgba(color)

    def on_save_clicked(self, button):
        self.on_save(self.config)
        self.destroy()

class NowPlaying(Gtk.Window):
    def __init__(self):
        super().__init__(title="Now Playing")
        self.set_default_size(420, 480)
        self.set_keep_above(True)
        self.set_resizable(False)
        self.set_decorated(False)
        self.set_app_paintable(True)

        screen = self.get_screen()
        visual = screen.get_rgba_visual()
        if visual:
            self.set_visual(visual)

        self.last_track_id = None
        self.page_counter = 0
        self.art_cache = {}
        self.updating = False
        self.last_action = None
        self.current_duration = 0

        # Load config
        self.load_config()

        # ===== ROOT CONTAINER =====
        overlay = Gtk.Overlay()
        self.add(overlay)

        # Background box for blur effect
        self.bg_box = Gtk.Box()
        self.bg_box.set_name("background")
        overlay.add(self.bg_box)

        settings_container = Gtk.EventBox()
        settings_container.set_halign(Gtk.Align.END)
        settings_container.set_valign(Gtk.Align.START)
        settings_container.set_margin_top(10)
        settings_container.set_margin_end(10)
        settings_container.set_size_request(50, 50)

        self.settings_btn = Gtk.Label(label=SETTINGS_ICON)
        self.settings_btn.set_name("settings-button")
        self.settings_btn.set_opacity(0)

        settings_container.add(self.settings_btn)
        settings_container.connect("enter-notify-event", lambda w, e: self.settings_btn.set_opacity(1.0))
        settings_container.connect("leave-notify-event", lambda w, e: self.settings_btn.set_opacity(0.0))
        settings_container.connect("button-press-event", lambda w, e: self.on_settings_clicked(None))

        overlay.add_overlay(settings_container)

        # Main content
        vbox = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=0)
        vbox.set_margin_top(15)
        vbox.set_margin_bottom(15)
        vbox.set_margin_start(15)
        vbox.set_margin_end(15)
        overlay.add_overlay(vbox)

        self.stack = Gtk.Stack()
        self.stack.set_transition_type(Gtk.StackTransitionType.SLIDE_LEFT_RIGHT)
        self.stack.set_transition_duration(300)
        vbox.pack_start(self.stack, True, True, 0)

        self.current_page = self.make_page(None, "", "")
        self.current_page.show_all()
        self.stack.add_named(self.current_page, "page0")
        self.stack.set_visible_child(self.current_page)

        # ===== PROGRESS BAR =====
        self.progress_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=8)
        self.progress_box.set_margin_top(10)
        self.progress_box.set_margin_bottom(10)

        self.time_label = Gtk.Label(label="0:00")
        self.time_label.set_name("time-label")
        self.progress_box.pack_start(self.time_label, False, False, 0)

        self.progress = Gtk.ProgressBar()
        self.progress.set_name("progress-bar")
        self.progress.set_fraction(0.0)

        # Make progress bar clickable
        progress_event_box = Gtk.EventBox()
        progress_event_box.add(self.progress)
        progress_event_box.connect("button-press-event", self.on_progress_click)
        self.progress_box.pack_start(progress_event_box, True, True, 0)

        self.duration_label = Gtk.Label(label="0:00")
        self.duration_label.set_name("time-label")
        self.progress_box.pack_start(self.duration_label, False, False, 0)

        vbox.pack_start(self.progress_box, False, False, 0)

        button_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=15)
        button_box.set_halign(Gtk.Align.CENTER)
        button_box.set_margin_top(5)
        vbox.pack_start(button_box, False, False, 0)

        self.back_btn = Gtk.Button(label=BACK_ICON)
        self.back_btn.set_name("control-button")
        self.back_btn.connect("clicked", self.on_previous)
        button_box.pack_start(self.back_btn, False, False, 0)

        self.play_btn = Gtk.Button(label=PLAY_SYMBOL)
        self.play_btn.set_name("play-button")
        self.play_btn.connect("clicked", self.on_play_pause)
        button_box.pack_start(self.play_btn, False, False, 0)

        self.next_btn = Gtk.Button(label=NEXT_ICON)
        self.next_btn.set_name("control-button")
        self.next_btn.connect("clicked", self.on_next)
        button_box.pack_start(self.next_btn, False, False, 0)

        self.css_provider = Gtk.CssProvider()
        self.update_css()
        Gtk.StyleContext.add_provider_for_screen(
            screen, self.css_provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
        )

        overlay.connect("button-press-event", self.start_move)

        self.show_all()

        threading.Thread(target=self.update_loop, daemon=True).start()
        threading.Thread(target=self.progress_loop, daemon=True).start()

    def load_config(self):
        if CONFIG_FILE.exists():
            try:
                with open(CONFIG_FILE, 'r') as f:
                    self.config = json.load(f)
            except:
                self.config = DEFAULT_CONFIG.copy()
        else:
            self.config = DEFAULT_CONFIG.copy()

    def save_config(self, config):
        self.config = config
        with open(CONFIG_FILE, 'w') as f:
            json.dump(self.config, f, indent=2)
        self.update_css()

    def update_css(self):
        css = f"""
        * {{
            font-family: '{FONT_NAME}';
        }}
        window {{
            background: transparent;
        }}
        #background {{
            background: {self.config['bg_color']};
            border-radius: 16px;
            border: 2px solid {self.config['border_color']};
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
        }}
        #title-label {{
            font-size: 16px;
            font-weight: bold;
            color: {self.config['text_color']};
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
        }}
        #artist-label {{
            font-size: 13px;
            color: {self.config['text_secondary']};
            margin-top: 4px;
        }}
        #album-label {{
            font-size: 11px;
            color: {self.config['text_tertiary']};
            margin-top: 2px;
            font-style: italic;
        }}
        #time-label {{
            font-size: 10px;
            color: {self.config['text_secondary']};
        }}
        #progress-bar {{
            min-height: 6px;
            background: rgba(60, 60, 80, 0.6);
            border-radius: 3px;
        }}
        #progress-bar trough {{
            min-height: 6px;
            background: rgba(60, 60, 80, 0.6);
            border-radius: 3px;
            border: 1px solid rgba(100, 100, 120, 0.3);
        }}
        #progress-bar progress {{
            min-height: 6px;
            background: {self.config['accent_color']};
            border-radius: 3px;
            box-shadow: 0 0 8px {self.config['accent_color']};
        }}
        button {{
            background: rgba(40, 40, 60, 0.6);
            border: 1px solid rgba(100, 100, 140, 0.4);
            border-radius: 8px;
            color: {self.config['text_color']};
            font-size: 20px;
            min-width: 50px;
            min-height: 50px;
            transition: all 200ms ease;
        }}
        button:hover {{
            background: rgba(60, 60, 90, 0.8);
            border-color: {self.config['border_color']};
            box-shadow: 0 0 12px {self.config['accent_color']};
        }}
        button:active {{
            background: rgba(80, 80, 110, 0.9);
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.3);
        }}
        #play-button {{
            min-width: 60px;
            min-height: 60px;
            font-size: 24px;
            background: {self.config['accent_color']};
            border: 2px solid {self.config['border_color']};
        }}
        #play-button:hover {{
            background: {self.config['accent_color']};
            border-color: {self.config['accent_color']};
            box-shadow: 0 0 16px {self.config['accent_color']};
            opacity: 0.9;
        }}
        #control-button {{
            min-width: 50px;
            min-height: 50px;
        }}
        #settings-button {{
            font-size: 24px;
            color: {self.config['text_color']};
            background: rgba(40, 40, 60, 0.9);
            border: 1px solid rgba(100, 100, 140, 0.4);
            border-radius: 8px;
            padding: 13px;
        }}
        image {{
            border-radius: 12px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.4);
        }}
        """
        self.css_provider.load_from_data(css.encode())

    def on_settings_clicked(self, button):
        SettingsDialog(self, self.config, self.save_config)

    def on_previous(self, widget):
        self.last_action = "previous"
        threading.Thread(target=lambda: subprocess.run(["playerctl", "previous"]), daemon=True).start()

    def on_play_pause(self, widget):
        threading.Thread(target=lambda: subprocess.run(["playerctl", "play-pause"]), daemon=True).start()

    def on_next(self, widget):
        self.last_action = "next"
        threading.Thread(target=lambda: subprocess.run(["playerctl", "next"]), daemon=True).start()

    def on_progress_click(self, widget, event):
        """Seek to position when progress bar is clicked"""
        if self.current_duration > 0:
            allocation = widget.get_allocation()
            click_x = event.x
            bar_width = allocation.width

            fraction = click_x / bar_width
            target_position = self.current_duration * fraction

            threading.Thread(
                target=lambda: subprocess.run(
                    ["playerctl", "position", str(target_position)]
                ),
                daemon=True
            ).start()

    def make_page(self, pixbuf, title, artist, album=""):
        box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=0)

        image = Gtk.Image()
        if pixbuf:
            image.set_from_pixbuf(pixbuf)
        image.set_margin_bottom(15)

        info_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=0)
        info_box.set_halign(Gtk.Align.CENTER)

        title_label = Gtk.Label(label=title)
        title_label.set_name("title-label")
        title_label.set_line_wrap(True)
        title_label.set_line_wrap_mode(Pango.WrapMode.WORD_CHAR)
        title_label.set_justify(Gtk.Justification.CENTER)
        title_label.set_max_width_chars(30)
        title_label.set_lines(2)
        title_label.set_ellipsize(Pango.EllipsizeMode.END)

        artist_label = Gtk.Label(label=artist)
        artist_label.set_name("artist-label")
        artist_label.set_line_wrap(True)
        artist_label.set_line_wrap_mode(Pango.WrapMode.WORD_CHAR)
        artist_label.set_justify(Gtk.Justification.CENTER)
        artist_label.set_max_width_chars(30)
        artist_label.set_lines(2)
        artist_label.set_ellipsize(Pango.EllipsizeMode.END)

        album_label = Gtk.Label(label=album)
        album_label.set_name("album-label")
        album_label.set_line_wrap(True)
        album_label.set_line_wrap_mode(Pango.WrapMode.WORD_CHAR)
        album_label.set_justify(Gtk.Justification.CENTER)
        album_label.set_max_width_chars(30)
        album_label.set_lines(1)
        album_label.set_ellipsize(Pango.EllipsizeMode.END)

        info_box.pack_start(title_label, False, False, 0)
        info_box.pack_start(artist_label, False, False, 0)
        if album:
            info_box.pack_start(album_label, False, False, 0)

        box.pack_start(image, True, True, 0)
        box.pack_start(info_box, False, False, 0)

        box.image = image
        box.title_label = title_label
        box.artist_label = artist_label
        box.album_label = album_label
        return box

    def start_move(self, widget, event):
        if event.type == Gdk.EventType.BUTTON_PRESS and event.button == 1:
            self.begin_move_drag(
                event.button,
                int(event.x_root),
                int(event.y_root),
                event.time
            )

    def animate_new_track(self, pixbuf, title, artist, album):
        if self.last_action == "previous":
            self.stack.set_transition_type(Gtk.StackTransitionType.SLIDE_RIGHT)
        else:
            self.stack.set_transition_type(Gtk.StackTransitionType.SLIDE_LEFT)

        new_page = self.make_page(pixbuf, title, artist, album)
        new_page.show_all()

        name = f"page{self.page_counter}"
        self.page_counter += 1

        self.stack.add_named(new_page, name)
        self.stack.set_visible_child(new_page)

        old = self.current_page
        self.current_page = new_page

        self.last_action = None

        GLib.timeout_add(350, lambda: self.stack.remove(old) or False)

    def get_cached_art_path(self, art_url):
        url_hash = hashlib.md5(art_url.encode()).hexdigest()
        return CACHE_DIR / f"{url_hash}.png"

    def load_album_art(self, art_url):
        if not art_url.strip():
            return None

        if art_url in self.art_cache:
            return self.art_cache[art_url]

        try:
            if art_url.startswith("file://"):
                path = art_url[7:]
            else:
                cached_path = self.get_cached_art_path(art_url)
                if cached_path.exists():
                    path = str(cached_path)
                else:
                    path = str(cached_path)
                    urllib.request.urlretrieve(art_url, path)

            pixbuf = GdkPixbuf.Pixbuf.new_from_file_at_scale(
                path, 390, 240, True
            )

            if len(self.art_cache) > 10:
                self.art_cache.pop(next(iter(self.art_cache)))
            self.art_cache[art_url] = pixbuf

            return pixbuf
        except Exception as e:
            print(f"Failed to load art: {e}")
            return None

    def get_playerctl_metadata(self):
        try:
            result = subprocess.run(
                ["playerctl", "metadata", "--format",
                 "{{title}}|{{artist}}|{{album}}|{{mpris:artUrl}}|{{status}}"],
                capture_output=True,
                text=True,
                timeout=1
            )

            if result.returncode != 0:
                return None

            parts = result.stdout.strip().split("|")
            if len(parts) < 5:
                return None

            return {
                "title": parts[0],
                "artist": parts[1],
                "album": parts[2],
                "art_url": parts[3],
                "status": parts[4]
            }
        except Exception:
            return None

    def progress_loop(self):
        while True:
            try:
                result = subprocess.run(
                    ["playerctl", "metadata", "--format", "{{position}}|{{mpris:length}}"],
                    capture_output=True,
                    text=True,
                    timeout=1
                )

                if result.returncode == 0:
                    parts = result.stdout.strip().split("|")
                    if len(parts) == 2 and parts[0] and parts[1]:
                        position = int(parts[0]) / 1000000
                        duration = int(parts[1]) / 1000000

                        self.current_duration = duration

                        if duration > 0:
                            fraction = min(position / duration, 1.0)

                            pos_mins = int(position // 60)
                            pos_secs = int(position % 60)
                            dur_mins = int(duration // 60)
                            dur_secs = int(duration % 60)

                            GLib.idle_add(self.progress.set_fraction, fraction)
                            GLib.idle_add(self.time_label.set_text, f"{pos_mins}:{pos_secs:02d}")
                            GLib.idle_add(self.duration_label.set_text, f"{dur_mins}:{dur_secs:02d}")
            except Exception as e:
                pass

            time.sleep(0.5)

    def update_loop(self):
        while True:
            if self.updating:
                time.sleep(0.3)
                continue

            self.updating = True

            try:
                metadata = self.get_playerctl_metadata()

                if not metadata or not metadata["title"].strip():
                    GLib.idle_add(self.label_clear)
                else:
                    if metadata["status"].lower() == "playing":
                        GLib.idle_add(self.play_btn.set_label, PAUSE_SYMBOL)
                    else:
                        GLib.idle_add(self.play_btn.set_label, PLAY_SYMBOL)

                    track_id = f"{metadata['title']}|{metadata['artist']}|{metadata['album']}"

                    if track_id != self.last_track_id:
                        self.last_track_id = track_id

                        pixbuf = self.load_album_art(metadata["art_url"])

                        title = metadata['title'] or "Unknown Track"
                        artist = metadata['artist'] or "Unknown Artist"
                        album = metadata['album']

                        GLib.idle_add(self.animate_new_track, pixbuf, title, artist, album)

            except Exception as e:
                print(f"Update error: {e}")

            self.updating = False
            time.sleep(0.3)

    def label_clear(self):
        self.play_btn.set_label(PLAY_SYMBOL)

if __name__ == "__main__":
    win = NowPlaying()
    win.connect("destroy", Gtk.main_quit)
    Gtk.main()
