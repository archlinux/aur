from PySide6.QtWidgets import (QDialog, QVBoxLayout, QHBoxLayout, QLabel, QLineEdit,
                               QComboBox, QPushButton, QDateEdit, QGroupBox, QFormLayout,
                               QDialogButtonBox, QRadioButton, QButtonGroup,
                               QProgressBar, QTextEdit, QSpinBox, QFrame, QWidget,
                               QCheckBox, QListWidget, QListWidgetItem, QAbstractItemView, QTableWidget, QTableWidgetItem, QHeaderView)
from PySide6.QtCore import Qt, QDate
from config import _, CASH_SAVINGS_NAME, MONTH_NAME

class ProcessingDialog(QDialog):
    def __init__(self, parent=None, title=None, label_text=None):
        super().__init__(parent)
        self.setWindowTitle(title if title else _("Przetwarzanie..."))
        self.setFixedSize(300, 120)
        self.setWindowFlags(Qt.Dialog | Qt.CustomizeWindowHint | Qt.WindowTitleHint)
        self.setModal(True)
        layout = QVBoxLayout(self)
        self.lbl = QLabel(label_text if label_text else _("Proszę czekać..."))
        self.lbl.setAlignment(Qt.AlignCenter)
        self.pbar = QProgressBar()
        self.pbar.setRange(0, 0)
        layout.addWidget(self.lbl)
        layout.addWidget(self.pbar)

class BackupDialog(QDialog):
    def __init__(self, parent=None, db_manager=None):
        super().__init__(parent)
        from PySide6.QtWidgets import QSizePolicy
        self.db = db_manager
        self.setWindowTitle(_("Kopia Zapasowa"))
        self.resize(500, 250)
        main_btn_base = """
            QPushButton {
                font-size: 12px; font-weight: bold; padding: 5px 15px; border-radius: 6px;
                border: 2px solid; background-color: transparent; min-height: 20px;
            }
        """
        blue_style = main_btn_base + """
            QPushButton { color: #2980b9; border-color: #3498db; }
            QPushButton:hover { background-color: #2980b9; color: #ffffff; }
        """
        orange_style = main_btn_base + """
            QPushButton { color: #d35400; border-color: #e67e22; }
            QPushButton:hover { background-color: #d35400; color: #ffffff; }
        """
        gray_style = main_btn_base + """
            QPushButton { color: #7f8c8d; border-color: #95a5a6; }
            QPushButton:hover { background-color: #7f8c8d; color: #ffffff; }
        """
        layout = QVBoxLayout(self)
        gb = QGroupBox(_("Ustawienia"))
        form = QFormLayout()
        self.cb_auto = QCheckBox(_("Rób automatycznie przy zamknięciu"))
        self.path_edit = QLineEdit()
        self.path_edit.setReadOnly(True)
        self.path_edit.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Fixed)

        h = QHBoxLayout()
        h.setSpacing(5)
        h.addWidget(self.path_edit)

        btn = QPushButton("...")
        btn.setFixedWidth(60)
        btn.setStyleSheet(gray_style)
        btn.setCursor(Qt.PointingHandCursor)
        btn.clicked.connect(self.select_path)

        h.addWidget(btn)

        form.addRow(self.cb_auto)
        form.addRow(_("Lokalizacja:"), h)
        gb.setLayout(form)
        layout.addWidget(gb)

        h_act = QHBoxLayout()
        h_act.setSpacing(15)

        b1 = QPushButton(_("💾 Utwórz Kopię Teraz"))
        b1.setStyleSheet(blue_style)
        b1.setCursor(Qt.PointingHandCursor)
        b1.clicked.connect(self.create_now)

        b2 = QPushButton(_("🔄 Przywróć z Kopii"))
        b2.setStyleSheet(orange_style)
        b2.setCursor(Qt.PointingHandCursor)
        b2.clicked.connect(self.restore_now)

        h_act.addWidget(b1)
        h_act.addWidget(b2)
        layout.addLayout(h_act)

        self.load_config()

        btn_close = QPushButton(_("ZAMKNIJ"))
        btn_close.setStyleSheet(gray_style)
        btn_close.setCursor(Qt.PointingHandCursor)
        btn_close.clicked.connect(self.accept)

        close_layout = QHBoxLayout()
        close_layout.addStretch()
        close_layout.addWidget(btn_close)

        layout.addLayout(close_layout)

    def load_config(self):
        cfg = self.db.get_config("backup_config")
        if cfg:
            self.cb_auto.setChecked(cfg.get("auto_backup", False))
            self.path_edit.setText(cfg.get("backup_path", ""))

    def save_config(self):
        self.db.save_config("backup_config", {
            "auto_backup": self.cb_auto.isChecked(),
            "backup_path": self.path_edit.text()
        })

    def select_path(self):
        from PySide6.QtWidgets import QFileDialog
        d = QFileDialog.getExistingDirectory(self, _("Wybierz folder"))
        if d: self.path_edit.setText(d); self.save_config()

    def create_now(self):
        from PySide6.QtWidgets import QApplication, QMessageBox
        self.save_config()

        pd = ProcessingDialog(self, _("Kopia zapasowa"), _("Trwa tworzenie kopii..."))
        pd.pbar.setRange(0, 100)
        pd.pbar.setValue(0)
        pd.show()

        def update_pbar(val):
            pd.pbar.setValue(val)
            QApplication.processEvents()

        success, msg = self.db.perform_backup(progress_callback=update_pbar)
        pd.close()

        if success:
            QMessageBox.information(self, _("Sukces"), _("Utworzono kopię zapasową w:\n{}").format(msg))
        else:
            QMessageBox.warning(self, _("Błąd"), msg)

    def restore_now(self):
        import sys
        import os
        from PySide6.QtWidgets import QFileDialog, QMessageBox, QApplication

        path = self.path_edit.text()
        #f, _ext = QFileDialog.getOpenFileName(self, _("Wybierz plik"), path, "Backup (*.bak)")
        # W metodzie restore_now zmień linijkę filtru:
        f, _ext = QFileDialog.getOpenFileName(self, _("Wybierz plik"), path, "Backup (*.zip)")

        if f and QMessageBox.Yes == QMessageBox.question(
            self, _("Potwierdź"), _("Przywrócenie nadpisze obecne dane. Kontynuować?")
        ):
            pd = ProcessingDialog(self, _("Przywracanie"), _("Trwa przywracanie bazy danych..."))
            pd.pbar.setRange(0, 100)
            pd.pbar.setValue(0)
            pd.show()

            def update_pbar(val):
                pd.pbar.setValue(val)
                QApplication.processEvents()

            if self.db.restore_database(f, progress_callback=update_pbar):
                pd.close()
                QMessageBox.information(
                    self, _("Sukces"),
                    _("Baza danych została przywrócona.\nAplikacja zostanie teraz uruchomiona ponownie.")
                )
                python = sys.executable
                os.execl(python, python, *sys.argv)
            else:
                pd.close()
                QMessageBox.critical(self, _("Błąd"), _("Nie udało się przywrócić bazy danych."))

    def closeEvent(self, e):
        self.save_config()
        e.accept()

class WeeklyLimitDialog(QDialog):
    def __init__(self, parent=None, db_manager=None, target_monday_date=None):
        super().__init__(parent)
        self.db = db_manager
        self.target_date = target_monday_date
        if not self.target_date:
            from datetime import datetime, timedelta
            today = datetime.now().date()
            monday = today - timedelta(days=today.weekday())
            self.target_date = monday.strftime("%Y-%m-%d")

        self.setWindowTitle(_("Ustawienia Limitu Tygodniowego"))
        self.resize(420, 550)
        layout = QVBoxLayout(self)
        self.cb_enabled = QCheckBox(_("Włącz system budżetu tygodniowego"))
        self.cb_enabled.toggled.connect(self.toggle_inputs)
        layout.addWidget(self.cb_enabled)
        line = QFrame(); line.setFrameShape(QFrame.HLine); line.setFrameShadow(QFrame.Sunken)
        layout.addWidget(line)
        self.settings_container = QWidget()
        self.settings_layout = QVBoxLayout(self.settings_container)
        self.settings_layout.setContentsMargins(0,0,0,0)
        self.lbl_info = QLabel(_("Edycja dla tygodnia od: <b>{}</b>").format(self.target_date))
        self.lbl_info.setTextFormat(Qt.RichText)
        self.settings_layout.addWidget(self.lbl_info)
        form_layout = QFormLayout()
        self.amount_edit = QLineEdit()
        self.amount_edit.setPlaceholderText("np. 500")

        # --- DODANY WALIDATOR (BLOKADA TEKSTU) ---
        from PySide6.QtCore import QRegularExpression
        from PySide6.QtGui import QRegularExpressionValidator
        self.amount_edit.setValidator(QRegularExpressionValidator(QRegularExpression(r"[0-9.,]*"), self))
        # ----------------------------------------

        form_layout.addRow(_("Kwota (PLN):"), self.amount_edit)
        self.settings_layout.addLayout(form_layout)
        self.settings_layout.addWidget(QLabel(_("Wybierz kategorie wliczane do limitu:")))
        self.cat_list = QListWidget()
        self.cat_list.setSelectionMode(QAbstractItemView.NoSelection)
        self.settings_layout.addWidget(self.cat_list)
        h_btns = QHBoxLayout()
        btn_all = QPushButton(_("Zaznacz wszystkie"))
        btn_all.clicked.connect(self.select_all)
        btn_none = QPushButton(_("Odznacz wszystkie"))
        btn_none.clicked.connect(self.deselect_all)
        h_btns.addWidget(btn_all); h_btns.addWidget(btn_none)
        self.settings_layout.addLayout(h_btns)
        layout.addWidget(self.settings_container)
        btns = QDialogButtonBox(QDialogButtonBox.Save | QDialogButtonBox.Cancel)
        btns.accepted.connect(self.save_and_close)
        btns.rejected.connect(self.reject)
        layout.addWidget(btns)
        self.load_settings()

    def toggle_inputs(self, checked): self.settings_container.setEnabled(checked)

    def load_settings(self):
        is_system_enabled = self.db.is_weekly_system_enabled()
        self.cb_enabled.setChecked(is_system_enabled)
        found, amount, saved_cats = self.db.get_weekly_limit_for_week(self.target_date)
        global_cfg = self.db.get_config("weekly_limit_config")
        global_active_cats = global_cfg.get("categories", []) if global_cfg else []
        if not found:
            amount = 0.0
            saved_cats = global_active_cats
        self.amount_edit.setText(str(amount))
        all_cats = self.db.get_categories()
        self.cat_list.clear()
        for cat in all_cats:
            item = QListWidgetItem(cat)
            item.setFlags(item.flags() | Qt.ItemIsUserCheckable)
            if cat in saved_cats or cat in global_active_cats: item.setCheckState(Qt.Checked)
            else: item.setCheckState(Qt.Unchecked)
            self.cat_list.addItem(item)
        self.toggle_inputs(is_system_enabled)

    def select_all(self):
        for i in range(self.cat_list.count()): self.cat_list.item(i).setCheckState(Qt.Checked)

    def deselect_all(self):
        for i in range(self.cat_list.count()): self.cat_list.item(i).setCheckState(Qt.Unchecked)

    def save_and_close(self):
        enabled = self.cb_enabled.isChecked()
        self.db.set_weekly_system_enabled(enabled)
        if enabled:
            try: amt = float(self.amount_edit.text().replace(",", "."))
            except ValueError: amt = 0.0
            selected_cats = []
            for i in range(self.cat_list.count()):
                item = self.cat_list.item(i)
                if item.checkState() == Qt.Checked: selected_cats.append(item.text())
            self.db.set_weekly_limit_for_week(self.target_date, amt, selected_cats)
        self.accept()

