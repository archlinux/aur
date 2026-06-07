
import sys
import subprocess
import json
import urllib.request
import os
import re
from PyQt6.QtWidgets import (QApplication, QMainWindow, QWidget, QVBoxLayout, 
                             QHBoxLayout, QLineEdit, QPushButton, QTableWidget, 
                             QTableWidgetItem, QHeaderView, QLabel, QAbstractItemView)
from PyQt6.QtGui import QIcon
from PyQt6.QtCore import Qt, QThread, pyqtSignal

class SearchWorker(QThread):
    results_found = pyqtSignal(list)
    finished = pyqtSignal()

    def __init__(self, query):
        super().__init__()
        self.query = query.lower()
        self.desktop_icons = self.load_desktop_icons()

    def load_desktop_icons(self):
        apps_icons = {}
        search_paths = ["/usr/share/applications", os.path.expanduser("~/.local/share/applications")]
        for path in search_paths:
            if os.path.exists(path):
                for file in os.listdir(path):
                    if file.endswith(".desktop"):
                        try:
                            with open(os.path.join(path, file), "r", errors="ignore") as f:
                                content = f.read()
                                icon_match = re.search(r"^Icon=(.+)$", content, re.MULTILINE)
                                pkg_name = file.replace(".desktop", "")
                                if icon_match:
                                    apps_icons[pkg_name] = icon_match.group(1).strip()
                        except:
                            pass
        return apps_icons

    def get_icon_for_package(self, pkg_name):
        if pkg_name in self.desktop_icons:
            return self.desktop_icons[pkg_name]
        if "player" in pkg_name or "video" in pkg_name or "music" in pkg_name or pkg_name == "mpv":
            return "multimedia-video-player"
        if "git" in pkg_name or "dev" in pkg_name:
            return "applications-development"
        return "vcs-normal"

    def get_package_size(self, pkg_name):
        try:
            res = subprocess.run(["pacman", "-Si", pkg_name], capture_output=True, text=True, timeout=2)
            if res.returncode == 0:
                for line in res.stdout.splitlines():
                    if "Download Size" in line or "Dimensione del download" in line or "Installed Size" in line or "Dimensione installazione" in line:
                        return line.split(":", 1)[1].strip()
        except:
            pass
        return "N/A"

    def run(self):
        official_matches = []
        aur_matches = []

        try:
            pacman_res = subprocess.run(["pacman", "-Ss", self.query], capture_output=True, text=True)
            lines = pacman_res.stdout.splitlines()
            pkg_names = []
            for i in range(0, len(lines), 2):
                if i < len(lines):
                    parts = lines[i].split("/")
                    if len(parts) > 1:
                        pkgname = parts[1].split(" ")[0]
                        pkg_names.append(pkgname)
            if pkg_names:
                pkg_names = pkg_names[:40]
                size_res = subprocess.run(["pacman", "-Si"] + pkg_names, capture_output=True, text=True)
                current_pkg = None
                sizes = {}
                for line in size_res.stdout.splitlines():
                    if line.startswith("Repository") or line.startswith("Nome") or line.startswith("Name"):
                        current_pkg = line.split(":")[1].strip()
                    if ("Download Size" in line or "Dimensione del download" in line or "Installed Size" in line or "Dimensione installazione" in line) and current_pkg:
                        sizes[current_pkg] = line.split(":")[1].strip()
                for name in pkg_names:
                    size = sizes.get(name, "N/A")
                    icon = self.get_icon_for_package(name)
                    official_matches.append((name, size, "Official", icon))
        except Exception as e:
            print(f"Pacman error: {e}")

        try:
            url = f"https://aur.archlinux.org/rpc/?v=5&type=search&arg={self.query}"
            req = urllib.request.Request(url, headers={"User-Agent": "PMgui-Client"})
            with urllib.request.urlopen(req, timeout=5) as response:
                data = json.loads(response.read().decode())
                if data.get("results"):
                    results = sorted(data["results"], key=lambda x: x.get("NumVotes", 0), reverse=True)
                    for item in results[:30]:
                        pkg_name = item.get("Name")
                        votes = item.get("NumVotes", 0)
                        icon = self.get_icon_for_package(pkg_name)
                        aur_matches.append((pkg_name, "N/A", f"{votes} votes", icon))
        except Exception as e:
            print(f"AUR error: {e}")

        all_results = official_matches + aur_matches
        sorted_results = sorted(all_results, key=lambda x: (x[0].lower() != self.query, x[0].lower()))
        self.results_found.emit(sorted_results)
        self.finished.emit()

