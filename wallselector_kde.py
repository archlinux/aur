#!/usr/bin/env python3
import os
import sys
import glob
import hashlib
import subprocess
import fcntl
import json
import signal
import time

from PyQt6.QtWidgets import (
    QApplication, QWidget, QLabel, QFrame, QGraphicsDropShadowEffect,
    QPushButton, QDialog, QVBoxLayout, QHBoxLayout, QCheckBox,
    QLineEdit, QFileDialog, QComboBox, QSpacerItem, QSizePolicy
)
from PyQt6.QtGui import (
    QPixmap, QKeyEvent, QGuiApplication, QImageReader,
    QPainter, QPainterPath, QColor, QWheelEvent, QMouseEvent, QPen
)
from PyQt6.QtCore import (
    Qt, QSize, QPropertyAnimation, QEasingCurve, QRectF, QTimer, QPoint, QEvent, QRect, QCoreApplication, pyqtProperty
)

DAEMON_PID_FILE = f"/tmp/wallselector_daemon_{os.getuid()}.pid"
DAEMON_LOCK_FILE = f"/tmp/wallselector_daemon_{os.getuid()}.lock"
GUI_PID_FILE = f"/tmp/wallselector_gui_{os.getuid()}.pid"
GUI_LOCK_FILE = f"/tmp/wallselector_gui_{os.getuid()}.lock"
CONFIG_FILE = os.path.expanduser("~/.config/wallselector-kde.json")
DEFAULT_DIR = os.path.expanduser("~/Pictures/Wallpapers")

I18N = {
    "en": {"settings_title": "Settings", "folder": "Wallpaper Folder:", "browse": "Browse", "pause_bat": "Pause on Battery", "pause_dpms": "Pause when Screen Off (DPMS)", "pause_man": "Force Pause Video Wallpapers", "shortcut": "Global Shortcut (Wayland):", "kde_btn": "Configure in KDE", "autostart": "Autostart on Boot", "language": "Language:", "close": "Close", "save": "Save", "settings_btn": "⚙ Settings"},
    "uk": {"settings_title": "Налаштування", "folder": "Папка зі шпалерами:", "browse": "Огляд", "pause_bat": "Пауза від батареї", "pause_dpms": "Пауза, якщо екран вимкнено", "pause_man": "Примусова пауза відео", "shortcut": "Глобальна комбінація (Wayland):", "kde_btn": "Налаштувати в KDE", "autostart": "Автозапуск при ввімкненні", "language": "Мова (Language):", "close": "Закрити", "save": "Зберегти", "settings_btn": "⚙ Налаштування"},
    "ru": {"settings_title": "Настройки", "folder": "Папка с обоями:", "browse": "Обзор", "pause_bat": "Пауза от батареи", "pause_dpms": "Пауза при выкл. экране", "pause_man": "Принудительная пауза видео", "shortcut": "Глобальная комбинация (Wayland):", "kde_btn": "Настроить в KDE", "autostart": "Автозапуск при старте ПК", "language": "Язык (Language):", "close": "Закрыть", "save": "Сохранить", "settings_btn": "⚙ Настройки"}
}

def load_config():
    cfg = {"wallpaper_folder": DEFAULT_DIR, "pause_battery": False, "pause_screen_off": False, "pause_manual": False, "language": "en", "autostart": True}
    if os.path.exists(CONFIG_FILE):
        try:
            with open(CONFIG_FILE, 'r') as f: cfg.update(json.load(f))
        except Exception: pass
    return cfg

def save_config(cfg):
    os.makedirs(os.path.dirname(CONFIG_FILE), exist_ok=True)
    with open(CONFIG_FILE, 'w') as f: json.dump(cfg, f)

CACHE_DIR = os.path.expanduser("~/.cache/plasma-wallpapers")
LAST_WP_FILE = os.path.join(CACHE_DIR, "last_selected.txt")
COLOR_CACHE_FILE = os.path.join(CACHE_DIR, "colors.json")

# Загрузка кэша цветов для мгновенного старта
COLOR_CACHE = {}
if os.path.exists(COLOR_CACHE_FILE):
    try:
        with open(COLOR_CACHE_FILE, 'r') as f: COLOR_CACHE = json.load(f)
    except: pass

def save_color_cache():
    try:
        with open(COLOR_CACHE_FILE, 'w') as f: json.dump(COLOR_CACHE, f)
    except: pass

BASE_PREVIEW_SIZE = QSize(600, 300)
FOCUSED_ITEM_SIZE = QSize(600, 300)
NORMAL_ITEM_SIZE = QSize(180, 240)
SETTINGS_DIALOG_SIZE = (480, 540)
STATIC_TYPES = ('*.jpg', '*.jpeg', '*.png', '*.webp')
VIDEO_TYPES = ('*.mp4', '*.mkv', '*.webm')