class IncomeDialog(QDialog):
    def __init__(self, parent=None, db_manager=None):
        super().__init__(parent)
        self.db = db_manager
        self.setWindowTitle(_("Dodaj Przychód"))
        self.resize(400, 350) # Lekko zwiększona wysokość na nowe pole

        l = QFormLayout(self)
        self.date = QDateEdit(QDate.currentDate())
        self.date.setCalendarPopup(True)

        # --- NOWE: Wybór Konta ---
        self.account_combo = QComboBox()
        # Pobieramy konta z bazy: id jest danymi ukrytymi (UserData), nazwa widoczną
        for acc_id, name, bal, unused_color in self.db.get_accounts():
            self.account_combo.addItem(name, acc_id)
        # -------------------------

        self.person = QComboBox()
        self.person.setEditable(True)
        self.person.addItems(self.db.get_people())

        self.src = QLineEdit()
        self.src.setPlaceholderText(_("np. Wypłata, Sprzedaż, Zwrot..."))
        self.src.setText(_("Wpływ"))

        self.amt = QLineEdit()
        self.amt.setPlaceholderText("0.00")

        # --- DODANY WALIDATOR (BLOKADA TEKSTU) ---
        from PySide6.QtCore import QRegularExpression
        from PySide6.QtGui import QRegularExpressionValidator
        self.amt.setValidator(QRegularExpressionValidator(QRegularExpression(r"[0-9.,]*"), self))
        # ----------------------------------------

        # --- NOWE: Pole Szczegóły ---
        from PySide6.QtWidgets import QTextEdit
        self.details = QTextEdit()
        self.details.setPlaceholderText(_("Dodatkowy opis (opcjonalnie)..."))
        self.details.setMaximumHeight(60)

        # --- Sekcja Załącznika ---
        self.attachment_data = None
        self.btn_attach = QPushButton(_("📎 Załącznik"))
        self.btn_attach.setStyleSheet("""
            QPushButton {
                border: 1px solid #95a5a6; border-radius: 6px; padding: 3px;
                font-size: 11px; min-height: 22px;
            }
            QPushButton[attached="true"] {
                background-color: #2ecc71; color: white; border-color: #27ae60;
            }
        """)
        self.btn_attach.clicked.connect(self.select_attachment)

        # --- STYLIZACJA PRZYCISKÓW GŁÓWNYCH ---
        from PySide6.QtWidgets import QDialogButtonBox
        bb = QDialogButtonBox(QDialogButtonBox.Save | QDialogButtonBox.Cancel)
        btn_save = bb.button(QDialogButtonBox.Save)
        btn_cancel = bb.button(QDialogButtonBox.Cancel)

        base_style = """
            QPushButton {
                font-size: 12px; font-weight: bold; padding: 2px 15px; border-radius: 6px;
                border: 2px solid; background-color: transparent; min-height: 22px; max-height: 22px;
            }
        """

        btn_save.setText(_("Zapisz"))
        btn_save.setStyleSheet(base_style + """
            QPushButton { color: #27ae60; border-color: #2ecc71; }
            QPushButton:hover { background-color: #27ae60; color: #ffffff; }
        """)

        btn_cancel.setText(_("Anuluj"))
        btn_cancel.setStyleSheet(base_style + """
            QPushButton { color: #7f8c8d; border-color: #95a5a6; }
            QPushButton:hover { background-color: #7f8c8d; color: #ffffff; }
        """)

        bb.accepted.connect(self.accept)
        bb.rejected.connect(self.reject)

        # --- UKŁAD FORMULARZA ---
        l.addRow(_("Data:"), self.date)
        l.addRow(_("Wpływa na:"), self.account_combo) # <-- DODANE
        l.addRow(_("Osoba:"), self.person)
        l.addRow(_("Źródło:"), self.src)
        l.addRow(_("Kwota:"), self.amt)
        l.addRow(_("Szczegóły:"), self.details)
        l.addRow(_("Dokument:"), self.btn_attach)
        l.addRow(bb)

    def select_attachment(self):
        from PySide6.QtWidgets import QFileDialog
        from config import _

        path, file_ext = QFileDialog.getOpenFileName(
            self,
            _("Wybierz potwierdzenie"),
            "",
            "Pliki (*.jpg *.png *.pdf)"
        )

        if path:
            try:
                with open(path, "rb") as f:
                    self.attachment_data = f.read()

                self.btn_attach.setText(_("✅ Załączono"))
                self.btn_attach.setProperty("attached", True)
                self.btn_attach.style().unpolish(self.btn_attach)
                self.btn_attach.style().polish(self.btn_attach)
            except Exception as e:
                print(f"Błąd czytania pliku: {e}")

    def get_data(self):
        try:
            val = float(self.amt.text().replace(",", "."))
        except ValueError:
            val = 0.0

        return {
            "date": self.date.date().toString("yyyy-MM-dd"),
            "type": "income",
            "cat": self.person.currentText(),
            "sub": self.src.text(),
            "amount": val,
            "details": self.details.toPlainText().strip(),
            "attachment": self.attachment_data,
            "account_id": self.account_combo.currentData() # <-- DODANE (ID konta)
        }

class AddExpenseDialog(QDialog):
    def __init__(self, parent=None, db_manager=None):
        super().__init__(parent)
        self.db = db_manager
        self.setWindowTitle(_("Dodaj Wydatek"))
        self.resize(450, 460) # Lekko zwiększona wysokość pod nowe pole konta

        l = QFormLayout(self)

        self.date = QDateEdit(QDate.currentDate())
        self.date.setCalendarPopup(True)

        # --- NOWE: Wybór Konta ---
        self.account_combo = QComboBox()
        for acc_id, name, bal, acc_color in self.db.get_accounts():
            self.account_combo.addItem(name, acc_id)
        # -------------------------

        h = QHBoxLayout()
        self.cat = QComboBox()
        self.cat.addItems(self.db.get_categories())

        small_btn_style = """
            QPushButton {
                font-size: 14px; font-weight: bold; border-radius: 4px;
                border: 1px solid palette(mid); background-color: transparent;
                color: palette(text); min-width: 26px; max-width: 26px;
                min-height: 26px; max-height: 26px;
            }
            QPushButton:hover { background-color: palette(mid); }
        """

        b1 = QPushButton("+"); b1.setStyleSheet(small_btn_style); b1.clicked.connect(self.add_c)
        b2 = QPushButton("-"); b2.setStyleSheet(small_btn_style); b2.clicked.connect(self.del_c)

        h.addWidget(self.cat); h.addWidget(b1); h.addWidget(b2)

        self.desc = QLineEdit()
        self.desc.setPlaceholderText(_("Gdzie? (np. Biedronka, Orlen)"))

        # --- ZMIANA: Pole Szczegóły jako QTextEdit ---
        self.details = QTextEdit()
        self.details.setPlaceholderText(_("Co kupiono? (każda rzecz w nowej linii...)"))
        self.details.setFixedHeight(80)
        self.details.setTabChangesFocus(True)
        # --------------------------------------------

        self.amt = QLineEdit()
        self.amt.setPlaceholderText("0.00")

        # --- DODANY WALIDATOR (BLOKADA TEKSTU) ---
        from PySide6.QtCore import QRegularExpression
        from PySide6.QtGui import QRegularExpressionValidator
        self.amt.setValidator(QRegularExpressionValidator(QRegularExpression(r"[0-9.,]*"), self))
        # ----------------------------------------

        self.cb_exclude = QCheckBox(_("Pomiń w limicie tygodniowym"))

        self.attachment_data = None
        self.btn_attach = QPushButton(_("📎 Załącznik"))
        self.btn_attach.setStyleSheet("""
            QPushButton { border: 1px solid #95a5a6; border-radius: 6px; padding: 3px; font-size: 11px; min-height: 22px; }
            QPushButton[attached="true"] { background-color: #2ecc71; color: white; border-color: #27ae60; }
        """)
        self.btn_attach.clicked.connect(self.select_attachment)

        bb = QDialogButtonBox(QDialogButtonBox.Save | QDialogButtonBox.Cancel)
        btn_save = bb.button(QDialogButtonBox.Save)
        btn_cancel = bb.button(QDialogButtonBox.Cancel)

        main_btn_base = "QPushButton { font-size: 12px; font-weight: bold; padding: 2px 15px; border-radius: 6px; border: 2px solid; background-color: transparent; min-height: 22px; max-height: 22px; }"
        btn_save.setText(_("Zapisz Wydatek")); btn_save.setStyleSheet(main_btn_base + "QPushButton { color: #c0392b; border-color: #e74c3c; } QPushButton:hover { background-color: #c0392b; color: #ffffff; }")
        btn_cancel.setText(_("Anuluj")); btn_cancel.setStyleSheet(main_btn_base + "QPushButton { color: #7f8c8d; border-color: #95a5a6; } QPushButton:hover { background-color: #7f8c8d; color: #ffffff; }")

        bb.accepted.connect(self.accept)
        bb.rejected.connect(self.reject)

        l.addRow(_("Data:"), self.date)
        l.addRow(_("Płacę z:"), self.account_combo) # <-- DODANE
        l.addRow(_("Kategoria:"), h)
        l.addRow(_("Opis (Sklep):"), self.desc)
        l.addRow(_("Szczegóły:"), self.details)
        l.addRow(_("Dokument:"), self.btn_attach)
        l.addRow(_("Kwota:"), self.amt)
        l.addRow("", self.cb_exclude)
        l.addRow(bb)

    def select_attachment(self):
        from PySide6.QtWidgets import QFileDialog
        from config import _
        path, file_ext = QFileDialog.getOpenFileName(
            self,
            _("Wybierz potwierdzenie"),
            "",
            "Pliki (*.jpg *.png *.pdf)"
        )
        if path:
            try:
                with open(path, "rb") as f:
                    self.attachment_data = f.read()
                self.btn_attach.setText(_("✅ Załączono"))
                self.btn_attach.setProperty("attached", True)
                self.btn_attach.style().unpolish(self.btn_attach)
                self.btn_attach.style().polish(self.btn_attach)
            except Exception as e:
                print(f"Błąd czytania pliku: {e}")

    def add_c(self):
        from PySide6.QtWidgets import QInputDialog
        t, ok = QInputDialog.getText(self, _("Nowa Kategoria"), _("Nazwa:"))
        if ok and t:
            self.db.add_category(t)
            self.cat.clear(); self.cat.addItems(self.db.get_categories()); self.cat.setCurrentText(t)

    def del_c(self):
        from PySide6.QtWidgets import QMessageBox
        c = self.cat.currentText()
        if c and c != _("Inne") and QMessageBox.Yes == QMessageBox.question(self, _("Usuń"), _("Usunąć kategorię '{}'?").format(c)):
            self.db.delete_category_safe(c); self.cat.clear(); self.cat.addItems(self.db.get_categories()); self.cat.setCurrentText("Inne")

    def get_data(self):
        try: val = float(self.amt.text().replace(",", "."))
        except ValueError: val = 0.0
        return {
            "date": self.date.date().toString("yyyy-MM-dd"),
            "type": "expense",
            "cat": self.cat.currentText(),
            "sub": self.desc.text(),
            "details": self.details.toPlainText(),
            "amount": val,
            "exclude": 1 if self.cb_exclude.isChecked() else 0,
            "attachment": self.attachment_data,
            "account_id": self.account_combo.currentData() # <-- DODANE
        }

