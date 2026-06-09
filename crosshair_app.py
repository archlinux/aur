#!/usr/bin/env python3
"""
Crosshair overlay application for Linux (CachyOS).
Allows custom crosshair with PNG import, color/size/opacity/shape settings,
global hotkeys to toggle visibility and open settings.
"""

import sys
import os
import threading
from PyQt5.QtCore import (
    Qt, QRect, QPoint, QSize, QSettings, pyqtSignal, QTimer
)
from PyQt5.QtGui import (
    QPainter, QColor, QPixmap, QIcon, QFont, QImage, QPen, QBrush
)
from PyQt5.QtWidgets import (
    QApplication, QMainWindow, QWidget, QLabel, QVBoxLayout,
    QHBoxLayout, QPushButton, QSlider, QComboBox, QColorDialog,
    QFileDialog, QDialog, QFormLayout, QSpinBox, QDoubleSpinBox,
    QCheckBox, QGroupBox, QSystemTrayIcon, QMenu, QAction, QMessageBox
)
from pynput.keyboard import Key, KeyCode, Listener, HotKey

# ----------------------------------------------------------------------
# Settings keys
# ----------------------------------------------------------------------
KEY_SHAPE = "shape"          # "cross", "dot", "circle", "png"
KEY_COLOR = "color"          # hex string e.g. "#ff0000"
KEY_SIZE = "size"            # int (pixels)
KEY_OPACITY = "opacity"      # float 0.0-1.0
KEY_PNG_PATH = "png_path"    # str (path to PNG file)
KEY_TOGGLE_HOTKEY = "toggle_hotkey"   # e.g. "ctrl+shift+x"
KEY_SETTINGS_HOTKEY = "settings_hotkey"  # e.g. "ctrl+shift+s"

DEFAULT_SHAPE = "cross"
DEFAULT_COLOR = "#00ff00"
DEFAULT_SIZE = 40
DEFAULT_OPACITY = 0.8
DEFAULT_TOGGLE = "<ctrl>+<shift>+x"
DEFAULT_SETTINGS = "<ctrl>+<shift>+s"

