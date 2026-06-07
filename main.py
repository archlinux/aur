
import sys
import subprocess
import json
import urllib.request
from PyQt6.QtWidgets import (QApplication, QMainWindow, QWidget, QVBoxLayout, 
                             QHBoxLayout, QLineEdit, QPushButton, QTableWidget, 
                             QTableWidgetItem, QHeaderView, QLabel, QAbstractItemView)
from PyQt6.QtGui import QIcon, QFont
from PyQt6.QtCore import Qt

class PMGui(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("PMgui - Package Manager Center")
        self.setGeometry(100, 100, 750, 500)
        
        # Widget principale e Layout
        self.main_widget = QWidget()
        self.setCentralWidget(self.main_widget)
        self.layout = QVBoxLayout(self.main_widget)
        
        # Barra di ricerca superiore
        self.search_layout = QHBoxLayout()
        self.search_bar = QLineEdit()
        self.search_bar.setPlaceholderText("Cerca un pacchetto (es. vlc, gimp, steam)...")
        self.search_bar.returnPressed.connect(self.search_packages)
        
        self.search_button = QPushButton("Cerca")
        self.search_button.clicked.connect(self.search_packages)
        
        self.search_layout.addWidget(self.search_bar)
        self.search_layout.addWidget(self.search_button)
        self.layout.addLayout(self.search_layout)
        
        # Tabella dei Risultati
        self.table = QTableWidget()
        self.table.setColumnCount(3)
        self.table.setHorizontalHeaderLabels(["Nome Pacchetto", "Dimensione", "Popolarità / Voti"])
        self.table.setSelectionBehavior(QAbstractItemView.SelectionBehavior.SelectRows)
        self.table.setEditTriggers(QAbstractItemView.EditTrigger.NoEditTriggers)
        
        # Abilita l'ordinamento automatico cliccando sulle colonne!
self.table.setSortingEnabled(True)

# Adatta le colonne allo spazio
header = self.table.horizontalHeader()
header.setSectionResizeMode(0, QHeaderView.ResizeMode.Stretch)
header.setSectionResizeMode(1, QHeaderView.ResizeMode.Interactive)
header.setSectionResizeMode(2, QHeaderView.ResizeMode.Interactive)

self.layout.addWidget(self.table)

# Barra di stato/Azioni inferiore
self.action_layout = QHBoxLayout()
self.status_label = QLabel("Pronto.")
self.install_button = QPushButton("Installa Selezionato")
self.install_button.clicked.connect(self.install_package)

self.action_layout.addWidget(self.status_label)
self.action_layout.addStretch()
self.action_layout.addWidget(self.install_button)
self.layout.addLayout(self.action_layout)

def get_package_size(self, pkg_name):
try:
res = subprocess.run(["pacman", "-Si", pkg_name], capture_output=True, text=True)
if res.returncode == 0:
for line in res.stdout.splitlines():
if "Dimensione del download" in line or "Download Size" in line or "Dimensione installazione" in line:
return line.split(":", 1)[1].strip()
except:
pass
return "N/D (AUR)"

def search_packages(self):
query = self.search_bar.text().strip()
if not query:
return

self.status_label.setText("Ricerca in corso...")
self.table.setSortingEnabled(False)
self.table.setRowCount(0)

# 1. Repository ufficiali (Pacman)
try:
pacman_res = subprocess.run(["pacman", "-Ss", query], capture_output=True, text=True)
lines = pacman_res.stdout.splitlines()
for i in range(0, len(lines), 2):
if i < len(lines):
parts = lines[i].split("/")
if len(parts) > 1:
pkg_info = parts[1].split(" ")
pkg_name = pkg_info[0]
size = self.get_package_size(pkg_name)
self.add_table_row(pkg_name, size, "Ufficiale (Alta)", "package-x-generic")
except Exception as e:
print(f"Errore pacman: {e}")

# 2. AUR via RPC API
try:
url = f"https://aur.archlinux.org/rpc/?v=5&type=search&arg={query}"
with urllib.request.urlopen(url) as response:
data = json.loads(response.read().decode())
if data.get("results"):
results = sorted(data["results"], key=lambda x: x.get("NumVotes", 0), reverse=True)
for item in results[:30]:
pkg_name = item.get("Name")
votes = item.get("NumVotes", 0)
self.add_table_row(pkg_name, "N/D (Sorgente)", f"{votes} voti", "vcs-normal")
except Exception as e:
print(f"Errore AUR: {e}")

self.table.setSortingEnabled(True)
self.status_label.setText(f"Ricerca completata. Clicca sulle colonne per ordinare!")

def add_table_row(self, name, size, popularity, icon_name):
row = self.table.rowCount()
self.table.insertRow(row)

name_item = QTableWidgetItem(name)
icon = QIcon.fromTheme(icon_name, QIcon.fromTheme("system-run"))
name_item.setIcon(icon)

size_item = QTableWidgetItem(size)
pop_item = QTableWidgetItem(popularity)

self.table.setItem(row, 0, name_item)
self.table.setItem(row, 1, size_item)
self.table.setItem(row, 2, pop_item)

def install_package(self):
selected_row = self.table.currentRow()
if selected_row < 0:
self.status_label.setText("Seleziona prima un pacchetto dalla tabella!")
return

pkg_name = self.table.item(selected_row, 0).text()
self.status_label.setText(f"Installazione di {pkg_name} in corso...")
subprocess.run(["alacritty", "-e", "yay", "-S", pkg_name])

if __name__ == "__main__":
app = QApplication(sys.argv)
gui = PMGui()
gui.show()
sys.exit(app.exec())
