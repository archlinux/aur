from PySide6.QtWidgets import (QDialog, QVBoxLayout, QHBoxLayout, QGroupBox,
                               QCheckBox, QPushButton, QDialogButtonBox,
                               QTableWidget, QTableWidgetItem, QHeaderView, QLineEdit,
                               QColorDialog, QMessageBox)
from PySide6.QtCore import Qt
from config import _

class SettingsDialog(QDialog):
    def __init__(self, parent, db):
        super().__init__(parent)
        self.db = db
        self.setWindowTitle(_("Ustawienia i Konta"))
        self.resize(550, 600)
        layout = QVBoxLayout(self)

        # --- DEFINICJA STYLI ---
        base_style = """
            QPushButton {
                font-size: 12px; font-weight: bold; padding: 5px 10px;
                border-radius: 6px; border: 2px solid; background-color: transparent;
            }
        """
        inc_style = base_style + """
            QPushButton { color: #27ae60; border-color: #2ecc71; }
            QPushButton:hover { background-color: #27ae60; color: #ffffff; }
        """
        exp_style = base_style + """
            QPushButton { color: #c0392b; border-color: #e74c3c; }
            QPushButton:hover { background-color: #c0392b; color: #ffffff; }
        """

        # --- SEKCJA MODUŁÓW ---
        modules_group = QGroupBox(_("Widoczne moduły i systemy"))
        mod_lay = QVBoxLayout(modules_group)

        self.cb_liabilities = QCheckBox(_("System Długów (Zobowiązania)"))
        self.cb_liabilities.setChecked(self.db.get_config_bool("show_liabilities", True))
        self.cb_debtors = QCheckBox(_("System Dłużników (Należności)"))
        self.cb_debtors.setChecked(self.db.get_config_bool("show_debtors", True))
        self.cb_shopping = QCheckBox(_("Moduł: Lista Zakupów"))
        self.cb_shopping.setChecked(self.db.get_config_bool("show_shopping", True))
        self.cb_weekly = QCheckBox(_("System: Limit Tygodniowy"))
        self.cb_weekly.setChecked(self.db.get_config_bool("show_weekly", True))

        for cb in [self.cb_liabilities, self.cb_debtors, self.cb_shopping, self.cb_weekly]:
            mod_lay.addWidget(cb)
        layout.addWidget(modules_group)

        # --- SEKCJA KONT BANKOWYCH ---
        acc_group = QGroupBox(_("Zarządzanie kontami"))
        acc_lay = QVBoxLayout(acc_group)

        # Zmieniamy na 3 kolumny: Nazwa, Saldo, Akcja
        self.acc_table = QTableWidget(0, 3)
        self.acc_table.setHorizontalHeaderLabels([_("Nazwa konta"), _("Saldo pocz."), _("Kolor")])
        self.acc_table.horizontalHeader().setSectionResizeMode(0, QHeaderView.Stretch)
        self.acc_table.horizontalHeader().setSectionResizeMode(1, QHeaderView.Interactive)
        self.acc_table.horizontalHeader().setSectionResizeMode(2, QHeaderView.Fixed)
        self.acc_table.setColumnWidth(2, 100)

        self.acc_table.setAlternatingRowColors(True)
        self.acc_table.setStyleSheet("QTableWidget { font-size: 12px; }")
        acc_lay.addWidget(self.acc_table)

        # Formularz dodawania konta
        add_acc_lay = QHBoxLayout()
        self.new_acc_name = QLineEdit(); self.new_acc_name.setPlaceholderText(_("Nazwa konta"))
        self.new_acc_bal = QLineEdit(); self.new_acc_bal.setPlaceholderText(_("Saldo startowe"))

        btn_add_acc = QPushButton(_("Dodaj konto"))
        btn_add_acc.setStyleSheet(inc_style)
        btn_add_acc.clicked.connect(self.add_account_action)

        add_acc_lay.addWidget(self.new_acc_name)
        add_acc_lay.addWidget(self.new_acc_bal)
        add_acc_lay.addWidget(btn_add_acc)
        acc_lay.addLayout(add_acc_lay)

        layout.addWidget(acc_group)

        # Wywołujemy odświeżanie
        self.refresh_accounts()

        # --- PRZYCISKI ZAPISU I ANULOWANIA ---
        self.buttons = QDialogButtonBox(QDialogButtonBox.Save | QDialogButtonBox.Cancel)
        self.buttons.accepted.connect(self.save_and_close)
        self.buttons.rejected.connect(self.reject)

        btn_save = self.buttons.button(QDialogButtonBox.Save)
        if btn_save:
            btn_save.setText(_("ZAPISZ"))
            btn_save.setStyleSheet(inc_style)

        btn_cancel = self.buttons.button(QDialogButtonBox.Cancel)
        if btn_cancel:
            btn_cancel.setText(_("ANULUJ"))
            btn_cancel.setStyleSheet(exp_style)

        layout.addWidget(self.buttons)

    def refresh_accounts(self):
        self.acc_table.setRowCount(0)
        accounts = self.db.get_accounts()

        for acc_id, name, bal, color in accounts:
            row = self.acc_table.rowCount()
            self.acc_table.insertRow(row)

            # 1. Nazwa konta
            name_item = QTableWidgetItem(name)
            name_item.setFlags(Qt.ItemIsEnabled | Qt.ItemIsSelectable)
            self.acc_table.setItem(row, 0, name_item)

            # 2. Saldo początkowe
            bal_item = QTableWidgetItem(f"{bal:.2f} zł")
            bal_item.setFlags(Qt.ItemIsEnabled | Qt.ItemIsSelectable)
            self.acc_table.setItem(row, 1, bal_item)

            # 3. Widget koloru (Podgląd + Przycisk)
            color_widget = QPushButton(_("Zmień"))
            # Mały trik stylistyczny: kolorowy pasek na przycisku
            color_widget.setStyleSheet(f"""
                QPushButton {{
                    border-left: 10px solid {color};
                    font-size: 11px; padding: 2px;
                    border-top: 1px solid gray; border-right: 1px solid gray; border-bottom: 1px solid gray;
                }}
            """)
            color_widget.clicked.connect(lambda ch, aid=acc_id, n=name: self.change_account_color(aid, n))
            self.acc_table.setCellWidget(row, 2, color_widget)

    def change_account_color(self, acc_id, name):
        color = QColorDialog.getColor()
        if color.isValid():
            new_hex = color.name()
            if self.db.update_account_color(acc_id, new_hex):
                self.refresh_accounts()
                # Powiadomienie Dashboardu o zmianie kolorów
                if hasattr(self.parent(), 'load_transactions'):
                    self.parent().load_transactions()

    def add_account_action(self):
        name = self.new_acc_name.text().strip()
        raw = self.new_acc_bal.text().replace(',', '.')

        try:
            bal = float(raw) if raw else 0.0
        except ValueError:
            bal = 0.0

        if not name:
            return

        color = QColorDialog.getColor()
        color_hex = color.name() if color.isValid() else "#7f8c8d"

        if self.db.add_account(name, bal, color_hex):
            self.new_acc_name.clear()
            self.new_acc_bal.clear()
            self.refresh_accounts()
            # Odświeżenie Dashboardu
            if hasattr(self.parent(), 'load_transactions'):
                self.parent().load_transactions()
            QMessageBox.information(self, _("Sukces"), _("Konto '{}' zostało dodane.").format(name))
        else:
            QMessageBox.warning(self, _("Błąd"), _("Nie udało się dodać konta."))

    def save_and_close(self):
        self.db.set_config("show_liabilities", self.cb_liabilities.isChecked())
        self.db.set_config("show_debtors", self.cb_debtors.isChecked())
        self.db.set_config("show_shopping", self.cb_shopping.isChecked())
        self.db.set_config("show_weekly", self.cb_weekly.isChecked())
        self.accept()
