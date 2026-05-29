#!/usr/bin/env python3
import os
import sys
import glob
import hashlib
import subprocess
import fcntl
import json
import shutil
import signal
import time

from PyQt6.QtWidgets import (
    QApplication, QWidget, QLabel, QFrame, QGraphicsDropShadowEffect,
    QPushButton, QDialog, QVBoxLayout, QHBoxLayout, QCheckBox,
    QLineEdit, QFileDialog, QComboBox
)
from PyQt6.QtGui import (
    QPixmap, QKeyEvent, QGuiApplication, QImageReader,
    QPainter, QPainterPath, QColor, QWheelEvent, QMouseEvent, QKeySequence
)
from PyQt6.QtCore import (
    Qt, QSize, QPropertyAnimation, QEasingCurve, QRectF, QTimer, QPoint, QEvent, QRect, QCoreApplication
)

DAEMON_PID_FILE = f"/tmp/wallselector_daemon_{os.getuid()}.pid"
DAEMON_LOCK_FILE = f"/tmp/wallselector_daemon_{os.getuid()}.lock"
GUI_PID_FILE = f"/tmp/wallselector_gui_{os.getuid()}.pid"
GUI_LOCK_FILE = f"/tmp/wallselector_gui_{os.getuid()}.lock"
CONFIG_FILE = os.path.expanduser("~/.config/wallselector-kde.json")
DEFAULT_DIR = os.path.expanduser("~/Pictures/Wallpapers")

I18N = {
    "en": {"settings_title": "Settings", "folder": "Wallpaper Folder:", "browse": "Browse", "pause_bat": "Pause on Battery", "pause_dpms": "Pause when Screen Off (DPMS)", "pause_man": "Force Pause Video Wallpapers", "shortcut": "Global Shortcut:", "press_key": "Press combination...", "autostart": "Autostart on Boot", "language": "Language:", "close": "Close", "save": "Save"},
    "uk": {"settings_title": "Налаштування", "folder": "Папка зі шпалерами:", "browse": "Огляд", "pause_bat": "Пауза від батареї", "pause_dpms": "Пауза, якщо екран вимкнено", "pause_man": "Примусова пауза відеошпалер", "shortcut": "Глобальна комбінація:", "press_key": "Натисніть клавіші...", "autostart": "Автозапуск при ввімкненні", "language": "Мова (Language):", "close": "Закрити", "save": "Зберегти"},
    "ru": {"settings_title": "Настройки", "folder": "Папка с обоями:", "browse": "Обзор", "pause_bat": "Пауза от батареи", "pause_dpms": "Пауза при выкл. экране", "pause_man": "Принудительная пауза видео", "shortcut": "Глобальная комбинация:", "press_key": "Нажмите клавиши...", "autostart": "Автозапуск при старте ПК", "language": "Язык (Language):", "close": "Закрыть", "save": "Сохранить"}
}

def load_config():
    cfg = {"wallpaper_folder": DEFAULT_DIR, "pause_battery": False, "pause_screen_off": False, "pause_manual": False, "language": "en", "shortcut": "Alt+T", "autostart": True}
    if os.path.exists(CONFIG_FILE):
        try:
            with open(CONFIG_FILE, 'r') as f: cfg.update(json.load(f))
        except Exception: pass
    return cfg

def save_config(cfg):
    os.makedirs(os.path.dirname(CONFIG_FILE), exist_ok=True)
    with open(CONFIG_FILE, 'w') as f: json.dump(cfg, f)