SKEW_OFFSET = 40
ITEM_GAP = 15

os.makedirs(CACHE_DIR, exist_ok=True)

def cache_filename_for(path: str, size: QSize) -> str:
    h = hashlib.md5(path.encode("utf-8")).hexdigest()[:16]
    return os.path.join(CACHE_DIR, f"thumb_{h}_{size.width()}x{size.height()}.jpg")

def extract_dominant_color(image_path: str) -> QColor:
    reader = QImageReader(image_path)
    if not reader.canRead(): return QColor(255, 255, 255)
    img = reader.read()
    if img.isNull(): return QColor(255, 255, 255)
    scaled = img.scaled(1, 1, Qt.AspectRatioMode.IgnoreAspectRatio, Qt.TransformationMode.SmoothTransformation)
    return QColor(scaled.pixelColor(0, 0))

class SkewedWallpaperView(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.pixmap = QPixmap()
        self.dim_alpha = 150
        self.focus_val = 0.0
        self.glow_color = QColor(255, 255, 255)

    def setPixmap(self, pix):
        self.pixmap = pix
        self.update()

    def setDimAlpha(self, alpha):
        self.dim_alpha = alpha
        self.update()

    def setFocusData(self, val, color):
        self.focus_val = val
        self.glow_color = color
        self.update()

    def paintEvent(self, event):
        if self.pixmap.isNull(): return
        painter = QPainter(self)
        painter.setRenderHints(QPainter.RenderHint.Antialiasing | QPainter.RenderHint.SmoothPixmapTransform)

        w, h = self.width(), self.height()
        path = QPainterPath()
        path.moveTo(SKEW_OFFSET, 0)
        path.lineTo(w, 0)
        path.lineTo(w - SKEW_OFFSET, h)
        path.lineTo(0, h)
        path.lineTo(SKEW_OFFSET, 0)

        # Обрезаем картинку по форме параллелограмма
        painter.setClipPath(path)

        pw, ph = self.pixmap.width(), self.pixmap.height()
        if pw > 0 and ph > 0:
            if pw * h > w * ph:
                new_w = int(ph * (w / h))
                src_rect = QRect((pw - new_w) // 2, 0, new_w, ph)
            else:
                new_h = int(pw * (h / w))
                src_rect = QRect(0, (ph - new_h) // 2, pw, new_h)
            painter.drawPixmap(self.rect(), self.pixmap, src_rect)

        if self.dim_alpha > 0:
            painter.fillRect(self.rect(), QColor(10, 10, 15, self.dim_alpha))

        # Отключаем обрезку, чтобы нарисовать рамки поверх обоев
        painter.setClipping(False)

        # ОПТИМИЗАЦИЯ ВИЗУАЛА: Элегантная рамка для неактивных обоев (чтобы не казались деревянными)
        if self.focus_val < 0.99:
            alpha_border = int(40 * (1.0 - self.focus_val))
            pen = QPen(QColor(255, 255, 255, alpha_border))
            pen.setWidth(1)
            pen.setJoinStyle(Qt.PenJoinStyle.MiterJoin)
            painter.setPen(pen)
            painter.setBrush(Qt.BrushStyle.NoBrush)
            painter.drawPath(path)

        # Активная жирная цветная рамка
        if self.focus_val > 0.01:
            pen = QPen(QColor(self.glow_color.red(), self.glow_color.green(), self.glow_color.blue(), int(220 * self.focus_val)))
            pen.setWidth(int(4 * self.focus_val))
            pen.setJoinStyle(Qt.PenJoinStyle.MiterJoin)
            painter.setPen(pen)
            painter.setBrush(Qt.BrushStyle.NoBrush)
            painter.drawPath(path)

class ToggleSwitch(QCheckBox):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setFixedSize(44, 24)
        self.setCursor(Qt.CursorShape.PointingHandCursor)
        self._position = 0.0

        self.anim = QPropertyAnimation(self, b"position")
        self.anim.setDuration(250)
        self.anim.setEasingCurve(QEasingCurve.Type.InOutQuad)

        self.stateChanged.connect(self.start_transition)

    @pyqtProperty(float)
    def position(self):
        return self._position

    @position.setter
    def position(self, pos):
        self._position = pos
        self.update()

    def start_transition(self, value):
        self.anim.stop()
        self.anim.setEndValue(1.0 if value else 0.0)
        self.anim.start()

    def paintEvent(self, event):
        p = QPainter(self)
        p.setRenderHint(QPainter.RenderHint.Antialiasing)

        track_color = QColor("#3daee9") if self.isChecked() else QColor(255, 255, 255, 30)
        p.setBrush(track_color)
        p.setPen(Qt.PenStyle.NoPen)
        p.drawRoundedRect(0, 0, self.width(), self.height(), self.height() // 2, self.height() // 2)

        thumb_radius = self.height() - 4
        thumb_x = int(self._position * (self.width() - thumb_radius - 4)) + 2

        p.setBrush(QColor(255, 255, 255))
        p.drawEllipse(thumb_x, 2, thumb_radius, thumb_radius)
        p.end()

    def hitButton(self, pos: QPoint) -> bool:
        return self.rect().contains(pos)

class DaemonWatcher:
    def __init__(self):
        self.last_state = None
        self.timer = QTimer()
        self.timer.timeout.connect(self.check_state)
        self.timer.start(3000)

    def force_update(self):
        self.last_state = None
        self.check_state()

    def check_state(self):
        cfg = load_config()
        should_pause = False
        if cfg.get("pause_manual", False): should_pause = True
        else:
            if cfg.get("pause_battery", False):
                try:
                    for bat in glob.glob("/sys/class/power_supply/BAT*/status"):
                        with open(bat, "r") as f:
                            if f.read().strip() == "Discharging":
                                should_pause = True
                                break
                except: pass
            if not should_pause and cfg.get("pause_screen_off", False):
                try:
                    res = subprocess.run(["qdbus6", "org.freedesktop.ScreenSaver", "/ScreenSaver", "org.freedesktop.ScreenSaver.GetActive"], capture_output=True, text=True, timeout=1)
                    if "true" in res.stdout.strip().lower(): should_pause = True
                except: pass
                if not should_pause:
                    try:
                        connectors = glob.glob("/sys/class/drm/card*-*/status")
                        active, off = 0, 0
                        for conn in connectors:
                            with open(conn, 'r') as f:
                                if f.read().strip() == "connected":
                                    active += 1
                                    dpms_path = conn.replace("status", "dpms")
                                    if os.path.exists(dpms_path):
                                        with open(dpms_path, 'r') as df:
                                            if df.read().strip().lower() != "on": off += 1
                        if active > 0 and active == off: should_pause = True
                    except: pass

        if should_pause != self.last_state:
            self.apply_state(should_pause)
            self.last_state = should_pause

    def apply_state(self, pause):
        try:
            with open(LAST_WP_FILE, 'r') as f: current_wp = f.read().strip()
        except: return

        if pause:
            h = hashlib.md5(current_wp.encode("utf-8")).hexdigest()[:16]
            cache_thumb = os.path.join(CACHE_DIR, f"thumb_{h}_{BASE_PREVIEW_SIZE.width()}x{BASE_PREVIEW_SIZE.height()}.jpg")
            if not os.path.exists(cache_thumb): return
            plugin = "org.kde.image"
            cfg_key = "Image"
            cfg_val = f"file://{os.path.abspath(cache_thumb)}"
        else:
            is_video = current_wp.lower().endswith(VIDEO_TYPES[0][1:]) or current_wp.lower().endswith(VIDEO_TYPES[1][1:]) or current_wp.lower().endswith(VIDEO_TYPES[2][1:])
            if is_video:
                plugin = "luisbocanegra.smart.video.wallpaper.reborn"
                cfg_key = "VideoUrls"
                cfg_val = f'[{{"filename":"file://{current_wp}","enabled":true}}]'
            else:
                plugin = "org.kde.image"
                cfg_key = "Image"
                cfg_val = f"file://{current_wp}"

        js_code = f"var d = desktops(); for(var i=0; i<d.length; i++) {{ d[i].wallpaperPlugin = '{plugin}'; d[i].currentConfigGroup = ['Wallpaper', '{plugin}', 'General']; d[i].writeConfig('{cfg_key}', '{cfg_val}'); }}"

        subprocess.Popen(["qdbus6", "org.kde.plasmashell", "/PlasmaShell", "org.kde.PlasmaShell.evaluateScript", js_code], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        subprocess.Popen(["kwriteconfig6", "--file", "kscreenlockerrc", "--group", "Greeter", "--key", "WallpaperPlugin", plugin], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        subprocess.Popen(["kwriteconfig6", "--file", "kscreenlockerrc", "--group", "Greeter", "--group", "Wallpaper", "--group", plugin, "--group", "General", "--key", cfg_key, cfg_val], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

class SettingsMenu(QDialog):
    def __init__(self, parent=None, current_config=None, anchor_widget=None):
        super().__init__(parent)
        self.cfg = current_config
        self.anchor = anchor_widget
        self.lang = self.cfg.get("language", "en")
        if self.lang not in I18N: self.lang = "en"
        self.t = I18N[self.lang]

        self.setWindowFlags(Qt.WindowType.Tool | Qt.WindowType.FramelessWindowHint | Qt.WindowType.WindowStaysOnTopHint)
        self.setAttribute(Qt.WidgetAttribute.WA_TranslucentBackground)
        self.setFixedSize(*SETTINGS_DIALOG_SIZE)

        self.setStyleSheet("""
            QDialog { background: transparent; }
            QLabel { color: rgba(255, 255, 255, 220); font-size: 14px; background: transparent; border: none; min-height: 20px;}
            QLineEdit, QComboBox {
                background: rgba(255, 255, 255, 10);
                color: white;
                border: 1px solid rgba(255, 255, 255, 20);
                border-radius: 8px;
                padding: 6px 12px;
                font-size: 13px;
                min-height: 24px;
            }
            QComboBox::drop-down { border: none; }
            QComboBox QAbstractItemView {
                background-color: rgba(30, 30, 35, 240);
                color: white;
                selection-background-color: #3daee9;
                border-radius: 4px;
            }
            QPushButton {
                background-color: rgba(255, 255, 255, 10);
                color: white;
                border-radius: 8px;
                padding: 6px 16px;
                font-size: 13px;
                border: 1px solid rgba(255,255,255,15);
                min-height: 24px;
            }
            QPushButton:hover { background-color: rgba(255, 255, 255, 25); }
            QPushButton#SaveBtn { background-color: #3daee9; font-weight: bold; border: none; color: white; }
            QPushButton#SaveBtn:hover { background-color: #4dbfff; }
        """)

        self.bg = QFrame(self)
        self.bg.setObjectName("MainBG")
        self.bg.setGeometry(0, 0, SETTINGS_DIALOG_SIZE[0], 0)

        self.bg.setStyleSheet("""
            QFrame#MainBG {
                background-color: rgba(25, 25, 30, 210);
                border-radius: 24px;
                border: 1px solid rgba(255, 255, 255, 30);
            }
        """)

        self.shadow = QGraphicsDropShadowEffect(self)
        self.shadow.setBlurRadius(40)
        self.shadow.setColor(QColor(0, 0, 0, 150))
        self.shadow.setOffset(0, 10)
        self.bg.setGraphicsEffect(self.shadow)

        self.content = QWidget(self.bg)
        self.content.setFixedSize(*SETTINGS_DIALOG_SIZE)
        layout = QVBoxLayout(self.content)
        layout.setContentsMargins(30, 30, 30, 30)
        layout.setSpacing(16)

        title = QLabel(self.t["settings_title"])
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        title.setStyleSheet("color: white; font-size: 18px; font-weight: bold; background: transparent; border: none; margin-bottom: 5px;")
        layout.addWidget(title)

        def create_toggle_row(label_text, config_key, default=False):
            row = QHBoxLayout()
            lbl = QLabel(label_text)
            toggle = ToggleSwitch()
            initial_val = self.cfg.get(config_key, default)
            toggle.setChecked(initial_val)
            toggle._position = 1.0 if initial_val else 0.0
            row.addWidget(lbl)
            row.addStretch()
            row.addWidget(toggle)
            return row, toggle

        layout.addWidget(QLabel(self.t["language"]))
        self.lang_cb = QComboBox()
        self.lang_cb.addItems(["en", "uk", "ru"])
        self.lang_cb.setCurrentText(self.lang)
        self.lang_cb.currentTextChanged.connect(self.change_language_preview)
        layout.addWidget(self.lang_cb)

        layout.addWidget(QLabel(self.t["folder"]))
        h_lay = QHBoxLayout()
        self.path_input = QLineEdit(self.cfg["wallpaper_folder"])
        self.path_input.setReadOnly(True)
        self.btn_br = QPushButton(self.t["browse"])
        self.btn_br.clicked.connect(self.browse)
        h_lay.addWidget(self.path_input)
        h_lay.addWidget(self.btn_br)
        layout.addLayout(h_lay)

        layout.addSpacing(10)

        row_auto, self.cb_auto = create_toggle_row(self.t["autostart"], "autostart", True)
        layout.addLayout(row_auto)

        row_bat, self.cb_bat = create_toggle_row(self.t["pause_bat"], "pause_battery", False)
        layout.addLayout(row_bat)

        row_screen, self.cb_screen = create_toggle_row(self.t["pause_dpms"], "pause_screen_off", False)
        layout.addLayout(row_screen)

        row_manual, self.cb_manual = create_toggle_row(self.t["pause_man"], "pause_manual", False)
        layout.addLayout(row_manual)

        layout.addSpacing(10)

        layout.addWidget(QLabel(self.t["shortcut"]))
        self.btn_kde_shortcuts = QPushButton(self.t["kde_btn"])
        self.btn_kde_shortcuts.clicked.connect(self.open_kde_shortcuts)
        layout.addWidget(self.btn_kde_shortcuts)

        layout.addSpacing(25)
        layout.addStretch()

        btn_box = QHBoxLayout()
        self.btn_close = QPushButton(self.t["close"])
        self.btn_close.clicked.connect(self.reject)
        self.btn_save = QPushButton(self.t["save"])
        self.btn_save.setObjectName("SaveBtn")
        self.btn_save.clicked.connect(self.save)
        btn_box.addWidget(self.btn_close)
        btn_box.addWidget(self.btn_save)
        layout.addLayout(btn_box)

        self.anim_geom = QPropertyAnimation(self.bg, b"geometry")
        self.anim_geom.setDuration(300)
        self.anim_geom.setEasingCurve(QEasingCurve.Type.OutBack)

    def change_language_preview(self, new_lang):
        self.cfg["language"] = new_lang

    def open_kde_shortcuts(self):
        subprocess.Popen(["systemsettings", "kcm_keys"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

    def showEvent(self, event):
        if self.anchor and self.parent():
            gp = self.parent().mapToGlobal(QPoint(self.anchor.geometry().center().x(), self.anchor.geometry().top()))
            self.move(gp.x() - (SETTINGS_DIALOG_SIZE[0] // 2), gp.y() - SETTINGS_DIALOG_SIZE[1] - 15)
        self.anim_geom.setStartValue(QRect(0, SETTINGS_DIALOG_SIZE[1], SETTINGS_DIALOG_SIZE[0], 0))
        self.anim_geom.setEndValue(QRect(0, 0, SETTINGS_DIALOG_SIZE[0], SETTINGS_DIALOG_SIZE[1]))
        self.anim_geom.start()
        super().showEvent(event)

    def browse(self):
        start_dir = self.path_input.text().strip()
        if start_dir.startswith("file://"): start_dir = start_dir[7:]
        start_dir = os.path.expanduser(start_dir)
        if not start_dir or not os.path.isdir(start_dir): start_dir = os.path.expanduser("~")
        folder = QFileDialog.getExistingDirectory(self, "Select...", start_dir, QFileDialog.Option.ShowDirsOnly | QFileDialog.Option.DontUseNativeDialog)
        if folder: self.path_input.setText(folder)

    def save(self):
        self.cfg["wallpaper_folder"] = self.path_input.text()
        self.cfg["pause_battery"] = self.cb_bat.isChecked()
        self.cfg["pause_screen_off"] = self.cb_screen.isChecked()
        self.cfg["pause_manual"] = self.cb_manual.isChecked()
        self.cfg["language"] = self.lang_cb.currentText()
        self.cfg["autostart"] = self.cb_auto.isChecked()

        autostart_path = os.path.expanduser("~/.config/autostart/wallselector_kde_daemon.desktop")
        os.makedirs(os.path.dirname(autostart_path), exist_ok=True)
        if self.cfg["autostart"]:
            with open(autostart_path, "w") as f:
                f.write("[Desktop Entry]\nName=Wallselector KDE Daemon\nExec=wallselector_kde --hidden\nType=Application\nTerminal=false\nX-KDE-autostart-phase=2\n")
        else:
            with open(autostart_path, "w") as f:
                f.write("[Desktop Entry]\nHidden=true\n")

        save_config(self.cfg)

        try:
            with open(DAEMON_PID_FILE, 'r') as f:
                daemon_pid = int(f.read().strip())
            os.kill(daemon_pid, signal.SIGUSR1)
        except: pass

        self.accept()

class WallpaperItem(QFrame):
    def __init__(self, original_path, parent=None, is_video=False):
        super().__init__(parent)
        self.original_path = original_path
        self.is_video = is_video
        self.adaptive_color = QColor(255, 255, 255)
        self.target_rect = QRect()

        self._focus_progress = 0.0

        self.anim_geom = QPropertyAnimation(self, b"geometry")
        self.anim_geom.setDuration(400)
        self.anim_geom.setEasingCurve(QEasingCurve.Type.OutQuart)

        self.anim_focus = QPropertyAnimation(self, b"focus_progress")
        self.anim_focus.setDuration(400)
        self.anim_focus.setEasingCurve(QEasingCurve.Type.OutQuart)

        self.img_view = SkewedWallpaperView(self)

        self.glow = QGraphicsDropShadowEffect(self)
        self.glow.setOffset(0, 0)
        self.glow.setColor(QColor(0, 0, 0, 0))
        self.setGraphicsEffect(self.glow)

        self.load_thumbnail()
        self.update_style(False, animate=False)

    @pyqtProperty(float)
    def focus_progress(self):
        return self._focus_progress

    @focus_progress.setter
    def focus_progress(self, val):
        self._focus_progress = val

        # ОПТИМИЗАЦИЯ ВИЗУАЛА: Снижено затемнение до 110 для более стеклянного вида неактивных элементов
        self.img_view.setDimAlpha(int(110 * (1.0 - val)))

        self.img_view.setFocusData(val, self.adaptive_color)

        c = self.adaptive_color
        alpha = int(255 * val)
        blur = int(90 * val)

        self.glow.setColor(QColor(c.red(), c.green(), c.blue(), alpha))
        self.glow.setBlurRadius(blur)

    def load_thumbnail(self):
        cache_path = cache_filename_for(self.original_path, BASE_PREVIEW_SIZE)
        if not os.path.exists(cache_path):
            if self.is_video:
                subprocess.run(["ffmpeg", "-y", "-i", self.original_path, "-vframes", "1", "-q:v", "2", "-s", f"{BASE_PREVIEW_SIZE.width()}x{BASE_PREVIEW_SIZE.height()}", cache_path], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            else:
                reader = QImageReader(self.original_path)
                reader.setAutoTransform(True)
                reader.setScaledSize(BASE_PREVIEW_SIZE)
                img = reader.read()
                if not img.isNull(): img.save(cache_path, "JPEG", 87)

        if os.path.exists(cache_path):
            global COLOR_CACHE
            # ОПТИМИЗАЦИЯ ЗАПУСКА: Используем кэш вместо повторного чтения файла
            if cache_path in COLOR_CACHE:
                self.adaptive_color = QColor(COLOR_CACHE[cache_path])
            else:
                self.adaptive_color = extract_dominant_color(cache_path)
                COLOR_CACHE[cache_path] = self.adaptive_color.name()
                save_color_cache()
            pix = QPixmap(cache_path)
        else:
            pix = QPixmap()

        self.img_view.setPixmap(pix)

    def update_style(self, is_selected: bool, animate=True):
        target_val = 1.0 if is_selected else 0.0
        if animate:
            self.anim_focus.stop()
            self.anim_focus.setEndValue(target_val)
            self.anim_focus.start()
        else:
            self.focus_progress = target_val

    def animate_to(self, target_rect, animate=True):
        self.target_rect = target_rect
        if animate:
            self.anim_geom.stop()
            self.anim_geom.setEndValue(target_rect)
            self.anim_geom.start()
        else:
            self.setGeometry(target_rect)

    def resizeEvent(self, event):
        self.img_view.setGeometry(self.rect())
        super().resizeEvent(event)

    def mousePressEvent(self, event: QMouseEvent):
        if event.button() == Qt.MouseButton.LeftButton:
            parent = self.parent()
            if self in parent.items and not parent.is_applying:
                parent.current_index = parent.items.index(self)
                parent.update_positions(animate=True)
                parent.apply_wallpaper()

class WallpaperSelector(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Wallselector KDE")

        self.startup_time = time.time()
        self.cfg = load_config()

        flags = Qt.WindowType.FramelessWindowHint | Qt.WindowType.WindowStaysOnTopHint | Qt.WindowType.Tool
        self.setWindowFlags(flags)
        self.setAttribute(Qt.WidgetAttribute.WA_TranslucentBackground)

        screen_geo = QGuiApplication.primaryScreen().geometry()
        window_height = 450
        self.setFixedSize(screen_geo.width(), window_height)
        self.move(screen_geo.x(), (screen_geo.height() - window_height) // 2)

        self.bg = QFrame(self)
        self.bg.setFixedSize(self.width(), self.height())

        style_bg = """
            background-color: transparent;
            border: none;
        """
        self.bg.setStyleSheet(style_bg)

        lang = self.cfg.get("language", "en")
        if lang not in I18N: lang = "en"
        btn_text = I18N[lang]["settings_btn"]

        self.btn_settings = QPushButton(btn_text, self)
        style_pill = """
            QPushButton {
                background-color: rgba(0, 0, 0, 150);
                color: rgba(255, 255, 255, 220);
                border: 1px solid rgba(255, 255, 255, 30);
                border-radius: 16px;
                font-size: 14px;
                font-weight: bold;
                padding: 6px 16px;
            }
            QPushButton:hover {
                background-color: rgba(30, 30, 40, 200);
                border: 1px solid rgba(255, 255, 255, 60);
            }
        """
        self.btn_settings.setStyleSheet(style_pill)
        self.btn_settings.clicked.connect(self.open_settings)

        btn_w, btn_h = 160, 32
        center_y = self.height() // 2 + 20
        btn_y = center_y - (FOCUSED_ITEM_SIZE.height() // 2) - btn_h - 15
        self.btn_settings.setGeometry((self.width() - btn_w) // 2, btn_y, btn_w, btn_h)

        self.items = []
        self.current_index = 0
        self.is_applying = False
        self.is_settings_open = False

        if not self.cfg.get("daemon_autostart_created"):
            autostart_path = os.path.expanduser("~/.config/autostart/wallselector_kde_daemon.desktop")
            os.makedirs(os.path.dirname(autostart_path), exist_ok=True)
            with open(autostart_path, "w") as f:
                f.write("[Desktop Entry]\nName=Wallselector KDE Daemon\nExec=wallselector_kde --hidden\nType=Application\nTerminal=false\nX-KDE-autostart-phase=2\n")
            self.cfg["daemon_autostart_created"] = True
            save_config(self.cfg)

        self.init_carousel()
        self.setFocusPolicy(Qt.FocusPolicy.StrongFocus)
        self.setFocus()

    # ОПТИМИЗАЦИЯ ИСЧЕЗНОВЕНИЯ: Собственная прозрачная анимация (0.1с)
    def fade_out_and_quit(self):
        if hasattr(self, 'is_quitting') and self.is_quitting: return
        self.is_quitting = True
        self.fade_anim = QPropertyAnimation(self, b"windowOpacity")
        self.fade_anim.setDuration(100)
        self.fade_anim.setStartValue(1.0)
        self.fade_anim.setEndValue(0.0)
        self.fade_anim.finished.connect(QApplication.quit)
        self.fade_anim.start()

    def update_settings_button_text(self):
        self.cfg = load_config()
        lang = self.cfg.get("language", "en")
        if lang not in I18N: lang = "en"
        self.btn_settings.setText(I18N[lang]["settings_btn"])

    def open_settings(self):
        self.is_settings_open = True
        dlg = SettingsMenu(self, load_config(), self.btn_settings)
        if dlg.exec() == QDialog.DialogCode.Accepted:
            self.update_settings_button_text()
            for item in self.items: item.deleteLater()
            self.items.clear()
            self.init_carousel()
        QTimer.singleShot(250, self._restore_focus_safe)

    def _restore_focus_safe(self):
        self.is_settings_open = False
        self.setFocus()

    def init_carousel(self):
        folder = self.cfg["wallpaper_folder"]
        static_files, video_files = [], []
        if os.path.exists(folder):
            for t in STATIC_TYPES: static_files.extend(glob.glob(os.path.join(folder, t)))
            for t in VIDEO_TYPES: video_files.extend(glob.glob(os.path.join(folder, t)))

        all_files = [(p, True) for p in sorted(video_files)] + [(p, False) for p in sorted(static_files)]
        if not all_files: return

        last_saved = ""
        if os.path.exists(LAST_WP_FILE):
            with open(LAST_WP_FILE, 'r') as f: last_saved = f.read().strip()

        start_index = 0
        for i, (path, is_video) in enumerate(all_files):
            item = WallpaperItem(path, self, is_video=is_video)
            self.items.append(item)
            item.show()
            if os.path.abspath(path) == last_saved: start_index = i

        self.current_index = start_index
        self.update_positions(animate=False)

    def update_positions(self, animate=True):
        if not self.items: return
        n = len(self.items)
        center_x = self.width() // 2
        center_y = self.height() // 2 + 20

        W_f = FOCUSED_ITEM_SIZE.width()
        W_n = NORMAL_ITEM_SIZE.width()

        x_f = center_x - W_f // 2

        for i, item in enumerate(self.items):
            dist = (i - self.current_index + n + n//2) % n - n//2
            is_focused = (i == self.current_index)

            size = FOCUSED_ITEM_SIZE if is_focused else NORMAL_ITEM_SIZE
            w, h = size.width(), size.height()

            if dist == 0:
                target_x = x_f
            elif dist > 0:
                target_x = x_f + W_f - SKEW_OFFSET + ITEM_GAP + (dist - 1) * (W_n - SKEW_OFFSET + ITEM_GAP)
            else:
                k = abs(dist)
                target_x = x_f + SKEW_OFFSET - ITEM_GAP - W_n - (k - 1) * (W_n - SKEW_OFFSET + ITEM_GAP)

            target_y = center_y - h // 2
            target_rect = QRect(target_x, target_y, w, h)

            should_animate = animate
            if animate and abs(item.target_rect.x() - target_rect.x()) > self.width():
                should_animate = False

            item.animate_to(target_rect, animate=should_animate)
            item.update_style(is_focused, animate=should_animate)

    def select_next(self):
        if not self.items or self.is_applying: return
        self.current_index = (self.current_index + 1) % len(self.items)
        self.update_positions(animate=True)

    def select_prev(self):
        if not self.items or self.is_applying: return
        self.current_index = (self.current_index - 1) % len(self.items)
        self.update_positions(animate=True)

    def apply_wallpaper(self):
        if not self.items or self.is_applying: return
        self.is_applying = True
        selected = self.items[self.current_index]
        path = os.path.abspath(selected.original_path)

        with open(LAST_WP_FILE, 'w') as f: f.write(path)

        try:
            with open(DAEMON_PID_FILE, 'r') as f:
                daemon_pid = int(f.read().strip())
            os.kill(daemon_pid, signal.SIGUSR1)
        except: pass

        if selected.is_video:
            plugin = "luisbocanegra.smart.video.wallpaper.reborn"
            cfg_key = "VideoUrls"
            cfg_val = f'[{{"filename":"file://{path}","enabled":true}}]'
        else:
            plugin = "org.kde.image"
            cfg_key = "Image"
            cfg_val = f"file://{path}"

        js_code = f"var d = desktops(); for(var i=0; i<d.length; i++) {{ d[i].wallpaperPlugin = '{plugin}'; d[i].currentConfigGroup = ['Wallpaper', '{plugin}', 'General']; d[i].writeConfig('{cfg_key}', '{cfg_val}'); }}"

        subprocess.Popen(["qdbus6", "org.kde.plasmashell", "/PlasmaShell", "org.kde.PlasmaShell.evaluateScript", js_code], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        subprocess.Popen(["kwriteconfig6", "--file", "kscreenlockerrc", "--group", "Greeter", "--key", "WallpaperPlugin", plugin], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        subprocess.Popen(["kwriteconfig6", "--file", "kscreenlockerrc", "--group", "Greeter", "--group", "Wallpaper", "--group", plugin, "--group", "General", "--key", cfg_key, cfg_val], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

        self.fade_out_and_quit()

    def changeEvent(self, event):
        if event.type() == QEvent.Type.ActivationChange:
            if time.time() - getattr(self, 'startup_time', 0) > 1.5:
                if not self.isActiveWindow() and not self.is_applying and not self.is_settings_open:
                    self.fade_out_and_quit()
        super().changeEvent(event)

    def keyPressEvent(self, event: QKeyEvent):
        if not self.items: return super().keyPressEvent(event)

        if event.key() == Qt.Key.Key_Left: self.select_prev()
        elif event.key() == Qt.Key.Key_Right: self.select_next()
        elif event.key() in (Qt.Key.Key_Enter, Qt.Key.Key_Return, Qt.Key.Key_Space): self.apply_wallpaper()
        elif event.key() == Qt.Key.Key_Escape: self.fade_out_and_quit()
        else: super().keyPressEvent(event)

    def wheelEvent(self, event: QWheelEvent):
        angle = event.angleDelta().y()
        if angle > 0: self.select_prev()
        elif angle < 0: self.select_next()


if __name__ == "__main__":
    is_daemon = "--hidden" in sys.argv

    if is_daemon:
        lock_fd = open(DAEMON_LOCK_FILE, 'w')
        try: fcntl.flock(lock_fd, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except IOError: sys.exit(0)

        with open(DAEMON_PID_FILE, 'w') as f: f.write(str(os.getpid()))

        app = QCoreApplication(sys.argv)
        watcher = DaemonWatcher()
        signal.signal(signal.SIGUSR1, lambda sig, frame: watcher.force_update())
        sys.exit(app.exec())

    else:
        gui_lock_fd = open(GUI_LOCK_FILE, 'w')
        try:
            fcntl.flock(gui_lock_fd, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except IOError:
            try:
                with open(GUI_PID_FILE, 'r') as f: old_pid = int(f.read().strip())
                os.kill(old_pid, signal.SIGTERM)
            except: pass
            sys.exit(0)

        with open(GUI_PID_FILE, 'w') as f: f.write(str(os.getpid()))

        try:
            with open(DAEMON_PID_FILE, 'r') as f: d_pid = int(f.read().strip())
            os.kill(d_pid, 0)
        except:
            subprocess.Popen(["/usr/bin/python3", "/usr/bin/wallselector_kde", "--hidden"], start_new_session=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

        QApplication.setAttribute(Qt.ApplicationAttribute.AA_DontUseNativeDialogs, True)
        app = QApplication(sys.argv)
        app.setApplicationName("wallselector_kde")
        app.setDesktopFileName("wallselector_kde")

        selector = WallpaperSelector()
        selector.show()
        selector.raise_()
        selector.activateWindow()

        sys.exit(app.exec())
