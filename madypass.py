#!/usr/bin/env python3

"""
Generatore Password Avanzato
Autore: madyel
Blog: Webikki
Versione: 1.0
Data: 2025-04-11

Questo software consente di generare password sicure, salvarle in modo cifrato,
visualizzarle in una griglia interattiva, copiarle negli appunti e gestirle in totale sicurezza.

Powered by PyQt5 + Cryptography
"""

import os
import random
import string
import datetime
import logging

from PyQt5.QtGui import QIcon
from PyQt5.QtWidgets import (
    QApplication, QWidget, QVBoxLayout, QLabel,
    QLineEdit, QCheckBox, QPushButton, QSpinBox, QMessageBox,
    QTableWidget, QTableWidgetItem, QHeaderView
)
from PyQt5.QtCore import Qt
from cryptography.fernet import Fernet

# Percorso base nella home dell'utente
PATH = os.path.expanduser("~/.generate-password")
os.makedirs(PATH, exist_ok=True)

# Directory per i log
log_dir = os.path.join(PATH, "log")
os.makedirs(log_dir, exist_ok=True)

# File path assoluti
KEY_FILE = os.path.join(PATH, "secret.key")
ENC_FILE = os.path.join(PATH, "passwords.enc")
log_path = os.path.join(log_dir, "password_generator.log")


# Setup logger
logging.basicConfig(
    filename=log_path,
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)
logger = logging.getLogger(__name__)

def load_or_create_key():
    if not os.path.exists(KEY_FILE):
        key = Fernet.generate_key()
        with open(KEY_FILE, "wb") as key_file:
            key_file.write(key)
        logger.info("Chiave segreta creata.")
    else:
        logger.info("Chiave segreta caricata.")
        with open(KEY_FILE, "rb") as key_file:
            key = key_file.read()
    return Fernet(key)

fernet = load_or_create_key()

def genera_password(usa_maiuscole=True, usa_numeri=True, usa_speciali=True):
    caratteri = string.ascii_lowercase
    if usa_maiuscole:
        caratteri += string.ascii_uppercase
    if usa_numeri:
        caratteri += string.digits
    if usa_speciali:
        caratteri += "!@#$%^&*()-_=+[]{}|;:,.<>?/"
    return caratteri

def salva_password(nome_account, password):
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    entry = f"{timestamp} | {nome_account} | {password}\n"
    encrypted = fernet.encrypt(entry.encode())
    with open(ENC_FILE, "ab") as f:
        f.write(encrypted + b"\n")
    logger.info(f"Password salvata per account: {nome_account}")

def leggi_password_cifrate():
    if not os.path.exists(ENC_FILE):
        logger.warning("Nessun file di password cifrate trovato.")
        return []
    righe = []
    with open(ENC_FILE, "rb") as f:
        for linea in f:
            try:
                decrypted = fernet.decrypt(linea.strip())
                righe.append(decrypted.decode())
            except Exception as e:
                logger.exception("Errore nella decifratura di una riga")
                righe.append("|||")
    return righe