class PMGui(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("PMgui - Package Manager Center")
        self.setGeometry(100, 100, 750, 500)
        self.main_widget = QWidget()
        self.setCentralWidget(self.main_widget)
        self.layout = QVBoxLayout(self.main_widget)
        
        self.search_layout = QHBoxLayout()
        self.search_bar = QLineEdit()
        self.search_bar.setPlaceholderText("Search for packages (e.g., vlc, gimp, mpv)...")
        self.search_bar.returnPressed.connect(self.start_search)
        self.search_button = QPushButton("Search")
        self.search_button.clicked.connect(self.start_search)
        self.search_layout.addWidget(self.search_bar)
        self.search_layout.addWidget(self.search_button)
        self.layout.addLayout(self.search_layout)
        
        self.table = QTableWidget()
        self.table.setColumnCount(3)
        self.table.setHorizontalHeaderLabels(["Package Name", "Size", "Popularity"])
        self.table.setSelectionBehavior(QAbstractItemView.SelectionBehavior.SelectRows)
        self.table.setEditTriggers(QAbstractItemView.EditTrigger.NoEditTriggers)
        self.table.setSortingEnabled(True)
        header = self.table.horizontalHeader()
        header.setSectionResizeMode(0, QHeaderView.ResizeMode.Stretch)
        self.layout.addWidget(self.table)
        
        self.action_layout = QHBoxLayout()
        self.status_label = QLabel("Ready.")
        self.install_button = QPushButton("Install Selected")
        self.install_button.clicked.connect(self.install_package)
        self.action_layout.addWidget(self.status_label)
        self.action_layout.addStretch()
        self.action_layout.addWidget(self.install_button)
        self.layout.addLayout(self.action_layout)

    def start_search(self):
        query = self.search_bar.text().strip()
        if not query:
            return
        self.status_label.setText("Searching...")
        self.table.setSortingEnabled(False)
        self.table.setRowCount(0)
        self.search_button.setEnabled(False)
        self.worker = SearchWorker(query)
        self.worker.results_found.connect(self.populate_table)
        self.worker.finished.connect(self.search_finished)
        self.worker.start()

    def populate_table(self, results):
        for name, size, popularity, icon_name in results:
            row = self.table.rowCount()
            self.table.insertRow(row)
            name_item = QTableWidgetItem(name)
            icon = QIcon.fromTheme(icon_name, QIcon.fromTheme("application-x-executable"))
            name_item.setIcon(icon)
            size_item = QTableWidgetItem(size)
            pop_item = QTableWidgetItem(popularity)
            self.table.setItem(row, 0, name_item)
            self.table.setItem(row, 1, size_item)
            self.table.setItem(row, 2, pop_item)

    def search_finished(self):
        self.table.setSortingEnabled(True)
        self.search_button.setEnabled(True)
        self.status_label.setText("Search completed!")

    def install_package(self):
        selected_row = self.table.currentRow()
        if selected_row < 0:
            self.status_label.setText("Please select a package first!")
            return
        pkg_name = self.table.item(selected_row, 0).text()
        self.status_label.setText(f"Installing {pkg_name}...")
        subprocess.run(["alacritty", "-e", "yay", "-S", pkg_name])

if __name__ == "__main__":
    app = QApplication(sys.argv)
    gui = PMGui()
    gui.show()
    sys.exit(app.exec())
