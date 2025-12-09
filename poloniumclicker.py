#!/usr/bin/env python3

import sys
from PyQt5.QtWidgets import (
    QApplication, QWidget, QLabel, QLineEdit, QPushButton,
    QVBoxLayout, QHBoxLayout, QGraphicsDropShadowEffect, QFrame
)
from PyQt5.QtGui import QColor
from PyQt5.QtCore import QTimer, pyqtSignal, QObject
from pynput import keyboard
from pynput.mouse import Controller, Button


# -----------------------------
#  Глобальный слушатель хоткея
# -----------------------------
class HotkeyListener(QObject):
    toggle_signal = pyqtSignal()

    def __init__(self, hotkey):
        super().__init__()
        self.hotkey = hotkey
        self.listener = keyboard.GlobalHotKeys({f'<{self.hotkey}>': self.emit_signal})
        self.listener.start()

    def emit_signal(self):
        self.toggle_signal.emit()


# -----------------------------
#   Красивые стили
# -----------------------------
LIGHT_THEME = """
    QWidget {
        background-color: #ffffff;
        color: #222;
        font-size: 15px;
        border-radius: 15px;
    }
    QLineEdit {
        background: #f2f2f2;
        border-radius: 10px;
        padding: 8px;
        border: 2px solid #dddddd;
    }
    QLineEdit:focus {
        border: 2px solid #0078ff;
        background: #fafafa;
    }
    QPushButton {
        background: #0078ff;
        border: none;
        padding: 10px 0;
        color: white;
        font-size: 16px;
        border-radius: 12px;
    }
    QPushButton:hover {
        background: #0066d6;
    }
"""

DARK_THEME = """
    QWidget {
        background-color: #1e1e1e;
        color: #efefef;
        font-size: 15px;
        border-radius: 15px;
    }
    QLineEdit {
        background: #2b2b2b;
        border-radius: 10px;
        padding: 8px;
        border: 2px solid #444;
        color: white;
    }
    QLineEdit:focus {
        border: 2px solid #55aaff;
        background: #222;
    }
    QPushButton {
        background: #2d7dff;
        border: none;
        padding: 10px 0;
        color: white;
        font-size: 16px;
        border-radius: 12px;
    }
    QPushButton:hover {
        background: #2360cc;
    }
"""


# -----------------------------
#     Основной интерфейс
# -----------------------------
class AutoClicker(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("PoloClicker")
        self.setFixedSize(340, 220)

        self.clicking = False
        self.click_interval = 10
        self.hotkey = 'f6'
        self.mouse = Controller()

        self.dark_mode = True  # стартуем с тёмной темы

        self.init_ui()
        self.init_styles()

        # Таймер
        self.timer = QTimer()
        self.timer.timeout.connect(self.do_click)

        # Глобальный хоткей
        self.hotkey_listener = HotkeyListener(self.hotkey)
        self.hotkey_listener.toggle_signal.connect(self.toggle_clicking)

    # -------------------------------
    #      Интерфейс и стили
    # -------------------------------
    def apply_shadow(self, widget):
        shadow = QGraphicsDropShadowEffect()
        shadow.setBlurRadius(25)
        shadow.setXOffset(0)
        shadow.setYOffset(4)
        shadow.setColor(QColor(0, 0, 0, 130))
        widget.setGraphicsEffect(shadow)

    def init_styles(self):
        self.setStyleSheet(DARK_THEME if self.dark_mode else LIGHT_THEME)

    def toggle_theme(self):
        self.dark_mode = not self.dark_mode
        self.init_styles()

    def init_ui(self):
        main_layout = QVBoxLayout()

        # Контейнер с тенью
        frame = QFrame()
        frame_layout = QVBoxLayout()
        frame.setLayout(frame_layout)
        self.apply_shadow(frame)

        # Поле интервала
        h_interval = QHBoxLayout()
        h_interval.addWidget(QLabel("Интервал (мс):"))
        self.interval_input = QLineEdit(str(self.click_interval))
        h_interval.addWidget(self.interval_input)
        frame_layout.addLayout(h_interval)

        # Поле хоткея
        h_hotkey = QHBoxLayout()
        h_hotkey.addWidget(QLabel("Горячая клавиша:"))
        self.hotkey_input = QLineEdit(self.hotkey)
        self.hotkey_input.setReadOnly(True)
        self.hotkey_input.mousePressEvent = self.capture_hotkey
        h_hotkey.addWidget(self.hotkey_input)
        frame_layout.addLayout(h_hotkey)

        # Кнопка старта
        self.toggle_button = QPushButton("Старт / Стоп")
        self.toggle_button.clicked.connect(self.toggle_clicking)
        frame_layout.addWidget(self.toggle_button)

        # Переключение темы
        self.theme_btn = QPushButton("Сменить тему")
        self.theme_btn.clicked.connect(self.toggle_theme)
        frame_layout.addWidget(self.theme_btn)

        main_layout.addWidget(frame)
        self.setLayout(main_layout)

    # -----------------------
    #      Хоткей захват
    # -----------------------
    def capture_hotkey(self, event):
        self.hotkey_input.setText("Нажмите клавишу...")

        def on_press(key):
            try:
                self.hotkey = key.char
            except AttributeError:
                self.hotkey = str(key).split('.')[1]
            self.hotkey_input.setText(self.hotkey)

            self.hotkey_listener.listener.stop()
            self.hotkey_listener = HotkeyListener(self.hotkey)
            self.hotkey_listener.toggle_signal.connect(self.toggle_clicking)
            return False

        listener = keyboard.Listener(on_press=on_press)
        listener.start()

    # -----------------------
    #       Автоклик
    # -----------------------
    def toggle_clicking(self):
        try:
            self.click_interval = max(1, int(self.interval_input.text()))
        except:
            self.interval_input.setText("10")
            self.click_interval = 10

        if self.clicking:
            self.timer.stop()
        else:
            self.timer.start(self.click_interval)

        self.clicking = not self.clicking

    def do_click(self):
        self.mouse.click(Button.left)


# -----------------------
#        Запуск
# -----------------------
if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = AutoClicker()
    window.show()
    sys.exit(app.exec_())