class PasswordGeneratorApp(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Madypass")
        self.setWindowIcon(QIcon("/usr/share/icons/hicolor/64x64/apps/madypass.png"))
        self.init_ui()

    def init_ui(self):
        self.resize(1000, 700)
        layout = QVBoxLayout()

        layout.addWidget(QLabel("Nome Account:"))
        self.account_input = QLineEdit()
        layout.addWidget(self.account_input)

        layout.addWidget(QLabel("Lunghezza Password:"))
        self.length_input = QSpinBox()
        self.length_input.setMinimum(4)
        self.length_input.setMaximum(128)
        self.length_input.setValue(16)
        layout.addWidget(self.length_input)

        self.chk_maiuscole = QCheckBox("Includi Maiuscole")
        self.chk_maiuscole.setChecked(True)
        layout.addWidget(self.chk_maiuscole)

        self.chk_numeri = QCheckBox("Includi Numeri")
        self.chk_numeri.setChecked(True)
        layout.addWidget(self.chk_numeri)

        self.chk_speciali = QCheckBox("Includi Speciali")
        self.chk_speciali.setChecked(True)
        layout.addWidget(self.chk_speciali)

        self.chk_solo_numeri = QCheckBox("Solo Numeri")
        self.chk_solo_numeri.setChecked(False)
        self.chk_solo_numeri.toggled.connect(self.gestisci_solo_numeri)
        layout.addWidget(self.chk_solo_numeri)

        self.result_label = QLabel("")
        self.result_label.setTextInteractionFlags(Qt.TextSelectableByMouse)
        layout.addWidget(self.result_label)

        self.btn_generate = QPushButton("Genera Password")
        self.btn_generate.clicked.connect(self.genera_password)
        layout.addWidget(self.btn_generate)

        self.btn_copy = QPushButton("📋 Copia negli appunti")
        self.btn_copy.clicked.connect(self.copia_password)
        layout.addWidget(self.btn_copy)

        self.btn_save = QPushButton("Salva Password")
        self.btn_save.clicked.connect(self.salva_password)
        layout.addWidget(self.btn_save)

        self.btn_read = QPushButton("📂 Mostra Password Salvate")
        self.btn_read.clicked.connect(self.mostra_tabella_password)
        layout.addWidget(self.btn_read)

        self.table_widget = QTableWidget()
        self.table_widget.setColumnCount(3)
        self.table_widget.setHorizontalHeaderLabels(["Data", "Account", "Password"])
        self.table_widget.horizontalHeader().setStretchLastSection(True)
        self.table_widget.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)
        self.table_widget.cellDoubleClicked.connect(self.copia_doppio_click)
        layout.addWidget(self.table_widget)

        self.btn_delete_selected = QPushButton("❌ Elimina Selezionata")
        self.btn_delete_selected.clicked.connect(self.elimina_password_selezionata)
        layout.addWidget(self.btn_delete_selected)

        self.setLayout(layout)

    def gestisci_solo_numeri(self, checked):
        # Se è selezionato "Solo Numeri", disattiva le altre opzioni
        self.chk_maiuscole.setEnabled(not checked)
        self.chk_numeri.setEnabled(not checked)
        self.chk_speciali.setEnabled(not checked)

        # Se selezionato, forza l'uso dei numeri (le altre diventano irrilevanti)
        if checked:
            self.chk_maiuscole.setChecked(False)
            self.chk_numeri.setChecked(False)
            self.chk_speciali.setChecked(False)

    def genera_password(self):
        if self.chk_solo_numeri.isChecked():
            caratteri = string.digits
        else:
            caratteri = genera_password(
            usa_maiuscole=self.chk_maiuscole.isChecked(),
            usa_numeri=self.chk_numeri.isChecked(),
            usa_speciali=self.chk_speciali.isChecked()
            )

        if not caratteri:
            QMessageBox.warning(self, "Errore", "Seleziona almeno una categoria di caratteri.")
            return

        pwd = ''.join(random.choice(caratteri) for _ in range(self.length_input.value()))
        logger.info(f"Password generata per account: {self.account_input.text().strip()}")
        self.result_label.setText(f"{pwd}")


    def copia_password(self):
        password = self.result_label.text().replace("🔐 ", "").strip().replace("<b style='color:#00ffcc; font-size:16px;'>", "").replace("</b>", "")
        if password:
            QApplication.clipboard().setText(password)
            logger.info("Password copiata negli appunti")
            QMessageBox.information(self, "Copiata!", "Password copiata negli appunti!")
        else:
            QMessageBox.warning(self, "Errore", "Nessuna password da copiare.")

    def salva_password(self):
        nome = self.account_input.text().strip()
        password = self.result_label.text().replace("🔐 ", "").replace("<b style='color:#00ffcc; font-size:16px;'>", "").replace("</b>", "")
        if nome and (password != "Password generata apparirà qui"):
            salva_password(nome, password)
            QMessageBox.information(self, "Salvata", "Password salvata e cifrata correttamente!")
        else:
            QMessageBox.warning(self, "Errore", "Inserisci un nome account e genera una password prima di salvare.")

    def mostra_tabella_password(self):
        self.table_widget.setRowCount(0)
        passwords = leggi_password_cifrate()
        for i, entry in enumerate(passwords):
            parts = entry.split(" | ")
            if len(parts) == 3:
                self.table_widget.insertRow(i)
                for j, part in enumerate(parts):
                    self.table_widget.setItem(i, j, QTableWidgetItem(part))
        logger.info("Password caricate nella griglia")
        #self.table_widget.resizeColumnsToContents()

    def elimina_password_selezionata(self):
        row = self.table_widget.currentRow()
        if row < 0:
            QMessageBox.warning(self, "Errore", "Seleziona una riga da eliminare.")
            return
        with open(ENC_FILE, "rb") as f:
            righe = f.readlines()
        del righe[row]
        with open(ENC_FILE, "wb") as f:
            for r in righe:
                f.write(r)
        self.table_widget.removeRow(row)
        logger.info(f"Password alla riga {row} eliminata")
        QMessageBox.information(self, "Eliminata", "Password eliminata correttamente.")

    def copia_doppio_click(self, row, column):
        password_item = self.table_widget.item(row, 2)
        if password_item:
            password = password_item.text()
            QApplication.clipboard().setText(password)
            logger.info(f"Password copiata da riga {row}")
            QMessageBox.information(self, "Copiata!", f"Password copiata: {password}")

def main():
    app = QApplication([])
    dark_style = '''
        QWidget { background-color: #2b2b2b; color: white; font-family: Consolas; }
        QLabel { font-size: 14px; color: white; }
        QLineEdit, QSpinBox, QTableWidget, QTableWidgetItem {
            background-color: #3c3f41; color: white; border: 1px solid #555;
        }
        QPushButton {
            background-color: #44475a; color: white;
            border: 1px solid #6272a4; padding: 5px; font-weight: bold;
        }
        QPushButton:hover { background-color: #6272a4; }
    '''
    app.setStyleSheet(dark_style)
    window = PasswordGeneratorApp()
    window.show()
    app.exec_()

if __name__ == "__main__":
    main()