def enforce_kde_rules(shortcut_str):
    if not shortcut_str: return

    subprocess.run(["kbuildsycoca6"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    time.sleep(0.2)

    # Жестко перезаписываем шорткат в правильном формате Plasma 6
    subprocess.run(["systemctl", "--user", "stop", "plasma-kglobalaccel.service"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    time.sleep(0.2)
    subprocess.run(["kwriteconfig6", "--file", "kglobalshortcutsrc", "--group", "services", "--group", "wallselector_kde.desktop", "--key", "_launch", shortcut_str], stdout=subprocess.DEVNULL)
    subprocess.run(["systemctl", "--user", "start", "plasma-kglobalaccel.service"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

    # Прописываем скрытие из панели И форсируем фокус для Wayland
    rule_id = "wallselector_hide"
    res = subprocess.run(["kreadconfig6", "--file", "kwinrulesrc", "--group", "General", "--key", "rules"], capture_output=True, text=True)
    rules_list = res.stdout.strip().split(",") if res.stdout.strip() else []
    if rule_id not in rules_list:
        rules_list.append(rule_id)
        new_rules = ",".join(filter(None, rules_list))
        subprocess.run(["kwriteconfig6", "--file", "kwinrulesrc", "--group", "General", "--key", "rules", new_rules], stdout=subprocess.DEVNULL)
        subprocess.run(["kwriteconfig6", "--file", "kwinrulesrc", "--group", "General", "--key", "count", str(len(rules_list))], stdout=subprocess.DEVNULL)

    subprocess.run(["kwriteconfig6", "--file", "kwinrulesrc", "--group", rule_id, "--key", "Description", "Скрытие и Фокус Wallselector KDE"], stdout=subprocess.DEVNULL)
    subprocess.run(["kwriteconfig6", "--file", "kwinrulesrc", "--group", rule_id, "--key", "wmclass", "wallselector_kde"], stdout=subprocess.DEVNULL)
    subprocess.run(["kwriteconfig6", "--file", "kwinrulesrc", "--group", rule_id, "--key", "wmclassmatch", "2"], stdout=subprocess.DEVNULL)
    subprocess.run(["kwriteconfig6", "--file", "kwinrulesrc", "--group", rule_id, "--key", "skiptaskbar", "true"], stdout=subprocess.DEVNULL)
    subprocess.run(["kwriteconfig6", "--file", "kwinrulesrc", "--group", rule_id, "--key", "skiptaskbarrule", "2"], stdout=subprocess.DEVNULL)
    # Магия отключения защиты от кражи фокуса:
    subprocess.run(["kwriteconfig6", "--file", "kwinrulesrc", "--group", rule_id, "--key", "fsplevel", "0"], stdout=subprocess.DEVNULL)
    subprocess.run(["kwriteconfig6", "--file", "kwinrulesrc", "--group", rule_id, "--key", "fsplevelrule", "2"], stdout=subprocess.DEVNULL)
    subprocess.run(["qdbus6", "org.kde.KWin", "/KWin", "org.kde.KWin.reconfigure"], stdout=subprocess.DEVNULL)

CACHE_DIR = os.path.expanduser("~/.cache/plasma-wallpapers")
LAST_WP_FILE = os.path.join(CACHE_DIR, "last_selected.txt")
BASE_PREVIEW_SIZE = QSize(260, 146)
NORMAL_ITEM_SIZE = QSize(BASE_PREVIEW_SIZE.width(), BASE_PREVIEW_SIZE.height() + 20)
FOCUS_SCALE = 1.15
FOCUSED_ITEM_SIZE = QSize(int(NORMAL_ITEM_SIZE.width() * FOCUS_SCALE), int(NORMAL_ITEM_SIZE.height() * FOCUS_SCALE))
WINDOW_SIZE = (1050, 290)
SPACING = 30
SETTINGS_DIALOG_SIZE = (380, 440)
STATIC_TYPES = ('*.jpg', '*.jpeg', '*.png', '*.webp')
VIDEO_TYPES = ('*.mp4', '*.mkv', '*.webm')
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

def rounded_pixmap(pix: QPixmap, radius: int) -> QPixmap:
    if pix.isNull(): return pix
    out = QPixmap(pix.size())
    out.fill(Qt.GlobalColor.transparent)
    painter = QPainter(out)
    painter.setRenderHints(QPainter.RenderHint.Antialiasing | QPainter.RenderHint.SmoothPixmapTransform)
    path = QPainterPath()
    rect = QRectF(out.rect())
    path.addRoundedRect(rect, float(radius), float(radius))
    painter.setClipPath(path)
    painter.drawPixmap(0, 0, pix)
    painter.end()
    return out

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
            cache_thumb = os.path.join(CACHE_DIR, f"thumb_{h}_260x146.jpg")
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

class ShortcutInputButton(QPushButton):
    def __init__(self, text, lang_dict, parent=None):
        super().__init__(text, parent)
        self.setCheckable(True)
        self.current_shortcut = text
        self.lang_dict = lang_dict

    def keyPressEvent(self, event: QKeyEvent):
        if not self.isChecked():
            super().keyPressEvent(event)
            return
        key = event.key()
        modifiers = event.modifiers()
        if key in (Qt.Key.Key_Control, Qt.Key.Key_Shift, Qt.Key.Key_Alt, Qt.Key.Key_Meta): return
        if key == Qt.Key.Key_Escape:
            self.setText(self.current_shortcut)
            self.setChecked(False)
            return
        seq = QKeySequence(key | modifiers.value)
        shortcut_str = seq.toString(QKeySequence.SequenceFormat.PortableText)
        self.current_shortcut = shortcut_str
        self.setText(shortcut_str)
        self.setChecked(False)

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

        self.bg = QFrame(self)
        self.bg.setGeometry(0, 0, SETTINGS_DIALOG_SIZE[0], 0)
        self.bg.setStyleSheet("QFrame { background-color: rgba(20, 20, 25, 245); border-radius: 16px; border: 1px solid rgba(255, 255, 255, 15); }")
        self.shadow = QGraphicsDropShadowEffect(self)
        self.shadow.setBlurRadius(30)
        self.shadow.setColor(QColor(0, 0, 0, 180))
        self.shadow.setOffset(0, 5)
        self.bg.setGraphicsEffect(self.shadow)

        self.content = QWidget(self.bg)
        self.content.setFixedSize(*SETTINGS_DIALOG_SIZE)
        layout = QVBoxLayout(self.content)
        layout.setContentsMargins(20, 20, 20, 20)
        layout.setSpacing(12)

        title = QLabel(self.t["settings_title"])
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        title.setStyleSheet("color: white; font-size: 15px; font-weight: bold; background: transparent; border: none;")
        layout.addWidget(title)

        style = """
            QLabel { color: rgba(255, 255, 255, 180); font-size: 12px; background: transparent; border: none; }
            QLineEdit, QComboBox { background: rgba(0, 0, 0, 60); color: white; border: 1px solid rgba(255, 255, 255, 15); border-radius: 6px; padding: 6px; font-size: 12px; }
            QComboBox::drop-down { border: none; }
            QPushButton { background-color: rgba(255, 255, 255, 10); color: white; border-radius: 6px; padding: 7px 12px; font-size: 12px; border: none; }
            QPushButton:hover { background-color: rgba(255, 255, 255, 20); }
            QPushButton:checked { background-color: rgba(61, 174, 233, 50); border: 1px solid #3daee9; }
            QPushButton#SaveBtn { background-color: #3daee9; font-weight: bold; }
            QPushButton#SaveBtn:hover { background-color: #4dbfff; }
            QCheckBox { color: rgba(255, 255, 255, 200); font-size: 13px; background: transparent; border: none; }
            QCheckBox::indicator { width: 16px; height: 16px; border-radius: 4px; background-color: rgba(0, 0, 0, 60); border: 1px solid rgba(255, 255, 255, 20); }
            QCheckBox::indicator:checked { background-color: #3daee9; border: none; }
        """
        self.setStyleSheet(style)

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

        self.cb_auto = QCheckBox(self.t["autostart"])
        self.cb_auto.setChecked(self.cfg.get("autostart", True))
        layout.addWidget(self.cb_auto)

        self.cb_bat = QCheckBox(self.t["pause_bat"])
        self.cb_bat.setChecked(self.cfg.get("pause_battery", False))
        layout.addWidget(self.cb_bat)
        self.cb_screen = QCheckBox(self.t["pause_dpms"])
        self.cb_screen.setChecked(self.cfg.get("pause_screen_off", False))
        layout.addWidget(self.cb_screen)
        self.cb_manual = QCheckBox(self.t["pause_man"])
        self.cb_manual.setChecked(self.cfg.get("pause_manual", False))
        layout.addWidget(self.cb_manual)

        layout.addWidget(QLabel(self.t["shortcut"]))
        self.btn_shortcut = ShortcutInputButton(self.cfg.get("shortcut", "Alt+T"), self.t)
        self.btn_shortcut.toggled.connect(lambda checked: self.btn_shortcut.setText(self.t["press_key"] if checked else self.btn_shortcut.current_shortcut))
        layout.addWidget(self.btn_shortcut)

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
        self.anim_geom.setDuration(250)
        self.anim_geom.setEasingCurve(QEasingCurve.Type.OutQuart)

    def change_language_preview(self, new_lang):
        self.cfg["language"] = new_lang

    def showEvent(self, event):
        if self.anchor and self.parent():
            gp = self.parent().mapToGlobal(QPoint(self.anchor.geometry().center().x(), self.anchor.geometry().top()))
            self.move(gp.x() - (SETTINGS_DIALOG_SIZE[0] // 2), gp.y() - SETTINGS_DIALOG_SIZE[1] - 10)
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

        new_shortcut = self.btn_shortcut.current_shortcut
        if self.cfg.get("shortcut") != new_shortcut:
            self.cfg["shortcut"] = new_shortcut
            enforce_kde_rules(new_shortcut)

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
        self.anim = QPropertyAnimation(self, b"geometry")
        self.anim.setDuration(350)
        self.anim.setEasingCurve(QEasingCurve.Type.OutExpo)
        self.img_container = QWidget(self)
        self.label = QLabel(self.img_container)
        self.label.setScaledContents(True)
        self.dim_overlay = QFrame(self.img_container)
        self.top_indicator = QFrame(self)
        self.top_indicator.setStyleSheet("background-color: transparent;")
        self.bottom_indicator = QFrame(self)
        self.bottom_indicator.setStyleSheet("background-color: transparent;")
        self.glow = QGraphicsDropShadowEffect(self)
        self.glow.setOffset(0, 0)
        self.glow.setColor(QColor(0, 0, 0, 0))
        self.label.setGraphicsEffect(self.glow)
        self.load_thumbnail()
        self.update_style(False)

    def load_thumbnail(self):
        cache_path = cache_filename_for(self.original_path, BASE_PREVIEW_SIZE)
        if not os.path.exists(cache_path):
            if self.is_video:
                subprocess.run(["ffmpeg", "-y", "-i", self.original_path, "-vframes", "1", "-q:v", "2", cache_path], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            else:
                reader = QImageReader(self.original_path)
                reader.setAutoTransform(True)
                reader.setScaledSize(BASE_PREVIEW_SIZE)
                img = reader.read()
                if not img.isNull(): img.save(cache_path, "JPEG", 87)
        if os.path.exists(cache_path):
            self.adaptive_color = extract_dominant_color(cache_path)
            pix = QPixmap(cache_path)
        else: pix = QPixmap()
        if not pix.isNull():
            pix = pix.scaled(BASE_PREVIEW_SIZE, Qt.AspectRatioMode.KeepAspectRatioByExpanding, Qt.TransformationMode.SmoothTransformation)
            self.label.setPixmap(rounded_pixmap(pix, 16))
        else: self.label.setText("Error")

    def update_style(self, is_selected: bool):
        if is_selected:
            self.dim_overlay.setStyleSheet("background-color: transparent; border-radius: 16px;")
            c = self.adaptive_color
            color_full = f"rgba({c.red()}, {c.green()}, {c.blue()}, 255)"
            color_fade = f"rgba({c.red()}, {c.green()}, {c.blue()}, 0)"
            grad_style = f"background: qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 {color_fade}, stop:0.2 {color_full}, stop:0.8 {color_full}, stop:1 {color_fade}); border-radius: 3px; border: none;"
            self.top_indicator.setStyleSheet(grad_style)
            self.bottom_indicator.setStyleSheet(grad_style)
            self.glow.setColor(QColor(c.red(), c.green(), c.blue(), 180))
            self.glow.setBlurRadius(50)
        else:
            self.dim_overlay.setStyleSheet("background-color: rgba(10, 10, 15, 200); border-radius: 16px;")
            self.top_indicator.setStyleSheet("background-color: transparent; border: none;")
            self.bottom_indicator.setStyleSheet("background-color: transparent; border: none;")
            self.glow.setColor(QColor(0, 0, 0, 120))
            self.glow.setBlurRadius(20)

    def animate_to(self, target_rect, animate=True):
        self.target_rect = target_rect
        if animate:
            self.anim.stop()
            self.anim.setEndValue(target_rect)
            self.anim.start()
        else: self.setGeometry(target_rect)

    def resizeEvent(self, event):
        w, h = self.width(), self.height()
        scale = h / NORMAL_ITEM_SIZE.height()
        p_w, p_h = int(BASE_PREVIEW_SIZE.width() * scale), int(BASE_PREVIEW_SIZE.height() * scale)
        cont_y = int(12 * scale)
        self.img_container.setGeometry(0, cont_y, p_w, p_h)
        self.label.setGeometry(0, 0, p_w, p_h)
        self.dim_overlay.setGeometry(0, 0, p_w, p_h)
        ind_w, ind_h = int(120 * scale), int(6 * scale)
        self.top_indicator.setGeometry((w - ind_w) // 2, 0, ind_w, ind_h)
        self.bottom_indicator.setGeometry((w - ind_w) // 2, h - ind_h, ind_w, ind_h)
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

        flags = Qt.WindowType.FramelessWindowHint | Qt.WindowType.WindowStaysOnTopHint | Qt.WindowType.SplashScreen
        self.setWindowFlags(flags)
        self.setAttribute(Qt.WidgetAttribute.WA_TranslucentBackground)
        self.setAttribute(Qt.WidgetAttribute.WA_ShowWithoutActivating)
        self.setFixedSize(*WINDOW_SIZE)

        screen_geo = QGuiApplication.primaryScreen().geometry()
        self.move((screen_geo.width() - self.width()) // 2, (screen_geo.height() - self.height()) // 2)

        self.bg = QFrame(self)
        self.bg.setFixedSize(*WINDOW_SIZE)
        style_bg = """
            background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:0, y2:1,
                stop:0 rgba(25, 25, 30, 0.95), stop:0.5 rgba(15, 15, 20, 0.9), stop:1 rgba(10, 10, 15, 0.95));
            border-radius: 28px; border: 1px solid rgba(255, 255, 255, 10%);
        """
        self.bg.setStyleSheet(style_bg)
        self.window_shadow = QGraphicsDropShadowEffect(self)
        self.window_shadow.setBlurRadius(60)
        self.window_shadow.setColor(QColor(0, 0, 0, 150))
        self.bg.setGraphicsEffect(self.window_shadow)

        self.btn_settings = QPushButton("⚙", self)
        self.btn_settings.setGeometry((self.width() - 36) // 2, self.height() - 42, 36, 36)
        self.btn_settings.setStyleSheet("background: transparent; color: rgba(255,255,255,100); font-size: 22px; border: none;")
        self.btn_settings.clicked.connect(self.open_settings)

        self.items = []
        self.current_index = 0
        self.is_applying = False
        self.is_settings_open = False

        cfg = load_config()
        if not cfg.get("rules_applied_v11"):
            enforce_kde_rules(cfg.get("shortcut", "Alt+T"))
            autostart_path = os.path.expanduser("~/.config/autostart/wallselector_kde_daemon.desktop")
            os.makedirs(os.path.dirname(autostart_path), exist_ok=True)
            with open(autostart_path, "w") as f:
                f.write("[Desktop Entry]\nName=Wallselector KDE Daemon\nExec=wallselector_kde --hidden\nType=Application\nTerminal=false\nX-KDE-autostart-phase=2\n")
            cfg["rules_applied_v11"] = True
            save_config(cfg)

        QTimer.singleShot(50, self.init_carousel)
        self.setFocusPolicy(Qt.FocusPolicy.StrongFocus)
        self.setFocus()

    def open_settings(self):
        self.is_settings_open = True
        dlg = SettingsMenu(self, load_config(), self.btn_settings)
        if dlg.exec() == QDialog.DialogCode.Accepted:
            for item in self.items: item.deleteLater()
            self.items.clear()
            self.init_carousel()
        QTimer.singleShot(250, self._restore_focus_safe)

    def _restore_focus_safe(self):
        self.is_settings_open = False
        self.setFocus()

    def init_carousel(self):
        cfg = load_config()
        folder = cfg["wallpaper_folder"]
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
        window_center_x = self.width() // 2
        step = NORMAL_ITEM_SIZE.width() + SPACING

        for i, item in enumerate(self.items):
            dist = (i - self.current_index + n + n//2) % n - n//2
            target_center_x = window_center_x + (dist * step)
            is_focused = (i == self.current_index)
            size = FOCUSED_ITEM_SIZE if is_focused else NORMAL_ITEM_SIZE
            w, h = size.width(), size.height()
            y_pos = (WINDOW_SIZE[1] - h) // 2

            target_rect = QRect(target_center_x - w//2, y_pos, w, h)
            should_animate = animate
            if animate and abs(item.target_rect.x() - target_rect.x()) > step * 2: should_animate = False
            item.animate_to(target_rect, animate=should_animate)
            item.update_style(is_focused)

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

        QApplication.quit()

    def changeEvent(self, event):
        if event.type() == QEvent.Type.ActivationChange:
            # 300мс иммунитета на самом старте, чтобы KGlobalAccel не убил окно из-за Wayland-задержек
            if time.time() - getattr(self, 'startup_time', 0) > 0.3:
                if not self.isActiveWindow() and not self.is_applying and not self.is_settings_open:
                    QApplication.quit()
        super().changeEvent(event)

    def keyPressEvent(self, event: QKeyEvent):
        if not self.items: return super().keyPressEvent(event)
        cfg = load_config()
        current_shortcut = cfg.get("shortcut", "Alt+T").split("+")
        if len(current_shortcut) == 2:
            mod_str, key_str = current_shortcut[0].lower(), current_shortcut[1].lower()
            mod_pressed = False
            if "alt" in mod_str and (event.modifiers() & Qt.KeyboardModifier.AltModifier): mod_pressed = True
            elif "meta" in mod_str or "win" in mod_str and (event.modifiers() & Qt.KeyboardModifier.MetaModifier): mod_pressed = True
            elif "ctrl" in mod_str and (event.modifiers() & Qt.KeyboardModifier.ControlModifier): mod_pressed = True

            if mod_pressed and event.text().lower() == key_str:
                QApplication.quit()
                return

        if event.key() == Qt.Key.Key_Left: self.select_prev()
        elif event.key() == Qt.Key.Key_Right: self.select_next()
        elif event.key() in (Qt.Key.Key_Enter, Qt.Key.Key_Return, Qt.Key.Key_Space): self.apply_wallpaper()
        elif event.key() == Qt.Key.Key_Escape: QApplication.quit()
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
