#!/usr/bin/env python3
import tkinter as tk
from tkinter import ttk, filedialog, messagebox
from PIL import Image, ImageTk
import vlc
import os
import tempfile
from urllib.request import urlretrieve
import sys

class UltraMediaPlayer:
    def __init__(self, root):
        self.root = root
        self.setup_window()
        self.init_vlc()
        self.setup_assets()
        self.make_theme()
        self.setup_ui()
        self.download_assets()
        self.bind_shortcuts()

        self.fullscreen = False
        self.panel_visible = True
        self.hide_panel_job = None
        self.zoom_factor = 1.0

    # ---------- SETUP ----------
    def setup_window(self):
        self.root.title("Mini Media Player")
        self.root.geometry("1200x800")
        self.root.configure(bg="#1b1b1b")
        self.root.protocol("WM_DELETE_WINDOW", self.cleanup_and_exit)

    def init_vlc(self):
        try:
            self.instance = vlc.Instance()
            self.media_player = None
        except Exception as e:
            messagebox.showerror("VLC Error", f"VLC initialization failed:\n{str(e)}")
            sys.exit(1)

    def setup_assets(self):
        self.asset_dir = tempfile.mkdtemp(prefix="media_player_")
        self.linux_logo = os.path.join(self.asset_dir, "linux_logo.png")
        self.python_logo = os.path.join(self.asset_dir, "python_logo.png")
        self.current_media = None
        self.is_video = False
        self.photo_image = None
        self.original_image = None
        self.current_image = None

        # Playback state
        self.is_playing = False
        self.user_seeking = False
        self.length_ms_cached = 0
        self._timeline_job = None
        self._volume_before_mute = 70

    # ---------- THEME ----------
    def make_theme(self):
        style = ttk.Style(self.root)
        try:
            style.theme_use("clam")
        except:
            pass

        bg = "#1b1b1b"
        panel = "#242424"
        panel2 = "#2c2c2c"
        fg = "#e7e7e7"
        acc = "#4CAF50"

        self.colors = dict(bg=bg, panel=panel, panel2=panel2, fg=fg, acc=acc)

        self.root.configure(bg=bg)
        style.configure(".", background=panel, foreground=fg)
        style.configure("TButton", background=panel2, foreground=fg, padding=(12,6), font=("Segoe UI",11,"bold"), borderwidth=0)
        style.map("TButton", background=[("active","#3a3a3a")], foreground=[("disabled","#7a7a7a")])
        style.configure("Horizontal.TScale", troughcolor="#3a3a3a", background=panel, sliderlength=18)
        style.configure("Main.TFrame", background=bg)
        style.configure("Panel.TFrame", background=panel)
        style.configure("SubPanel.TFrame", background=panel2)
        style.configure("TLabel", background=panel, foreground=fg, font=("Segoe UI",10))

    # ---------- UI ----------
    def setup_ui(self):
        self.create_menus()
        self.create_media_display()
        self.create_controls()

    def create_menus(self):
        menubar = tk.Menu(self.root, bg=self.colors["panel"], fg="white", tearoff=0)

        file_menu = tk.Menu(menubar, tearoff=0, bg=self.colors["panel2"], fg="white")
        file_menu.add_command(label="Medya Aç", command=self.open_media)
        file_menu.add_separator()
        file_menu.add_command(label="Çıkış", command=self.cleanup_and_exit)
        menubar.add_cascade(label="Dosya", menu=file_menu)

        view_menu = tk.Menu(menubar, tearoff=0, bg=self.colors["panel2"], fg="white")
        view_menu.add_command(label="Yakınlaştır (+)", command=lambda: self.zoom_image(self.zoom_factor*1.2))
        view_menu.add_command(label="Uzaklaştır (-)", command=lambda: self.zoom_image(self.zoom_factor*0.8))
        view_menu.add_command(label="Zoom Sıfırla", command=lambda: self.zoom_image(1.0))
        menubar.add_cascade(label="Görünüm", menu=view_menu)

        about_menu = tk.Menu(menubar, tearoff=0, bg=self.colors["panel2"], fg="white")
        about_menu.add_command(label="Hakkında", command=self.show_about)
        menubar.add_cascade(label="Hakkında", menu=about_menu)

        self.root.config(menu=menubar)

    def create_media_display(self):
        self.main_frame = ttk.Frame(self.root, style="Main.TFrame")
        self.main_frame.pack(fill="both", expand=True, padx=10, pady=(10,6))

        self.video_canvas = tk.Canvas(self.main_frame, bg="black", highlightthickness=0)
        self.video_canvas.pack(fill="both", expand=True)
        self.video_canvas.bind("<Configure>", self._on_media_area_resize)

        self.photo_label = tk.Label(self.main_frame, bg="black")
        self.photo_label.pack_forget()

        # Çift tıklama ile tam ekran
        self.video_canvas.bind("<Double-Button-1>", self.toggle_fullscreen)
        self.video_canvas.bind("<Motion>", self.on_mouse_move)

        # Fotoğraf için zoom mouse wheel
        self.main_frame.bind("<Control-MouseWheel>", self._on_ctrl_mousewheel)
        self.video_canvas.bind("<Control-MouseWheel>", self._on_ctrl_mousewheel)

    def create_controls(self):
        self.control_frame = ttk.Frame(self.root, style="Panel.TFrame")
        self.control_frame.pack(fill="x", padx=10, pady=(0,10))

        self.timeline_frame = ttk.Frame(self.control_frame, style="SubPanel.TFrame")
        self.timeline_frame.pack(fill="x", padx=10, pady=8)

        self.current_time_lbl = ttk.Label(self.timeline_frame, text="00:00")
        self.current_time_lbl.pack(side="left", padx=8)

        self.timeline = ttk.Scale(
            self.timeline_frame,
            from_=0, to=1000,
            orient="horizontal",
            style="Horizontal.TScale",
            command=self._on_timeline_drag
        )
        self.timeline.pack(side="left", fill="x", expand=True, padx=8, pady=8)

        # Yeni özellik: timeline tıklayınca o saniyeye git
        self.timeline.bind("<Button-1>", self._on_timeline_click)

        self.timeline.bind("<ButtonRelease-1>", self._on_seek_commit)

        self.total_time_lbl = ttk.Label(self.timeline_frame, text="00:00")
        self.total_time_lbl.pack(side="right", padx=8)

        # Butonlar
        self.btn_frame = ttk.Frame(self.control_frame, style="Panel.TFrame")
        self.btn_frame.pack(fill="x", padx=10, pady=(0,10))

        left = ttk.Frame(self.btn_frame, style="Panel.TFrame")
        left.pack(side="left")

        self.btn_prev = ttk.Button(left, text="⏮", width=3, command=self.prev_frame)
        self.btn_prev.grid(row=0, column=0, padx=2)

        self.btn_rew = ttk.Button(left, text="⏪ 10s", command=self.rewind)
        self.btn_rew.grid(row=0, column=1, padx=2)

        self.btn_play = ttk.Button(left, text="⏯ Oynat/Duraklat", command=self.toggle_play_pause)
        self.btn_play.grid(row=0, column=2, padx=6)

        self.btn_fwd = ttk.Button(left, text="10s ⏩", command=self.fast_forward)
        self.btn_fwd.grid(row=0, column=3, padx=2)

        self.btn_next = ttk.Button(left, text="⏭", width=3, command=self.next_frame)
        self.btn_next.grid(row=0, column=4, padx=2)

        center = ttk.Frame(self.btn_frame, style="Panel.TFrame")
        center.pack(side="left", expand=True)
        self.status_lbl = ttk.Label(center, text="Hazır")
        self.status_lbl.pack(pady=4)

        right = ttk.Frame(self.btn_frame, style="Panel.TFrame")
        right.pack(side="right")

        self.mute_btn = ttk.Button(right, text="🔊", width=3, command=self.toggle_mute)
        self.mute_btn.grid(row=0, column=0, padx=(0,6))

        self.volume_slider = ttk.Scale(
            right, from_=0, to=100,
            orient="horizontal",
            style="Horizontal.TScale",
            command=self.set_volume
        )
        self.volume_slider.set(70)
        self.volume_slider.grid(row=0, column=1, padx=4, ipadx=60)

        self.volume_lbl = ttk.Label(right, text="70%")
        self.volume_lbl.grid(row=0, column=2, padx=(6,0))

    # ---------- ASSETS ----------
    def download_assets(self):
        try:
            if not os.path.exists(self.linux_logo):
                urlretrieve(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Tux.svg/200px-Tux.svg.png",
                    self.linux_logo
                )
            if not os.path.exists(self.python_logo):
                urlretrieve(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/200px-Python-logo-notext.svg.png",
                    self.python_logo
                )
        except Exception as e:
            print(f"Logo download error: {e}")

    # ---------- SHORTCUTS ----------
    def bind_shortcuts(self):
        self.root.bind("<space>", lambda e: self.toggle_play_pause())
        self.root.bind("<Left>", lambda e: self.rewind())
        self.root.bind("<Right>", lambda e: self.fast_forward())
        self.root.bind("<Up>", lambda e: self.bump_volume(+5))
        self.root.bind("<Down>", lambda e: self.bump_volume(-5))

    # ---------- CTRL + MOUSEWHEEL ----------
    def _on_ctrl_mousewheel(self, event):
        delta = 0
        if hasattr(event, 'delta'):
            delta = event.delta / 120  # Windows
        elif hasattr(event, 'num'):
            delta = 1 if event.num == 4 else -1  # Linux
        self.zoom_image(self.zoom_factor * (1.2 if delta > 0 else 0.8))

    # ---------- MEDIA ----------
    def open_media(self):
        file_types = [
            ("Tüm Medya", "*.mp4 *.avi *.mov *.mkv *.webm *.flv *.jpg *.jpeg *.png *.webp"),
            ("Videolar", "*.mp4 *.avi *.mov *.mkv *.webm *.flv"),
            ("Görseller", "*.jpg *.jpeg *.png *.webp")
        ]

        path = filedialog.askopenfilename(filetypes=file_types)
        if path:
            self.load_media(path)

    def load_media(self, path):
        self.clear_media()
        self.current_media = path
        self.status_lbl.config(text=os.path.basename(path))
        try:
            if path.lower().endswith(('.jpg','.jpeg','.png','.webp')):
                self.show_photo(path)
            else:
                self.prepare_video()
                self.play_video()
        except Exception as e:
            messagebox.showerror("Hata", f"Medya yüklenemedi:\n{str(e)}")

    # ---------- VIDEO ----------
    def prepare_video(self):
        self.is_video = True
        self.photo_label.pack_forget()
        self.video_canvas.pack(fill="both", expand=True)
        try:
            if self.media_player:
                self.media_player.stop()
                self.media_player.release()
                self.media_player = None

            self.media_player = self.instance.media_player_new()
            media = self.instance.media_new(self.current_media)
            self.media_player.set_media(media)

            if sys.platform.startswith("linux"):
                self.media_player.set_xwindow(self.video_canvas.winfo_id())
            elif sys.platform == "win32":
                self.media_player.set_hwnd(self.video_canvas.winfo_id())
            elif sys.platform == "darwin":
                self.media_player.set_nsobject(self.video_canvas.winfo_id())

            self.media_player.audio_set_volume(int(self.volume_slider.get()))
            self.is_playing = False
        except Exception as e:
            messagebox.showerror("Hata", f"Video hazırlanamadı:\n{str(e)}")

    def play_video(self):
        if not self.current_media or not self.media_player:
            return
        try:
            self.media_player.play()
            self.is_playing = True
            self.status_lbl.config(text="Oynatılıyor")
            self._schedule_timeline()
        except Exception as e:
            messagebox.showerror("Hata", f"Video oynatılamadı:\n{str(e)}")

    def pause_video(self):
        if self.media_player:
            self.media_player.pause()
            self.is_playing = False
            self.status_lbl.config(text="Duraklatıldı")

    def toggle_play_pause(self):
        if not self.current_media:
            return
        if not self.is_video:
            return
        if not self.media_player:
            self.prepare_video()
        state = self.media_player.get_state()
        if state in (vlc.State.Playing, vlc.State.Buffering):
            self.pause_video()
        else:
            self.play_video()

    def rewind(self):
        if self.is_video and self.media_player:
            self.media_player.set_time(max(0, self.media_player.get_time() - 10000))

    def fast_forward(self):
        if self.is_video and self.media_player:
            self.media_player.set_time(self.media_player.get_time() + 10000)

    def prev_frame(self):
        if self.is_video and self.media_player:
            try:
                self.media_player.set_pause(1)
                self.media_player.previous_frame()
                self.is_playing = False
                self.status_lbl.config(text="Kare geri")
                self._update_time_labels()
            except Exception:
                pass

    def next_frame(self):
        if self.is_video and self.media_player:
            try:
                self.media_player.set_pause(1)
                self.media_player.next_frame()
                self.is_playing = False
                self.status_lbl.config(text="Kare ileri")
                self._update_time_labels()
            except Exception:
                pass

    # ---------- FULLSCREEN ----------
    def toggle_fullscreen(self, _event=None):
        self.fullscreen = not self.fullscreen
        self.root.attributes("-fullscreen", self.fullscreen)
        if self.fullscreen:
            self.hide_panel_after_delay()
        else:
            self.show_panel()

    def hide_panel_after_delay(self):
        if self.fullscreen:
            self.hide_panel()
            self.hide_panel_job = self.root.after(2000, self.hide_panel_after_delay)

    def hide_panel(self):
        if self.panel_visible:
            self.control_frame.pack_forget()
            self.panel_visible = False

    def show_panel(self):
        if not self.panel_visible:
            self.control_frame.pack(fill="x", padx=10, pady=(0,10))
            self.panel_visible = True
        if self.hide_panel_job:
            self.root.after_cancel(self.hide_panel_job)
        self.hide_panel_after_delay()

    def on_mouse_move(self, _event=None):
        if self.fullscreen:
            self.show_panel()

    # ---------- TIMELINE ----------
    def _schedule_timeline(self):
        self._cancel_timeline_job()
        self._update_timeline()

    def _cancel_timeline_job(self):
        if self._timeline_job:
            try:
                self.root.after_cancel(self._timeline_job)
            except Exception:
                pass
            self._timeline_job = None

    def _update_timeline(self):
        if not self.is_video or not self.media_player:
            return
        try:
            length = self.media_player.get_length()
            if length and length > 0:
                self.length_ms_cached = length
                self.total_time_lbl.config(text=self._ms_to_mmss(length))

            if not self.user_seeking:
                pos = self.media_player.get_time()
                total = self.length_ms_cached or 1
                frac = max(0, min(1, pos / total))
                self.timeline.set(int(frac * 1000))
                self.current_time_lbl.config(text=self._ms_to_mmss(pos))

            state = self.media_player.get_state()
            if state == vlc.State.Ended:
                self.is_playing = False
                self.status_lbl.config(text="Bitti")
                self.media_player.stop()
            else:
                self._timeline_job = self.root.after(100, self._update_timeline)
        except Exception:
            self._timeline_job = self.root.after(200, self._update_timeline)

    def _on_seek_start(self, _event):
        if self.is_video:
            self.user_seeking = True

    def _on_timeline_drag(self, value):
        if self.is_video and (self.length_ms_cached > 0):
            frac = float(value) / 1000.0
            target_ms = int(self.length_ms_cached * frac)
            self.current_time_lbl.config(text=self._ms_to_mmss(target_ms))

    def _on_seek_commit(self, _event):
        if self.is_video and self.media_player and (self.length_ms_cached > 0):
            frac = float(self.timeline.get()) / 1000.0
            target_ms = int(self.length_ms_cached * frac)
            try:
                self.media_player.set_time(target_ms)
            except Exception:
                self.media_player.set_position(frac)
        self.user_seeking = False
        self._update_time_labels()

    # ---------- Yeni: timeline tıklama ----------
    def _on_timeline_click(self, event):
        if not self.is_video or not self.media_player or self.length_ms_cached <= 0:
            return
        x = event.x
        w = self.timeline.winfo_width()
        frac = max(0, min(1, x / w))
        target_ms = int(self.length_ms_cached * frac)
        self.media_player.set_time(target_ms)
        self.timeline.set(int(frac * 1000))
        self.current_time_lbl.config(text=self._ms_to_mmss(target_ms))

    def _update_time_labels(self):
        if self.is_video and self.media_player:
            pos = self.media_player.get_time()
            self.current_time_lbl.config(text=self._ms_to_mmss(pos))
            total = self.length_ms_cached
            self.total_time_lbl.config(text=self._ms_to_mmss(total))

    def _ms_to_mmss(self, ms):
        seconds = int(ms / 1000)
        m, s = divmod(seconds, 60)
        return f"{m:02}:{s:02}"

    # ---------- PHOTO ----------
    def show_photo(self, path):
        self.is_video = False
        self.video_canvas.pack_forget()
        self.photo_label.pack(fill="both", expand=True)

        self.original_image = Image.open(path)
        self.zoom_factor = 1.0
        self._update_photo_image()

    def zoom_image(self, factor):
        if self.is_video:
            return
        self.zoom_factor = factor
        self._update_photo_image()

    def _update_photo_image(self):
        if not self.original_image:
            return
        w, h = self.photo_label.winfo_width(), self.photo_label.winfo_height()
        if w <= 0 or h <= 0:
            self.root.after(100, self._update_photo_image)
            return
        img = self.original_image.copy()
        new_w, new_h = int(img.width * self.zoom_factor), int(img.height * self.zoom_factor)
        img = img.resize((new_w, new_h), Image.LANCZOS)
        self.current_image = img
        self.photo_image = ImageTk.PhotoImage(img)
        self.photo_label.config(image=self.photo_image)

    # ---------- VOLUME ----------
    def set_volume(self, value):
        try:
            vol = int(float(value))
            self.volume_lbl.config(text=f"{vol}%")
            if self.media_player:
                self.media_player.audio_set_volume(vol)
        except Exception:
            pass

    def bump_volume(self, delta):
        vol = min(100, max(0, int(self.volume_slider.get()) + delta))
        self.volume_slider.set(vol)
        self.set_volume(vol)

    def toggle_mute(self):
        if self.media_player:
            mute = self.media_player.audio_get_mute()
            self.media_player.audio_toggle_mute()
        else:
            vol = self.volume_slider.get()
            if vol > 0:
                self._volume_before_mute = vol
                self.volume_slider.set(0)
            else:
                self.volume_slider.set(self._volume_before_mute)
            self.set_volume(self.volume_slider.get())

    # ---------- ABOUT ----------
    def show_about(self):
        about_win = tk.Toplevel(self.root)
        about_win.title("Hakkında - Mini Media Player")
        about_win.geometry("500x500")
        about_win.resizable(False, False)
        about_win.configure(bg=self.colors["panel"])

        # Logolar
        linux_img = Image.open(self.linux_logo).resize((80,80), Image.LANCZOS)
        python_img = Image.open(self.python_logo).resize((80,80), Image.LANCZOS)
        linux_photo = ImageTk.PhotoImage(linux_img)
        python_photo = ImageTk.PhotoImage(python_img)

        lbl_linux = tk.Label(about_win, image=linux_photo, bg=self.colors["panel"])
        lbl_linux.image = linux_photo
        lbl_linux.pack(pady=(20,8))

        lbl_python = tk.Label(about_win, image=python_photo, bg=self.colors["panel"])
        lbl_python.image = python_photo
        lbl_python.pack(pady=(0,12))

        # Başlık
        title_lbl = tk.Label(about_win, text="MINI MEDIA PLAYER", font=("Segoe UI",16,"bold"), fg=self.colors["acc"], bg=self.colors["panel"])
        title_lbl.pack(pady=(0,16))

        # Açıklama
        desc_text = "Open Source Free Software\nDeveloped by Sezer Karaoğlan\nBuilt on Python Architecture"
        desc_lbl = tk.Label(about_win, text=desc_text, font=("Segoe UI",12), fg=self.colors["fg"], bg=self.colors["panel"], justify="center")
        desc_lbl.pack(pady=(0,180))

        # Footer
        footer_lbl = tk.Label(about_win, text="Powered by Sezer Since 2025", font=("Segoe UI",9), fg=self.colors["fg"], bg=self.colors["panel"])
        footer_lbl.pack(side="bottom", pady=12)

    # ---------- CLEANUP ----------
    def clear_media(self):
        if self.media_player:
            self.media_player.stop()
            self.media_player.release()
            self.media_player = None
        self.photo_label.pack_forget()
        self.video_canvas.pack(fill="both", expand=True)
        self.is_video = False
        self.is_playing = False
        self.current_media = None
        self.status_lbl.config(text="Hazır")
        self.timeline.set(0)
        self.current_time_lbl.config(text="00:00")
        self.total_time_lbl.config(text="00:00")

    def cleanup_and_exit(self):
        self.clear_media()
        self.root.destroy()

    # ---------- RESIZE ----------
    def _on_media_area_resize(self, event):
        if not self.is_video:
            self._update_photo_image()


if __name__ == "__main__":
    root = tk.Tk()
    app = UltraMediaPlayer(root)
    root.mainloop()
