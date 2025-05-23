#!/usr/bin/env python
from PyQt5 import QtWidgets, QtGui
from PyQt5.QtWidgets import QApplication, QWidget, QVBoxLayout, QLabel, QLineEdit, QPushButton, QTextEdit, QMessageBox, QSpinBox, QDialog, QFormLayout, QDialogButtonBox, QMainWindow, QAction, QMenu
import sys
import hashlib
import bcrypt
from argon2 import PasswordHasher

class Argon2ConfigDialog(QDialog):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Configure Argon2")

        layout = QFormLayout()

        self.time_cost = QSpinBox()
        self.time_cost.setRange(1, 10)
        self.time_cost.setValue(4)
        layout.addRow("Time Cost (t):", self.time_cost)

        self.memory_cost = QSpinBox()
        self.memory_cost.setRange(8192, 262144)
        self.memory_cost.setSingleStep(8192)
        self.memory_cost.setValue(65536)
        layout.addRow("Memory Cost (kB):", self.memory_cost)

        self.parallelism = QSpinBox()
        self.parallelism.setRange(1, 8)
        self.parallelism.setValue(2)
        layout.addRow("Parallelism (p):", self.parallelism)

        self.hash_len = QSpinBox()
        self.hash_len.setRange(16, 64)
        self.hash_len.setValue(32)
        layout.addRow("Hash Length:", self.hash_len)

        self.salt_len = QSpinBox()
        self.salt_len.setRange(8, 32)
        self.salt_len.setValue(16)
        layout.addRow("Salt Length:", self.salt_len)

        self.buttons = QDialogButtonBox(QDialogButtonBox.Ok | QDialogButtonBox.Cancel)
        self.buttons.accepted.connect(self.accept)
        self.buttons.rejected.connect(self.reject)
        layout.addWidget(self.buttons)

        self.setLayout(layout)

class BcryptConfigDialog(QDialog):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Configure Bcrypt")

        layout = QFormLayout()

        self.rounds = QSpinBox()
        self.rounds.setRange(4, 31)
        self.rounds.setValue(12)
        layout.addRow("Cost (Rounds):", self.rounds)

        self.buttons = QDialogButtonBox(QDialogButtonBox.Ok | QDialogButtonBox.Cancel)
        self.buttons.accepted.connect(self.accept)
        self.buttons.rejected.connect(self.reject)
        layout.addWidget(self.buttons)

        self.setLayout(layout)

class PasswordHasherApp(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Password Hasher")
        self.resize(600, 400)

        central_widget = QWidget()
        self.setCentralWidget(central_widget)
        layout = QVBoxLayout()
        central_widget.setLayout(layout)

        self.label = QLabel("Enter Password:")
        layout.addWidget(self.label)

        self.password_entry = QLineEdit()
        self.password_entry.setEchoMode(QLineEdit.Password)
        layout.addWidget(self.password_entry)

        self.generate_button = QPushButton("Generate Hashes")
        self.generate_button.clicked.connect(self.generate_hashes)
        layout.addWidget(self.generate_button)

        self.verify_button = QPushButton("Verify Password")
        self.verify_button.clicked.connect(self.verify_password)
        layout.addWidget(self.verify_button)

        self.hash_output = QTextEdit()
        self.hash_output.setReadOnly(True)
        layout.addWidget(self.hash_output)

        self.hashes = {}
        self.argon2_hasher = PasswordHasher()
        self.bcrypt_rounds = 12

        self.create_menu()

    def create_menu(self):
        menubar = self.menuBar()

        file_menu = menubar.addMenu("File")
        about_action = QAction("About", self)
        about_action.triggered.connect(self.show_about_dialog)
        file_menu.addAction(about_action)

        edit_menu = menubar.addMenu("Edit")

        configure_menu = QMenu("Configure", self)
        edit_menu.addMenu(configure_menu)

        configure_argon2_action = QAction("Argon2", self)
        configure_argon2_action.triggered.connect(self.configure_argon2)
        configure_menu.addAction(configure_argon2_action)

        configure_bcrypt_action = QAction("Bcrypt", self)
        configure_bcrypt_action.triggered.connect(self.configure_bcrypt)
        configure_menu.addAction(configure_bcrypt_action)

    def show_about_dialog(self):
        QMessageBox.information(
            self,
            "About Password Hasher",
            "Password Hasher\n\n"
            "A cross-platform utility for generating and verifying password hashes\n"
            "using popular algorithms including MD5, SHA-1, SHA-256, SHA-512, Bcrypt, and Argon2.\n\n"
            "Version: 1.0\n"
            "Author: MaDyEl\n"
            "Website: https://webikki.blogspot.com\n"
        )

    def configure_argon2(self):
        dialog = Argon2ConfigDialog(self)
        if dialog.exec_() == QDialog.Accepted:
            self.argon2_hasher = PasswordHasher(
                time_cost=dialog.time_cost.value(),
                memory_cost=dialog.memory_cost.value(),
                parallelism=dialog.parallelism.value(),
                hash_len=dialog.hash_len.value(),
                salt_len=dialog.salt_len.value()
            )

    def configure_bcrypt(self):
        dialog = BcryptConfigDialog(self)
        if dialog.exec_() == QDialog.Accepted:
            self.bcrypt_rounds = dialog.rounds.value()

    def generate_hashes(self):
        password_str = self.password_entry.text()
        if not password_str:
            QMessageBox.warning(self, "Input Error", "Please enter a password")
            return

        password = password_str.encode('utf-8')

        self.hashes = {
            'MD5': hashlib.md5(password).hexdigest(),
            'SHA1': hashlib.sha1(password).hexdigest(),
            'SHA256': hashlib.sha256(password).hexdigest(),
            'SHA512': hashlib.sha512(password).hexdigest(),
            'BCRYPT': bcrypt.hashpw(password, bcrypt.gensalt(self.bcrypt_rounds)).decode('utf-8'),
            'ARGON2': self.argon2_hasher.hash(password_str)
        }

        self.hash_output.clear()
        for algo, h in self.hashes.items():
            self.hash_output.setTextColor(QtGui.QColor("blue"))
            self.hash_output.insertPlainText(f"{algo}: ")
            self.hash_output.setTextColor(QtGui.QColor("black"))
            self.hash_output.insertPlainText(f"{h}\n")

    def verify_password(self):
        password_str = self.password_entry.text()
        if not password_str:
            QMessageBox.warning(self, "Input Error", "Please enter a password")
            return

        password = password_str.encode('utf-8')

        result = []
        for algo, h in self.hashes.items():
            if algo == 'BCRYPT':
                match = bcrypt.checkpw(password, h.encode('utf-8'))
            elif algo == 'ARGON2':
                try:
                    self.argon2_hasher.verify(h, password_str)
                    match = True
                except Exception:
                    match = False
            else:
                hasher = getattr(hashlib, algo.lower())
                match = hasher(password).hexdigest() == h
            result.append(f"{algo}: {'MATCH' if match else 'NO MATCH'}")

        QMessageBox.information(self, "Verification Result", "\n".join(result))

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = PasswordHasherApp()
    window.show()
    sys.exit(app.exec_())