# ----------------------------------------------------------------------
# CrosshairOverlay – main transparent window
# ----------------------------------------------------------------------
class CrosshairOverlay(QMainWindow):
    toggle_signal = pyqtSignal()
    settings_signal = pyqtSignal()

    def __init__(self):
        super().__init__()
        self.setWindowTitle("Crosshair Overlay")
        self.setWindowFlags(
            Qt.FramelessWindowHint
            | Qt.WindowStaysOnTopHint
            | Qt.WindowTransparentForInput
            | Qt.Tool
            | Qt.X11BypassWindowManagerHint
        )
        self.setAttribute(Qt.WA_TranslucentBackground)
        self.setAttribute(Qt.WA_ShowWithoutActivating)

        # full screen on primary monitor
        screen = QApplication.primaryScreen()
        if screen is None:
            self.setGeometry(0, 0, 1920, 1080)
        else:
            geo = screen.geometry()
            self.setGeometry(geo)

        # central widget
        central = QWidget(self)
        self.setCentralWidget(central)
        layout = QVBoxLayout(central)
        layout.setAlignment(Qt.AlignCenter)
        self.label = QLabel(central)
        self.label.setAlignment(Qt.AlignCenter)
        layout.addWidget(self.label)

        # settings
        self.settings = QSettings("CrosshairApp", "CrosshairOverlay")
        self.load_settings()

        # signals
        self.toggle_signal.connect(self.toggle_visibility)
        self.settings_signal.connect(self.open_settings)

        # tray icon
        self.tray_icon = QSystemTrayIcon(self)
        self.tray_icon.setIcon(self.make_tray_icon())
        tray_menu = QMenu()
        toggle_action = QAction("Toggle Crosshair", self)
        toggle_action.triggered.connect(self.toggle_visibility)
        settings_action = QAction("Settings...", self)
        settings_action.triggered.connect(self.open_settings)
        quit_action = QAction("Quit", self)
        quit_action.triggered.connect(self.quit_app)
        tray_menu.addAction(toggle_action)
        tray_menu.addAction(settings_action)
        tray_menu.addSeparator()
        tray_menu.addAction(quit_action)
        self.tray_icon.setContextMenu(tray_menu)
        self.tray_icon.show()

        # global hotkeys using pynput (no root required)
        self._listener = None
        self._start_hotkey_listener()

        # initial crosshair
        self.update_crosshair()

        # ensure window stays on top of fullscreen games
        QTimer.singleShot(500, self._ensure_on_top)

    # ------------------------------------------------------------------
    # Hotkey listener using pynput
    # ------------------------------------------------------------------
    @staticmethod
    def _normalize_hotkey(hk):
        """Ensure hotkey string uses angle brackets for pynput."""
        if "<" in hk:
            return hk
        parts = hk.split("+")
        return "+".join(f"<{p}>" for p in parts)

    def _start_hotkey_listener(self):
        toggle_hk = self._normalize_hotkey(
            self.settings.value(KEY_TOGGLE_HOTKEY, DEFAULT_TOGGLE)
        )
        settings_hk = self._normalize_hotkey(
            self.settings.value(KEY_SETTINGS_HOTKEY, DEFAULT_SETTINGS)
        )

        self.toggle_hotkey = HotKey(
            HotKey.parse(toggle_hk),
            on_activate=lambda: self.toggle_signal.emit()
        )
        self.settings_hotkey = HotKey(
            HotKey.parse(settings_hk),
            on_activate=lambda: self.settings_signal.emit()
        )

        def on_press(key):
            self.toggle_hotkey.press(key)
            self.settings_hotkey.press(key)

        def on_release(key):
            self.toggle_hotkey.release(key)
            self.settings_hotkey.release(key)

        self._listener = Listener(on_press=on_press, on_release=on_release)
        self._listener.start()

    def _ensure_on_top(self):
        self.raise_()
        self.activateWindow()

    # ------------------------------------------------------------------
    # Settings persistence
    # ------------------------------------------------------------------
    def load_settings(self):
        self.shape = self.settings.value(KEY_SHAPE, DEFAULT_SHAPE)
        self.color_hex = self.settings.value(KEY_COLOR, DEFAULT_COLOR)
        self.size = int(self.settings.value(KEY_SIZE, DEFAULT_SIZE))
        self.opacity = float(self.settings.value(KEY_OPACITY, DEFAULT_OPACITY))
        self.png_path = self.settings.value(KEY_PNG_PATH, "")

    def save_settings(self):
        self.settings.setValue(KEY_SHAPE, self.shape)
        self.settings.setValue(KEY_COLOR, self.color_hex)
        self.settings.setValue(KEY_SIZE, self.size)
        self.settings.setValue(KEY_OPACITY, self.opacity)
        self.settings.setValue(KEY_PNG_PATH, self.png_path)

    # ------------------------------------------------------------------
    # Crosshair rendering
    # ------------------------------------------------------------------
    def update_crosshair(self):
        color = QColor(self.color_hex)
        color.setAlphaF(self.opacity)
        if self.shape == "png" and self.png_path and os.path.isfile(self.png_path):
            pix = QPixmap(self.png_path)
            if not pix.isNull():
                pix = pix.scaled(
                    self.size, self.size,
                    Qt.KeepAspectRatio,
                    Qt.SmoothTransformation
                )
                # apply opacity via QPainter
                tmp = QPixmap(pix.size())
                tmp.fill(Qt.transparent)
                painter = QPainter(tmp)
                painter.setOpacity(self.opacity)
                painter.drawPixmap(0, 0, pix)
                painter.end()
                self.label.setPixmap(tmp)
                return
        # fallback: draw built-in shape
        pix = self._draw_shape(self.size, color)
        self.label.setPixmap(pix)

    def _draw_shape(self, size, color):
        pix = QPixmap(size, size)
        pix.fill(Qt.transparent)
        painter = QPainter(pix)
        painter.setRenderHint(QPainter.Antialiasing)
        pen = QPen(color, max(2, size // 10))
        painter.setPen(pen)
        brush = QBrush(color)
        painter.setBrush(brush)

        half = size // 2
        if self.shape == "dot":
            r = size // 4
            painter.drawEllipse(QPoint(half, half), r, r)
        elif self.shape == "circle":
            r = size // 2 - 2
            painter.drawEllipse(QPoint(half, half), r, r)
        else:  # cross
            thick = max(2, size // 8)
            painter.setPen(Qt.NoPen)
            painter.setBrush(brush)
            # horizontal bar
            painter.drawRect(0, half - thick // 2, size, thick)
            # vertical bar
            painter.drawRect(half - thick // 2, 0, thick, size)
        painter.end()
        return pix

    # ------------------------------------------------------------------
    # Visibility toggle
    # ------------------------------------------------------------------
    def toggle_visibility(self):
        self.setVisible(not self.isVisible())

    # ------------------------------------------------------------------
    # Settings dialog
    # ------------------------------------------------------------------
    def open_settings(self):
        dlg = SettingsDialog(self)
        if dlg.exec_() == QDialog.Accepted:
            self.shape = dlg.shape_combo.currentText()
            self.color_hex = dlg.color_hex
            self.size = dlg.size_spin.value()
            self.opacity = dlg.opacity_spin.value()
            self.png_path = dlg.png_path
            self.save_settings()
            self.update_crosshair()

    # ------------------------------------------------------------------
    # Tray icon helper
    # ------------------------------------------------------------------
    def make_tray_icon(self):
        pix = QPixmap(32, 32)
        pix.fill(Qt.transparent)
        painter = QPainter(pix)
        painter.setRenderHint(QPainter.Antialiasing)
        painter.setPen(QPen(QColor("#00ff00"), 3))
        painter.drawLine(0, 16, 32, 16)
        painter.drawLine(16, 0, 16, 32)
        painter.end()
        return QIcon(pix)

    # ------------------------------------------------------------------
    # Quit
    # ------------------------------------------------------------------
    def quit_app(self):
        if self._listener:
            self._listener.stop()
        QApplication.quit()


# ----------------------------------------------------------------------
# SettingsDialog
# ----------------------------------------------------------------------
class SettingsDialog(QDialog):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Crosshair Settings")
        self.setModal(True)
        self.parent = parent
        self.color_hex = parent.color_hex
        self.png_path = parent.png_path

        layout = QVBoxLayout(self)

        # shape
        shape_group = QGroupBox("Shape")
        shape_layout = QFormLayout()
        self.shape_combo = QComboBox()
        self.shape_combo.addItems(["cross", "dot", "circle", "png"])
        self.shape_combo.setCurrentText(parent.shape)
        self.shape_combo.currentTextChanged.connect(self._on_shape_changed)
        shape_layout.addRow("Type:", self.shape_combo)
        shape_group.setLayout(shape_layout)
        layout.addWidget(shape_group)

        # color
        color_group = QGroupBox("Color")
        color_layout = QHBoxLayout()
        self.color_btn = QPushButton()
        self.color_btn.setFixedSize(40, 40)
        self._update_color_btn()
        self.color_btn.clicked.connect(self._pick_color)
        color_layout.addWidget(self.color_btn)
        color_group.setLayout(color_layout)
        layout.addWidget(color_group)

        # size
        size_group = QGroupBox("Size (pixels)")
        size_layout = QHBoxLayout()
        self.size_spin = QSpinBox()
        self.size_spin.setRange(8, 200)
        self.size_spin.setValue(parent.size)
        size_layout.addWidget(self.size_spin)
        size_group.setLayout(size_layout)
        layout.addWidget(size_group)

        # opacity
        opacity_group = QGroupBox("Opacity")
        opacity_layout = QHBoxLayout()
        self.opacity_spin = QDoubleSpinBox()
        self.opacity_spin.setRange(0.0, 1.0)
        self.opacity_spin.setSingleStep(0.05)
        self.opacity_spin.setDecimals(2)
        self.opacity_spin.setValue(parent.opacity)
        opacity_layout.addWidget(self.opacity_spin)
        opacity_group.setLayout(opacity_layout)
        layout.addWidget(opacity_group)

        # PNG import (only enabled when shape == "png")
        png_group = QGroupBox("PNG Image")
        png_layout = QHBoxLayout()
        self.png_path_label = QLabel(parent.png_path if parent.png_path else "No file selected")
        self.png_path_label.setWordWrap(True)
        png_layout.addWidget(self.png_path_label)
        self.png_btn = QPushButton("Browse...")
        self.png_btn.clicked.connect(self._browse_png)
        png_layout.addWidget(self.png_btn)
        png_group.setLayout(png_layout)
        layout.addWidget(png_group)
        self._on_shape_changed(parent.shape)

        # buttons
        btn_layout = QHBoxLayout()
        ok_btn = QPushButton("OK")
        ok_btn.clicked.connect(self.accept)
        cancel_btn = QPushButton("Cancel")
        cancel_btn.clicked.connect(self.reject)
        btn_layout.addStretch()
        btn_layout.addWidget(ok_btn)
        btn_layout.addWidget(cancel_btn)
        layout.addLayout(btn_layout)

    def _on_shape_changed(self, shape):
        enabled = shape == "png"
        self.png_btn.setEnabled(enabled)
        self.png_path_label.setEnabled(enabled)

    def _update_color_btn(self):
        self.color_btn.setStyleSheet(f"background-color: {self.color_hex};")

    def _pick_color(self):
        col = QColorDialog.getColor(QColor(self.color_hex), self)
        if col.isValid():
            self.color_hex = col.name()
            self._update_color_btn()

    def _browse_png(self):
        path, _ = QFileDialog.getOpenFileName(
            self, "Select PNG", "", "PNG Images (*.png)"
        )
        if path:
            self.png_path = path
            self.png_path_label.setText(path)


# ----------------------------------------------------------------------
# Entry point
# ----------------------------------------------------------------------
def main():
    # high DPI support must be set before QApplication is created
    QApplication.setAttribute(Qt.AA_EnableHighDpiScaling, True)
    QApplication.setAttribute(Qt.AA_UseHighDpiPixmaps, True)

    app = QApplication(sys.argv)
    app.setApplicationName("CrosshairApp")
    app.setOrganizationName("CrosshairOverlay")

    overlay = CrosshairOverlay()
    overlay.show()
    overlay.raise_()
    overlay.activateWindow()

    sys.exit(app.exec_())


if __name__ == "__main__":
    main()
