#!/usr/bin/env python3
import sys
import shutil
import subprocess
from pathlib import Path

from PyQt6.QtWidgets import (
    QApplication, QWidget, QLabel, QLineEdit,
    QPushButton, QVBoxLayout, QHBoxLayout,
    QComboBox, QTextEdit, QMessageBox
)
from PyQt6.QtCore import QThread, pyqtSignal


DOWNLOAD_DIR = Path.home() / "Pobrane" / "OneTube"


class DownloadThread(QThread):
    log = pyqtSignal(str)
    finished_ok = pyqtSignal(bool)

    def __init__(self, url: str, fmt: str):
        super().__init__()
        self.url = url
        self.fmt = fmt

    def run(self):
        try:
            DOWNLOAD_DIR.mkdir(parents=True, exist_ok=True)

            out_template = str(DOWNLOAD_DIR / "%(title)s.%(ext)s")

            if self.fmt == "mp4":
                cmd = [
                    "yt-dlp",
                    "-f", "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best",
                    "-o", out_template,
                    self.url
                ]
            else:
                cmd = [
                    "yt-dlp",
                    "--extract-audio",
                    "--audio-format", "mp3",
                    "--audio-quality", "0",
                    "-o", out_template,
                    self.url
                ]

            self.log.emit("Uruchamiam:\n" + " ".join(cmd) + "\n")

            proc = subprocess.Popen(
                cmd,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                text=True
            )

            for line in proc.stdout:
                self.log.emit(line.rstrip())

            proc.wait()
            self.finished_ok.emit(proc.returncode == 0)

        except Exception as e:
            self.log.emit(f"Błąd: {e}")
            self.finished_ok.emit(False)


class OneTubeGUI(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("OneTube")
        self.setMinimumWidth(500)

        self.url_input = QLineEdit()
        self.url_input.setPlaceholderText("Wklej link (YouTube / inne)")

        self.format_box = QComboBox()
        self.format_box.addItems(["mp4", "mp3"])

        self.download_btn = QPushButton("Pobierz")
        self.download_btn.clicked.connect(self.start_download)

        self.log_box = QTextEdit()
        self.log_box.setReadOnly(True)

        top = QVBoxLayout()
        top.addWidget(QLabel("URL:"))
        top.addWidget(self.url_input)

        row = QHBoxLayout()
        row.addWidget(QLabel("Format:"))
        row.addWidget(self.format_box)
        row.addStretch()
        row.addWidget(self.download_btn)

        top.addLayout(row)
        top.addWidget(QLabel("Log:"))
        top.addWidget(self.log_box)

        self.setLayout(top)

        self.check_deps()

    def check_deps(self):
        if shutil.which("yt-dlp") is None:
            QMessageBox.critical(
                self,
                "Brak yt-dlp",
                "Nie znaleziono yt-dlp.\nZainstaluj: pip install -U yt-dlp"
            )
            sys.exit(1)

    def start_download(self):
        url = self.url_input.text().strip()
        if not url:
            QMessageBox.warning(self, "Błąd", "Podaj URL.")
            return

        fmt = self.format_box.currentText()
        self.log_box.clear()
        self.download_btn.setEnabled(False)

        self.thread = DownloadThread(url, fmt)
        self.thread.log.connect(self.log_box.append)
        self.thread.finished_ok.connect(self.download_finished)
        self.thread.start()

    def download_finished(self, ok: bool):
        self.download_btn.setEnabled(True)
        if ok:
            QMessageBox.information(
                self,
                "Gotowe",
                f"Pobrano do:\n{DOWNLOAD_DIR}"
            )
        else:
            QMessageBox.critical(self, "Błąd", "Pobieranie nie powiodło się.")


def main():
    app = QApplication(sys.argv)
    win = OneTubeGUI()
    win.show()
    sys.exit(app.exec())


if __name__ == "__main__":
    main()
