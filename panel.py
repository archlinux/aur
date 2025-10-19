#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Pythia Panel — полноценная панель для собственной DE на Arch Linux.
Функции:
- Меню приложений с иконками и поиском
- Переключение/скрытие окон
- Системный трей (громкость, Wi-Fi, батарея)
- Часы
Зависимости: python, tk, pillow, xdotool, wmctrl, pulseaudio, wireless_tools, acpi
"""

import tkinter as tk
from datetime import datetime
import subprocess
import os
import sys
import re
import configparser
from pathlib import Path

# === Попытка импорта Pillow для иконок ===
try:
    from PIL import Image, ImageTk
    PIL_AVAILABLE = True
except ImportError:
    PIL_AVAILABLE = False

# ======================
# ⚙️ НАСТРОЙКИ
# ======================
PANEL_HEIGHT = 36
PANEL_POSITION = "bottom"  # "top" или "bottom"
BG_COLOR = "#1e1e2e"
FG_COLOR = "#cdd6f4"
BUTTON_BG = "#313244"
BUTTON_HOVER = "#45475a"
MENU_BG = "#181825"
MENU_FG = "#cdd6f4"
FONT_FAMILY = "FiraCode Nerd Font"  # Поддерживает иконки!
FONT_SIZE = 10
ICON_SIZE = 24

# ======================
# 🧠 ВСПОМОГАТЕЛЬНЫЕ ФУНКЦИИ
# ======================

def get_volume_info():
    try:
        result = subprocess.run(
            ["pactl", "get-sink-volume", "@DEFAULT_SINK@"],
            stdout=subprocess.PIPE, text=True, stderr=subprocess.DEVNULL
        )
        match = re.search(r'/\s*(\d+)%', result.stdout)
        vol = int(match.group(1)) if match else 0
        muted = "yes" in subprocess.run(
            ["pactl", "get-sink-mute", "@DEFAULT_SINK@"],
            stdout=subprocess.PIPE, text=True, stderr=subprocess.DEVNULL
        ).stdout
        return vol, muted
    except:
        return 0, True

def get_wifi_info():
    try:
        result = subprocess.run(
            ["iwgetid", "-r"],
            stdout=subprocess.PIPE, text=True, stderr=subprocess.DEVNULL
        )
        ssid = result.stdout.strip()
        return bool(ssid), ssid if ssid else None
    except:
        return False, None

def get_battery_info():
    try:
        battery_dir = Path("/sys/class/power_supply")
        for dev in battery_dir.iterdir():
            if dev.name.startswith("BAT"):
                cap_file = dev / "capacity"
                stat_file = dev / "status"
                if cap_file.exists() and stat_file.exists():
                    capacity = int(cap_file.read_text().strip())
                    status = stat_file.read_text().strip()
                    charging = status in ("Charging", "Full")
                    return capacity, charging
        return None, None
    except:
        return None, None

def get_visible_windows():
    try:
        result = subprocess.run(
            ["xdotool", "search", "--onlyvisible", "--name", "."],
            stdout=subprocess.PIPE, text=True, stderr=subprocess.DEVNULL
        )
        window_ids = [wid for wid in result.stdout.strip().split() if wid.isdigit()]
        windows = []
        for wid in window_ids:
            name = subprocess.run(
                ["xdotool", "getwindowname", wid],
                stdout=subprocess.PIPE, text=True, stderr=subprocess.DEVNULL
            ).stdout.strip()
            if name and "Pythia Panel" not in name:
                short_name = (name[:20] + "...") if len(name) > 20 else name
                windows.append({'id': wid, 'name': short_name, 'visible': True})
        return windows
    except:
        return []

def get_all_windows():
    try:
        result = subprocess.run(
            ["wmctrl", "-l"],
            stdout=subprocess.PIPE, text=True, stderr=subprocess.DEVNULL
        )
        lines = result.stdout.strip().split("\n")
        windows = []
        for line in lines:
            if not line.strip():
                continue
            parts = line.split(maxsplit=3)
            if len(parts) < 4:
                continue
            wid_hex = parts[0]
            try:
                wid_dec = str(int(wid_hex, 16))
            except:
                continue
            name = parts[3]
            if "Pythia Panel" in name:
                continue
            windows.append({
                'id': wid_dec,
                'name': (name[:20] + "...") if len(name) > 20 else name,
                'visible': False
            })
        return windows
    except:
        return []

def toggle_window(window_id):
    try:
        result = subprocess.run(
            ["xdotool", "search", "--onlyvisible", "--name", "."],
            stdout=subprocess.PIPE, text=True, stderr=subprocess.DEVNULL
        )
        visible_ids = set(result.stdout.strip().split())
        if window_id in visible_ids:
            subprocess.run(["xdotool", "windowminimize", window_id], stderr=subprocess.DEVNULL)
        else:
            subprocess.run(["xdotool", "windowactivate", window_id], stderr=subprocess.DEVNULL)
    except Exception as e:
        print(f"Ошибка переключения окна {window_id}: {e}")

def launch_app(cmd):
    try:
        clean_cmd = cmd.split()[0] if ' ' in cmd else cmd
        subprocess.Popen([clean_cmd])
    except Exception as e:
        print(f"Ошибка запуска: {cmd} — {e}")

def load_desktop_entries():
    entries = []
    paths = [
        Path("/usr/share/applications"),
        Path.home() / ".local/share/applications"
    ]
    for path in paths:
        if not path.exists():
            continue
        for file in path.glob("*.desktop"):
            try:
                config = configparser.ConfigParser(interpolation=None)
                config.read(file, encoding='utf-8')
                if 'Desktop Entry' not in config:
                    continue
                section = config['Desktop Entry']
                if section.get('NoDisplay', 'false').lower() == 'true':
                    continue
                if section.get('Type', 'Application') != 'Application':
                    continue
                name = section.get('Name', 'Unknown')
                exec_cmd = section.get('Exec')
                icon = section.get('Icon', '')
                if not exec_cmd:
                    continue
                entries.append({'name': name, 'exec': exec_cmd, 'icon': icon})
            except:
                continue
    return entries

def get_icon_path(icon_name):
    if not icon_name:
        return None
    if icon_name.startswith("/"):
        return icon_name if os.path.exists(icon_name) else None
    icon_dirs = [
        Path("/usr/share/icons"),
        Path.home() / ".local/share/icons",
        Path("/usr/share/pixmaps")
    ]
    extensions = [".png", ".svg", ".xpm"]
    for icon_dir in icon_dirs:
        if not icon_dir.exists():
            continue
        for ext in extensions:
            full_path = icon_dir / (icon_name + ext)
            if full_path.exists():
                return str(full_path)
            for candidate in icon_dir.rglob(icon_name + ext):
                return str(candidate)
    return None

# ======================
# 🖥️ КЛАСС ПАНЕЛИ
# ======================

class PythiaPanel:
    def __init__(self):
        self.root = tk.Tk()
        self.root.title("Pythia Panel")
        self.root.overrideredirect(True)
        self.root.configure(bg=BG_COLOR)

        sw = self.root.winfo_screenwidth()
        sh = self.root.winfo_screenheight()
        y = 0 if PANEL_POSITION == "top" else sh - PANEL_HEIGHT
        self.root.geometry(f"{sw}x{PANEL_HEIGHT}+0+{y}")
        self.root.wm_attributes("-topmost", True)

        # Кнопка меню
        self.start_btn = tk.Button(
            self.root,
            text=" Menu",
            bg=BUTTON_BG,
            fg=FG_COLOR,
            font=(FONT_FAMILY, FONT_SIZE),
            relief="flat",
            command=self.toggle_menu,
            activebackground=BUTTON_HOVER
        )
        self.start_btn.pack(side="left", padx=6, pady=2)

        # Запущенные приложения
        self.apps_frame = tk.Frame(self.root, bg=BG_COLOR)
        self.apps_frame.pack(side="left", fill="x", expand=True, padx=5)

        # Системный трей
        self.tray_frame = tk.Frame(self.root, bg=BG_COLOR)
        self.tray_frame.pack(side="right", padx=5)

        # Часы
        self.clock_label = tk.Label(
            self.root,
            text="",
            bg=BG_COLOR,
            fg=FG_COLOR,
            font=(FONT_FAMILY, FONT_SIZE)
        )
        self.clock_label.pack(side="right", padx=10)

        self.menu_window = None
        self.apps_list = load_desktop_entries()

        self.update_clock()
        self.update_apps()
        self.update_tray()

    def update_clock(self):
        self.clock_label.config(text=datetime.now().strftime("%H:%M"))
        self.root.after(60000, self.update_clock)

    def update_apps(self):
        for w in self.apps_frame.winfo_children():
            w.destroy()

        visible = {w['id']: w for w in get_visible_windows()}
        all_windows = get_all_windows()

        displayed = {}
        for w in all_windows:
            wid = w['id']
            if wid in visible:
                displayed[wid] = visible[wid]
            else:
                if wid not in displayed:
                    displayed[wid] = w

        seen_names = set()
        unique_windows = []
        for w in displayed.values():
            if w['name'] not in seen_names:
                unique_windows.append(w)
                seen_names.add(w['name'])

        for w in unique_windows[:10]:
            btn = tk.Button(
                self.apps_frame,
                text=w['name'],
                bg=BUTTON_BG,
                fg=FG_COLOR,
                font=(FONT_FAMILY, FONT_SIZE - 1),
                relief="flat",
                activebackground=BUTTON_HOVER,
                command=lambda wid=w['id']: toggle_window(wid)
            )
            btn.pack(side="left", padx=2)

        self.root.after(2000, self.update_apps)

    def update_tray(self):
        for w in self.tray_frame.winfo_children():
            w.destroy()

        # Громкость
        vol, muted = get_volume_info()
        if muted:
            vol_icon = ""
        elif vol == 0:
            vol_icon = ""
        elif vol < 50:
            vol_icon = ""
        else:
            vol_icon = ""
        vol_label = tk.Label(
            self.tray_frame, text=f"{vol_icon} {vol}%",
            bg=BG_COLOR, fg=FG_COLOR, font=(FONT_FAMILY, FONT_SIZE - 1)
        )
        vol_label.pack(side="right", padx=5)

        # Wi-Fi
        wifi_connected, _ = get_wifi_info()
        wifi_icon = "" if wifi_connected else "睊"
        wifi_label = tk.Label(
            self.tray_frame, text=wifi_icon,
            bg=BG_COLOR, fg=FG_COLOR, font=(FONT_FAMILY, FONT_SIZE)
        )
        wifi_label.pack(side="right", padx=5)

        # Батарея
        battery, charging = get_battery_info()
        if battery is not None:
            if charging:
                bat_icon = ""
            elif battery > 75:
                bat_icon = ""
            elif battery > 50:
                bat_icon = ""
            elif battery > 25:
                bat_icon = ""
            else:
                bat_icon = ""
            bat_label = tk.Label(
                self.tray_frame, text=f"{bat_icon} {battery}%",
                bg=BG_COLOR, fg=FG_COLOR, font=(FONT_FAMILY, FONT_SIZE - 1)
            )
            bat_label.pack(side="right", padx=5)

        self.root.after(5000, self.update_tray)

    def toggle_menu(self):
        if self.menu_window and self.menu_window.winfo_exists():
            self.menu_window.destroy()
            self.menu_window = None
        else:
            self.show_menu()

    def show_menu(self):
        self.menu_window = tk.Toplevel(self.root)
        self.menu_window.overrideredirect(True)
        self.menu_window.configure(bg=MENU_BG)

        x = 10
        y = PANEL_HEIGHT if PANEL_POSITION == "bottom" else PANEL_HEIGHT
        self.menu_window.geometry(f"600x500+{x}+{y}")
        self.menu_window.wm_attributes("-topmost", True)

        search_var = tk.StringVar()
        search_entry = tk.Entry(
            self.menu_window,
            textvariable=search_var,
            bg="#313244",
            fg=MENU_FG,
            insertbackground=MENU_FG,
            font=(FONT_FAMILY, FONT_SIZE)
        )
        search_entry.pack(fill="x", padx=5, pady=5)
        search_entry.focus_set()

        canvas = tk.Canvas(self.menu_window, bg=MENU_BG, highlightthickness=0)
        scrollbar = tk.Scrollbar(self.menu_window, orient="vertical", command=canvas.yview)
        scrollable_frame = tk.Frame(canvas, bg=MENU_BG)

        scrollable_frame.bind(
            "<Configure>",
            lambda e: canvas.configure(scrollregion=canvas.bbox("all"))
        )

        canvas.create_window((0, 0), window=scrollable_frame, anchor="nw")
        canvas.configure(yscrollcommand=scrollbar.set)

        canvas.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")

        def filter_apps(*_):
            query = search_var.get().lower()
            for widget in scrollable_frame.winfo_children():
                widget.destroy()
            for app in self.apps_list:
                if query in app['name'].lower():
                    self.create_app_button(scrollable_frame, app)

        search_var.trace("w", filter_apps)
        filter_apps()

        self.root.bind("<Button-1>", self._close_menu_on_click_outside, add="+")

    def _close_menu_on_click_outside(self, event):
        if self.menu_window and self.menu_window.winfo_exists():
            x, y = event.x_root, event.y_root
            menu_x1 = self.menu_window.winfo_rootx()
            menu_y1 = self.menu_window.winfo_rooty()
            menu_x2 = menu_x1 + self.menu_window.winfo_width()
            menu_y2 = menu_y1 + self.menu_window.winfo_height()
            if not (menu_x1 <= x <= menu_x2 and menu_y1 <= y <= menu_y2):
                self.menu_window.destroy()
                self.menu_window = None
                self.root.unbind("<Button-1>")

    def create_app_button(self, parent, app):
        frame = tk.Frame(parent, bg=MENU_BG)
        frame.pack(fill="x", padx=5, pady=2)

        icon_label = tk.Label(frame, bg=MENU_BG)
        if PIL_AVAILABLE and app['icon']:
            icon_path = get_icon_path(app['icon'])
            if icon_path:
                try:
                    img = Image.open(icon_path).convert("RGBA")
                    img = img.resize((ICON_SIZE, ICON_SIZE), Image.LANCZOS)
                    photo = ImageTk.PhotoImage(img)
                    icon_label.config(image=photo)
                    icon_label.image = photo
                except:
                    pass

        icon_label.pack(side="left", padx=(0, 10))

        name_label = tk.Label(
            frame,
            text=app['name'],
            bg=MENU_BG,
            fg=MENU_FG,
            font=(FONT_FAMILY, FONT_SIZE),
            anchor="w"
        )
        name_label.pack(side="left", fill="x", expand=True)

        def on_click():
            launch_app(app['exec'])
            if self.menu_window:
                self.menu_window.destroy()
                self.menu_window = None

        for widget in (icon_label, name_label, frame):
            widget.bind("<Button-1>", lambda e: on_click())
            widget.configure(cursor="hand2")

    def run(self):
        self.root.mainloop()

# ======================
# ▶️ ЗАПУСК
# ======================

if __name__ == "__main__":
    if not os.environ.get("DISPLAY"):
        print("Ошибка: запускайте внутри X11-сессии (например, через startx).")
        sys.exit(1)

    # Проверка зависимостей (опционально)
    deps = ["xdotool", "wmctrl"]
    for dep in deps:
        if not subprocess.run(["which", dep], stdout=subprocess.DEVNULL).returncode == 0:
            print(f"Предупреждение: {dep} не установлен. Некоторые функции могут не работать.")
    
    panel = PythiaPanel()
    panel.run()