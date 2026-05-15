#!/usr/bin/env python3

import os
import subprocess
import logging
import sys
import locale
import socket

from PyQt6.QtWidgets import (
    QApplication,
    QSystemTrayIcon,
    QMenu,
    QInputDialog,
    QLineEdit,
    QMessageBox
)

from PyQt6.QtGui import QIcon, QAction
from PyQt6.QtCore import Qt

# =========================
# ШЛЯХИ
# =========================

log_file = os.path.expanduser("~/.virtdisp.log")
config_dir = os.path.expanduser("~/.config")
config_file = os.path.join(config_dir, "virtdisp.conf")

os.makedirs(config_dir, exist_ok=True)

# =========================
# ЛОГИ
# =========================

logging.basicConfig(
    filename=log_file,
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

# =========================
# ЛОКАЛІЗАЦІЯ
# =========================

try:
    sys_lang = locale.getlocale()[0] or "en_US"
except Exception:
    sys_lang = "en_US"

is_ua = sys_lang.startswith("uk")

TEXT = {
    "on": "Enable Screen" if not is_ua else "Увімкнути екран",
    "off": "Disable Screen" if not is_ua else "Вимкнути екран",
    "info": "Connection Info" if not is_ua else "Інфо для підключення",
    "set_pwd": "Set Password" if not is_ua else "Змінити пароль",
    "log": "Open Log" if not is_ua else "Відкрити лог",
    "stop": "Stop Service" if not is_ua else "Зупинити сервіс",
    "exit": "Exit" if not is_ua else "Вихід",

    "status_off": "Virtual display disabled" if not is_ua else "Віртуальний екран вимкнено",
    "status_on": "Virtual display active" if not is_ua else "Віртуальний екран активний",

    "pwd_title": "Password" if not is_ua else "Пароль",
    "pwd_label": "Enter VNC password:" if not is_ua else "Введіть пароль VNC:",

    "info_title": "Connection Details" if not is_ua else "Дані для підключення",

    "started": "Virtual display started" if not is_ua else "Віртуальний екран запущено",
    "stopped": "Virtual display stopped" if not is_ua else "Віртуальний екран зупинено",

    "copy_success": "Copied to clipboard" if not is_ua else "Скопійовано в буфер",

    "error": "Error" if not is_ua else "Помилка",
    "start_error": "Failed to start virtual display" if not is_ua else "Не вдалося запустити віртуальний екран",

    "already_running": "Application already running" if not is_ua else "Програма вже запущена"
}


class TabletTrayApp:
    def __init__(self):

        # =========================
        # SINGLE INSTANCE LOCK
        # =========================

        self.lock_socket = socket.socket(socket.AF_UNIX, socket.SOCK_DGRAM)

        try:
            self.lock_socket.bind("\0virtdisp_lock")
        except socket.error:
            print(TEXT["already_running"])
            sys.exit(0)

        # =========================
        # QT APP
        # =========================

        self.app = QApplication(sys.argv)
        self.app.setQuitOnLastWindowClosed(False)

        # =========================
        # PASSWORD
        # =========================

        self.password = self.load_password()

        # =========================
        # ICONS
        # =========================

        self.icon_on = QIcon.fromTheme("video-display")
        self.icon_off = QIcon.fromTheme("video-display-ambient")

        if self.icon_on.isNull():
            self.icon_on = QIcon.fromTheme("computer")

        if self.icon_off.isNull():
            self.icon_off = self.icon_on

        # =========================
        # TRAY
        # =========================

        self.tray = QSystemTrayIcon(self.icon_off)

        self.tray.setToolTip(TEXT["status_off"])

        self.process = None

        # =========================
        # MENU
        # =========================

        self.menu = QMenu()

        self.toggle_action = QAction(TEXT["on"])
        self.toggle_action.triggered.connect(self.toggle)
        self.menu.addAction(self.toggle_action)

        self.menu.addSeparator()

        self.info_action = QAction(TEXT["info"])
        self.info_action.triggered.connect(self.show_info_dialog)
        self.menu.addAction(self.info_action)

        self.pwd_action = QAction(TEXT["set_pwd"])
        self.pwd_action.triggered.connect(self.set_password_dialog)
        self.menu.addAction(self.pwd_action)

        self.show_log_action = QAction(TEXT["log"])
        self.show_log_action.triggered.connect(self.open_log)
        self.menu.addAction(self.show_log_action)

        self.menu.addSeparator()

        self.stop_action = QAction(TEXT["stop"])
        self.stop_action.triggered.connect(self.exit_app)
        self.menu.addAction(self.stop_action)

        self.tray.setContextMenu(self.menu)

        self.tray.activated.connect(self.on_tray_activated)

        self.tray.show()

        logging.info("Application started")

    # ==========================================================
    # PASSWORD
    # ==========================================================

    def load_password(self):
        try:
            if os.path.exists(config_file):
                with open(config_file, "r") as f:
                    pwd = f.read().strip()

                    if pwd:
                        return pwd

        except Exception as e:
            logging.error(f"Password load error: {e}")

        return "123456"

    def save_password(self, pwd):
        try:
            with open(config_file, "w") as f:
                f.write(pwd)

        except Exception as e:
            logging.error(f"Password save error: {e}")

    def set_password_dialog(self):

        new_pwd, ok = QInputDialog.getText(
            None,
            TEXT["pwd_title"],
            TEXT["pwd_label"],
            QLineEdit.EchoMode.Normal,
            self.password
        )

        if ok and new_pwd.strip():

            self.password = new_pwd.strip()

            self.save_password(self.password)

            logging.info("Password updated")

            # Перезапуск монітора якщо вже працює
            if self.is_monitor_running():
                self.stop_monitor()
                self.start_monitor()

    # ==========================================================
    # NETWORK
    # ==========================================================

    def get_ip(self):

        try:
            s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

            s.connect(("8.8.8.8", 80))

            ip = s.getsockname()[0]

            s.close()

            return ip

        except Exception as e:

            logging.error(f"IP detection error: {e}")

            return "127.0.0.1"

    def get_connection_text(self):

        ip = self.get_ip()

        return (
            f"IP: {ip}\n"
            f"Port: 5900\n"
            f"Password: {self.password}"
        )

    # ==========================================================
    # UI
    # ==========================================================

    def show_info_dialog(self):

        msg = QMessageBox()

        msg.setWindowTitle(TEXT["info_title"])

        msg.setText(self.get_connection_text())

        copy_button = msg.addButton(
            "Copy",
            QMessageBox.ButtonRole.ActionRole
        )

        close_button = msg.addButton(
            "Close",
            QMessageBox.ButtonRole.RejectRole
        )

        msg.exec()

        if msg.clickedButton() == copy_button:

            QApplication.clipboard().setText(
                self.get_connection_text()
            )

            self.tray.showMessage(
                TEXT["info_title"],
                TEXT["copy_success"],
                QSystemTrayIcon.MessageIcon.Information,
                3000
            )

    def show_connection_notification(self):

        self.tray.showMessage(
            TEXT["started"],
            self.get_connection_text(),
            QSystemTrayIcon.MessageIcon.Information,
            15000
        )

    # ==========================================================
    # EVENTS
    # ==========================================================

    def on_tray_activated(self, reason):

        if reason == QSystemTrayIcon.ActivationReason.Trigger:
            self.toggle()

    # ==========================================================
    # PROCESS CONTROL
    # ==========================================================

    def is_monitor_running(self):

        return (
            self.process is not None and
            self.process.poll() is None
        )

    def toggle(self):

        if self.is_monitor_running():
            self.stop_monitor()
        else:
            self.start_monitor()

    def start_monitor(self):

        try:

            # На випадок завислого процесу
            subprocess.run(
                ["pkill", "-f", "krfb-virtualmonitor"],
                stderr=subprocess.DEVNULL
            )

            cmd = [
                "krfb-virtualmonitor",
                "--name", "TabletDisplay",
                "--resolution", "1920x1080",
                "--port", "5900"
            ]

            if self.password:
                cmd.extend(["--password", self.password])

            logging.info(f"Starting command: {' '.join(cmd)}")

            self.process = subprocess.Popen(
                cmd,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.PIPE,
                text=True
            )

            # Перевірка чи процес не впав одразу
            self.process.poll()

            if self.process.returncode is not None:

                error_output = self.process.stderr.read()

                raise RuntimeError(error_output)

            self.tray.setIcon(self.icon_on)

            self.tray.setToolTip(TEXT["status_on"])

            self.toggle_action.setText(TEXT["off"])

            logging.info("Monitor started")

            # Popup notification
            self.show_connection_notification()

            # Автоматично відкрити вікно з даними
            self.show_info_dialog()

        except Exception as e:

            logging.error(f"Start error: {e}")

            QMessageBox.critical(
                None,
                TEXT["error"],
                f"{TEXT['start_error']}\n\n{e}"
            )

            self.stop_monitor()

    def stop_monitor(self):

        try:

            if self.process:

                self.process.terminate()

                try:
                    self.process.wait(timeout=3)
                except Exception:
                    self.process.kill()

                self.process = None

            subprocess.run(
                ["pkill", "-f", "krfb-virtualmonitor"],
                stderr=subprocess.DEVNULL
            )

            self.tray.setIcon(self.icon_off)

            self.tray.setToolTip(TEXT["status_off"])

            self.toggle_action.setText(TEXT["on"])

            logging.info("Monitor stopped")

            self.tray.showMessage(
                TEXT["stopped"],
                "",
                QSystemTrayIcon.MessageIcon.Information,
                3000
            )

        except Exception as e:

            logging.error(f"Stop error: {e}")

    # ==========================================================
    # LOG
    # ==========================================================

    def open_log(self):

        editors = [
            "kate",
            "kwrite",
            "gedit",
            "xdg-open"
        ]

        for editor in editors:

            try:

                subprocess.Popen([editor, log_file])

                return

            except FileNotFoundError:
                continue

        QMessageBox.warning(
            None,
            TEXT["error"],
            log_file
        )

    # ==========================================================
    # EXIT
    # ==========================================================

    def exit_app(self):

        logging.info("Application exit")

        self.stop_monitor()

        self.app.quit()

    # ==========================================================
    # RUN
    # ==========================================================

    def run(self):

        sys.exit(self.app.exec())


# ==========================================================
# MAIN
# ==========================================================

if __name__ == "__main__":

    tray_app = TabletTrayApp()

    tray_app.run()