class AddGoalDialog(QDialog):
    def __init__(self, parent=None, db_manager=None):
        from PySide6.QtWidgets import QSpacerItem, QSizePolicy
        super().__init__(parent)
        self.db = db_manager
        self.setWindowTitle(_("Nowy Cel"))
        self.resize(350, 250)
        l = QFormLayout(self)

        # --- DEFINICJA STYLI ---
        base_style = """
            QPushButton {
                font-size: 12px; font-weight: bold; padding: 6px 15px;
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

        self.n = QLineEdit()
        self.n.setStyleSheet("padding: 4px;")

        # --- Wybór Konta ---
        self.account_combo = QComboBox()
        for acc_id, name, bal, acc_color in self.db.get_accounts():
            self.account_combo.addItem(name, acc_id)

        self.t = QLineEdit()
        self.t.setPlaceholderText("0.00")
        self.t.setStyleSheet("padding: 4px;")

        # Walidator kwoty
        from PySide6.QtCore import QRegularExpression
        from PySide6.QtGui import QRegularExpressionValidator
        self.t.setValidator(QRegularExpressionValidator(QRegularExpression(r"[0-9.,]*"), self))

        # --- PRZYCISKI (Ręczna stylizacja ButtonBox) ---
        self.bb = QDialogButtonBox(QDialogButtonBox.Save | QDialogButtonBox.Cancel)
        self.bb.accepted.connect(self.accept)
        self.bb.rejected.connect(self.reject)

        # Wyciągamy przyciski i nadajemy style
        btn_save = self.bb.button(QDialogButtonBox.Save)
        if btn_save:
            btn_save.setText(_("ZAPISZ"))
            btn_save.setStyleSheet(inc_style)

        btn_cancel = self.bb.button(QDialogButtonBox.Cancel)
        if btn_cancel:
            btn_cancel.setText(_("ANULUJ"))
            btn_cancel.setStyleSheet(exp_style)

        # Układanie w formularzu
        l.addRow(_("Nazwa celu:"), self.n)
        l.addRow(_("Domyślne konto:"), self.account_combo)
        l.addRow(_("Kwota celu (PLN):"), self.t)
        l.addItem(QSpacerItem(20, 10, QSizePolicy.Minimum, QSizePolicy.Expanding)) # Odstęp
        l.addRow(self.bb)

    def accept(self):
        from PySide6.QtWidgets import QMessageBox
        name = self.n.text().strip()
        if not name:
            QMessageBox.warning(self, _("Błąd"), _("Proszę podać nazwę celu!"))
            return

        amount_raw = self.t.text().strip()
        if not amount_raw:
            QMessageBox.warning(self, _("Błąd"), _("Proszę podać kwotę celu!"))
            return

        QMessageBox.information(self, _("Sukces"), _("Cel '{}' został utworzony!").format(name))
        super().accept()

    def get_data(self):
        try:
            val = float(self.t.text().replace(",", "."))
        except ValueError:
            val = 0.0
        return self.n.text().strip(), val, self.account_combo.currentData()

class SavingsTransferDialog(QDialog):
    def __init__(self, parent, db):
        super().__init__(parent)
        self.db = db
        self.setWindowTitle(_("Transfer oszczędności"))
        self.setFixedWidth(380)
        layout = QVBoxLayout(self)

        # --- DEFINICJA STYLI (Spójna z Ustawieniami) ---
        base_style = """
            QPushButton {
                font-size: 12px; font-weight: bold; padding: 6px 15px;
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

        # --- UKŁAD FORMULARZA ---
        # Z KONTA
        layout.addWidget(QLabel(_("Transfer z konta:")))
        self.from_acc = QComboBox()
        layout.addWidget(self.from_acc)

        # NA KONTO
        layout.addWidget(QLabel(_("Transfer na konto:")))
        self.to_acc = QComboBox()
        layout.addWidget(self.to_acc)

        # Wypełnianie kont
        accounts = self.db.get_accounts()
        for acc_id, name, bal, acc_color in accounts:
            self.from_acc.addItem(name, acc_id)
            self.to_acc.addItem(name, acc_id)

        # CEL
        layout.addWidget(QLabel(_("Cel oszczędności:")))
        self.goal_input = QComboBox()

        # --- KLUCZOWA POPRAWKA ---
        # Zamiast brać wszystko z transakcji (gdzie są teraz opisy Wpłata/Wypłata),
        # bierzemy czystą listę z tabeli celów i dodajemy domyślne "Oszczędności"
        from config import CASH_SAVINGS_NAME

        # Pobieramy cele z bazy (używamy Twojej metody get_goals, która już to robi)
        goals = [CASH_SAVINGS_NAME] + self.db.get_goals()

        self.goal_input.addItems(goals)
        layout.addWidget(self.goal_input)

        # KWOTA
        layout.addWidget(QLabel(_("Kwota transferu:")))
        self.amount_input = QLineEdit()
        self.amount_input.setPlaceholderText("0.00")
        # Dodajmy styl dla LineEdit, żeby pasował do reszty
        self.amount_input.setStyleSheet("padding: 5px; border: 1px solid #ccc; border-radius: 4px;")
        layout.addWidget(self.amount_input)

        layout.addSpacing(10) # Trochę oddechu przed przyciskami

        # --- PRZYCISKI ---
        btns = QHBoxLayout()

        btn_ok = QPushButton(_("PRZENIEŚ"))
        btn_ok.setStyleSheet(inc_style)
        btn_ok.clicked.connect(self.accept)

        btn_cancel = QPushButton(_("ANULUJ"))
        btn_cancel.setStyleSheet(exp_style)
        btn_cancel.clicked.connect(self.reject)

        btns.addWidget(btn_ok)
        btns.addWidget(btn_cancel)
        layout.addLayout(btns)

    def get_data(self):
        try:
            amt = float(self.amount_input.text().replace(',', '.'))
        except ValueError:
            amt = 0.0
        return {
            "from_id": self.from_acc.currentData(),
            "to_id": self.to_acc.currentData(),
            "goal": self.goal_input.currentText(),
            "amount": amt
        }

class AddSavingsDialog(QDialog):
    def __init__(self, parent=None, db_manager=None):
        super().__init__(parent)
        self.db = db_manager
        self.setWindowTitle(_("Oszczędności"))
        self.resize(450, 400)

        l = QFormLayout(self)

        # Wybór kierunku
        self.rd = QRadioButton(_("Wpłacam na oszczędności"))
        self.rw = QRadioButton(_("Wypłacam z oszczędności"))
        self.rd.setChecked(True)
        h_dir = QHBoxLayout()
        h_dir.addWidget(self.rd)
        h_dir.addWidget(self.rw)

        # Podpięcie dynamicznej zmiany etykiet
        self.rd.toggled.connect(self.update_labels)

        self.date = QDateEdit(QDate.currentDate())
        self.date.setCalendarPopup(True)

        # --- KONTA BANKOWE ---
        # Konto 1: Z którego schodzi kasa / Na które wraca
        self.lbl_wallet_acc = QLabel(_("Z konta (Portfel):"))
        self.wallet_account_combo = QComboBox()

        # Konto 2: Na którym "siedzą" oszczędności
        self.lbl_savings_acc = QLabel(_("Na konto (Oszczędności):"))
        self.savings_account_combo = QComboBox()

        accounts = self.db.get_accounts()
        for acc_id, name, bal, acc_color in accounts:
            self.wallet_account_combo.addItem(name, acc_id)
            self.savings_account_combo.addItem(name, acc_id)

        # --- CEL OSZCZĘDNOŚCIOWY ---
        h_goal = QHBoxLayout()
        self.g = QComboBox()
        self.g.addItem(CASH_SAVINGS_NAME)
        self.g.addItems(self.db.get_goals())

        small_btn_style = """
            QPushButton {
                font-size: 14px; font-weight: bold; border-radius: 4px;
                border: 1px solid palette(mid); background-color: transparent;
                color: palette(text); min-width: 26px; max-width: 26px;
                min-height: 26px; max-height: 26px;
            }
            QPushButton:hover { background-color: palette(mid); }
        """

        btn_add_goal = QPushButton("+")
        btn_add_goal.setStyleSheet(small_btn_style)
        btn_add_goal.clicked.connect(self.add_g)

        btn_transfer = QPushButton("⇄")
        btn_transfer.setToolTip(_("Migracja oszczędności między kontami"))
        btn_transfer.setStyleSheet(small_btn_style)
        btn_transfer.clicked.connect(self.migrate_savings)

        h_goal.addWidget(self.g)
        h_goal.addWidget(btn_add_goal)
        h_goal.addWidget(btn_transfer)

        self.amt = QLineEdit()
        self.amt.setPlaceholderText("0.00")
        from PySide6.QtCore import QRegularExpression
        from PySide6.QtGui import QRegularExpressionValidator
        self.amt.setValidator(QRegularExpressionValidator(QRegularExpression(r"[0-9.,]*"), self))

        self.details = QTextEdit()
        self.details.setPlaceholderText(_("Dodatkowy opis (opcjonalnie)..."))
        self.details.setMaximumHeight(60)

        self.attachment_data = None
        self.btn_attach = QPushButton(_("📎 Załącznik"))
        self.btn_attach.setStyleSheet("""
            QPushButton { border: 1px solid #95a5a6; border-radius: 6px; padding: 3px; font-size: 11px; min-height: 22px; }
            QPushButton[attached="true"] { background-color: #2ecc71; color: white; border-color: #27ae60; }
        """)
        self.btn_attach.clicked.connect(self.select_attachment)

        bb = QDialogButtonBox(QDialogButtonBox.Save | QDialogButtonBox.Cancel)
        btn_save = bb.button(QDialogButtonBox.Save)
        btn_cancel = bb.button(QDialogButtonBox.Cancel)

        main_btn_base = "QPushButton { font-size: 12px; font-weight: bold; padding: 2px 15px; border-radius: 6px; border: 2px solid; background-color: transparent; min-height: 22px; }"
        btn_save.setText(_("Zatwierdź"))
        btn_save.setStyleSheet(main_btn_base + "QPushButton { color: #2980b9; border-color: #3498db; } QPushButton:hover { background-color: #2980b9; color: white; }")
        btn_cancel.setText(_("Anuluj"))
        btn_cancel.setStyleSheet(main_btn_base + "QPushButton { color: #7f8c8d; border-color: #95a5a6; } QPushButton:hover { background-color: #7f8c8d; color: white; }")

        bb.accepted.connect(self.accept)
        bb.rejected.connect(self.reject)

        # Dodawanie wierszy do formularza
        l.addRow(_("Operacja:"), h_dir)
        l.addRow(_("Data:"), self.date)
        l.addRow(self.lbl_wallet_acc, self.wallet_account_combo)
        l.addRow(self.lbl_savings_acc, self.savings_account_combo)
        l.addRow(_("Cel (oszczędność):"), h_goal)
        l.addRow(_("Kwota:"), self.amt)
        l.addRow(_("Szczegóły:"), self.details)
        l.addRow(_("Dokument:"), self.btn_attach)
        l.addRow(bb)

    def update_labels(self):
        """Aktualizuje etykiety, by było jasne co skąd wychodzi."""
        if self.rd.isChecked():
            self.lbl_wallet_acc.setText(_("Z konta (Portfel):"))
            self.lbl_savings_acc.setText(_("Na konto (Oszczędności):"))
        else:
            self.lbl_wallet_acc.setText(_("Na konto (Portfel):"))
            self.lbl_savings_acc.setText(_("Z konta (Oszczędności):"))

    def select_attachment(self):
        from PySide6.QtWidgets import QFileDialog
        path, _ = QFileDialog.getOpenFileName(self, _("Wybierz potwierdzenie"), "", "Pliki (*.jpg *.png *.pdf)")
        if path:
            try:
                with open(path, "rb") as f: self.attachment_data = f.read()
                self.btn_attach.setText(_("✅ Załączono"))
                self.btn_attach.setProperty("attached", True)
                self.btn_attach.style().unpolish(self.btn_attach)
                self.btn_attach.style().polish(self.btn_attach)
            except Exception as e: print(f"Błąd pliku: {e}")

    def add_g(self):
        from dialogs import AddGoalDialog
        d = AddGoalDialog(self, self.db)
        if d.exec():
            self.db.add_goal(*d.get_data())
            cur = self.g.currentText()
            self.g.clear()
            self.g.addItem(CASH_SAVINGS_NAME)
            self.g.addItems(self.db.get_goals())
            self.g.setCurrentText(cur)

    def migrate_savings(self):
        from dialogs import SavingsTransferDialog
        d = SavingsTransferDialog(self, self.db)
        cur = self.g.currentText()
        idx = d.goal_input.findText(cur)
        if idx >= 0: d.goal_input.setCurrentIndex(idx)
        if d.exec():
            data = d.get_data()
            if data['from_id'] == data['to_id']: return
            if self.db.transfer_savings(data['from_id'], data['to_id'], data['amount'], data['goal']):
                self.accept()

    def get_data(self):
        try: val = float(self.amt.text().replace(",", "."))
        except ValueError: val = 0.0

        wallet_name = self.wallet_account_combo.currentText()
        savings_name = self.savings_account_combo.currentText()
        goal_name = self.g.currentText()
        user_details = self.details.toPlainText().strip()

        if self.rw.isChecked(): # WYPŁACAM
            val = -val
            display_type = _("Wypłata: {}").format(goal_name)
            # Info: Z konta oszczędnościowego X na konto portfela Y
            prefix = _("Pobrano z oszczędności na {}. Przestano na: {}").format(savings_name, wallet_name)
        else: # WPŁACAM
            display_type = _("Wpłata: {}").format(goal_name)
            # Info: Z portfela X na oszczędności na koncie Y
            prefix = _("Wpłacono z konta: {}. Odłożono na: {}").format(wallet_name, savings_name)

        final_details = f"{prefix}. {user_details}".strip(". ")

        # Zwracamy savings_account_combo, bo to tam fizycznie "lądują" oszczędności w rejestrze
        return {
            "date": self.date.date().toString("yyyy-MM-dd"),
            "type": "savings",
            "cat": _("Oszczędności"),
            "sub": display_type,
            "amount": val,
            "details": final_details,
            "attachment": self.attachment_data,
            "account_id": self.savings_account_combo.currentData()
        }

class TransferDialog(QDialog):
    def __init__(self, parent=None, db_manager=None):
        super().__init__(parent)
        self.db = db_manager # Zachowujemy db_manager
        self.setWindowTitle(_("Transfer"))
        self.resize(350, 250) # Zwiększona wysokość na pole konta
        l=QFormLayout(self)

        # --- NOWE: Wybór Konta (na którym koncie robimy przesunięcie celów) ---
        self.account_combo = QComboBox()
        for acc_id, name, bal, acc_color in self.db.get_accounts():
            self.account_combo.addItem(name, acc_id)
        # ---------------------------------------------------------------------

        self.cf=QComboBox()
        self.ct=QComboBox()
        from config import CASH_SAVINGS_NAME # Upewnij się, że masz import
        i=[CASH_SAVINGS_NAME] + self.db.get_goals()
        self.cf.addItems(i)
        self.ct.addItems(i)
        self.amt=QLineEdit()

        # --- DODANY WALIDATOR (BLOKADA TEKSTU) ---
        from PySide6.QtCore import QRegularExpression
        from PySide6.QtGui import QRegularExpressionValidator
        self.amt.setValidator(QRegularExpressionValidator(QRegularExpression(r"[0-9.,]*"), self))
        # ----------------------------------------

        bb=QDialogButtonBox(QDialogButtonBox.Ok|QDialogButtonBox.Cancel)
        bb.accepted.connect(self.accept)
        bb.rejected.connect(self.reject)

        l.addRow(_("Konto bankowe:"), self.account_combo) # <-- DODANE
        l.addRow(_("Z (cel):"), self.cf)
        l.addRow(_("Do (cel):"), self.ct)
        l.addRow(_("Kwota:"), self.amt)
        l.addRow(bb)

    def get_data(self):
        # Pobieranie danych z wymianą separatora dla float()
        try:
            amt_val = float(self.amt.text().replace(",", "."))
        except ValueError:
            amt_val = 0.0

        # Zwracamy: Źródło, Cel, Kwota, ID Konta
        return self.cf.currentText(), self.ct.currentText(), amt_val, self.account_combo.currentData()

class LiabilitiesDialog(QDialog):
    def __init__(self, parent=None, db_manager=None):
        super().__init__(parent)
        self.db = db_manager
        self.setWindowTitle(_("Zarządzaj Długami"))
        self.resize(450, 400) # Zwiększona wysokość na nowe pole
        self.layout = QVBoxLayout(self)

        # Selektor trybu (RadioButtons)
        self.tabs = QButtonGroup(self)
        self.rb_new = QRadioButton(_("Nowe Zobowiązanie"))
        self.rb_pay = QRadioButton(_("Spłata (Oddaję)"))
        self.rb_new.setChecked(True)
        self.tabs.addButton(self.rb_new)
        self.tabs.addButton(self.rb_pay)
        self.rb_new.toggled.connect(self.toggle_mode)

        h_tabs = QHBoxLayout()
        h_tabs.addWidget(self.rb_new)
        h_tabs.addWidget(self.rb_pay)
        self.layout.addLayout(h_tabs)

        # Formularz
        self.form_widget = QWidget()
        self.form_layout = QFormLayout(self.form_widget)
        self.layout.addWidget(self.form_widget)

        # --- NOWE: Wybór Konta ---
        self.lbl_acc = QLabel(_("Konto bankowe:"))
        self.account_combo = QComboBox()
        for acc_id, name, bal, acc_color in self.db.get_accounts():
            self.account_combo.addItem(name, acc_id)
        # -------------------------

        self.lbl_n = QLabel(_("Komu (Nazwa):"))
        self.n = QLineEdit()
        self.lbl_c = QLabel(_("Wybierz dług:"))
        self.c = QComboBox()
        self.a = QLineEdit()
        self.a.setPlaceholderText("0.00")

        # --- DODANY WALIDATOR (BLOKADA TEKSTU) ---
        from PySide6.QtCore import QRegularExpression
        from PySide6.QtGui import QRegularExpressionValidator
        self.a.setValidator(QRegularExpressionValidator(QRegularExpression(r"[0-9.,]*"), self))
        # ----------------------------------------

        self.d = QDateEdit(QDate.currentDate())
        self.d.setCalendarPopup(True)
        self.lbl_deadline = QLabel(_("Termin zwrotu:"))

        # --- SEKCOJA ZAŁĄCZNIKA ---
        self.attachment_data = None
        self.btn_attach = QPushButton(_("📎 Załącznik"))
        self.btn_attach.setStyleSheet("""
            QPushButton { border: 1px solid #95a5a6; border-radius: 6px; padding: 3px; font-size: 11px; min-height: 22px; }
            QPushButton[attached="true"] { background-color: #2ecc71; color: white; border-color: #27ae60; }
        """)
        self.btn_attach.clicked.connect(self.select_attachment)

        # Układanie pól w formularzu
        self.form_layout.addRow(self.lbl_acc, self.account_combo) # <-- DODANE na górze
        self.form_layout.addRow(self.lbl_n, self.n)
        self.form_layout.addRow(self.lbl_c, self.c)
        self.form_layout.addRow(_("Kwota:"), self.a)
        self.form_layout.addRow(self.lbl_deadline, self.d)
        self.form_layout.addRow(_("Dokument:"), self.btn_attach)

        # --- STYLIZACJA PRZYCISKÓW GŁÓWNYCH ---
        self.buttons = QDialogButtonBox(QDialogButtonBox.Save | QDialogButtonBox.Cancel)
        btn_save = self.buttons.button(QDialogButtonBox.Save)
        btn_cancel = self.buttons.button(QDialogButtonBox.Cancel)

        main_btn_base = """
            QPushButton {
                font-size: 12px; font-weight: bold; padding: 2px 15px; border-radius: 6px;
                border: 2px solid; background-color: transparent; min-height: 22px; max-height: 22px;
            }
        """

        btn_save.setText(_("Zatwierdź"))
        btn_save.setStyleSheet(main_btn_base + """
            QPushButton { color: #d35400; border-color: #e67e22; }
            QPushButton:hover { background-color: #d35400; color: #ffffff; }
        """)

        btn_cancel.setText(_("Anuluj"))
        btn_cancel.setStyleSheet(main_btn_base + """
            QPushButton { color: #7f8c8d; border-color: #95a5a6; }
            QPushButton:hover { background-color: #7f8c8d; color: #ffffff; }
        """)

        self.buttons.accepted.connect(self.accept)
        self.buttons.rejected.connect(self.reject)
        self.layout.addWidget(self.buttons)

        self.toggle_mode()

    def select_attachment(self):
        from PySide6.QtWidgets import QFileDialog
        from config import _
        path, file_ext = QFileDialog.getOpenFileName(self, _("Wybierz potwierdzenie"), "", "Pliki (*.jpg *.png *.pdf)")
        if path:
            try:
                with open(path, "rb") as f:
                    self.attachment_data = f.read()
                self.btn_attach.setText(_("✅ Załączono"))
                self.btn_attach.setProperty("attached", True)
                self.btn_attach.style().unpolish(self.btn_attach)
                self.btn_attach.style().polish(self.btn_attach)
            except Exception as e:
                print(f"Błąd czytania pliku: {e}")

    def toggle_mode(self):
        is_new = self.rb_new.isChecked()
        self.lbl_n.setVisible(is_new)
        self.n.setVisible(is_new)
        self.lbl_c.setVisible(not is_new)
        self.c.setVisible(not is_new)

        if is_new:
            self.lbl_acc.setText(_("Pieniądze wpłynęły na:"))
            self.a.setPlaceholderText(_("Całkowita kwota do oddania"))
            self.lbl_deadline.setText(_("Termin zwrotu:"))
            self.d.setDate(QDate.currentDate().addMonths(1))
        else:
            self.lbl_acc.setText(_("Spłacam z konta:"))
            self.a.setPlaceholderText(_("Kwota wpłaty"))
            self.lbl_deadline.setText(_("Data wpłaty:"))
            self.d.setDate(QDate.currentDate())
            self.refresh_combo()

    def refresh_combo(self):
        self.c.clear()
        active_liabilities = self.db.get_active_liabilities_detailed()
        for l_id, name, remaining in active_liabilities:
            display_text = f"{name} (do spłaty: {remaining:.2f} zł)"
            self.c.addItem(display_text, l_id)

    def accept(self):
        from PySide6.QtWidgets import QMessageBox
        try:
            float(self.a.text().replace(",", "."))
        except ValueError:
            QMessageBox.warning(self, _("Błąd"), _("Podaj poprawną kwotę!")); return

        if self.rb_new.isChecked():
            if not self.n.text().strip():
                QMessageBox.warning(self, _("Błąd"), _("Podaj nazwę wierzyciela!")); return
        else:
            if self.c.count() == 0:
                QMessageBox.warning(self, _("Błąd"), _("Brak aktywnych długów do spłaty!")); return

        super().accept()

    def get_data(self):
        amt_str = self.a.text().replace(",", ".")
        amt = float(amt_str) if amt_str else 0.0

        if self.rb_new.isChecked():
            return {
                "mode": "new",
                "name": self.n.text().strip(),
                "amount": amt,
                "deadline": self.d.date().toString("yyyy-MM-dd"),
                "attachment": self.attachment_data,
                "account_id": self.account_combo.currentData() # <-- DODANE
            }
        else:
            return {
                "mode": "pay",
                "ref_id": self.c.currentData(),
                "name": self.c.currentText().split(" (")[0],
                "amount": amt,
                "date": self.d.date().toString("yyyy-MM-dd"),
                "attachment": self.attachment_data,
                "account_id": self.account_combo.currentData() # <-- DODANE
            }



class DebtorsDialog(QDialog):
    def __init__(self, parent=None, db_manager=None):
        super().__init__(parent)
        self.db = db_manager
        self.setWindowTitle(_("Zarządzaj Dłużnikami"))
        self.resize(450, 400) # Zwiększona wysokość na nowe pole
        self.layout = QVBoxLayout(self)

        # Selektor trybu
        self.tabs = QButtonGroup(self)
        self.rb_new = QRadioButton(_("Nowy Dłużnik (Pożyczam komuś)"))
        self.rb_pay = QRadioButton(_("Zwrot (Oddaje mi)"))
        self.rb_new.setChecked(True)
        self.tabs.addButton(self.rb_new)
        self.tabs.addButton(self.rb_pay)
        self.rb_new.toggled.connect(self.toggle_mode)

        h_tabs = QHBoxLayout()
        h_tabs.addWidget(self.rb_new)
        h_tabs.addWidget(self.rb_pay)
        self.layout.addLayout(h_tabs)

        # Formularz
        self.form_widget = QWidget()
        self.form_layout = QFormLayout(self.form_widget)
        self.layout.addWidget(self.form_widget)

        # --- NOWE: Wybór Konta ---
        self.lbl_acc = QLabel(_("Konto bankowe:"))
        self.account_combo = QComboBox()
        for acc_id, name, bal, acc_color in self.db.get_accounts():
            self.account_combo.addItem(name, acc_id)
        # -------------------------

        self.lbl_n = QLabel(_("Komu (Nazwa):"))
        self.n = QLineEdit()
        self.lbl_c = QLabel(_("Wybierz dłużnika:"))
        self.c = QComboBox()
        self.a = QLineEdit()
        self.a.setPlaceholderText("0.00")

        # --- DODANY WALIDATOR (BLOKADA TEKSTU) ---
        from PySide6.QtCore import QRegularExpression
        from PySide6.QtGui import QRegularExpressionValidator
        self.a.setValidator(QRegularExpressionValidator(QRegularExpression(r"[0-9.,]*"), self))
        # ----------------------------------------

        self.d = QDateEdit(QDate.currentDate())
        self.d.setCalendarPopup(True)
        self.lbl_deadline = QLabel(_("Planowany zwrot:"))

        # --- SEKCOJA ZAŁĄCZNIKA ---
        self.attachment_data = None
        self.btn_attach = QPushButton(_("📎 Załącznik"))
        self.btn_attach.setStyleSheet("""
            QPushButton { border: 1px solid #95a5a6; border-radius: 6px; padding: 3px; font-size: 11px; min-height: 22px; }
            QPushButton[attached="true"] { background-color: #2ecc71; color: white; border-color: #27ae60; }
        """)
        self.btn_attach.clicked.connect(self.select_attachment)

        # Układanie w formularzu
        self.form_layout.addRow(self.lbl_acc, self.account_combo) # <-- DODANE na górze
        self.form_layout.addRow(self.lbl_n, self.n)
        self.form_layout.addRow(self.lbl_c, self.c)
        self.form_layout.addRow(_("Kwota:"), self.a)
        self.form_layout.addRow(self.lbl_deadline, self.d)
        self.form_layout.addRow(_("Dokument:"), self.btn_attach)

        # --- STYLIZACJA PRZYCISKÓW GŁÓWNYCH ---
        self.buttons = QDialogButtonBox(QDialogButtonBox.Save | QDialogButtonBox.Cancel)
        btn_save = self.buttons.button(QDialogButtonBox.Save)
        btn_cancel = self.buttons.button(QDialogButtonBox.Cancel)

        main_btn_base = """
            QPushButton {
                font-size: 12px; font-weight: bold; padding: 2px 15px; border-radius: 6px;
                border: 2px solid; background-color: transparent; min-height: 22px; max-height: 22px;
            }
        """

        btn_save.setText(_("Zatwierdź"))
        btn_save.setStyleSheet(main_btn_base + """
            QPushButton { color: #d35400; border-color: #e67e22; }
            QPushButton:hover { background-color: #d35400; color: #ffffff; }
        """)

        btn_cancel.setText(_("Anuluj"))
        btn_cancel.setStyleSheet(main_btn_base + """
            QPushButton { color: #7f8c8d; border-color: #95a5a6; }
            QPushButton:hover { background-color: #7f8c8d; color: #ffffff; }
        """)

        self.buttons.accepted.connect(self.accept)
        self.buttons.rejected.connect(self.reject)
        self.layout.addWidget(self.buttons)

        self.toggle_mode()

    def select_attachment(self):
        from PySide6.QtWidgets import QFileDialog
        from config import _
        path, file_ext = QFileDialog.getOpenFileName(self, _("Wybierz potwierdzenie"), "", "Pliki (*.jpg *.png *.pdf)")
        if path:
            try:
                with open(path, "rb") as f:
                    self.attachment_data = f.read()
                self.btn_attach.setText(_("✅ Załączono"))
                self.btn_attach.setProperty("attached", True)
                self.btn_attach.style().unpolish(self.btn_attach)
                self.btn_attach.style().polish(self.btn_attach)
            except Exception as e:
                print(f"Błąd czytania pliku: {e}")

    def toggle_mode(self):
        is_new = self.rb_new.isChecked()
        self.lbl_n.setVisible(is_new)
        self.n.setVisible(is_new)
        self.lbl_c.setVisible(not is_new)
        self.c.setVisible(not is_new)

        if is_new:
            self.lbl_acc.setText(_("Płacę dłużnikowi z konta:"))
            self.a.setPlaceholderText(_("Ile pożyczasz"))
            self.lbl_deadline.setText(_("Planowany zwrot:"))
            self.d.setDate(QDate.currentDate().addMonths(1))
        else:
            self.lbl_acc.setText(_("Zwrot wpływa na konto:"))
            self.a.setPlaceholderText(_("Ile oddał"))
            self.lbl_deadline.setText(_("Data otrzymania zwrotu:"))
            self.d.setDate(QDate.currentDate())
            self.refresh_combo()

    def refresh_combo(self):
        self.c.clear()
        active_debtors = self.db.get_active_debtors_detailed()
        for d_id, name, remaining in active_debtors:
            display_text = f"{name} (zostało: {remaining:.2f} zł)"
            self.c.addItem(display_text, d_id)

    def accept(self):
        from PySide6.QtWidgets import QMessageBox
        try:
            val_str = self.a.text().replace(",", ".").strip()
            if not val_str: raise ValueError
            float(val_str)
        except ValueError:
            QMessageBox.warning(self, _("Błąd"), _("Podaj poprawną kwotę!")); return

        if self.rb_new.isChecked():
            if not self.n.text().strip():
                QMessageBox.warning(self, _("Błąd"), _("Podaj nazwę dłużnika!")); return
        else:
            if self.c.count() == 0:
                QMessageBox.warning(self, _("Błąd"), _("Brak aktywnych dłużników!")); return

        super().accept()

    def get_data(self):
        amt_str = self.a.text().replace(",", ".")
        amt = float(amt_str) if amt_str else 0.0

        if self.rb_new.isChecked():
            return {
                "mode": "new",
                "name": self.n.text().strip(),
                "amount": amt,
                "deadline": self.d.date().toString("yyyy-MM-dd"),
                "attachment": self.attachment_data,
                "account_id": self.account_combo.currentData() # <-- DODANE
            }
        else:
            selected_id = self.c.currentData()
            full_text = self.c.currentText()
            clean_name = full_text.split(" (")[0] if " (" in full_text else full_text

            return {
                "mode": "pay",
                "ref_id": selected_id,
                "name": clean_name,
                "amount": amt,
                "date": self.d.date().toString("yyyy-MM-dd"),
                "attachment": self.attachment_data,
                "account_id": self.account_combo.currentData() # <-- DODANE
            }

class FilterDialog(QDialog):
    def __init__(self, parent, cats, curr):
        super().__init__(parent)
        self.setWindowTitle(_("Filtr"))
        l=QVBoxLayout(self)
        self.c=QComboBox()
        self.c.addItem(_("--- Wszystkie ---"))
        self.c.addItems(sorted(cats))
        if curr: self.c.setCurrentText(curr)
        bb=QDialogButtonBox(QDialogButtonBox.Ok|QDialogButtonBox.Cancel)
        bb.accepted.connect(self.accept)
        bb.rejected.connect(self.reject)
        l.addWidget(QLabel(_("Kategoria:")))
        l.addWidget(self.c)
        l.addWidget(bb)
        self.selected_category=None

    def accept(self):
        t=self.c.currentText()
        self.selected_category = t if t != _("--- Wszystkie ---") else None
        super().accept()

class ReportSelectionDialog(QDialog):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle(_("Raport"))
        l=QVBoxLayout(self)
        self.rm=QRadioButton(_("Miesiąc"))
        self.ry=QRadioButton(_("Rok"))
        self.rm.setChecked(True)
        l.addWidget(self.rm); l.addWidget(self.ry)
        h=QHBoxLayout()
        self.cm=QComboBox()
        self.cm.addItems(MONTH_NAME)
        self.cy=QSpinBox()
        self.cy.setRange(2020, 2050)
        self.cy.setValue(QDate.currentDate().year())
        h.addWidget(self.cm); h.addWidget(self.cy)
        l.addLayout(h)
        bb=QDialogButtonBox(QDialogButtonBox.Ok|QDialogButtonBox.Cancel)
        bb.accepted.connect(self.accept)
        bb.rejected.connect(self.reject)
        l.addWidget(bb)
        self.selected_type="month"
        self.selected_month_str=""
        self.selected_year_str=""
        self.selected_month_name=""

    def accept(self):
        y=str(self.cy.value())
        self.selected_year_str=y
        if self.rm.isChecked():
            self.selected_type="month"
            idx=self.cm.currentIndex()+1
            self.selected_month_str=f"{y}-{idx:02d}"
            self.selected_month_name=self.cm.currentText()
        else: self.selected_type="year"
        super().accept()

class EditDialog(QDialog):
    def __init__(self, parent, data, db):
        super().__init__(parent)
        self.db = db
        self.setWindowTitle(_("Edycja transakcji"))
        self.resize(450, 480)  # Zwiększona wysokość na przycisk załącznika

        l = QFormLayout(self)

        # Dane wejściowe: tid=0, date=1, type=2, cat=3, sub=4, amount=5, details=6, has_file=7
        self.d = QDateEdit(QDate.fromString(data[1], "yyyy-MM-dd"))
        self.d.setCalendarPopup(True)

        self.c = QComboBox()
        self.c.setEditable(True)
        if data[2] == 'expense':
            self.c.addItems(self.db.get_categories())
        elif data[2] == 'income':
            self.c.addItems(self.db.get_people())
        else:
            self.c.addItem(data[3])
            self.c.setEnabled(False)
        self.c.setCurrentText(data[3])

        self.s = QLineEdit()
        self.s.setText(data[4])

        # --- Szczegóły jako QTextEdit ---
        self.det = QTextEdit()
        self.det.setText(data[6] if len(data) > 6 else "")
        self.det.setFixedHeight(80)
        self.det.setTabChangesFocus(True)

        self.a = QLineEdit(str(data[5]))

        # --- DODANY WALIDATOR (BLOKADA TEKSTU) ---
        from PySide6.QtCore import QRegularExpression
        from PySide6.QtGui import QRegularExpressionValidator
        self.a.setValidator(QRegularExpressionValidator(QRegularExpression(r"[0-9.,]*"), self))
        # ----------------------------------------

        # --- SEKCJA ZAŁĄCZNIKA ---
        self.attachment_data = None
        self.btn_attach = QPushButton(_("📎 Załącznik"))
        self.btn_attach.setStyleSheet("""
            QPushButton {
                font-size: 11px; border: 1px solid #95a5a6; border-radius: 6px;
                padding: 4px; min-height: 22px; background-color: transparent;
            }
            QPushButton[attached="true"] {
                background-color: #2ecc71; color: white; border-color: #27ae60; font-weight: bold;
            }
        """)
        self.btn_attach.clicked.connect(self.select_attachment)

        # Sprawdzamy czy transakcja już posiada załącznik (8. element w danych z SQL)
        if len(data) > 7 and data[7]:
            self.btn_attach.setText(_("✅ Załącznik obecny"))
            self.btn_attach.setProperty("attached", True)

        # --- PRZYCISKI GŁÓWNYCH ---
        bb = QDialogButtonBox(QDialogButtonBox.Save | QDialogButtonBox.Cancel)
        btn_save = bb.button(QDialogButtonBox.Save)
        btn_cancel = bb.button(QDialogButtonBox.Cancel)

        btn_base_style = """
            QPushButton {
                font-size: 12px; font-weight: bold; padding: 2px 15px; border-radius: 6px;
                border: 2px solid; background-color: transparent; min-height: 22px; max-height: 22px;
            }
        """

        btn_save.setText(_("Zapisz zmiany"))
        btn_save.setStyleSheet(btn_base_style + """
            QPushButton { color: #2980b9; border-color: #3498db; }
            QPushButton:hover { background-color: #2980b9; color: #ffffff; }
        """)

        btn_cancel.setText(_("Anuluj"))
        btn_cancel.setStyleSheet(btn_base_style + """
            QPushButton { color: #7f8c8d; border-color: #95a5a6; }
            QPushButton:hover { background-color: #7f8c8d; color: #ffffff; }
        """)

        bb.accepted.connect(self.accept)
        bb.rejected.connect(self.reject)

        # Układ formularza
        l.addRow(_("Data:"), self.d)
        l.addRow(_("Kategoria:"), self.c)
        l.addRow(_("Opis (Sklep):"), self.s)
        l.addRow(_("Szczegóły:"), self.det)
        l.addRow(_("Kwota:"), self.a)
        l.addRow(_("Dokument:"), self.btn_attach)
        l.addRow(bb)

    def select_attachment(self):
        from PySide6.QtWidgets import QFileDialog
        from config import _

        # file_ext zamiast _ zapobiega błędom zasięgu
        path, file_ext = QFileDialog.getOpenFileName(
            self, _("Wybierz potwierdzenie"), "", "Pliki (*.jpg *.png *.pdf)"
        )

        if path:
            try:
                with open(path, "rb") as f:
                    self.attachment_data = f.read()
                self.btn_attach.setText(_("✅ Nowy załącznik"))
                self.btn_attach.setProperty("attached", True)
                self.btn_attach.style().unpolish(self.btn_attach)
                self.btn_attach.style().polish(self.btn_attach)
            except Exception as e:
                print(f"Błąd czytania pliku: {e}")

    def get_data(self):
        try:
            amount_val = float(self.a.text().replace(",", "."))
        except ValueError:
            amount_val = 0.0

        return {
            "date": self.d.date().toString("yyyy-MM-dd"),
            "category": self.c.currentText(),
            "subcategory": self.s.text(),
            "amount": amount_val,
            "details": self.det.toPlainText(),
            "attachment": self.attachment_data
        }

from PySide6.QtWidgets import (QDialog, QVBoxLayout, QHBoxLayout, QLabel,
                               QLineEdit, QComboBox, QPushButton, QTableWidget,
                               QTableWidgetItem, QHeaderView, QGroupBox,
                               QCheckBox, QAbstractItemView, QMessageBox, QDateEdit)
from PySide6.QtCore import Qt, QDate
from PySide6.QtGui import QColor
from config import _

class BillsManagerDialog(QDialog):
    def __init__(self, db, categories, parent=None):
        super().__init__(parent)
        self.db = db
        self.categories = categories
        self.setWindowTitle(_("Rachunki i opłaty"))
        self.resize(900, 600)

        self.layout = QVBoxLayout(self)

        # --- DEFINICJA STYLI (Lux Style) ---
        base_style = """
            QPushButton {
                font-size: 11px; font-weight: bold; padding: 5px 15px;
                border-radius: 6px; border: 2px solid; background-color: transparent;
                min-height: 24px;
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
        blue_style = base_style + """
            QPushButton { color: #3498db; border-color: #3498db; }
            QPushButton:hover { background-color: #3498db; color: #ffffff; }
        """

        # --- TABELA RACHUNKÓW ---
        self.table = QTableWidget(0, 6) # Zwiększamy do 6 kolumn dla ukrytego ref_id
        self.table.setHorizontalHeaderLabels([_("ID"), _("Termin"), _("Kwota"), _("Kategoria"), _("Opis"), _("RefID")])
        self.table.setSelectionBehavior(QAbstractItemView.SelectRows)
        self.table.setEditTriggers(QAbstractItemView.NoEditTriggers)
        self.table.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)
        self.table.verticalHeader().setVisible(False)
        self.table.setColumnHidden(0, True)
        self.table.setColumnHidden(5, True) # Ukryte ID długu
        self.table.setAlternatingRowColors(True)
        self.table.setStyleSheet("QTableWidget { border: 1px solid palette(mid); }")

        self.layout.addWidget(QLabel(f"<b>{_('Oczekujące płatności:')}</b>"))
        self.layout.addWidget(self.table)

        # --- FORMULARZ DODAWANIA ---
        form_group = QGroupBox(_("Dodaj nową płatność"))
        form_layout = QHBoxLayout(form_group)

        self.date_input = QDateEdit(QDate.currentDate())
        self.date_input.setCalendarPopup(True)
        self.date_input.setFixedWidth(110)

        self.amt_input = QLineEdit()
        self.amt_input.setPlaceholderText(_("Kwota"))
        self.amt_input.setFixedWidth(80)

        self.cat_input = QComboBox()
        # Dodajemy standardowe kategorie + naszą specjalną opcję
        display_cats = list(self.categories)
        if _("Spłata Długu") not in display_cats:
            display_cats.append(_("Spłata Długu"))
        self.cat_input.addItems(display_cats)
        self.cat_input.currentTextChanged.connect(self.toggle_liability_selector)

        # Combo do wyboru konkretnego długu (domyślnie ukryte)
        self.liability_selector = QComboBox()
        self.liability_selector.setFixedWidth(270)
        self.liability_selector.hide()
        self.refresh_liabilities_list()

        self.desc_input = QLineEdit()
        self.desc_input.setPlaceholderText(_("Opis (np. Czynsz)"))

        self.recurring_cb = QCheckBox(_("Stały"))

        btn_add = QPushButton(_("DODAJ"))
        btn_add.setFixedWidth(80)
        btn_add.setStyleSheet(inc_style)
        btn_add.clicked.connect(self.add_bill)

        form_layout.addWidget(self.date_input)
        form_layout.addWidget(self.amt_input)
        form_layout.addWidget(self.cat_input)
        form_layout.addWidget(self.liability_selector) # Wstawiamy między kategorię a opis
        form_layout.addWidget(self.desc_input)
        form_layout.addWidget(self.recurring_cb)
        form_layout.addWidget(btn_add)
        self.layout.addWidget(form_group)

        # --- PRZYCISKI AKCJI ---
        action_layout = QHBoxLayout()
        self.btn_pay = QPushButton(f"✅ {_('ZAPŁAĆ')}")
        self.btn_pay.setStyleSheet(inc_style)
        self.btn_pay.clicked.connect(self.pay_bill)

        self.btn_delete = QPushButton(f"🗑️ {_('USUŃ')}")
        self.btn_delete.setStyleSheet(exp_style)
        self.btn_delete.clicked.connect(self.delete_bill)

        btn_close = QPushButton(_("ZAMKNIJ"))
        btn_close.setStyleSheet(blue_style)
        btn_close.clicked.connect(self.reject)

        action_layout.addWidget(self.btn_pay)
        action_layout.addWidget(self.btn_delete)
        action_layout.addStretch()
        action_layout.addWidget(btn_close)
        self.layout.addLayout(action_layout)

        self.load_data()

    def refresh_liabilities_list(self):
        """Pobiera aktywne długi do listy wyboru."""
        self.liability_selector.clear()
        status = self.db.get_liabilities_status()
        for d in status:
            rem = d['total'] - d['paid']
            if rem > 0.01:
                # Wyświetlamy nazwę długu i ile zostało
                self.liability_selector.addItem(f"{d['name']} (zost. {rem:.2f})", d['id'])

    def toggle_liability_selector(self, text):
        """Pokazuje wybór długu tylko gdy wybrano kategorię 'Spłata Długu'."""
        is_lia = (text == _("Spłata Długu"))
        self.liability_selector.setVisible(is_lia)
        self.desc_input.setVisible(not is_lia)
        if is_lia:
            self.refresh_liabilities_list()

    def load_data(self):
        self.table.setRowCount(0)
        bills = self.db.get_pending_bills() # Upewnij się, że get_pending_bills zwraca też ref_id (7 kolumn)
        for b in bills:
            # Zakładamy: b_id, d_date, amt, cat, desc, is_rec, ref_id
            b_id, d_date, amt, cat, desc, is_rec = b[:6]
            ref_id = b[6] if len(b) > 6 else None

            row = self.table.rowCount()
            self.table.insertRow(row)

            id_item = QTableWidgetItem(str(b_id))
            id_item.setData(Qt.UserRole, is_rec)
            self.table.setItem(row, 0, id_item)

            date_item = QTableWidgetItem(d_date)
            date_item.setTextAlignment(Qt.AlignCenter)
            self.table.setItem(row, 1, date_item)

            amt_item = QTableWidgetItem(f"{amt:.2f} PLN")
            amt_item.setTextAlignment(Qt.AlignRight | Qt.AlignVCenter)
            self.table.setItem(row, 2, amt_item)

            self.table.setItem(row, 3, QTableWidgetItem(cat))

            desc_text = f"🔄 {desc}" if is_rec == 1 else desc
            self.table.setItem(row, 4, QTableWidgetItem(desc_text))

            ref_item = QTableWidgetItem(str(ref_id) if ref_id else "")
            self.table.setItem(row, 5, ref_item)

    def add_bill(self):
        try:
            amt = float(self.amt_input.text().replace(',', '.'))
            cat = self.cat_input.currentText()
            is_rec = 1 if self.recurring_cb.isChecked() else 0

            if cat == _("Spłata Długu"):
                ref_id = self.liability_selector.currentData()
                desc = self.liability_selector.currentText().split(" (")[0]
            else:
                ref_id = None
                desc = self.desc_input.text().strip()

            self.db.add_pending_bill(
                self.date_input.date().toString("yyyy-MM-dd"),
                amt, cat, desc, is_rec, ref_id=ref_id
            )
            self.amt_input.clear(); self.desc_input.clear(); self.load_data()
        except Exception as e:
            print(f"Błąd dodawania rachunku: {e}")

    def pay_bill(self):
        row = self.table.currentRow()
        if row < 0: return

        b_id = int(self.table.item(row, 0).text())
        is_rec = self.table.item(row, 0).data(Qt.UserRole)
        date_str = self.table.item(row, 1).text()
        amt = float(self.table.item(row, 2).text().replace(" PLN", ""))
        cat = self.table.item(row, 3).text()
        desc = self.table.item(row, 4).text().replace("🔄 ", "")
        ref_id_str = self.table.item(row, 5).text()
        ref_id = int(ref_id_str) if ref_id_str else None

        from dialogs import BillPaymentConfirmDialog
        pay_dlg = BillPaymentConfirmDialog(self, self.db, desc, amt)
        if pay_dlg.exec():
            res = pay_dlg.get_data()
            self.db.mark_bill_paid(b_id)

            # Logika wyboru typu transakcji
            t_type = 'liability_repayment' if cat == _("Spłata Długu") else 'expense'

            # Jeśli to spłata długu, sprawdź czy to ostatnia rata dla dodatkowego opisu
            final_details = res["details"]
            if t_type == 'liability_repayment' and ref_id:
                status = self.db.get_liabilities_status()
                dane_dlugu = next((d for d in status if d['id'] == ref_id), None)
                if dane_dlugu and amt >= (dane_dlugu['total'] - dane_dlugu['paid']):
                    final_details = f"{_('Spłacone w całości')}. {final_details}".strip(". ")

            # Dodanie do historii transakcji
            self.db.add_transaction(
                date=QDate.currentDate().toString("yyyy-MM-dd"),
                t_type=t_type,
                category=cat,
                subcategory=desc,
                amount=amt,
                details=final_details,
                attachment=res["attachment"],
                account_id=res["account_id"],
                ref_id=ref_id # Kluczowe dla zaliczenia spłaty długu!
            )

            if is_rec == 1:
                new_date = QDate.fromString(date_str, "yyyy-MM-dd").addMonths(1).toString("yyyy-MM-dd")
                self.db.add_pending_bill(new_date, amt, cat, desc, 1, ref_id=ref_id)

            self.load_data()

    def delete_bill(self):
        row = self.table.currentRow()
        if row >= 0:
            b_id = int(self.table.item(row, 0).text())
            self.db.delete_pending_bill(b_id)
            self.load_data()

from PySide6.QtWidgets import (QDialog, QVBoxLayout, QHBoxLayout, QTableWidget,
                               QTableWidgetItem, QHeaderView, QPushButton,
                               QLabel, QLineEdit, QComboBox, QDateEdit, QMessageBox, QAbstractItemView, QCheckBox)
from PySide6.QtCore import QDate, Qt
from PySide6.QtGui import QColor
class BillPaymentConfirmDialog(QDialog):
    def __init__(self, parent, db, desc, amt):
        super().__init__(parent)
        self.db = db
        self.setWindowTitle(_("Potwierdzenie płatności"))
        self.setFixedWidth(400)
        layout = QVBoxLayout(self)

        # --- STYLE DLA PRZYCISKÓW DECYZJI ---
        base_style = """
            QPushButton {
                font-size: 11px; font-weight: bold; padding: 5px 15px;
                border-radius: 6px; border: 2px solid; background-color: transparent;
                min-height: 24px;
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

        # Treść pytania
        layout.addWidget(QLabel(f"{_('Czy na pewno opłaciłeś:')} <br><b>{desc}</b> ({amt:.2f} PLN)?"))

        # Sekcja wyboru konta
        layout.addWidget(QLabel(_("Zapłacono z konta:")))
        self.account_combo = QComboBox()
        for acc_id, name, bal, acc_color in self.db.get_accounts():
            self.account_combo.addItem(name, acc_id)
        layout.addWidget(self.account_combo)

        # Pole szczegółów
        self.details_input = QLineEdit()
        self.details_input.setPlaceholderText(_("Szczegóły (opcjonalnie)"))
        layout.addWidget(self.details_input)

        # --- SEKCOJA ZAŁĄCZNIKA (PRZYWRÓCONA DO ORGINAŁU) ---
        self.attachment_data = None
        self.btn_attach = QPushButton(_("📎 Załącznik"))
        self.btn_attach.setStyleSheet("""
            QPushButton {
                border: 1px solid #95a5a6; border-radius: 6px; padding: 3px;
                font-size: 11px; min-height: 22px;
            }
            QPushButton[attached="true"] {
                background-color: #2ecc71; color: white; border-color: #27ae60;
            }
        """)
        self.btn_attach.clicked.connect(self.select_attachment)
        layout.addWidget(self.btn_attach)

        # --- PRZYCISKI DECYZJI ---
        from PySide6.QtWidgets import QDialogButtonBox
        self.buttons = QDialogButtonBox(QDialogButtonBox.Yes | QDialogButtonBox.No)

        btn_yes = self.buttons.button(QDialogButtonBox.Yes)
        btn_yes.setText(_("Tak, opłacone"))
        btn_yes.setStyleSheet(inc_style)

        btn_no = self.buttons.button(QDialogButtonBox.No)
        btn_no.setText(_("Anuluj"))
        btn_no.setStyleSheet(exp_style)

        self.buttons.accepted.connect(self.accept)
        self.buttons.rejected.connect(self.reject)
        layout.addWidget(self.buttons)

    def select_attachment(self):
        from PySide6.QtWidgets import QFileDialog
        path, _ = QFileDialog.getOpenFileName(self, _("Wybierz potwierdzenie"), "", "Pliki (*.jpg *.png *.pdf)")

        if path:
            try:
                with open(path, "rb") as f:
                    self.attachment_data = f.read()

                # Przywrócenie Twojej logiki aktualizacji stylu
                self.btn_attach.setText(_("✅ Załączono"))
                self.btn_attach.setProperty("attached", True)
                self.btn_attach.style().unpolish(self.btn_attach)
                self.btn_attach.style().polish(self.btn_attach)
            except Exception as e:
                print(f"Błąd czytania załącznika: {e}")

    def get_data(self):
        acc_id = self.account_combo.currentData()
        return {
            "details": self.details_input.text().strip(),
            "attachment": self.attachment_data,
            "account_id": acc_id if acc_id is not None else 1
        }

from PySide6.QtWidgets import QLabel, QPushButton, QVBoxLayout, QFrame, QWidget
from PySide6.QtCore import Qt, QPoint
from PySide6.QtGui import QPainter, QPolygon, QColor, QBrush

class GuideArrow(QWidget):
    """Dłuższy, smukły wskaźnik (dziubek)."""
    def __init__(self, parent, color="#2980b9"):
        super().__init__(parent, Qt.ToolTip | Qt.FramelessWindowHint)
        self.setAttribute(Qt.WA_TranslucentBackground)
        self.color = color
        # Zmieniamy rozmiar: 16px szerokości, 20px wysokości (był 12px)
        self.setFixedSize(16, 20)
        self.direction_up = True

    def set_direction(self, points_up):
        self.direction_up = points_up
        self.update()

    def paintEvent(self, event):
        painter = QPainter(self)
        painter.setRenderHint(QPainter.Antialiasing)

        triangle = QPolygon()
        if self.direction_up:
            # Wskazuje w górę ▲ (smukły trójkąt)
            triangle.append(QPoint(self.width() // 2, 0))
            triangle.append(QPoint(2, self.height()))
            triangle.append(QPoint(self.width() - 2, self.height()))
        else:
            # Wskazuje w dół ▼
            triangle.append(QPoint(2, 0))
            triangle.append(QPoint(self.width() - 2, 0))
            triangle.append(QPoint(self.width() // 2, self.height()))

        painter.setPen(Qt.NoPen)
        painter.setBrush(QBrush(QColor(self.color)))
        painter.drawPolygon(triangle)

from PySide6.QtWidgets import QFrame, QVBoxLayout, QLabel, QProgressBar
from PySide6.QtCore import Qt, QPoint, QTimer

class GuideBubble(QFrame):
    def __init__(self, parent, text, target_widget, on_finish_callback, on_stop_callback):
        super().__init__(parent, Qt.ToolTip | Qt.FramelessWindowHint)
        self.target = target_widget
        self.on_finish_callback = on_finish_callback
        self.on_stop_callback = on_stop_callback # <--- NOWOŚĆ: Funkcja przerywająca
        self.arrow = GuideArrow(parent, color="#2980b9")

        self.setStyleSheet("""
            QFrame { background-color: #2980b9; color: white; border-radius: 8px; border: 1px solid #3498db; }
            QLabel { background: transparent; font-size: 13px; }
            QPushButton#close_btn {
                background: transparent; color: rgba(255,255,255,180);
                font-weight: bold; border: none; font-size: 10px;
            }
            QPushButton#close_btn:hover { color: white; }
        """)

        # Layout główny
        main_lay = QVBoxLayout(self)

        # Pasek górny z przyciskiem X
        top_lay = QHBoxLayout()
        top_lay.setContentsMargins(0,0,0,0)
        close_btn = QPushButton("✕")
        close_btn.setObjectName("close_btn")
        close_btn.setFixedSize(16, 16)
        close_btn.clicked.connect(self.on_stop_callback) # Przerywa przewodnik
        top_lay.addStretch()
        top_lay.addWidget(close_btn)
        main_lay.addLayout(top_lay)

        self.lbl = QLabel(text)
        self.lbl.setWordWrap(True)
        self.lbl.setContentsMargins(10, 0, 10, 5)
        main_lay.addWidget(self.lbl)

        self.progress = QProgressBar(self)
        self.progress.setFixedHeight(3)
        self.progress.setTextVisible(False)
        self.progress.setStyleSheet("QProgressBar { background: rgba(255,255,255,40); border: none; } "
                                  "QProgressBar::chunk { background: white; }")
        main_lay.addWidget(self.progress)

        self.prog_timer = QTimer(self)
        self.prog_value = 0
        self.prog_timer.timeout.connect(self.update_progress)
        self.prog_timer.start(50)

        self.setMinimumWidth(260)
        self.adjustSize()

    # ... metoda update_progress i move_to_target bez zmian ...

    def update_progress(self):
        self.prog_value += 1
        if self.prog_value <= 100:
            self.progress.setValue(self.prog_value)
        else:
            self.prog_timer.stop()
            # MAGIA: Kiedy pasek się skończy, wywołujemy przejście dalej!
            if self.on_finish_callback:
                self.on_finish_callback()

    # ... (reszta metod show, close, move_to_target bez zmian) ...

    def show(self):
        super().show()
        self.arrow.show()

    def close(self):
        self.arrow.close()
        super().close()

    def deleteLater(self):
        self.arrow.deleteLater()
        super().deleteLater()

    def move_to_target(self):
        gp = self.target.mapToGlobal(QPoint(0, 0))
        local_pos = self.parent().mapFromGlobal(gp)
        target_center_x = local_pos.x() + (self.target.width() // 2)

        # Odległość od przycisku (dostosowana do nowej wysokości strzałki 20px)
        # 2px marginesu + 20px strzałki
        gap = 2

        arrow_points_up = True
        bubble_y_offset = self.target.height() + self.arrow.height() + gap
        arrow_y_offset = self.target.height() + gap

        if local_pos.y() + bubble_y_offset + self.height() > self.parent().height():
            arrow_points_up = False
            # Dymek ląduje nad przyciskiem
            bubble_y_offset = -(self.height() + self.arrow.height() + gap)
            arrow_y_offset = -(self.arrow.height() + gap)

        self.arrow.set_direction(arrow_points_up)

        # Pozycjonowanie strzałki
        arrow_x = (self.target.width() // 2) - (self.arrow.width() // 2)
        self.arrow.move(local_pos + QPoint(arrow_x, arrow_y_offset))

        # Pozycjonowanie dymka
        bubble_x = target_center_x - (self.width() // 2)
        margin = 10
        bubble_x = max(margin, min(bubble_x, self.parent().width() - self.width() - margin))
        self.move(QPoint(bubble_x, local_pos.y() + bubble_y_offset))

from PySide6.QtCore import QTimer

class AppGuide:
    def __init__(self, parent):
        self.parent = parent
        self.steps = [
            (parent.btn_sel_month, _("1. Wybór daty: Tu określasz, który miesiąc i rok chcesz teraz rozliczać.")),
            (parent.btn_weekly, _("2. Limity: Ustaw ile maksymalnie chcesz wydać w danym tygodniu.")),
            (parent.search_bar, _("3. Wyszukiwarka: Filtruj historię wpisując kwoty, kategorie lub nazwy sklepów.")),
            (parent.btn_income, _("4. Przychody: Tu dodajesz wypłaty, premie i inne wpływy.")),
            (parent.btn_expense, _("5. Wydatki: Twoje codzienne zakupy. Wybierz kategorię, by widzieć statystyki.")),
            (parent.btn_savings, _("6. Oszczędności: Odkładaj na konkretne cele lub fundusz awaryjny.")),
            (parent.btn_liabilities, _("7. Twoje długi: Tutaj pilnujesz spłaty własnych kredytów i pożyczek.")),
            (parent.btn_debtors, _("8. Dłużnicy: Spis osób, które pożyczyły pieniądze od Ciebie.")),
            (parent.btn_bills, _("9. Rachunki: Stałe opłaty jak czynsz czy prąd. Apka przypomni Ci o terminach!")),
            (parent.table, _("10. Rejestr: Tutaj widzisz pełną listę wszystkich operacji w wybranym miesiącu.")),
            (parent.btn_pdf, _("11. Raport: Kliknij tutaj na koniec miesiąca, by stworzyć podsumowanie w PDF.")),
            (parent.btn_back, _("12. Backup: Zawsze rób kopię zapasową bazy danych przed większymi zmianami."))
        ]
        self.current_step = 0
        self.bubble = None

    def start(self):
        self.current_step = 0
        self.show_step()

    def show_step(self):
        if self.bubble:
            self.bubble.close()
            self.bubble.deleteLater()

        if self.current_step < len(self.steps):
            target_widget, text = self.steps[self.current_step]
            # Przekazujemy dwie funkcje: co zrobić po czasie i co zrobić po kliknięciu X
            self.bubble = GuideBubble(self.parent, text, target_widget, self.next_step, self.stop_guide)
            self.bubble.show()
            self.bubble.move_to_target()

    def next_step(self):
        self.current_step += 1
        QTimer.singleShot(100, self.show_step)

    def stop_guide(self):
        """Całkowite zatrzymanie prezentacji."""
        if self.bubble:
            self.bubble.prog_timer.stop() # Zatrzymujemy pasek
            self.bubble.close()
            self.bubble.deleteLater()
            self.bubble = None
        self.current_step = 999 # Blokujemy dalsze kroki

class AccountHistoryDialog(QDialog):
    def __init__(self, parent, db, account_id, account_name):
        super().__init__(parent)
        self.db = db
        self.account_id = account_id
        self.setWindowTitle(f"{_('Historia konta')}: {account_name}")
        self.resize(900, 600)

        layout = QVBoxLayout(self)

        # --- FILTRY ---
        filter_layout = QHBoxLayout()

        self.date_from = QDateEdit(QDate.currentDate().addMonths(-1))
        self.date_from.setCalendarPopup(True)
        self.date_to = QDateEdit(QDate.currentDate())
        self.date_to.setCalendarPopup(True)

        self.type_combo = QComboBox()
        self.type_combo.addItems([
            _("Wszystkie"), _("Wpływy"), _("Wydatki"),
            _("Oszczędności"), _("Spłaty długów"), _("Zwroty od dłużników")
        ])
        # Mapowanie dla bazy danych
        self.type_map = {
            _("Wszystkie"): None,
            _("Wpływy"): "income",
            _("Wydatki"): "expense",
            _("Oszczędności"): "savings",
            _("Spłaty długów"): "liability_repayment",
            _("Zwroty od dłużników"): "debtor_repayment"
        }

        btn_refresh = QPushButton(_("Filtruj"))
        btn_refresh.clicked.connect(self.load_history)

        # Styl spójny z resztą aplikacji (Lux style)
        btn_refresh.setStyleSheet("""
            QPushButton {
                font-size: 12px;
                font-weight: bold;
                padding: 4px 15px;
                border-radius: 6px;
                border: 2px solid #3498db;
                color: #2980b9;
                background-color: transparent;
                min-height: 20px;
            }
            QPushButton:hover {
                background-color: #3498db;
                color: #ffffff;
            }
        """)
        btn_refresh.setCursor(Qt.PointingHandCursor) # Dodajemy łapkę

        filter_layout.addWidget(QLabel(_("Od:")))
        filter_layout.addWidget(self.date_from)
        filter_layout.addWidget(QLabel(_("Do:")))
        filter_layout.addWidget(self.date_to)
        filter_layout.addWidget(QLabel(_("Typ:")))
        filter_layout.addWidget(self.type_combo)
        filter_layout.addWidget(btn_refresh)
        layout.addLayout(filter_layout)

        # --- TABELA ---
        self.table = QTableWidget(0, 5)
        self.table.setHorizontalHeaderLabels([_("Data"), _("Kategoria"), _("Opis"), _("Kwota"), _("Szczegóły")])
        self.table.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)
        self.table.setEditTriggers(QAbstractItemView.NoEditTriggers)
        layout.addWidget(self.table)

        # --- PODSUMOWANIE ---
        self.lbl_summary = QLabel("")
        self.lbl_summary.setStyleSheet("font-weight: bold; font-size: 13px; color: #2c3e50;")
        layout.addWidget(self.lbl_summary)

        self.load_history()

    def load_history(self):
        from PySide6.QtGui import QColor, QPalette
        d1 = self.date_from.date().toString("yyyy-MM-dd")
        d2 = self.date_to.date().toString("yyyy-MM-dd")
        selected_text = self.type_combo.currentText()
        t_type = self.type_map.get(selected_text)

        rows = self.db.get_account_history(self.account_id, d1, d2, t_type)

        self.table.setRowCount(0)
        total_val = 0.0

        for r in rows:
            row_idx = self.table.rowCount()
            self.table.insertRow(row_idx)

            self.table.setItem(row_idx, 0, QTableWidgetItem(r[0])) # Data
            self.table.setItem(row_idx, 1, QTableWidgetItem(r[2])) # Kategoria
            self.table.setItem(row_idx, 2, QTableWidgetItem(r[3])) # Opis

            amt = r[4]
            # Kolorowanie kwoty w tabeli
            item_amt = QTableWidgetItem(f"{amt:.2f}")
            if r[1] in ['income', 'debtor_repayment']:
                item_amt.setForeground(QColor("#2ecc71")) # Jaśniejszy zielony dla lepszego kontrastu
                total_val += amt
            else:
                item_amt.setForeground(QColor("#e74c3c")) # Jaśniejszy czerwony
                total_val -= amt

            self.table.setItem(row_idx, 3, item_amt)
            self.table.setItem(row_idx, 4, QTableWidgetItem(r[5] or ""))

        # --- LOGIKA KOLOROWANIA PODSUMOWANIA (BEZ NIEBIESKIEGO NAPISU) ---
        theme_text_color = self.palette().color(QPalette.WindowText).name()

        if total_val > 0.01:
            val_color = "#2ecc71" # Zielony
        elif total_val < -0.01:
            val_color = "#e74c3c" # Czerwony
        else:
            val_color = theme_text_color

        self.lbl_summary.setStyleSheet(f"QLabel {{ color: {theme_text_color}; font-size: 13px; font-weight: bold; }}")

        self.lbl_summary.setText(
            f"{_('Bilans operacji w tym okresie')}: "
            f"<span style='color:{val_color};'>{total_val:.2f} PLN</span>"
        )
