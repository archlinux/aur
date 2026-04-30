import sys
import os
from datetime import datetime, timedelta

from PySide6.QtWidgets import (QApplication, QMainWindow, QWidget, QVBoxLayout, QHBoxLayout, QLabel,
                               QLineEdit, QPushButton, QTableWidget, QTableWidgetItem, QHeaderView,
                               QGroupBox, QMessageBox, QAbstractItemView, QFrame,
                               QFileDialog, QProgressBar, QSizePolicy, QMenu,
                               QStackedWidget, QDialog)
from PySide6.QtCore import Qt, QSettings, QDate, QTimer, QTranslator, QLocale
from PySide6.QtGui import QColor, QPalette, QIcon, QKeyEvent, QAction

from config import WERSJA, PRODUCENT, setup_crash_handlers, _, MONTH_NAME, CASH_SAVINGS_NAME, APPNAME
from database import DatabaseManager
from dialogs import AppGuide
from config import save_table_widths, load_table_widths

basedir = os.path.dirname(__file__)
icon_path = os.path.join(basedir, "budget.png")

from PySide6.QtCore import Signal # Upewnij się, że masz Signal w importach na górze

class ClickableDebtLabel(QLabel):
    clicked = Signal(int, str)  # Emituje: id_dlugu, typ ('lia' lub 'deb')

    def __init__(self, text, debt_id, debt_type, parent=None):
        super().__init__(text, parent)
        self.debt_id = debt_id
        self.debt_type = debt_type
        self.setCursor(Qt.PointingHandCursor)
        self.setStyleSheet("QLabel:hover { color: #3498db; text-decoration: underline; }")

    def mousePressEvent(self, event):
        if event.button() == Qt.LeftButton:
            self.clicked.emit(self.debt_id, self.debt_type)

class BudgetApp(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle(f"{APPNAME}")
        self.resize(1200, 950)
        self.db = DatabaseManager()
        self.settings = QSettings("BudgetApp", "Config")
        self.pdf_gen = None
        self.active_filter_cat = None
        self.weekly_filter_cat = None
        self.week_offset = 0
        self.guide = None
        self.current_account_history_dialog = None
        self._loading_transactions = False
        self._pending_refresh = False

        now = datetime.now()
        self.current_month = now.month
        self.current_year = now.year

        # Próba przywrócenia ostatniej daty z ustawień
        ly = self.settings.value("last_year", type=int)
        lm = self.settings.value("last_month", type=int)
        if ly and lm is not None:
            self.current_year = ly
            self.current_month = lm

        self.update_timer = QTimer()
        self.update_timer.setInterval(300)
        self.update_timer.setSingleShot(True)
        self.update_timer.timeout.connect(self.load_transactions)

        c = QWidget(); self.setCentralWidget(c); self.main_layout = QVBoxLayout(c)

        # 2. Budujemy interfejs
        self.setup_top_bar()
        self.setup_dashboard()
        self.setup_buttons()
        self.setup_table()
        self.setup_footer()
        self.apply_module_visibility()

        if g := self.settings.value("geometry"): self.restoreGeometry(g)
        if s := self.settings.value("windowState"): self.restoreState(s)

        QTimer.singleShot(100, self.load_transactions)
        self.check_new_week_prompt()
        self._pending_category_click = None

    # Szukaj w okolicy linii 1600-1700 (tam gdzie masz inne metody open_...)

    def open_settings_dialog(self):
        from settings_dialog import SettingsDialog
        dlg = SettingsDialog(self, self.db)
        if dlg.exec():
            # Po zamknięciu odświeżamy widoczność przycisków i paneli
            self.apply_module_visibility()
            self.load_transactions() # Odświeży też statystyki

    def apply_module_visibility(self):
        """
        Poprawiona widoczność:
        - Zakupy i Tydzień: sterowane tylko przyciskiem (Twoja prośba).
        - Długi i Dłużnicy: bez zmian (Twoja oryginalna logika).
        """
        # 1. Pobieramy ustawienia z bazy
        show_lia_mod = self.db.get_config_bool("show_liabilities", True)
        show_deb_mod = self.db.get_config_bool("show_debtors", True)
        show_shop = self.db.get_config_bool("show_shopping", True)
        show_week = self.db.get_config_bool("show_weekly", True)

        # --- NOWE MODUŁY: TYLKO UKRYWANIE PRZYCISKÓW ---
        if hasattr(self, 'btn_shop'):
            self.btn_shop.setVisible(show_shop)

        if hasattr(self, 'btn_weekly'):
            self.btn_weekly.setVisible(show_week)
            # Jeśli moduł wyłączony, a widok tygodnia był aktywny - wróć do miesiąca
            if not show_week and hasattr(self, 'weekly_widget') and self.weekly_widget.isVisible():
                self.weekly_widget.setVisible(False)
                self.monthly_widget.setVisible(True)

        # --- DŁUGI I DŁUŻNICY: TWOJA ORYGINALNA LOGIKA (BEZ ZMIAN) ---
        # 2. Ukrywamy/Pokazujemy dolne przyciski akcji
        self.btn_liabilities.setVisible(show_lia_mod)
        self.btn_debtors.setVisible(show_deb_mod)

        # 3. Odświeżamy treść paneli (generujemy paski postępu)
        if show_lia_mod:
            self.update_liabilities_display()
        if show_deb_mod:
            self.update_debtors_display()

        # 4. Decydujemy o widoczności całych GroupBoxów (Panel boczny)
        # Pokazuje się tylko jeśli: moduł włączony ORAZ są aktywne wpisy
        status_lia = self.db.get_liabilities_status()
        has_active_lia = any((d['total'] - d['paid']) > 0.01 for d in status_lia)
        self.lia_box.setVisible(show_lia_mod and has_active_lia)

        status_deb = self.db.get_debtors_status()
        has_active_deb = any((d['total'] - d['paid']) > 0.01 for d in status_deb)
        self.deb_box.setVisible(show_deb_mod and has_active_deb)

    def open_month_menu(self):
        from PySide6.QtWidgets import QMenu
        from PySide6.QtGui import QAction
        from PySide6.QtCore import QPoint

        menu = QMenu(self)
        # Używamy tego samego stylu co w filtrze (możesz go wydzielić do stałej)
        menu.setStyleSheet(self.get_menu_style())

        for i, name in enumerate(MONTH_NAME):
            month_num = i + 1
            display_text = f"✔ {name}" if month_num == self.current_month else name
            action = QAction(display_text, self)
            action.setData(month_num)
            action.triggered.connect(lambda chk=False, m=month_num: self.change_date_filter(new_month=m))
            menu.addAction(action)

        menu.exec(self.btn_sel_month.mapToGlobal(QPoint(0, self.btn_sel_month.height())))

    def open_year_menu(self):
        from PySide6.QtWidgets import QMenu
        from PySide6.QtGui import QAction
        from PySide6.QtCore import QPoint

        # Pobieramy lata, które faktycznie istnieją w bazie
        years = self.db.get_available_years() # Musisz dodać tę metodę do klasy Database
        if self.current_year not in years: years.append(self.current_year)
        years.sort(reverse=True)

        menu = QMenu(self)
        menu.setStyleSheet(self.get_menu_style())

        for y in years:
            display_text = f"✔ {y}" if y == self.current_year else str(y)
            action = QAction(display_text, self)
            action.setData(y)
            action.triggered.connect(lambda chk=False, year=y: self.change_date_filter(new_year=year))
            menu.addAction(action)

        menu.exec(self.btn_sel_year.mapToGlobal(QPoint(0, self.btn_sel_year.height())))

    def change_date_filter(self, new_month=None, new_year=None):
        if new_month: self.current_month = new_month
        if new_year: self.current_year = new_year

        self.btn_sel_month.setText(MONTH_NAME[self.current_month - 1])
        self.btn_sel_year.setText(str(self.current_year))
        self.load_transactions()

    def change_week(self, delta):
        """Przesuwa widok tygodnia o określoną liczbę tygodni (delta)."""
        self.week_offset += delta
        # Po zmianie offsetu musimy przeładować dane, by tabela pokazała właściwy tydzień
        self.load_transactions()

    def get_menu_style(self):
        return """
            QMenu { background-color: palette(window); color: palette(text); border: 1px solid palette(mid); border-radius: 6px; }
            QMenu::item { padding: 6px 25px; }
            QMenu::item:selected { background-color: palette(highlight); color: palette(highlighted-text); }
        """

    def check_new_week_prompt(self):
        from dialogs import WeeklyLimitDialog
        if not self.db.is_weekly_system_enabled(): return
        today = datetime.now().date()
        monday_real = today - timedelta(days=today.weekday())
        monday_str = monday_real.strftime("%Y-%m-%d")
        found, _, _ = self.db.get_weekly_limit_for_week(monday_str)
        if not found:
            dlg = WeeklyLimitDialog(self, self.db, target_monday_date=monday_str)
            if dlg.exec():
                def safe_startup_refresh():
                    self.monthly_widget.setVisible(False)
                    self.weekly_widget.setVisible(True)
                    self.load_transactions()
                QTimer.singleShot(10, safe_startup_refresh)



    def setup_top_bar(self):
        from dialogs import BackupDialog
        from shopping import ShoppingListDialog
        l = QHBoxLayout(); l.setContentsMargins(0, 0, 0, 10)

        # --- UJEDNOLICONA MATEMATYKA WYSOKOŚCI ---
        # 22px (wysokość) + 2*2px (border) = 26px całkowitej wysokości dla wszystkich
        common_height = """
            min-height: 22px;
            max-height: 22px;
        """

        # --- STYLE ---
        date_btn_style = f"""
            QPushButton {{
                font-size: 12px; font-weight: bold; padding: 2px 10px; border-radius: 6px;
                border: 2px solid #5499c7; color: #2980b9; background-color: transparent;
                {common_height}
            }}
            QPushButton:hover {{ background-color: #2980b9; color: #ffffff; }}
        """

        top_base_style = f"""
            QPushButton {{
                font-size: 12px; font-weight: bold; padding: 2px 8px; border-radius: 6px;
                border: 2px solid; background-color: transparent;
                {common_height}
            }}
        """

        back_style = top_base_style + """ QPushButton { color: #7f8c8d; border-color: #95a5a6; } QPushButton:hover { background-color: #7f8c8d; color: #ffffff; } """
        shop_style = top_base_style + """ QPushButton { color: #16a085; border-color: #1abc9c; } QPushButton:hover { background-color: #16a085; color: #ffffff; } """
        filter_style = top_base_style + """ QPushButton { color: #d68910; border-color: #f39c12; } QPushButton:hover { background-color: #d68910; color: #ffffff; } """
        weekly_style = top_base_style + """ QPushButton { color: #2980b9; border-color: #3498db; } QPushButton:hover { background-color: #2980b9; color: #ffffff; } """
        pdf_style = top_base_style + """ QPushButton { color: #c0392b; border-color: #e74c3c; } QPushButton:hover { background-color: #c0392b; color: #ffffff; } """
        close_style = top_base_style + """ QPushButton { color: #ba4a00; border-color: #e67e22; } QPushButton:hover { background-color: #ba4a00; color: #ffffff; } """

        # --- ELEMENTY ---
        lbl = QLabel(_("Okres:"))
        lbl.setStyleSheet("font-size: 14px; font-weight: bold;")

        # Przyciski Daty
        self.btn_sel_month = QPushButton(MONTH_NAME[self.current_month - 1])
        self.btn_sel_month.setStyleSheet(date_btn_style)
        self.btn_sel_month.clicked.connect(self.open_month_menu)

        self.btn_sel_year = QPushButton(str(self.current_year))
        self.btn_sel_year.setStyleSheet(date_btn_style)
        self.btn_sel_year.clicked.connect(self.open_year_menu)

        # Backup
        self.btn_back = QPushButton(_("Backup")) # Zmieniamy na self.btn_backup
        self.btn_back.setStyleSheet(back_style)
        def _open_backup():
            self._backup_dlg = BackupDialog(self, self.db)
            self._backup_dlg.exec()
        self.btn_back.clicked.connect(_open_backup)

        # Przycisk Ustawienia
        settings_style = top_base_style + """ QPushButton { color: #7f8c8d; border-color: #95a5a6; } QPushButton:hover { background-color: #7f8c8d; color: #ffffff; } """
        self.btn_settings = QPushButton(_("⚙️ Ustawienia"))
        self.btn_settings.setStyleSheet(settings_style)
        self.btn_settings.clicked.connect(self.open_settings_dialog)

        # Wyszukiwarka (Dostosowana do wysokości przycisków)
        self.search_bar = QLineEdit()
        self.search_bar.setPlaceholderText(_("Szukaj: '19zł', 'czynsz', '21.06'..."))
        self.search_bar.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Fixed)
        self.search_bar.setStyleSheet(f"""
            QLineEdit {{
                border-radius: 6px; padding: 2px 8px; font-size: 12px;
                border: 2px solid #95a5a6; background-color: palette(base); color: palette(text);
                {common_height}
            }}
            QLineEdit:focus {{ border: 2px solid #3498db; }}
        """)
        # W __init__ (tam gdzie tworzysz UI)
        self.search_timer = QTimer()
        self.search_timer.setSingleShot(True)
        self.search_timer.setInterval(300)
        self.search_timer.timeout.connect(self.load_transactions) # To musi celować w funkcję ładowania

        # To wywołuje timer przy każdej literce
        self.search_bar.textChanged.connect(lambda: self.search_timer.start())

        # Pozostałe przyciski
        self.btn_weekly = QPushButton(_("📅 Limit Tygodnia"))
        self.btn_weekly.setStyleSheet(weekly_style)
        self.btn_weekly.clicked.connect(self.open_weekly_settings_safe)

        self.btn_shop = QPushButton(_("🛒 Lista Zakupów"))
        self.btn_shop.setStyleSheet(shop_style)
        def _open_shopping():
            self._shopping_dlg = ShoppingListDialog(self, self.db)
            self._shopping_dlg.exec()
        self.btn_shop.clicked.connect(_open_shopping)

        self.btn_filter = QPushButton(_("🔍 Filtruj"))
        self.btn_filter.setStyleSheet(filter_style)
        self.btn_filter.clicked.connect(self.open_filter_dialog)

        self.btn_pdf = QPushButton(_("📄 Zapisz do PDF"))
        self.btn_pdf.setStyleSheet(pdf_style)
        self.btn_pdf.clicked.connect(self.open_report_dialog)

        self.btn_close_month = QPushButton(_("🔒 Zamknij Miesiąc"))
        self.btn_close_month.setStyleSheet(close_style)
        self.btn_close_month.clicked.connect(self.toggle_month_lock)

        # --- UKŁADANIE NA PASKU ---
        l.addWidget(lbl)
        l.addWidget(self.btn_sel_month)
        l.addWidget(self.btn_sel_year)
        l.addWidget(self.btn_back)
        l.addWidget(self.btn_settings)
        l.addSpacing(20)
        l.addWidget(self.search_bar, 1)
        l.addSpacing(20)
        l.addWidget(self.btn_weekly)
        l.addWidget(self.btn_shop)
        l.addWidget(self.btn_filter)
        l.addWidget(self.btn_pdf)
        l.addWidget(self.btn_close_month)

        self.main_layout.addLayout(l)

    def schedule_update(self): self.update_timer.start(50)



    def open_weekly_settings(self):
        from dialogs import WeeklyLimitDialog
        today = datetime.now().date()
        target = today + timedelta(weeks=self.week_offset)
        monday = target - timedelta(days=target.weekday())
        monday_str = monday.strftime("%Y-%m-%d")
        dlg = WeeklyLimitDialog(self, self.db, target_monday_date=monday_str)
        if dlg.exec():
            def safe_delayed_update():
                is_enabled = self.db.is_weekly_system_enabled()
                if is_enabled:
                    self.monthly_widget.setVisible(False)
                    self.weekly_widget.setVisible(True)
                else:
                    self.monthly_widget.setVisible(True)
                    self.weekly_widget.setVisible(False)
                    self.weekly_filter_cat = None
                self.load_transactions()
            QTimer.singleShot(50, safe_delayed_update)

    def open_weekly_settings_safe(self):
        self.update_timer.stop()
        self.open_weekly_settings()

    def open_bills_manager(self):
        from dialogs import BillsManagerDialog
        # Pobieramy Twoją listę kategorii (dostosuj, jeśli masz inną metodę)
        categories = self.db.get_categories()
        # Czasami get_categories zwraca listę krotek np. [('Jedzenie',), ('Opłaty',)].
        # Jeśli tak jest, użyj: categories = [c[0] for c in self.db.get_categories()]

        # --- ZMIANA: Dodajemy 'self.', żeby okno przeżyło w pamięci! ---
        self.current_bills_dialog = BillsManagerDialog(self.db, categories, self)
        self.current_bills_dialog.exec()
        # ----------------------------------------------------------------

        # MAGIA NR 2: Jak zamkniesz okno rachunków, główny ekran
        # automatycznie przeładuje finanse i zaktualizuje dzwonek powiadomień!
        self.load_transactions()
        self.check_bills_notifications()

    def setup_dashboard(self):
        global _ #to jest zamiana żeby błędem nie walił
        dash_group = QGroupBox()
        dash_layout = QHBoxLayout()
        stats_widget = QWidget()
        stats_layout = QVBoxLayout()
        stats_layout.setSpacing(5)
        stats_layout.setContentsMargins(0,0,0,0)

        # --- ZMIANA: SALDO ŁĄCZNE I LISTA KONT ---
        self.lbl_balance = QLabel(_("SALDO ŁĄCZNE: 0.00 zł"))
        self.lbl_balance.setStyleSheet("""
            QLabel { color: #2ecc71; font-size: 22px; font-weight: bold; }
            QLabel:hover { color: #27ae60; }
        """)
        # --- TO DODAJE ŁAPKĘ PO NAJECHANIU MYSZKĄ ---
        self.lbl_balance.setCursor(Qt.PointingHandCursor)
        # --------------------------------------------
        # Sprawiamy, że label reaguje na kliknięcie jak przycisk
        self.lbl_balance.mousePressEvent = lambda e: self.toggle_accounts_visibility()

        # --- TO JEST NASZ NOWY KONTENER ---
        self.accounts_container = QWidget()
        self.accounts_balances_layout = QVBoxLayout(self.accounts_container)
        self.accounts_balances_layout.setSpacing(2)
        self.accounts_balances_layout.setContentsMargins(15, 0, 0, 5)
        # Zamiast sztywnego False, czytamy z ustawień (domyślnie False jeśli brak klucza)
        acc_vis = self.settings.value("dash_acc_vis", False, type=bool)
        self.accounts_container.setVisible(acc_vis)
        # ----------------------------------

        # --- SEKCJA SALDA Z POPRZEDNIEGO MIESIĄCA (ZWIJANA) ---
        self.lbl_prev_balance = QLabel(_("z poprzedniego miesiąca: 0.00 zł"))
        self.lbl_prev_balance.setStyleSheet("""
            QLabel { color: gray; font-size: 13px; }
            QLabel:hover { color: #555; text-decoration: underline; }
        """)
        self.lbl_prev_balance.setCursor(Qt.PointingHandCursor)
        # Podpinamy metodę przełączającą
        self.lbl_prev_balance.mousePressEvent = lambda e: self.toggle_prev_balance_visibility()

        # Tworzymy kontener na rozbicie salda z poprzedniego miesiąca
        self.prev_balance_container = QWidget()
        self.prev_balance_details_layout = QVBoxLayout(self.prev_balance_container)
        self.prev_balance_details_layout.setSpacing(1)
        self.prev_balance_details_layout.setContentsMargins(15, 0, 0, 5)
        prev_vis = self.settings.value("dash_prev_vis", False, type=bool)
        self.prev_balance_container.setVisible(prev_vis) # DOMYŚLNIE UKRYTE

        # --- NOWE: Wpływy łączne (ten msc) ---
        self.lbl_income_month = QLabel(_("Wpływy (ten msc): 0.00 zł"))
        self.lbl_income_month.setStyleSheet("font-size: 14px; color: #27ae60; font-weight: bold; margin-top: 5px;")
        # -------------------------------------
        self.lbl_expenses_month = QLabel(_("Wydatki (ten msc): 0.00 zł"))
        self.lbl_expenses_month.setStyleSheet("font-size: 14px; color: #c0392b; font-weight: bold; margin-top: 5px;")
        # --- SEKCJA OSZCZĘDNOŚCI W TYM MIESIĄCU (ZWIJANA) ---
        self.lbl_savings_month = QLabel(_("Oszczędności (ten msc): 0.00 zł"))
        self.lbl_savings_month.setStyleSheet("""
            QLabel { color: #2874A6; font-size: 14px; font-weight: bold; margin-top: 5px; }
            QLabel:hover { color: #21618C; }
        """)
        self.lbl_savings_month.setCursor(Qt.PointingHandCursor)
        # Podpinamy nową metodę do kliknięcia
        self.lbl_savings_month.mousePressEvent = lambda e: self.toggle_savings_month_visibility()

        # Tworzymy kontener na szczegóły oszczędności z tego miesiąca
        self.savings_month_container = QWidget()
        self.savings_month_details_layout = QVBoxLayout(self.savings_month_container)
        self.savings_month_details_layout.setSpacing(2)
        self.savings_month_details_layout.setContentsMargins(15, 0, 0, 5)
        sav_m_vis = self.settings.value("dash_sav_m_vis", False, type=bool)
        self.savings_month_container.setVisible(sav_m_vis) # DOMYŚLNIE UKRYTE

        self.lbl_income_breakdown = QLabel(_("Przychody..."))
        self.lbl_income_breakdown.setStyleSheet("font-size: 13px; color: gray;")
        self.lbl_income_breakdown.setAlignment(Qt.AlignRight | Qt.AlignTop)
        # --- SEKCJA OSZCZĘDNOŚCI ŁĄCZNIE (ZWIJANA) ---
        self.lbl_savings_total = QLabel(_("OSZCZĘDNOŚCI ŁĄCZNIE: 0.00 zł"))
        self.lbl_savings_total.setStyleSheet("""
            QLabel { color: #2874A6; font-size: 14px; font-weight: bold; padding-top: 5px; }
            QLabel:hover { color: #21618C; }
        """)
        self.lbl_savings_total.setCursor(Qt.PointingHandCursor)
        # Podpinamy nową metodę do kliknięcia
        self.lbl_savings_total.mousePressEvent = lambda e: self.toggle_savings_visibility()

        # Tworzymy kontener na szczegóły oszczędności
        self.savings_total_container = QWidget()
        self.savings_total_details_layout = QVBoxLayout(self.savings_total_container)
        self.savings_total_details_layout.setSpacing(2)
        self.savings_total_details_layout.setContentsMargins(15, 0, 0, 5)
        sav_t_vis = self.settings.value("dash_sav_t_vis", False, type=bool)
        self.savings_total_container.setVisible(sav_t_vis) # DOMYŚLNIE UKRYTE
        # <--- UKRYTE

        top_split_layout = QHBoxLayout()
        top_left_v = QVBoxLayout()
        top_left_v.addWidget(self.lbl_balance)
        top_left_v.addWidget(self.accounts_container) # <--- DODAJ TO TUTAJ
        # DODAJEMY LAYOUT KONT TUTAJ (zaraz pod napisem SALDO ŁĄCZNE)
        #top_left_v.addLayout(self.accounts_balances_layout)
        top_left_v.addWidget(self.lbl_prev_balance)
        top_left_v.addWidget(self.prev_balance_container)
        #top_left_v.addLayout(self.prev_balance_details_layout)
        top_left_v.addWidget(self.lbl_income_month)  # <--- NOWE: Dodajemy do widoku
        top_left_v.addWidget(self.lbl_expenses_month)
        #top_left_v.addWidget(self.lbl_savings_month)
        #top_left_v.addLayout(self.savings_month_details_layout) # <-- DODAJ TO
        top_left_v.addWidget(self.lbl_savings_total)
        top_left_v.addWidget(self.savings_total_container)
        #top_left_v.addLayout(self.savings_total_details_layout)
        top_left_v.addStretch()
        top_right_v = QVBoxLayout()
        inc_header = QLabel(_("Wpływy:"))
        inc_header.setStyleSheet("color: gray; font-weight:bold;")
        inc_header.setAlignment(Qt.AlignRight)
        top_right_v.addWidget(inc_header)

        # --- ZMIANA: Zamiast self.lbl_income_breakdown ---
        self.income_cats_layout = QVBoxLayout()
        self.income_cats_layout.setSpacing(2)
        self.income_cats_layout.setAlignment(Qt.AlignRight)

        # Tworzymy pulę przycisków (np. max 15 różnych źródeł wpływów)
        self.income_rows = []
        for i in range(15):
            btn = QPushButton()
            btn.setCursor(Qt.PointingHandCursor)
            # Styl: mały tekst, wyrównany do prawej, bez ramki (jak link)
            btn.setStyleSheet("""
                QPushButton {
                    text-align: right; color: gray; font-size: 13px;
                    border: none; background: transparent; padding: 1px;
                }
                QPushButton:hover { color: #27ae60; text-decoration: underline; }
            """)
            btn.clicked.connect(self._handle_any_category_click)
            btn.hide()
            self.income_cats_layout.addWidget(btn)
            self.income_rows.append(btn)

        top_right_v.addLayout(self.income_cats_layout)
        # -------------------------------------------------

        self.lbl_income_total = QLabel(_("Suma Wpływów: 0.00 zł"))
        self.lbl_income_total.setStyleSheet("color: #27ae60; font-weight: bold; font-size: 13px; margin-top: 5px; padding-top: 5px;")
        self.lbl_income_total.setAlignment(Qt.AlignRight)
        top_right_v.addWidget(self.lbl_income_total)

        # --- NOWE: Sekcja zwrotów od dłużników ---
        self.lbl_debtors_header = QLabel(_("Dodatkowo oddane przez:"))
        self.lbl_debtors_header.setStyleSheet("color: #d35400; font-weight: bold; font-size: 12px; margin-top: 5px;")
        self.lbl_debtors_header.setAlignment(Qt.AlignRight)

        self.lbl_debtors_breakdown = QLabel(_("Brak zwrotów"))
        self.lbl_debtors_breakdown.setStyleSheet("font-size: 13px; color: gray;")
        self.lbl_debtors_breakdown.setAlignment(Qt.AlignRight | Qt.AlignTop)

        top_right_v.addWidget(self.lbl_debtors_header)
        top_right_v.addWidget(self.lbl_debtors_breakdown)
        # -----------------------------------------
        top_right_v.addSpacing(5) # Mały odstęp od wydatków
        top_right_v.addWidget(self.lbl_savings_month)
        top_right_v.addWidget(self.savings_month_container)
        #top_right_v.addLayout(self.savings_month_details_layout)


        top_right_v.addStretch()

        top_split_layout.addLayout(top_left_v, 60)
        top_split_layout.addLayout(top_right_v, 40)
        stats_layout.addLayout(top_split_layout)

        self.goals_box = QGroupBox(_("Oszczędzamy na (Cele):"))
        self.goals_box.setStyleSheet("""
            QGroupBox { border: 1px solid #3498db; border-radius: 5px; margin-top: 7px; font-weight: bold; color: #2874A6; }
            QGroupBox::title { subcontrol-origin: margin; left: 10px; padding: 0 3px; }
        """)
        self.goals_lay = QVBoxLayout()
        self.goals_lay.setContentsMargins(10, 5, 10, 5)
        self.goals_list_layout = QVBoxLayout()
        self.goals_list_layout.setSpacing(8)
        h = QHBoxLayout()
        btn_tr = QPushButton(_("⇄ Transfer"))
        btn_tr.setFixedWidth(65)
        btn_tr.setStyleSheet("font-size:10px; padding:2px; background:#5DADE2; color:white; border-radius:3px;")
        btn_tr.clicked.connect(self.open_transfer_dialog)
        btn_add = QPushButton(_("+ Cel"))
        btn_add.setFixedWidth(40)
        btn_add.setStyleSheet("font-size:10px; padding:2px;")
        btn_add.clicked.connect(self.open_new_goal_dialog)
        h.addWidget(QLabel(_("Postęp:"))); h.addStretch(); h.addWidget(btn_tr); h.addWidget(btn_add)
        self.goals_lay.addLayout(h)
        self.goals_lay.addLayout(self.goals_list_layout)
        self.goals_box.setLayout(self.goals_lay)
        self.goals_box.hide()

        self.lia_box = QGroupBox(_("Długi (Do oddania):"))
        self.lia_box.setStyleSheet("""
            QGroupBox { border: 1px solid #e74c3c; border-radius: 5px; margin-top: 7px; font-weight: bold; color: #c0392b; }
            QGroupBox::title { subcontrol-origin: margin; left: 10px; padding: 0 3px; }
        """)
        self.liabilities_layout = QVBoxLayout()
        self.liabilities_layout.setContentsMargins(10, 5, 10, 5)
        self.liabilities_layout.setSpacing(8)
        self.lia_box.setLayout(self.liabilities_layout)
        self.lia_box.hide()

        self.deb_box = QGroupBox(_("Dłużnicy (Winni mi):"))
        self.deb_box.setStyleSheet("""
            QGroupBox { border: 1px solid #d35400; border-radius: 5px; margin-top: 7px; font-weight: bold; color: #d35400; }
            QGroupBox::title { subcontrol-origin: margin; left: 10px; padding: 0 3px; }
        """)
        self.debtors_layout = QVBoxLayout()
        self.debtors_layout.setContentsMargins(10, 5, 10, 5)
        self.debtors_layout.setSpacing(8)
        self.deb_box.setLayout(self.debtors_layout)
        self.deb_box.hide()

        #stats_layout.addWidget(self.lbl_savings_total)
        stats_layout.addWidget(self.goals_box)
        stats_layout.addWidget(self.lia_box)
        stats_layout.addWidget(self.deb_box)
        stats_widget.setLayout(stats_layout)

        self.right_panel = QWidget()
        self.right_panel_layout = QVBoxLayout(self.right_panel)
        self.right_panel_layout.setContentsMargins(0,0,0,0)

        # Inicjalizacja widoku miesięcznego
        # --- WIDOK MIESIĘCZNY ---
        self.monthly_widget = QWidget()
        self.monthly_ui_layout = QVBoxLayout(self.monthly_widget)
        self.monthly_ui_layout.setContentsMargins(10, 0, 0, 0)
        self.monthly_ui_layout.setSpacing(0)

        # 1. Nagłówek (musi być dodany jako pierwszy do monthly_ui_layout)
        self.lbl_monthly_cat_head = QLabel("") # Na razie pusty
        self.lbl_monthly_cat_head.setStyleSheet("font-weight: bold; margin-top: 5px; margin-bottom: 5px;")
        self.lbl_monthly_cat_head.setAlignment(Qt.AlignCenter)
        self.monthly_ui_layout.addWidget(self.lbl_monthly_cat_head)


        # 2. Layout kategorii (rozpychający się)
        self.monthly_cat_layout = QVBoxLayout()
        self.monthly_cat_layout.setContentsMargins(0, 10, 2, 0) # Margines 15px na strzałki trendów
        self.monthly_cat_layout.setSpacing(2)

        # PULA WIDGETÓW MIESIĘCZNYCH (Object Pooling - max 50 kategorii)
        self.monthly_rows = []
        for i in range(50):
            row_w = QWidget()
            row_l = QHBoxLayout(row_w)
            row_l.setContentsMargins(15, 2, 0, 2)

            btn = QPushButton()
            btn.setCursor(Qt.PointingHandCursor)
            # --- DODANY STYL HOVER NA NIEBIESKO ---
            btn.setStyleSheet("""
                QPushButton {
                    text-align: left;
                    color: palette(text);
                    border: none;
                    background: transparent;
                }
                QPushButton:hover {
                    color: #3498db;
                    text-decoration: underline;
                }
            """)
            btn.clicked.connect(self._handle_any_category_click)

            lbl = QLabel()
            lbl.setAlignment(Qt.AlignRight)

            row_l.addWidget(btn)    # Przycisk z nazwą kategorii
            row_l.addStretch(1)     # Ta "sprężyna" wypchnie kwotę maksymalnie do prawej
            row_l.addWidget(lbl)    # Etykieta z kwotą i trendem

            self.monthly_cat_layout.addWidget(row_w)
            row_w.hide() # Ukryte domyślnie
            self.monthly_rows.append({'row': row_w, 'btn': btn, 'lbl': lbl})

        # Stała sprężyna na końcu listy kategorii
        self.monthly_cat_layout.addStretch()

        # Dodajemy layout kategorii do głównego układu pod nagłówek
        self.monthly_ui_layout.addLayout(self.monthly_cat_layout, stretch=1)

        # 3. System ostrzeżeń o rachunkach (na samym dole)
        self.lbl_bills_alert = QLabel("")
        self.lbl_bills_alert.setStyleSheet("color: #c0392b; font-weight: bold; font-size: 12px; margin-top: 10px;")
        self.lbl_bills_alert.setWordWrap(True)
        self.lbl_bills_alert.hide()
        self.monthly_ui_layout.addWidget(self.lbl_bills_alert)
        # --------------------------------------------------------

        # Inicjalizacja widoku tygodniowego
        self.weekly_widget = QWidget()
        self.weekly_ui_layout = QVBoxLayout(self.weekly_widget)
        self.setup_weekly_ui()
        self.weekly_widget.hide()

        #self.right_panel_layout.addWidget(self.monthly_widget)
        #self.right_panel_layout.addWidget(self.weekly_widget)

        #dash_layout.addWidget(stats_widget, stretch=1)
        #dash_layout.addWidget(self.right_panel, stretch=1)
        #dash_group.setLayout(dash_layout)
        #self.main_layout.addWidget(dash_group)

        #to u góry bylo a teraz to na dole
        # TWORZYMY STOS WIDOKÓW
        self.view_stack = QStackedWidget()
        self.view_stack.addWidget(self.monthly_widget) # Karta nr 0 (Miesiąc)
        self.view_stack.addWidget(self.weekly_widget)  # Karta nr 1 (Tydzień)
        self.right_panel_layout.addWidget(self.view_stack)

        dash_layout.addWidget(stats_widget, stretch=1)
        dash_layout.addWidget(self.right_panel, stretch=1)
        dash_group.setLayout(dash_layout)
        self.main_layout.addWidget(dash_group)

    def setup_weekly_ui(self):
        nav_layout = QHBoxLayout()
        btn_prev = QPushButton("<"); btn_prev.setFixedSize(30, 30); btn_prev.clicked.connect(lambda: self.change_week(-1))
        self.lbl_week_range = QLabel("..."); self.lbl_week_range.setStyleSheet("font-weight: bold; font-size: 15px; color: #333;"); self.lbl_week_range.setAlignment(Qt.AlignCenter)
        btn_next = QPushButton(">"); btn_next.setFixedSize(30, 30); btn_next.clicked.connect(lambda: self.change_week(1))
        nav_layout.addWidget(btn_prev); nav_layout.addWidget(self.lbl_week_range, stretch=1); nav_layout.addWidget(btn_next)

        self.lbl_current_limit = QLabel(_("Limit: 0.00 zł")); self.lbl_current_limit.setStyleSheet("color: #555; font-size: 12px; font-weight: bold;"); self.lbl_current_limit.setAlignment(Qt.AlignCenter)
        self.weekly_pbar = QProgressBar(); self.weekly_pbar.setFixedHeight(15); self.weekly_pbar.setAlignment(Qt.AlignCenter)
        self.lbl_weekly_spent = QLabel(_("Wydano: 0.00 zł")); self.lbl_weekly_spent.setStyleSheet("color: #c0392b; font-size: 12px;")
        self.lbl_weekly_remaining = QLabel(_("Pozostało w tym tygodniu: 0.00 zł")); self.lbl_weekly_remaining.setStyleSheet("color: #27ae60; font-weight: bold; font-size: 14px;")
        self.lbl_last_week_saved = QLabel(_("Z poprzedniego tygodnia wróciło: 0.00 zł")); self.lbl_last_week_saved.setStyleSheet("color: #7f8c8d; font-style: italic; font-size: 11px;")
        self.lbl_month_savings = QLabel(_("Udało się zaoszczędzić w tym miesiącu: 0.00 zł")); self.lbl_month_savings.setStyleSheet("color: #2980b9; font-weight: bold; font-size: 12px; margin-bottom: 5px;")

        self.lbl_cat_head = QLabel(_("Struktura wydatków:")); self.lbl_cat_head.setStyleSheet("font-weight: bold; margin-top: 5px;")
        self.lbl_cat_head.setAlignment(Qt.AlignCenter)

        # --- ZMIANA: Usuwamy QScrollArea, tworzymy bezpośredni layout dla kategorii ---
        self.weekly_cat_layout = QVBoxLayout()
        self.weekly_cat_layout.setContentsMargins(0, 0, 2, 0) # 15px odstępu od prawej dla trendów
        self.weekly_cat_layout.setSpacing(2)

        # PULA WIDGETÓW TYGODNIOWYCH (Object Pooling - max 50 kategorii)
        self.weekly_rows = []
        for i in range(50):
            row_w = QWidget()
            row_l = QHBoxLayout(row_w)
            row_l.setContentsMargins(15, 2, 0, 2)
            btn = QPushButton()
            btn.setCursor(Qt.PointingHandCursor)
            # Podpinamy uniwersalny kliker
            btn.clicked.connect(self._handle_any_category_click)

            lbl = QLabel()
            lbl.setAlignment(Qt.AlignRight)
            row_l.addWidget(btn)    # Przycisk z nazwą kategorii
            row_l.addStretch(1)     # Ta "sprężyna" wypchnie kwotę maksymalnie do prawej
            row_l.addWidget(lbl)    # Etykieta z kwotą i trendem

            # Dodajemy widget bezpośrednio do layoutu, a nie do kontenera scrolla
            self.weekly_cat_layout.addWidget(row_w)
            row_w.hide()
            self.weekly_rows.append({'row': row_w, 'btn': btn, 'lbl': lbl})

        # Sprężyna na końcu layoutu kategorii, by pchać je do góry
        self.weekly_cat_layout.addStretch()

        # --- Etykieta na powiadomienia o rachunkach ---
        self.lbl_weekly_bills_alert = QLabel("")
        self.lbl_weekly_bills_alert.setStyleSheet("color: #c0392b; font-size: 12px; margin-top: 10px;")
        self.lbl_weekly_bills_alert.setWordWrap(True)
        self.lbl_weekly_bills_alert.hide()

        # --- UKŁADANIE ELEMENTÓW W GŁÓWNYM LAYOUCIE TYGODNIA ---
        self.weekly_ui_layout.addLayout(nav_layout)
        self.weekly_ui_layout.addWidget(self.lbl_current_limit)
        self.weekly_ui_layout.addWidget(self.weekly_pbar)

        h_nums = QHBoxLayout()
        h_nums.addWidget(self.lbl_weekly_spent)
        h_nums.addStretch()
        h_nums.addWidget(self.lbl_weekly_remaining)
        self.weekly_ui_layout.addLayout(h_nums)

        line = QFrame()
        line.setFrameShape(QFrame.HLine)
        line.setStyleSheet("background: #ccc;")
        self.weekly_ui_layout.addWidget(line)

        self.weekly_ui_layout.addWidget(self.lbl_last_week_saved)
        self.weekly_ui_layout.addWidget(self.lbl_month_savings)
        self.weekly_ui_layout.addWidget(self.lbl_cat_head)

        # DODAJEMY LAYOUT KATEGORII (zamiast self.weekly_cat_area)
        self.weekly_ui_layout.addLayout(self.weekly_cat_layout, stretch=1)

        # Powiadomienia o rachunkach na sam dół
        self.weekly_ui_layout.addWidget(self.lbl_weekly_bills_alert)


    def check_weekly_bills(self, week_start_qdate, week_end_qdate):
        bills = self.db.get_pending_bills()
        today = QDate.currentDate() # Potrzebne do obliczenia zaległości
        alerts = []

        months_pl = ["", "Stycznia", "Lutego", "Marca", "Kwietnia", "Maja", "Czerwca",
                     "Lipca", "Sierpnia", "Września", "Października", "Listopada", "Grudnia"]

        for b in bills:
            # Rozpakowujemy b_id, d_date, amt, cat, desc, is_rec, ref_id
            b_id, d_date, amt, cat, desc, is_rec, _ = b
            due = QDate.fromString(d_date, "yyyy-MM-dd")
            days = today.daysTo(due)

            # --- LOGIKA: POKAZUJ JEŚLI TERMIN MIEŚCI SIĘ W TYGODNIU LUB JUŻ MINĄŁ ---
            if due <= week_end_qdate:
                day = due.day()
                month_name = months_pl[due.month()]

                if days < 0:
                    # Rachunek zaległy (sprzed tygodnia lub z tego tygodnia)
                    days_overdue = abs(days)
                    alerts.append(
                        f"<span style='color: #e74c3c; font-size: 11px; font-weight: bold;'>"
                        f"• [ZALEGŁE] {desc} ({cat}) z dnia {day}-go {month_name}: {amt:.2f} zł ({days_overdue} dni po terminie!)"
                        f"</span>"
                    )
                elif week_start_qdate <= due <= week_end_qdate:
                    # Rachunek przypadający na bieżący tydzień (niezaległy)
                    alerts.append(
                        f"<span style='color: palette(text); font-size: 11px;'>"
                        f"• {desc} ({cat}) na <b>{day}-go {month_name}</b>: <b>{amt:.2f} zł</b>"
                        f"</span>"
                    )

        if alerts:
            header = "<span style='color: #e67e22; font-weight: bold; font-size: 12px;'>W tym tygodniu do zapłaty / Zaległe:</span><br>"
            self.lbl_weekly_bills_alert.setText(header + "<br>".join(alerts))
            self.lbl_weekly_bills_alert.show()
        else:
            self.lbl_weekly_bills_alert.hide()


    def update_weekly_stats(self, weekly_enabled, weekly_limit, weekly_cats=None):
        if not weekly_enabled:
            self.view_stack.setCurrentWidget(self.monthly_widget)
            self.weekly_filter_cat = None; self.week_offset = 0; return

        self.view_stack.setCurrentWidget(self.weekly_widget)

        today_real = datetime.now().date(); target_date = today_real + timedelta(weeks=self.week_offset)
        start_of_week = target_date - timedelta(days=target_date.weekday())
        end_of_week = start_of_week + timedelta(days=6)
        s_str = start_of_week.strftime("%Y-%m-%d"); e_str = end_of_week.strftime("%Y-%m-%d")
        range_str = f"{start_of_week.strftime('%d.%m')} - {end_of_week.strftime('%d.%m')}"

        if self.week_offset == 0: self.lbl_week_range.setText(_("Obecny: {}").format(range_str)); self.lbl_week_range.setStyleSheet("font-weight: bold; font-size: 15px; color: #27ae60;")
        else: self.lbl_week_range.setText(_("Tydzień: {}").format(range_str)); self.lbl_week_range.setStyleSheet("font-weight: bold; font-size: 15px;")

        self.lbl_current_limit.setText(_("Limit tygodniowy: {:.2f} zł").format(weekly_limit))
        self.lbl_cat_head.setText(_("Struktura ({}):").format(range_str))

        cat_data = self.db.get_expenses_in_range(s_str, e_str, weekly_cats)
        total_spent = sum(amt for cat, amt in cat_data)
        remaining = weekly_limit - total_spent

        if weekly_limit > 0: pct = int((remaining / weekly_limit) * 100)
        else: pct = 0
        visual_pct = max(0, min(100, pct)); self.weekly_pbar.setValue(visual_pct); self.weekly_pbar.setFormat(f"{pct}%")

        if pct > 50: col = "#2ecc71"
        elif pct > 20: col = "#f39c12"
        else: col = "#e74c3c"

        self.weekly_pbar.setStyleSheet(f"QProgressBar {{ border: 1px solid palette(mid); border-radius: 3px; text-align: center; background: transparent; }} QProgressBar::chunk {{ background-color: {col}; }}")
        self.lbl_weekly_spent.setText(_("Wydano: {:.2f} zł").format(total_spent))

        if remaining < 0: self.lbl_weekly_remaining.setText(_("Przekroczono: {:.2f} zł").format(abs(remaining))); self.lbl_weekly_remaining.setStyleSheet("color: #e74c3c; font-weight: bold; font-size: 14px;")
        else: self.lbl_weekly_remaining.setText(_("Pozostało: {:.2f} zł").format(remaining)); self.lbl_weekly_remaining.setStyleSheet("color: #27ae60; font-weight: bold; font-size: 14px;")

        prev_start = start_of_week - timedelta(days=7); prev_end = prev_start + timedelta(days=6); prev_s_str = prev_start.strftime("%Y-%m-%d")
        found_prev, prev_limit, prev_cats = self.db.get_weekly_limit_for_week(prev_s_str)

        # Pobieranie danych z zeszłego tygodnia do trendów
        prev_data = self.db.get_expenses_in_range(prev_s_str, prev_end.strftime("%Y-%m-%d"), prev_cats if found_prev else None)
        prev_dict = {cat: amt for cat, amt in prev_data}

        if found_prev:
            prev_spent = sum(amt for cat, amt in prev_data)
            prev_saved = max(0, prev_limit - prev_spent)
            self.lbl_last_week_saved.setText(_("Z poprzedniego tygodnia wróciło: {:.2f} zł").format(prev_saved))
        else: self.lbl_last_week_saved.setText(_("Poprzedni tydzień: brak ustaleń"))

        viewed_month_idx = end_of_week.month; accumulated_savings = 0.0; check_sunday = end_of_week
        while check_sunday.month == viewed_month_idx:
            if check_sunday < today_real:
                check_monday = check_sunday - timedelta(days=6)
                c_s_str = check_monday.strftime("%Y-%m-%d"); c_e_str = check_sunday.strftime("%Y-%m-%d")
                h_found, h_limit, h_cats = self.db.get_weekly_limit_for_week(c_s_str)
                if h_found:
                    w_data = self.db.get_expenses_in_range(c_s_str, c_e_str, h_cats)
                    w_spent = sum(amt for cat, amt in w_data)
                    accumulated_savings += max(0, h_limit - w_spent)
            check_sunday -= timedelta(days=7)

        current_month_name = MONTH_NAME[viewed_month_idx - 1]
        self.lbl_month_savings.setText(_("Udało się zaoszczędzić w miesiącu {}: {:.2f} zł").format(current_month_name, accumulated_savings))

        # Reset poola
        for r_dict in self.weekly_rows: r_dict['row'].hide()

        if cat_data:
            idx = 0
            for cat, amt in cat_data:
                if idx >= len(self.weekly_rows): break
                cat_pct = int((amt / total_spent) * 100) if total_spent > 0 else 0
                is_active = (self.weekly_filter_cat == cat)

                r_dict = self.weekly_rows[idx]
                r_dict['btn'].setText(f"{cat}")

                try: r_dict['btn'].clicked.disconnect()
                except RuntimeError: pass

                r_dict['btn'].setProperty("cat_name", cat)
                r_dict['btn'].clicked.connect(self._handle_any_category_click)

                # Styl dla przycisku w widoku tygodniowym
                if is_active:
                    r_dict['btn'].setStyleSheet("QPushButton { text-align: left; font-weight: bold; color: #3498db; border: none; background: transparent; }")
                else:
                    r_dict['btn'].setStyleSheet("""
                        QPushButton { text-align: left; color: palette(text); border: none; background: transparent; }
                        QPushButton:hover { color: #3498db; text-decoration: underline; }
                    """)

                # --- NOWA LOGIKA TRENDU TYGODNIOWEGO Z WYRÓWNANIEM ---
                prev_amt = prev_dict.get(cat, 0.0)
                trend_str = ""
                if prev_amt > 0:
                    diff_pct = ((amt - prev_amt) / prev_amt) * 100
                    if abs(diff_pct) < 1:
                        trend_str = f"<span style='color: #95a5a6;'>▬ ({_('podobnie')})</span>"
                    elif diff_pct > 0:
                        trend_str = f"<span style='color: #e74c3c;'>▲ ({_('więcej o')} {abs(diff_pct):.0f}%)</span>"
                    else:
                        trend_str = f"<span style='color: #2ecc71;'>▼ ({_('mniej o')} {abs(diff_pct):.0f}%)</span>"
                elif amt > 0:
                    trend_str = f"<span style='color: #e74c3c;'>▲ ({_('nowe')})</span>"

                cat_pct = int((amt / total_spent) * 100) if total_spent > 0 else 0

                # WYRÓWNANIE: Kwota | % | Trend - wszystko dociśnięte do prawej
                rich_text = f"""
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="right" width="90">
                            {amt:.2f} zł
                        </td>
                        <td align="right" width="40" style="color: gray; padding-right: 5px;">
                            <small>({cat_pct}%)</small>
                        </td>
                        <td align="left">
                            {trend_str}
                        </td>
                    </tr>
                </table>
                """
                r_dict['lbl'].setTextFormat(Qt.RichText)
                r_dict['lbl'].setText(rich_text)

                # Usuwamy sztywny setFixedWidth lub ustawiamy go na tyle mały,
                # żeby addStretch mógł zadziałać i wypchnąć etykietę.
                r_dict['lbl'].setFixedWidth(243)

                #r_dict['lbl'].setTextFormat(Qt.RichText)
                #r_dict['lbl'].setText(f"{amt:.2f} zł ({cat_pct}%) {trend_str}")

                if is_active: r_dict['lbl'].setStyleSheet("font-weight: bold; color: #3498db;")
                else: r_dict['lbl'].setStyleSheet("")

                r_dict['row'].show()
                idx += 1

        # Odpalenie weryfikacji rachunków na dany tydzień
        q_start = QDate.fromString(s_str, "yyyy-MM-dd")
        q_end = QDate.fromString(e_str, "yyyy-MM-dd")
        self.check_weekly_bills(q_start, q_end)

        return remaining

    # Nowa, jednolita metoda dla miesięcznego i tygodniowego, BEZ użycia lambd w pętli!
    def _handle_any_category_click(self):
        sender = self.sender() # Bezpieczne pobranie obiektu, który wywołał sygnał
        if not sender: return

        category = sender.property("cat_name") # Pobranie nazwy zapisanej jako właściwość widgetu
        if not category: return

        if self.weekly_widget.isVisible():
            if self.weekly_filter_cat == category: self.weekly_filter_cat = None
            else: self.weekly_filter_cat = category
        else:
            if self.active_filter_cat == category: self.active_filter_cat = None
            else: self.active_filter_cat = category

        if self._loading_transactions:
            self._pending_refresh = True
            return

        self.update_timer.start(50)

    def _clear_layout_safely(self, layout):
        # Najbezpieczniejsza z możliwych metod czyszczenia układu w PySide
        while layout.count():
            child = layout.takeAt(0)
            widget = child.widget()
            if widget:
                widget.hide()
                # Wymusza natychmiastowe zerwanie sygnałów przed usunięciem!
                widget.blockSignals(True)
                widget.setParent(None)
                widget.deleteLater()

    def setup_buttons(self):
        l = QHBoxLayout()
        base_style = """
            QPushButton {
                font-size: 16px; font-weight: bold; padding: 12px; border-radius: 8px; border: 2px solid; background-color: transparent;
            }
        """

        # --- CIEMNIEJSZE, NASYCONE STYLE (Dostosowane pod oba motywy) ---

        # Przychód (Mocny zielony)
        inc_style = base_style + """
            QPushButton { color: #27ae60; border-color: #2ecc71; }
            QPushButton:hover { background-color: #27ae60; color: #ffffff; }
        """

        # Wydatek (Mocny czerwony)
        exp_style = base_style + """
            QPushButton { color: #c0392b; border-color: #e74c3c; }
            QPushButton:hover { background-color: #c0392b; color: #ffffff; }
        """

        # Oszczędności (Mocny niebieski)
        sav_style = base_style + """
            QPushButton { color: #2980b9; border-color: #3498db; }
            QPushButton:hover { background-color: #2980b9; color: #ffffff; }
        """

        # Moje Długi (Ciemny karmazyn)
        lia_style = base_style + """
            QPushButton { color: #922b21; border-color: #c0392b; }
            QPushButton:hover { background-color: #922b21; color: #ffffff; }
        """

        # Dłużnicy (Ciemny pomarańcz/brąz)
        deb_style = base_style + """
            QPushButton { color: #d35400; border-color: #e67e22; }
            QPushButton:hover { background-color: #d35400; color: #ffffff; }
        """

        # Rachunki (Głęboki fiolet/śliwka)
        bil_style = base_style + """
            QPushButton { color: #8e44ad; border-color: #9b59b6; }
            QPushButton:hover { background-color: #8e44ad; color: #ffffff; }
        """

        # --- TWORZENIE PRZYCISKÓW ---
        self.btn_income = QPushButton(_("+ DODAJ PRZYCHÓD")); self.btn_income.setStyleSheet(inc_style); self.btn_income.clicked.connect(self.open_income_dialog)
        self.btn_expense = QPushButton(_("- DODAJ WYDATEK")); self.btn_expense.setStyleSheet(exp_style); self.btn_expense.clicked.connect(self.open_expense_dialog)
        self.btn_savings = QPushButton(_("$$ OSZCZĘDNOŚCI")); self.btn_savings.setStyleSheet(sav_style); self.btn_savings.clicked.connect(self.open_savings_dialog)
        self.btn_liabilities = QPushButton(_("! DŁUGI")); self.btn_liabilities.setStyleSheet(lia_style); self.btn_liabilities.clicked.connect(self.open_liabilities_dialog)
        self.btn_debtors = QPushButton(_("$ DŁUŻNICY")); self.btn_debtors.setStyleSheet(deb_style); self.btn_debtors.clicked.connect(self.open_debtors_dialog)
        self.btn_bills = QPushButton(_("📅 RACHUNKI")); self.btn_bills.setStyleSheet(bil_style); self.btn_bills.clicked.connect(self.open_bills_manager)

        self.btns = [self.btn_income, self.btn_expense, self.btn_savings, self.btn_liabilities, self.btn_debtors, self.btn_bills]
        for b in self.btns: l.addWidget(b)
        self.main_layout.addLayout(l)

    def setup_table(self):
        self.table = QTableWidget()
        self.table.setColumnCount(6)
        # Nagłówki kolumn
        self.table.setHorizontalHeaderLabels([
            _("ID"), _("Data"), _("Kto/Kategoria"), _("Opis"), _("Kwota"), _("Szczegóły")
        ])

        header = self.table.horizontalHeader()

        # --- STYL NUMERACJI WIERSZY ---
        self.table.verticalHeader().setVisible(True)
        self.table.verticalHeader().setStyleSheet("""
            QHeaderView::section {
                color: gray;
                font-size: 11px;
                background-color: transparent;
                border: none;
            }
        """)

        # --- ZACHOWANIE I BLOKADY (DODANE) ---
        self.table.setEditTriggers(QAbstractItemView.NoEditTriggers) # Brak edycji po kliknięciu
        self.table.setFocusPolicy(Qt.ClickFocus) # Fokus tylko przy kliknięciu, brak ramki edycji
        self.table.setSelectionMode(QAbstractItemView.ExtendedSelection) # Możliwość zaznaczania wielu wierszy
        self.table.setSelectionBehavior(QAbstractItemView.SelectRows) # Zaznaczaj całe wiersze

        # --- KONFIGURACJA SKALOWANIA ---
        # Ustawiamy tryby: 1-4 sterowane przez użytkownika, 5 (szczegóły) elastyczne
        for i in [1, 2, 3, 4]:
            header.setSectionResizeMode(i, QHeaderView.Interactive)
        header.setSectionResizeMode(5, QHeaderView.Stretch)
        header.setStretchLastSection(False)

        # --- WCZYTYWANIE USTAWIEŃ SZEROKOŚCI KOLUMN ---
        from config import load_table_widths
        saved_widths = load_table_widths()
        if saved_widths:
            for col_idx, width in saved_widths.items():
                self.table.setColumnWidth(int(col_idx), width)
        else:
            # Domyślne wartości przy pierwszym uruchomieniu
            self.table.setColumnWidth(1, 110) # Data
            self.table.setColumnWidth(2, 170) # Kategoria
            self.table.setColumnWidth(3, 170) # Opis
            self.table.setColumnWidth(4, 100) # Kwota

        # --- POZOSTAŁE USTAWIENIA ---
        self.table.setColumnHidden(0, True) # Ukrywamy techniczne ID
        self.table.setContextMenuPolicy(Qt.CustomContextMenu)
        self.table.customContextMenuRequested.connect(self.open_context_menu)
        self.table.doubleClicked.connect(self.open_edit_dialog)

        # Dodanie tabeli do layoutu
        self.main_layout.addWidget(self.table, 2)



    def keyPressEvent(self, e: QKeyEvent):
        if e.key() == Qt.Key_Delete and self.table.hasFocus(): self.delete_selected_transaction()
        super().keyPressEvent(e)

    def open_context_menu(self, position):
        selected_rows = self.table.selectionModel().selectedRows()
        if not selected_rows:
            return

        idx = selected_rows[0].row()
        tid = int(self.table.item(idx, 0).text())

        menu = QMenu()
        # Nakładamy Twój styl menu (zaokrąglenia, kolory)
        menu.setStyleSheet(self.get_menu_style())

        # 1. SEKCOJA ZAŁĄCZNIKA
        # Pobieramy dane raz, by sprawdzić ich obecność
        attachment = self.db.get_attachment(tid)

        if attachment:
            # Akcja: PODGLĄD
            view_action = QAction(_("👁️ Pokaż załącznik"), self)
            view_action.triggered.connect(lambda: self.preview_attachment(tid))
            menu.addAction(view_action)

            # Akcja: POBIERANIE
            dl_action = QAction(_("📥 Pobierz załącznik"), self)
            dl_action.triggered.connect(lambda: self.download_attachment(tid))
            menu.addAction(dl_action)

            menu.addSeparator()

            # Nowa akcja PDF
        export_action = menu.addAction(_("📄 Eksportuj do PDF"))
        export_action.triggered.connect(self.export_selected_to_pdf)

        # 2. SEKCJA EDYCJI I USUWANIA
        is_locked = self.db.is_month_locked(self.get_current_month_str())

        if not is_locked:
            # Edycja tylko dla jednego zaznaczonego wiersza
            if len(selected_rows) == 1:
                edit_action = QAction(_("Edytuj"), self)
                edit_action.triggered.connect(self.open_edit_dialog)
                menu.addAction(edit_action)

            # Usuwanie (może być zbiorcze)
            del_text = _("Usuń ({})").format(len(selected_rows)) if len(selected_rows) > 1 else _("Usuń")
            del_action = QAction(del_text, self)
            del_action.triggered.connect(self.delete_selected_transaction)
            menu.addAction(del_action)
        else:
            # Jeśli miesiąc zablokowany, opcjonalnie możesz dodać informację
            lock_info = QAction(_("🔒 Miesiąc zablokowany"), self)
            lock_info.setEnabled(False)
            menu.addAction(lock_info)

        # Wyświetlenie menu w miejscu kliknięcia
        if not menu.isEmpty():
            menu.exec(self.table.viewport().mapToGlobal(position))

    def preview_attachment(self, tid):
        from config import _
        import tempfile
        import os
        from PySide6.QtWidgets import QMessageBox

        data = self.db.get_attachment(tid)
        if not data:
            return

        # Rozpoznajemy format po "magicznych bajtach"
        suffix = ".bin"
        if data.startswith(b"%PDF"):
            suffix = ".pdf"
        elif data.startswith(b"\x89PNG\r\n\x1a\n"):
            suffix = ".png"
        elif data.startswith(b"\xff\xd8"):
            suffix = ".jpg"

        try:
            # Tworzymy plik tymczasowy (delete=False, żeby systemowa apka zdążyła go odczytać)
            with tempfile.NamedTemporaryFile(delete=False, suffix=suffix) as tmp:
                tmp.write(data)
                tmp_path = tmp.name

            # Otwieranie systemowe
            if hasattr(os, 'startfile'): # Windows
                os.startfile(tmp_path)
            else: # Linux / Arch
                os.system(f'xdg-open "{tmp_path}" &')

        except Exception as e:
            QMessageBox.warning(self, _("Błąd"), _("Nie udało się otworzyć załącznika: {}").format(e))

    def download_attachment(self, tid):
        from config import _
        from PySide6.QtWidgets import QFileDialog, QMessageBox
        import os

        attachment = self.db.get_attachment(tid)
        if not attachment:
            QMessageBox.warning(self, _("Błąd"), _("Nie znaleziono załącznika dla tej transakcji."))
            return

        # --- INTELIGENTNE WYKRYWANIE FORMATU ---
        suffix = ".bin"
        file_filter = "Plik binarny (*.bin)"

        if attachment.startswith(b"%PDF"):
            suffix = ".pdf"
            file_filter = "Dokument PDF (*.pdf)"
        elif attachment.startswith(b"\x89PNG\r\n\x1a\n"):
            suffix = ".png"
            file_filter = "Obraz PNG (*.png)"
        elif attachment.startswith(b"\xff\xd8"):
            suffix = ".jpg"
            file_filter = "Obraz JPG (*.jpg)"

        # Sugerowana nazwa pliku z odpowiednim rozszerzeniem
        suggested_filename = f"potwierdzenie_{tid}{suffix}"
        default_path = os.path.join(os.path.expanduser("~"), suggested_filename)

        # Wyświetlenie okna zapisu z predefiniowanym filtrem
        path, selected_filter = QFileDialog.getSaveFileName(
            self,
            _("Zapisz potwierdzenie"),
            default_path,
            file_filter
        )

        if path:
            # Zabezpieczenie: jeśli użytkownik usunął rozszerzenie w nazwie pliku, dodajemy je
            if not path.lower().endswith(suffix):
                path += suffix

            try:
                with open(path, "wb") as f:
                    f.write(attachment)
                QMessageBox.information(self, _("Sukces"), _("Plik został zapisany poprawnie."))
            except Exception as e:
                QMessageBox.warning(self, _("Błąd"), _("Nie udało się zapisać pliku: {}").format(str(e)))

    def run_guide_with_confirm(self):
        # Zapytanie przed startem
        msg = QMessageBox(self)
        msg.setWindowTitle(_("Przewodnik"))
        msg.setText(_("Czy chcesz uruchomić interaktywny przewodnik po funkcjach?"))
        msg.setStandardButtons(QMessageBox.Yes | QMessageBox.No)
        msg.button(QMessageBox.Yes).setText(_("Tak, startuj"))
        msg.button(QMessageBox.No).setText(_("Anuluj"))

        if msg.exec() == QMessageBox.Yes:
            from dialogs import AppGuide
            # Ważne: przypisujemy do self, żeby obiekt nie został usunięty z pamięci
            self.active_guide = AppGuide(self)
            self.active_guide.start()


    def setup_footer(self):
        footer_widget = QWidget()
        footer_layout = QHBoxLayout(footer_widget)
        footer_layout.setContentsMargins(10, 5, 10, 5) # Mały margines boczny

        footer_item_style = """
            QLabel {
                font-size: 10px;
                font-weight: bold;
                color: gray;
                padding: 2px 8px;
                border: 1px solid gray;
                border-radius: 5px;
                background-color: transparent;
            }
        """

        # Lewa strona
        lbl_version = QLabel(f"v {WERSJA}")
        lbl_version.setStyleSheet(footer_item_style)

        self.btn_help = QPushButton("?", self)
        self.btn_help.setFixedSize(24, 24) # Ujednolicone z przyciskiem flagi
        self.btn_help.setToolTip(_("Uruchom interaktywny przewodnik"))
        self.btn_help.setStyleSheet("""
            QPushButton {
                border: none;
                background: transparent;
                color: #3498db;              /* Zachowujemy niebieski kolor, by sugerował pomoc */
                font-weight: bold;
                font-size: 14px;
                padding: 0px;
            }
            QPushButton:hover {
                background-color: rgba(52, 152, 219, 0.1); /* Bardzo jasny niebieski hover */
                border: 1px solid #3498db;                /* Ramka w kolorze pomocy */
                border-radius: 5px;                       /* Prostokątny kształt jak reszta */
            }
        """)
        self.btn_help.clicked.connect(self.run_guide)

        # --- ŚRODEK: PODSUMOWANIE FILTROWANIA (Większa czcionka) ---
        self.filter_summary_label = QLabel("")
        self.filter_summary_label.setStyleSheet("""
            QLabel {
                font-size: 12px;
                font-weight: bold;
                color: palette(text);
                padding: 3px 12px;
                border: 1px solid palette(mid);
                border-radius: 6px;
                background-color: palette(alternate-base);
            }
        """)
        self.filter_summary_label.setAlignment(Qt.AlignCenter)
        self.filter_summary_label.hide()

        # Prawa strona
        current_year = datetime.now().year
        year_str = f"2025 - {current_year}" if current_year > 2025 else "2025"
        lbl_copy = QLabel(f"© {PRODUCENT} {year_str}")
        lbl_copy.setStyleSheet(footer_item_style)

        # Układanie (Stretch między elementami zapewnia centrowanie środka)
        footer_layout.addWidget(lbl_version)
        footer_layout.addWidget(self.btn_help)
        footer_layout.addStretch(1) # Pcha środek na środek
        footer_layout.addWidget(self.filter_summary_label)
        footer_layout.addStretch(1) # Pcha środek na środek
        footer_layout.addWidget(lbl_copy)

        self.main_layout.addWidget(footer_widget)

    def get_current_month_str(self):
        # Pobieramy wartości bezpośrednio ze zmiennych obiektu, a nie z widżetów
        return f"{self.current_year}-{self.current_month:02d}"

    def update_monthly_label(self, year, month):
        months_pl = {
            1: "Styczeń", 2: "Luty", 3: "Marzec", 4: "Kwiecień",
            5: "Maj", 6: "Czerwiec", 7: "Lipiec", 8: "Sierpień",
            9: "Wrzesień", 10: "Październik", 11: "Listopad", 12: "Grudzień"
        }
        month_name = months_pl.get(int(month), "")
        # Ustawiamy tekst nagłówka
        self.lbl_monthly_cat_head.setText(_("Struktura wydatków ({} {}):").format(month_name, year))

    def toggle_month_lock(self):
        m = self.get_current_month_str(); locked = self.db.is_month_locked(m)
        act = _("ODBLOKOWAĆ") if locked else _("ZAMKNĄĆ")
        if QMessageBox.Yes == QMessageBox.question(self, _("Miesiąc"), _("Czy na pewno chcesz {} miesiąc {}?").format(act, m)):
            if locked: self.db.unlock_month(m)
            else: self.db.lock_month(m)
            self.schedule_update()

    def check_bills_notifications(self):
        bills = self.db.get_pending_bills()
        today = QDate.currentDate()
        alerts = []

        for b in bills:
            # --- ZMIANA TUTAJ: Dodane is_rec na końcu, żeby odebrać 7 elementów z bazy ---
            b_id, d_date, amt, cat, desc, is_rec, _ = b

            due = QDate.fromString(d_date, "yyyy-MM-dd")
            days = today.daysTo(due)

            # --- LOGIKA POWIADOMIEŃ HTML ---
            if days < 0:
                # Wyliczamy ile dni minęło od terminu
                days_overdue = abs(days)
                alerts.append(f"<span style='color: #e74c3c; font-size: 14px; font-weight: bold;'>❌ ZALEGŁY: {desc} ({cat}) - {amt:.2f} zł! ({days_overdue} dni po terminie)</span>")
            elif days == 0:
                alerts.append(f"<span style='color: #e74c3c; font-size: 14px; font-weight: bold;'>🚨 DZISIAJ PŁACISZ: {desc} ({cat}) - {amt:.2f} zł!</span>")
            elif days == 1:
                alerts.append(f"<span style='color: #e74c3c; font-size: 14px; font-weight: bold;'>🚨 JUTRO: {desc} ({cat}) - {amt:.2f} zł!</span>")
            elif 2 <= days <= 3:
                alerts.append(f"<span style='color: #e67e22; font-weight: bold; font-size: 12px;'>⚠️ Za {days} dni: {desc} ({cat}) - {amt:.2f} zł.</span>")
            elif 4 <= days <= 7:
                alerts.append(f"<span style='color: #3498db; font-weight: normal; font-size: 12px;'>ℹ️ Zbliża się (za {days} dni): {desc} ({cat}) - {amt:.2f} zł.</span>")
            # -------------------------------

        if alerts:
            self.lbl_bills_alert.setText("<br>".join(alerts))
            self.lbl_bills_alert.show()
        else:
            self.lbl_bills_alert.hide()

    def open_account_history(self, account_id, account_name):
        from dialogs import AccountHistoryDialog # Upewnij się, że tam jest klasa
        self.current_account_history_dialog = AccountHistoryDialog(self, self.db, account_id, account_name)
        self.current_account_history_dialog.exec()
        self.current_account_history_dialog = None

    def _open_account_history_from_sender(self):
        sender = self.sender()
        if not sender:
            return

        account_id = sender.property("account_id")
        account_name = sender.property("account_name")
        if account_id is None or not account_name:
            return

        self.open_account_history(account_id, account_name)

    def show_debt_details(self, d_id, d_type):
        """Otwiera okno ze szczegółami długu/dłużnika i załącznikiem w spójnym stylu."""
        if d_type == 'lia':
            data = self.db.get_liability_full_info(d_id)
            title = _("Szczegóły Długu")
        else:
            data = self.db.get_debtor_full_info(d_id)
            title = _("Szczegóły Dłużnika")

        if not data: return

        from PySide6.QtWidgets import QDialog, QVBoxLayout, QLabel, QPushButton, QHBoxLayout
        dlg = QDialog(self)
        dlg.setWindowTitle(title)
        dlg.setMinimumWidth(380)
        v_layout = QVBoxLayout(dlg)

        # --- STYLE PRZYCISKÓW (Zgodne z Twoją aplikacją) ---
        main_btn_base = """
            QPushButton {
                font-size: 12px; font-weight: bold; padding: 5px 15px; border-radius: 6px;
                border: 2px solid; background-color: transparent; min-height: 25px;
            }
        """
        blue_style = main_btn_base + """
            QPushButton { color: #2980b9; border-color: #3498db; }
            QPushButton:hover { background-color: #2980b9; color: #ffffff; }
            QPushButton:disabled { color: #bdc3c7; border-color: #ecf0f1; }
        """
        gray_style = main_btn_base + """
            QPushButton { color: #7f8c8d; border-color: #95a5a6; }
            QPushButton:hover { background-color: #7f8c8d; color: #ffffff; }
        """

        # Treść informacyjna
        info = (f"<div style='margin-bottom: 10px;'>"
                f"<p><b>{_('Osoba/Firma')}:</b> {data['name']}</p>"
                f"<p><b>{_('Kwota całkowita')}:</b> {data['total']:.2f} zł</p>"
                f"<p><b>{_('Pozostało')}:</b> <b style='color:#e74c3c;'>{data['remaining']:.2f} zł</b></p>"
                f"<p><b>{_('Termin')}:</b> {data['deadline']}</p></div>")

        lbl_info = QLabel(info)
        lbl_info.setStyleSheet("font-size: 13px;")
        v_layout.addWidget(lbl_info)

        # Kontener na przyciski
        h_btns = QHBoxLayout()
        h_btns.setSpacing(10)

        # --- LOGIKA PRZYCISKÓW (ZAŁĄCZNIK I ZAMKNIJ) ---
        has_attachment = bool(data.get('attachment'))

        if has_attachment:
            btn_view = QPushButton(_("Zobacz załącznik"))
            btn_view.setEnabled(True)
            btn_view.setCursor(Qt.PointingHandCursor)
            btn_view.clicked.connect(lambda: self.open_attachment_by_filename(data['attachment']))
        else:
            btn_view = QPushButton(_("Brak załącznika"))
            btn_view.setEnabled(False)
            btn_view.setCursor(Qt.ArrowCursor)

        btn_view.setStyleSheet(blue_style)

        # Przycisk Zamknij
        btn_ok = QPushButton(_("Zamknij"))
        btn_ok.setStyleSheet(gray_style)
        btn_ok.setCursor(Qt.PointingHandCursor)
        btn_ok.clicked.connect(dlg.accept)

        # Układanie przycisków w poziomie
        h_btns = QHBoxLayout()
        h_btns.addWidget(btn_view)
        h_btns.addStretch()
        h_btns.addWidget(btn_ok)

        v_layout.addLayout(h_btns)
        dlg.exec()

    def open_attachment_by_filename(self, filename):
        """Wczytuje plik z folderu attachments i otwiera go w systemie."""
        import os, tempfile, subprocess

        # 1. Budujemy ścieżkę do pliku w Twoim folderze attachments
        file_path = os.path.join(self.db.attachments_dir, filename)

        if not os.path.exists(file_path):
            from PySide6.QtWidgets import QMessageBox
            QMessageBox.warning(self, _("Błąd"), _("Nie znaleziono pliku na dysku."))
            return

        try:
            # 2. Wczytujemy bajty, żeby rozpoznać format
            with open(file_path, "rb") as f:
                blob_data = f.read()

            # 3. Rozpoznawanie formatu (tak jak miałeś wcześniej)
            ext = ".pdf"
            if blob_data.startswith(b'\xff\xd8'): ext = ".jpg"
            elif blob_data.startswith(b'\x89PNG'): ext = ".png"

            # 4. Zrzucamy do pliku tymczasowego z poprawnym rozszerzeniem i otwieramy
            with tempfile.NamedTemporaryFile(delete=False, suffix=ext) as tmp:
                tmp.write(blob_data)
                p = tmp.name

            if os.name == 'nt':
                os.startfile(p)
            else:
                subprocess.call(['xdg-open', p])
        except Exception as e:
            print(f"Błąd otwierania załącznika: {e}")

    def load_transactions(self, refresh_panel=True):
        import re
        from datetime import datetime, timedelta
        from PySide6.QtGui import QPalette

        if self._loading_transactions:
            self._pending_refresh = True
            return

        self._loading_transactions = True
        self.table.setUpdatesEnabled(False)
        if hasattr(self, 'update_timer'): self.update_timer.stop()
        try:
            # --- LOGIKA SYSTEMU TYGODNIOWEGO ---
            weekly_system_on = self.db.is_weekly_system_enabled()
            weekly_view_active = self.weekly_widget.isVisible()
            if weekly_system_on and not self.monthly_widget.isVisible():
                weekly_view_active = True

            if weekly_view_active:
                self.active_filter_cat = None
            else:
                self.weekly_filter_cat = None

            m_str = self.get_current_month_str()
            search = self.search_bar.text().lower().strip()
            is_searching = bool(search)

            # --- OBLICZANIE DAT TYGODNIA ---
            today_real = datetime.now().date()
            target_date = today_real + timedelta(weeks=self.week_offset)
            start_of_displayed_week = target_date - timedelta(days=target_date.weekday())
            end_of_displayed_week = start_of_displayed_week + timedelta(days=6)
            s_date_str = start_of_displayed_week.strftime("%Y-%m-%d")
            e_date_str = end_of_displayed_week.strftime("%Y-%m-%d")

            reserved_for_week = 0.0
            if weekly_system_on and weekly_view_active:
                found, amt, cats = self.db.get_weekly_limit_for_week(s_date_str)
                if found:
                    if refresh_panel:
                        self.update_weekly_stats(True, amt, cats)
                    real_start = today_real - timedelta(days=today_real.weekday())
                    if s_date_str == real_start.strftime("%Y-%m-%d"):
                        real_expenses = self.db.get_expenses_in_range(s_date_str, e_date_str, cats)
                        real_spent = sum(a for c, a in real_expenses)
                        rem_real = amt - real_spent
                        if rem_real > 0:
                            reserved_for_week = rem_real
                elif refresh_panel:
                    self.update_weekly_stats(weekly_system_on, 0.0, None)
            elif refresh_panel:
                self.update_weekly_stats(False, 0, None)

            # --- WYSZUKIWARKA I BLOKADA MIESIĄCA ---
            search_amount = None
            if is_searching:
                for i, n in enumerate(MONTH_NAME):
                    if n.lower() in search:
                        search = search.replace(n.lower(), f"{i+1:02d}")
                if "." in search:
                    dm = re.match(r"(\d{1,2})\.(\d{1,2})\.(\d{4})", search)
                    if dm:
                        search = f"{dm.group(3)}-{int(dm.group(2)):02d}-{int(dm.group(1)):02d}"

                clean_num_str = search.replace("zł", "").replace(" ", "").replace(",", ".").strip()
                try:
                    search_amount = float(clean_num_str)
                except ValueError:
                    search_amount = None

            locked = self.db.is_month_locked(m_str)
            for b in self.btns:
                b.setEnabled(not locked)

            common_lock_style = "QPushButton { font-size: 12px; font-weight: bold; padding: 2px 8px; border-radius: 6px; border: 2px solid; background: transparent; min-height: 22px; max-height: 22px; }"
            if locked:
                self.btn_close_month.setText(_("🔓 ODBLOKUJ MIESIĄC"))
                self.btn_close_month.setStyleSheet(common_lock_style + "QPushButton { color: #c0392b; border-color: #e74c3c; } QPushButton:hover { background: #c0392b; color: white; }")
            else:
                self.btn_close_month.setText(_("🔒 Zamknij Miesiąc"))
                self.btn_close_month.setStyleSheet(common_lock_style + "QPushButton { color: #ba4a00; border-color: #e67e22; } QPushButton:hover { background: #ba4a00; color: white; }")

            self.table.blockSignals(True)
            rows = self.db.get_all_transactions()
            accounts_data = self.db.get_accounts()
            account_names = {acc[0]: acc[1] for acc in accounts_data}
            account_colors = {a[0]: a[3] for a in accounts_data}

            stats_inc = stats_exp = stats_sav = stats_lia = stats_deb = 0.0
            inc_map = {}
            exp_map = {}
            deb_map = {}
            filtered_data = []
            monthly_cash_savings_net = 0.0
            total_monthly_savings_all = 0.0

            current_filter = self.active_filter_cat or self.weekly_filter_cat
            if current_filter:
                self.btn_filter.setText(f"🔍 {current_filter}")
            else:
                self.btn_filter.setText(_("🔍 Filtruj"))

            for r in rows:
                tid, tdate, ttype, tcat, tsub, tamt, tdetails, has_file, t_acc_id = r

                if abs(tamt) < 0.001:
                    continue

                if tdate.startswith(m_str):
                    if ttype == "income":
                        stats_inc += tamt
                        inc_map[tcat] = inc_map.get(tcat, 0) + tamt
                    elif ttype == "expense":
                        stats_exp += tamt
                        exp_map[tcat] = exp_map.get(tcat, 0) + tamt
                    elif ttype in ["savings", "savings_migration", "goal_deposit"]:
                        total_monthly_savings_all += tamt
                        monthly_cash_savings_net += tamt
                    elif ttype == "liability_repayment":
                        stats_lia += tamt
                        stats_exp += tamt
                        nazwa_dlugu = _("Spłata: {}").format(tsub)
                        exp_map[nazwa_dlugu] = exp_map.get(nazwa_dlugu, 0) + tamt
                    elif ttype == "debtor_repayment":
                        stats_deb += tamt
                        deb_map[tsub] = deb_map.get(tsub, 0) + tamt

                show = False
                if is_searching:
                    txt_match = any(search in str(field).lower() for field in [tdate, tcat, tsub, tamt, tdetails])
                    show = txt_match
                elif weekly_view_active:
                    if (not self.weekly_filter_cat or tcat == self.weekly_filter_cat) and s_date_str <= tdate <= e_date_str and ttype == 'expense':
                        show = True
                elif tdate.startswith(m_str):
                    if not self.active_filter_cat:
                        show = True
                    else:
                        if tcat == self.active_filter_cat:
                            show = True
                        elif ttype == 'liability_repayment' and _("Spłata: {}").format(tsub) == self.active_filter_cat:
                            show = True
                        elif ttype in ['savings', 'savings_migration', 'goal_deposit'] and _("Oszczędności") == self.active_filter_cat:
                            show = True

                if show:
                    filtered_data.append(r)

            palette_text = self.palette().color(QPalette.Text)
            needed = len(filtered_data)
            if self.table.rowCount() < needed:
                self.table.setRowCount(needed)

            for idx, r in enumerate(filtered_data):
                tid, tdate, ttype, tcat, tsub, tamt, tdetails, has_file, t_acc_id = r
                reverse_index = str(len(filtered_data) - idx)
                self.table.setVerticalHeaderItem(idx, QTableWidgetItem(reverse_index))

                def set_c(col, txt, clr=None):
                    it = self.table.item(idx, col) or QTableWidgetItem()
                    if not self.table.item(idx, col):
                        self.table.setItem(idx, col, it)
                    it.setText(str(txt))
                    if clr:
                        it.setForeground(QColor(clr))
                    else:
                        it.setForeground(palette_text)

                set_c(0, tid)
                set_c(1, tdate)

                base_cat = _("Oszczędności") if ttype in ['savings', 'savings_migration'] else \
                           (_("Spłata Długu") if ttype == 'liability_repayment' else \
                           (_("Zwrot od Dłużnika") if ttype == 'debtor_repayment' else tcat))

                acc_name = account_names.get(t_acc_id, _("Nieznane"))
                acc_color = account_colors.get(t_acc_id, "#7f8c8d")
                display_cat_with_acc = f"{base_cat} [{acc_name}]"

                set_c(2, display_cat_with_acc, acc_color)
                set_c(3, tsub)

                t_clr = "#27ae60" if ttype == "income" else ("#c0392b" if ttype == "expense" else ("#d35400" if ttype == "debtor_repayment" else "#2980b9"))
                set_c(4, f"{tamt:.2f}", t_clr)

                clean_details = tdetails.strip().replace("\n", ", ") if tdetails else ""
                display_text = f"📎  {clean_details}" if has_file else clean_details
                set_c(5, display_text)
                self.table.setRowHidden(idx, False)

            for i in range(needed, self.table.rowCount()):
                self.table.setRowHidden(i, True)

            prev = self.db.get_net_balance_pln_before_date(f"{m_str}-01")
            real_balance = prev + stats_inc + stats_deb - stats_exp - total_monthly_savings_all
            display_balance = real_balance - reserved_for_week
            final_bal = display_balance if abs(display_balance) > 0.001 else 0.0

            final_sav_month = monthly_cash_savings_net if monthly_cash_savings_net > 0 else 0.0
            final_sav_month = final_sav_month if abs(final_sav_month) > 0.001 else 0.0

            self._clear_layout_safely(self.accounts_balances_layout)
            self._clear_layout_safely(self.savings_month_details_layout)
            self._clear_layout_safely(self.savings_total_details_layout)
            self._clear_layout_safely(self.prev_balance_details_layout)

            first_day_of_month = f"{m_str}-01"
            total_prev_bal = 0.0
            current_total_bal = 0.0

            for acc_id, acc_name, initial_bal, acc_color in accounts_data:
                acc_history = [r for r in rows if r[8] == acc_id]

                acc_inc = sum(r[5] for r in acc_history if r[2] in ['income', 'debtor_repayment'])
                acc_exp = sum(r[5] for r in acc_history if r[2] in ['expense', 'liability_repayment', 'savings'])

                acc_bal = initial_bal + acc_inc - acc_exp
                current_total_bal += acc_bal

                hist_before = [r for r in acc_history if r[1] < first_day_of_month]
                p_inc = sum(r[5] for r in hist_before if r[2] in ['income', 'debtor_repayment'])
                p_exp = sum(r[5] for r in hist_before if r[2] in ['expense', 'liability_repayment', 'savings'])

                acc_prev_bal = initial_bal + p_inc - p_exp
                total_prev_bal += acc_prev_bal

                if abs(acc_prev_bal) > 0.001:
                    p_lbl = QLabel(f"   • {acc_name}: {acc_prev_bal:.2f} zł")
                    p_lbl.setStyleSheet("font-size: 11px; color: gray; font-style: italic;")
                    self.prev_balance_details_layout.addWidget(p_lbl)

                acc_btn = QPushButton(f"   • {acc_name}: {acc_bal:.2f} zł")
                acc_btn.setCursor(Qt.PointingHandCursor)
                acc_btn.setStyleSheet("""
                    QPushButton {
                        text-align: left;
                        border: none;
                        background: transparent;
                        font-size: 13px;
                        color: palette(text);
                        padding: 2px;
                    }
                    QPushButton:hover { color: #3498db; text-decoration: underline; }
                """)
                acc_btn.setProperty("account_id", acc_id)
                acc_btn.setProperty("account_name", acc_name)
                acc_btn.clicked.connect(self._open_account_history_from_sender)
                self.accounts_balances_layout.addWidget(acc_btn)

                raw_sav_month = sum(r[5] for r in acc_history if r[2] in ['savings', 'savings_migration', 'goal_deposit'] and r[1].startswith(m_str))
                acc_sav_month = max(0.0, raw_sav_month)
                if abs(acc_sav_month) > 0.001:
                    sm_lbl = QLabel(f"{acc_name}: {acc_sav_month:.2f} zł")
                    sm_lbl.setAlignment(Qt.AlignRight | Qt.AlignVCenter)
                    sm_lbl.setContentsMargins(0, 0, 0, 0)
                    sm_lbl.setStyleSheet("font-size: 11px; color: #2874A6; margin-right: 0px;")
                    self.savings_month_details_layout.addWidget(sm_lbl)

                acc_sav_total = sum(r[5] for r in acc_history if r[2] in ['savings', 'savings_migration', 'goal_deposit'])
                if abs(acc_sav_total) > 0.001:
                    st_lbl = QLabel(f"   • {acc_name}: <b>{acc_sav_total:.2f} zł</b>")
                    st_lbl.setStyleSheet("font-size: 12px; color: #21618C;")
                    self.savings_total_details_layout.addWidget(st_lbl)

            final_bal_display = current_total_bal - reserved_for_week
            final_bal_display = final_bal_display if abs(final_bal_display) > 0.001 else 0.0
            self.lbl_balance.setText(_("SALDO ŁĄCZNE: {:.2f} zł").format(final_bal_display))
            self.lbl_prev_balance.setText(_("z poprzedniego miesiąca: {:.2f} zł").format(total_prev_bal))

            final_sav_total = self.db.get_total_savings_cash_pln()
            final_sav_total = final_sav_total if abs(final_sav_total) > 0.001 else 0.0

            self.lbl_savings_month.setAlignment(Qt.AlignRight | Qt.AlignVCenter)
            self.lbl_savings_month.setText(_("Oszczędności (ten msc): {:.2f} zł").format(final_sav_month))
            self.lbl_savings_total.setText(_("OSZCZĘDNOŚCI ŁĄCZNIE: {:.2f} zł").format(final_sav_total))

            y, m_idx = map(int, m_str.split('-'))
            prev_m_str = f"{y-1}-12" if m_idx == 1 else f"{y}-{m_idx-1:02d}"

            prev_inc = 0.0
            prev_exp = 0.0
            prev_exp_map = {}

            for r in rows:
                r_date, r_type, r_cat, r_sub, r_amt = r[1], r[2], r[3], r[4], r[5]
                if r_date.startswith(prev_m_str):
                    if r_type in ['income', 'debtor_repayment']:
                        prev_inc += r_amt
                    elif r_type == 'expense':
                        prev_exp += r_amt
                        prev_exp_map[r_cat] = prev_exp_map.get(r_cat, 0.0) + r_amt
                    elif r_type == 'liability_repayment':
                        prev_exp += r_amt
                        nazwa_d = _("Spłata: {}").format(r_sub)
                        prev_exp_map[nazwa_d] = prev_exp_map.get(nazwa_d, 0.0) + r_amt

            def get_arrow(curr, old, inv=False):
                if old <= 0:
                    return ""
                pct = ((curr - old) / old) * 100
                clr = ("#e74c3c" if pct > 0 else "#2ecc71") if inv else ("#2ecc71" if pct >= 0 else "#e74c3c")
                sym = ("▲" if pct >= 0 else "▼") if not inv else ("▲" if pct > 0 else "▼")
                return f" <span style='color:{clr};'>{sym} {abs(pct):.1f}%</span>"

            self.lbl_income_month.setText(f"Wpływy: {stats_inc+stats_deb:.2f} zł{get_arrow(stats_inc+stats_deb, prev_inc)}")
            self.lbl_expenses_month.setText(f"Wydatki: {stats_exp:.2f} zł{get_arrow(stats_exp, prev_exp, True)}")

            self.lbl_income_total.setText(_("Suma Wpływów: {:.2f} zł").format(stats_inc))
            for btn in self.income_rows:
                btn.hide()

            sorted_inc = sorted(inc_map.items(), key=lambda x: x[1], reverse=True)
            for i, (name, amt) in enumerate(sorted_inc):
                if i >= len(self.income_rows):
                    break

                btn = self.income_rows[i]
                btn.setText(f"{name}: {amt:.2f} zł")
                btn.setProperty("cat_name", name)

                if self.active_filter_cat == name:
                    btn.setStyleSheet("QPushButton { text-align: right; color: #27ae60; font-weight: bold; border: none; background: transparent; }")
                else:
                    btn.setStyleSheet("QPushButton { text-align: right; color: gray; border: none; background: transparent; } QPushButton:hover { color: #27ae60; text-decoration: underline; }")

                btn.show()

            if deb_map:
                self.lbl_debtors_breakdown.setText("\n".join([f"{k}: {v:.2f} zł" for k, v in deb_map.items()]))
                self.lbl_debtors_header.show()
                self.lbl_debtors_breakdown.show()
            else:
                self.lbl_debtors_header.hide()
                self.lbl_debtors_breakdown.hide()

            if not weekly_view_active and refresh_panel:
                m_data = sorted([(c, a) for c, a in exp_map.items() if a > 0], key=lambda x: x[1], reverse=True)
                for r_dict in self.monthly_rows:
                    r_dict['row'].hide()
                total_p = stats_exp + stats_sav
                for idx, (cat, amt) in enumerate(m_data):
                    if idx >= len(self.monthly_rows):
                        break
                    rd = self.monthly_rows[idx]
                    rd['btn'].setText(cat)
                    rd['btn'].setProperty("cat_name", cat)
                    try:
                        rd['btn'].clicked.disconnect()
                    except Exception:
                        pass
                    rd['btn'].clicked.connect(self._handle_any_category_click)

                    sel = (self.active_filter_cat == cat)
                    if sel:
                        rd['btn'].setStyleSheet("QPushButton { text-align: left; font-weight: bold; color: #3498db; border: none; background: transparent; }")
                    else:
                        rd['btn'].setStyleSheet("""
                            QPushButton { text-align: left; color: palette(text); border: none; background: transparent; }
                            QPushButton:hover { color: #3498db; text-decoration: underline; }
                        """)
                    rd['lbl'].setStyleSheet(f"{'font-weight: bold; color: #3498db;' if sel else 'color: palette(text);'}")

                    prev_cat_amt = prev_exp_map.get(cat, 0.0)
                    cat_trend = ""
                    if prev_cat_amt > 0:
                        diff_pct = ((amt - prev_cat_amt) / prev_cat_amt) * 100
                        if abs(diff_pct) < 2:
                            cat_trend = f"<span style='color:#95a5a6;'>▬ ({_('podobnie')})</span>"
                        elif diff_pct > 0:
                            cat_trend = f"<span style='color:#e74c3c;'>▲ ({_('więcej o')} {abs(diff_pct):.0f}%)</span>"
                        else:
                            cat_trend = f"<span style='color:#27ae60;'>▼ ({_('mniej o')} {abs(diff_pct):.0f}%)</span>"
                    elif amt > 0:
                        cat_trend = f"<span style='color:#e74c3c;'>▲ ({_('nowe')})</span>"

                    pct = int((amt / total_p) * 100) if total_p > 0 else 0

                    rich_text = f"""
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td align="right" width="90" style="padding-right: 5px;">
                                {amt:.2f} zł
                            </td>
                            <td align="left" width="40" style="color: gray;">
                                <small>({pct}%)</small>
                            </td>
                            <td align="left">
                                {cat_trend}
                            </td>
                        </tr>
                    </table>
                    """
                    rd['lbl'].setTextFormat(Qt.RichText)
                    rd['lbl'].setText(rich_text)
                    rd['lbl'].setFixedWidth(240)
                    rd['row'].show()

                self.update_monthly_label(self.current_year, self.current_month)

            self.update_goals_display()
            self.apply_module_visibility()
            self.check_bills_notifications()

            if is_searching or self.active_filter_cat or self.weekly_filter_cat:
                f_inc = sum(r[5] for r in filtered_data if r[2] in ['income', 'debtor_repayment'])
                f_exp = sum(r[5] for r in filtered_data if r[2] in ['expense', 'liability_repayment'])
                f_sav = sum(r[5] for r in filtered_data if r[2] in ['savings', 'savings_migration', 'goal_deposit'])

                f_diff = f_inc - (f_exp + f_sav)
                count = len(filtered_data)
                cat = self.active_filter_cat or self.weekly_filter_cat
                prefix = _("Wyniki wyszukiwania") if is_searching else _("Filtr [{}]").format(cat)
                summary_parts = [f"{prefix}: {count} szt."]

                if f_inc > 0:
                    summary_parts.append(f"<span style='color:#27ae60;'>{_('Wpływy')}: {f_inc:.2f}</span>")
                if f_exp > 0:
                    summary_parts.append(f"<span style='color:#c0392b;'>{_('Wydatki')}: {f_exp:.2f}</span>")
                if f_sav > 0:
                    summary_parts.append(f"<span style='color:#2980b9;'>{_('Oszczędności')}: {f_sav:.2f}</span>")

                active_groups = sum([f_inc > 0, f_exp > 0, f_sav > 0])
                if active_groups > 1:
                    diff_col = "#27ae60" if f_diff >= 0 else "#c0392b"
                    summary_parts.append(f"<b>{_('Bilans')}: <span style='color:{diff_col};'>{f_diff:.2f}</span></b>")

                self.filter_summary_label.setText(" | ".join(summary_parts))
                self.filter_summary_label.show()
            else:
                self.filter_summary_label.hide()
        finally:
            self.table.blockSignals(False)
            self.table.setUpdatesEnabled(True)
            self._loading_transactions = False
            if self._pending_refresh:
                self._pending_refresh = False
                self.update_timer.start(0)

    #def on_chart_pick(self, event):
        #pass

    #def _process_delayed_click_logic(self):
        #pass

    #def _execute_safe_chart_update(self):
        #pass

    def delete_selected_transaction(self):
        if self.db.is_month_locked(self.get_current_month_str()): return
        sel = self.table.selectionModel().selectedRows()
        if not sel: return
        msg = _("Czy na pewno chcesz usunąć {} wpisów?").format(len(sel)) if len(sel) > 1 else _("Czy na pewno chcesz usunąć ten wpis?")
        if QMessageBox.Yes == QMessageBox.question(self, _("Usuń"), msg):
            for idx in sorted(sel, reverse=True):
                self.db.delete_transaction(int(self.table.item(idx.row(), 0).text()))
            self.schedule_update()

    def toggle_accounts_visibility(self):
        """Przełącza widoczność listy kont po kliknięciu w saldo."""
        is_visible = self.accounts_container.isVisible()
        self.accounts_container.setVisible(not is_visible)
        self.save_dashboard_visibility()

    def toggle_savings_visibility(self):
        """Przełącza widoczność rozbicia oszczędności na konta."""
        is_visible = self.savings_total_container.isVisible()
        self.savings_total_container.setVisible(not is_visible)
        self.save_dashboard_visibility()

    def toggle_savings_month_visibility(self):
        """Przełącza widoczność rozbicia oszczędności z bieżącego miesiąca."""
        is_visible = self.savings_month_container.isVisible()
        self.savings_month_container.setVisible(not is_visible)
        self.save_dashboard_visibility()

    def toggle_prev_balance_visibility(self):
        """Przełącza widoczność rozbicia salda z poprzedniego okresu."""
        is_visible = self.prev_balance_container.isVisible()
        self.prev_balance_container.setVisible(not is_visible)
        self.save_dashboard_visibility()

    def save_dashboard_visibility(self):
        """Zapisuje aktualny stan zwinięcia sekcji do QSettings."""
        self.settings.setValue("dash_acc_vis", self.accounts_container.isVisible())
        self.settings.setValue("dash_prev_vis", self.prev_balance_container.isVisible())
        self.settings.setValue("dash_sav_t_vis", self.savings_total_container.isVisible())
        self.settings.setValue("dash_sav_m_vis", self.savings_month_container.isVisible())

    # --- POPRAWIONE FUNKCJE Z BEZPIECZNIKIEM PAMIĘCI ---

    def open_income_dialog(self):
        from dialogs import IncomeDialog
        # ZMIANA: Przypisujemy do self.current_dialog, żeby obiekt nie wyparował
        self.current_dialog = IncomeDialog(self, self.db)
        if self.current_dialog.exec():
            self.save_transaction(self.current_dialog.get_data())

    def open_expense_dialog(self):
        from dialogs import AddExpenseDialog
        self.current_dialog = AddExpenseDialog(self, self.db)
        if self.current_dialog.exec():
            self.save_transaction(self.current_dialog.get_data())

    def open_savings_dialog(self):
        from dialogs import AddSavingsDialog
        self.current_dialog = AddSavingsDialog(self, self.db)
        if self.current_dialog.exec():
            self.save_transaction(self.current_dialog.get_data())

    def open_liabilities_dialog(self):
        from dialogs import LiabilitiesDialog
        self.current_dialog = LiabilitiesDialog(self, self.db)
        if self.current_dialog.exec():
            dat = self.current_dialog.get_data()
            if dat['mode'] == 'new':
                self.db.add_liability(dat['name'], dat['amount'], dat['deadline'], dat.get('attachment'))
                QMessageBox.information(self, "OK", _("Zapisano zobowiązanie."))
            else:
                # --- LOGIKA DOPISKU O ZAKOŃCZENIU ---
                dodatkowy_opis = ""
                # Pobieramy ile zostało przed tą wpłatą
                status = self.db.get_liabilities_status()
                # Szukamy tego konkretnego długu po ID
                dane_dlugu = next((d for d in status if d['id'] == dat['ref_id']), None)

                if dane_dlugu:
                    pozostalo = dane_dlugu['total'] - dane_dlugu['paid']
                    if dat['amount'] >= pozostalo:
                        dodatkowy_opis = _("Spłacone w całości")

                self.db.add_transaction(
                    dat['date'],
                    'liability_repayment',
                    _('Spłata Długu'),
                    dat['name'],
                    dat['amount'],
                    0,
                    dodatkowy_opis, # <--- Wstawiamy nasz dopisek
                    dat.get('attachment'),
                    ref_id=dat['ref_id']
                )
            self.schedule_update()

    def open_debtors_dialog(self):
        from dialogs import DebtorsDialog
        self.current_dialog = DebtorsDialog(self, self.db)
        if self.current_dialog.exec():
            dat = self.current_dialog.get_data()
            if dat['mode'] == 'new':
                new_id = self.db.add_debtor(dat['name'], dat['amount'], dat['deadline'], dat.get('attachment'))
                self.db.add_transaction(
                    QDate.currentDate().toString("yyyy-MM-dd"),
                    'expense', _('Pożyczki'), dat['name'], dat['amount'],
                    0, "", dat.get('attachment'), ref_id=new_id
                )
                QMessageBox.information(self, "OK", _("Zapisano dłużnika i dodano wydatek."))
            else:
                # --- LOGIKA DOPISKU O ZAKOŃCZENIU ---
                dodatkowy_opis = ""
                status = self.db.get_debtors_status()
                dane_dluznika = next((d for d in status if d['id'] == dat['ref_id']), None)

                if dane_dluznika:
                    pozostalo = dane_dluznika['total'] - dane_dluznika['paid']
                    if dat['amount'] >= pozostalo:
                        dodatkowy_opis = _("Spłata zakończona")

                self.db.add_transaction(
                    dat['date'],
                    'debtor_repayment',
                    _('Zwrot od Dłużnika'),
                    dat['name'],
                    dat['amount'],
                    0,
                    dodatkowy_opis, # <--- Wstawiamy nasz dopisek
                    dat.get('attachment'),
                    ref_id=dat['ref_id'],
                    account_id=dat.get('account_id', 1)
                )
            self.schedule_update()

    def update_debtors_display(self):
        self._clear_layout_safely(self.debtors_layout)

        debts = self.db.get_debtors_status()

        active_count = 0
        today = datetime.now().date()

        for d in debts:
            rem = d['total'] - d['paid']
            if rem <= 0: continue

            active_count += 1

            w = QWidget(); v = QVBoxLayout(w); v.setContentsMargins(0, 0, 0, 8); v.setSpacing(2)
            try:
                deadline_dt = datetime.strptime(d['deadline'], "%Y-%m-%d").date()
                delta = (deadline_dt - today).days
                if delta < 0:
                    status_text = _("PO TERMINIE: {} dni").format(abs(delta)); col = "#e74c3c"; is_overdue=True
                else:
                    weeks = delta // 7; days = delta % 7
                    status_text = _("Ma czas: {} tyg. i {} dni").format(weeks, days) if weeks > 0 else _("Ma czas: {} dni").format(days)
                    col = "#2ecc71"; is_overdue=False
            except: status_text = _("Błąd daty"); col = "gray"; is_overdue=False

            h_top = QHBoxLayout()
            # ZMIANA: Używamy ClickableDebtLabel zamiast zwykłego QLabel
            info_lbl = ClickableDebtLabel(f"• {d['name']}: {rem:.2f} zł", d['id'], 'deb')
            info_lbl.clicked.connect(self.show_debt_details)
            info_lbl.setStyleSheet("font-size: 11px;")


            btn_filter = QPushButton("🔍")
            btn_filter.setFixedSize(20, 20)
            btn_filter.setStyleSheet("border: none; color: #2980b9; font-weight: bold;")
            btn_filter.clicked.connect(lambda ch, name=d['name']: self.filter_transactions_by_string(name))

            btn_del = QPushButton("x"); btn_del.setFixedSize(16, 16)
            btn_del.setStyleSheet("border: none; color: gray; font-weight: bold;")
            btn_del.clicked.connect(lambda ch, did=d['id']: self.delete_debtor(did))

            h_top.addWidget(info_lbl); h_top.addStretch(); h_top.addWidget(btn_filter); h_top.addWidget(btn_del)
            pbar = QProgressBar(); pbar.setFixedHeight(10)
            percent = int((d['paid'] / d['total']) * 100) if d['total'] > 0 else 0
            pbar.setValue(percent)
            pbar.setStyleSheet(f"QProgressBar {{ border: 1px solid #ccc; border-radius: 4px; background-color: transparent; }} QProgressBar::chunk {{ background-color: #e67e22; border-radius: 3px; }}"); pbar.setTextVisible(False)
            status_lbl = QLabel(status_text); status_lbl.setStyleSheet(f"font-size: 10px; color: {col}; font-style: italic;")
            v.addLayout(h_top); v.addWidget(pbar); v.addWidget(status_lbl); self.debtors_layout.addWidget(w)

        # Pokaż ramkę tylko, jeśli ktoś faktycznie jest nam winny kasę
        self.deb_box.setVisible(active_count > 0)

    def filter_transactions_by_string(self, text):
        self.search_bar.setText(text)

    def delete_debtor(self, did):
        if QMessageBox.Yes == QMessageBox.question(self, _("Usuń"), _("Usunąć dłużnika? (Historia wpłat zostanie)")):
            self.db.delete_debtor(did); self.schedule_update()

    def open_transfer_dialog(self):
        from dialogs import TransferDialog
        d = TransferDialog(self, self.db)

        while True:
            if d.exec():
                try:
                    source, target, amount = d.get_data()

                    # --- SPRAWDZENIE DOSTĘPNYCH ŚRODKÓW ---
                    if source == CASH_SAVINGS_NAME:
                        available = self.db.get_total_savings_cash_pln()
                    else:
                        available = self.db.get_savings_total_for_subcat(source)

                    if amount > available:
                        QMessageBox.warning(self, _("Błąd kwoty"),
                            _("Nie możesz przenieść {:.2f} zł, ponieważ w '{}' masz tylko {:.2f} zł.").format(amount, source, available))
                        continue # Pozwala poprawić kwotę w tym samym oknie

                    # Wykonanie transferu
                    dt = QDate.currentDate().toString("yyyy-MM-dd")
                    self.db.add_transaction(dt, "savings", _("Oszczędności"), source, -amount)
                    self.db.add_transaction(dt, "savings", _("Oszczędności"), target, amount)

                    self.schedule_update()
                    QMessageBox.information(self, _("Transfer"), _("Przesunięto {:.2f} zł z '{}' do '{}'.").format(amount, source, target))
                    break # Wyjście z pętli po sukcesie

                except ValueError:
                    # Wyłapuje puste pole lub błędy formatu
                    QMessageBox.warning(self, _("Błąd"), _("Wpisz poprawną kwotę (np. 100 lub 50.50)!"))
                    continue
            else:
                break # Użytkownik kliknął Anuluj

    def open_new_goal_dialog(self):
        from dialogs import AddGoalDialog
        d = AddGoalDialog(self, self.db)
        if d.exec():
            try:
                # get_data() wywali ValueError, jeśli pole kwoty będzie puste
                name, target = d.get_data()

                if not name:
                    QMessageBox.warning(self, _("Błąd"), _("Nazwa celu nie może być pusta!"))
                    return

                if self.db.add_goal(name, target):
                    self.schedule_update()
                else:
                    QMessageBox.warning(self, _("Błąd"), _("Taki cel już istnieje!"))
            except ValueError:
                # To się stanie, gdy użytkownik nic nie wpisze lub wpisze litery zamiast cyfr
                QMessageBox.warning(self, _("Błąd"), _("Wpisz poprawną kwotę celu!"))

    def open_edit_dialog(self):
        selected = self.table.selectionModel().selectedRows()
        if not selected: return

        idx = selected[0].row()
        # Pobieramy pełne dane wiersza z bazy, żeby mieć has_file dla dialogu
        tid = int(self.table.item(idx, 0).text())
        row_data = None

        # Szukamy danych w załadowanych wierszach (rows)
        for r in self.db.get_all_transactions():
            if r[0] == tid:
                row_data = r
                break

        if not row_data: return

        from dialogs import EditDialog
        dlg = EditDialog(self, row_data, self.db)
        if dlg.exec():
            d = dlg.get_data()
            # Naprawione wywołanie:
            self.db.update_transaction(
                tid,
                d['date'],
                row_data[2],   # Pobieramy oryginalny typ (expense/income) z bazy
                d['category'],
                d['subcategory'],
                d['amount'],
                d['details'],
                d.get('attachment')
            )
            self.schedule_update()

    def save_transaction(self, data):
        if self.db.is_month_locked(data['date'][:7]):
            QMessageBox.critical(self, _("Błąd"), _("Miesiąc zamknięty!"))
            return

        if data['type'] == 'income':
            self.db.add_person(data['cat'])

        # KLUCZOWA ZMIANA: Dodajemy data.get('account_id', 1)
        # (1 to domyślnie 'Gotówka' jeśli coś by poszło nie tak)
        self.db.add_transaction(
            data['date'],
            data['type'],
            data['cat'],
            data['sub'],
            data['amount'],
            data.get('exclude', 0),
            data.get('details', ""),
            data.get('attachment', None),
            account_id=data.get('account_id', 1)  # <--- TO MUSI TU BYĆ
        )
        self.schedule_update()

    def open_filter_dialog(self):
        from PySide6.QtWidgets import QMenu
        from PySide6.QtGui import QAction
        from PySide6.QtCore import QPoint

        # --- POBIERANIE KATEGORII (bez zmian) ---
        cats = set(self.db.get_categories())
        cats.update(self.db.get_people())
        cats.add(_("Oszczędności"))
        cats.update(self.db.get_liabilities_list())
        cats.update(self.db.get_debtors_list())
        cats.update(self.db.get_all_historical_liabilities())

        valid_cats = sorted([c for c in cats if c])

        # --- BUDOWANIE ROZWIJANEGO MENU (Dynamiczne kolory) ---
        menu = QMenu(self)
        menu.setStyleSheet("""
            QMenu {
                background-color: palette(window);
                color: palette(text);
                border: 1px solid palette(mid);
                border-radius: 6px;
                font-size: 13px;
            }
            QMenu::item {
                padding: 6px 30px 6px 20px;
                background-color: transparent;
            }
            QMenu::item:selected {
                background-color: palette(highlight);
                color: palette(highlighted-text);
            }
            QMenu::separator {
                height: 1px;
                background: palette(mid);
                margin: 4px 10px;
            }
        """)

        # 1. Opcja resetowania filtra
        action_clear = QAction("❌ Wyczyść filtr", self)
        action_clear.setData(None)
        menu.addAction(action_clear)
        menu.addSeparator()

        # 2. Dodawanie kategorii
        for cat in valid_cats:
            display_text = f"✔ {cat}" if cat == self.active_filter_cat else cat
            action = QAction(display_text, self)
            action.setData(cat)

            if cat == self.active_filter_cat:
                font = action.font()
                font.setBold(True)
                action.setFont(font)

            menu.addAction(action)

        # Wyświetlanie pod przyciskiem
        pos = self.btn_filter.mapToGlobal(QPoint(0, self.btn_filter.height()))
        selected_action = menu.exec(pos)

        if selected_action is not None:
            self.active_filter_cat = selected_action.data()
            # --- AKTUALIZACJA NAZWY PRZYCISKU ---
            if self.active_filter_cat:
                self.btn_filter.setText(f"🔍 {self.active_filter_cat}")
            else:
                self.btn_filter.setText(_("🔍 Filtruj"))
            # ------------------------------------
            self.load_transactions()

    def open_report_dialog(self):
        from reports import PDFReportGenerator
        from dialogs import ReportSelectionDialog
        from PySide6.QtWidgets import QMessageBox, QFileDialog
        import os

        if not self.pdf_gen: self.pdf_gen = PDFReportGenerator()
        d = ReportSelectionDialog(self)

        if d.exec():
            last_dir = self.settings.value("last_report_dir", os.path.expanduser("~"))
            fn = f"budzet_{d.selected_month_str.replace('-','_')}.pdf" if d.selected_type=="month" else f"bilans_{d.selected_year_str}.pdf"

            # 1. Tworzymy dialog, ale wyłączamy w nim automatyczne pytanie o nadpisanie
            dialog = QFileDialog(self, _("Zapisz"), os.path.join(last_dir, fn), "PDF (*.pdf)")
            dialog.setAcceptMode(QFileDialog.AcceptSave)
            dialog.setOption(QFileDialog.DontConfirmOverwrite, True) # TO WYŁĄCZA TO ZEPSUTE OKNO

            if dialog.exec() == QFileDialog.Accepted:
                path = dialog.selectedFiles()[0]

                if path:
                    # 2. Teraz sami pytamy o nadpisanie naszym ładnym oknem
                    if os.path.exists(path):
                        msg = QMessageBox(self)
                        msg.setIcon(QMessageBox.Question)
                        msg.setWindowTitle(_("Potwierdzenie"))
                        msg.setText(_("Plik już istnieje. Czy chcesz go zastąpić?"))
                        msg.setStandardButtons(QMessageBox.Yes | QMessageBox.No)

                        # Ręczne wymuszenie tekstu przycisków - to naprawia Twój znaczek
                        msg.button(QMessageBox.Yes).setText(_("Tak"))
                        msg.button(QMessageBox.No).setText(_("Nie"))

                        if msg.exec() == QMessageBox.No:
                            return # Użytkownik się rozmyślił

                    # 3. Jeśli wszystko OK, generujemy raport
                    self.settings.setValue("last_report_dir", os.path.dirname(path))
                    self.gen_rep(path, d.selected_month_str if d.selected_type=="month" else d.selected_year_str, d.selected_month_name, d.selected_type=="year")

    def gen_rep(self, path, d_str, m_name, ann):
        from PySide6.QtWidgets import QMessageBox

        tr = self.db.get_year_transactions(d_str) if ann else [t for t in self.db.get_all_transactions() if t[1].startswith(d_str)]

        t_txt = _("Raport Roczny {}").format(d_str) if ann else _("Raport Miesięczny: {} {}").format(m_name, d_str.split('-')[0])

        if not ann:
            first_day_of_month = f"{d_str}-01"
            prev_balance = self.db.get_net_balance_pln_before_date(first_day_of_month)
        else:
            first_day_of_year = f"{d_str}-01-01"
            prev_balance = self.db.get_net_balance_pln_before_date(first_day_of_year)

        exp, sav, lia, deb, inc = {}, 0, 0, 0, 0
        for r in tr:
            v = r[5]
            ttype, tcat = r[2], r[3]
            if ttype == 'income': inc += v
            elif ttype == 'expense': exp[tcat] = exp.get(tcat, 0) + v
            elif ttype in ['savings', 'goal_deposit']: sav += v
            elif ttype == 'savings_migration':
                if v > 0: sav += v # Sumujemy tylko wejście do oszczędności
            elif ttype == 'liability_repayment': lia += v
            elif ttype == 'debtor_repayment': deb += v

        # --- 5. OBLICZANIE STANU KONT (LUSTRO TWOJEGO DASHBOARDU) ---
        raw_accounts = self.db.get_accounts()
        acc_data = []

        # Twoja logika z load_transactions używa m_str (np. 2026-04)
        # do filtrowania transakcji "z poprzedniego miesiąca" i bieżących.
        # Aby uzyskać stan "na teraz" zgodny z GUI:

        for acc_id, acc_name, initial_bal, unused_clr in raw_accounts:
            # 1. Pobieramy wszystkie transakcje dla tego konta (bez limitu daty, jak w GUI)
            cursor = self.db.conn.execute(
                "SELECT type, amount FROM transactions WHERE account_id=?", (acc_id,)
            )
            acc_history = cursor.fetchall()

            # 2. Logika IDENTYCZNA z Twoim load_transactions:
            # Dashboard sumuje TYLKO te typy:
            acc_inc = sum(r[1] for r in acc_history if r[0] in ['income', 'debtor_repayment'])
            acc_exp = sum(r[1] for r in acc_history if r[0] in ['expense', 'liability_repayment', 'savings'])

            # Dashboard IGNORUJE savings_migration i goal_deposit w saldzie konta!
            acc_bal = initial_bal + acc_inc - acc_exp

            print(f"DEBUG SYNC: {acc_name} -> {acc_bal}")
            acc_data.append((acc_id, acc_name, acc_bal))

        # 6. Generowanie raportu
        success = self.pdf_gen.generate(
            filename=path,
            title=t_txt,
            transactions=tr,
            prev_balance=prev_balance,
            liabilities_status=self.db.get_liabilities_status(),
            accounts_data=acc_data
        )

        if success:
            QMessageBox.information(self, _("Sukces"), _("Zapisano: {}").format(path))

    def update_goals_display(self):
        self._clear_layout_safely(self.goals_list_layout)

        # 2. Pobieranie danych
        goals_data = self.db.get_goals_progress_simple()

        # --- LOGIKA POKAZYWANIA/UKRYWANIA ---
        if not goals_data:
            self.goals_box.hide()
            return
        else:
            self.goals_box.show()
        # ------------------------------------

        for g in goals_data:
            g_id, name, target, current = g['id'], g['name'], g['target'], g['collected']

            # Główny kontener elementu (analogicznie do dłużników)
            w = QWidget()
            v = QVBoxLayout(w)
            v.setContentsMargins(0, 0, 0, 8)
            v.setSpacing(2)

            # Górny pasek: Nazwa celu + Przycisk X
            h_top = QHBoxLayout()
            lbl = QLabel(_("{}: {:.2f} / {:.0f} zł").format(name, current, target))
            lbl.setStyleSheet("font-size: 11px;")

            btn_del = QPushButton("x")
            btn_del.setFixedSize(16, 16)
            btn_del.setCursor(Qt.PointingHandCursor)
            btn_del.setStyleSheet("border: none; color: gray; font-weight: bold;")
            btn_del.clicked.connect(lambda checked, gid=g_id, gn=name: self.delete_goal_handler(gid, gn))

            h_top.addWidget(lbl)
            h_top.addStretch()
            h_top.addWidget(btn_del)

            # Pasek postępu (wysokość 10px, ujednolicony styl)
            pbar = QProgressBar()
            pbar.setFixedHeight(10)

            if target > 0:
                percent = int((current / target) * 100)
            else:
                percent = 0

            # Ograniczenie do 100% dla paska, ale zachowanie realnej wartości w tekście powyżej
            visual_percent = min(100, percent)
            pbar.setValue(visual_percent)

            # Zielony jeśli osiągnięto cel, niebieski jeśli w trakcie
            color = "#2ecc71" if percent >= 100 else "#3498db"
            pbar.setStyleSheet(f"""
                QProgressBar {{
                    border: 1px solid #ccc;
                    border-radius: 4px;
                    background-color: transparent;
                }}
                QProgressBar::chunk {{
                    background-color: {color};
                    border-radius: 3px;
                }}
            """)
            pbar.setTextVisible(False)

            v.addLayout(h_top)
            v.addWidget(pbar)

            self.goals_list_layout.addWidget(w)

    def delete_goal_handler(self, goal_id, goal_name):
        msg = QMessageBox(); msg.setWindowTitle(_("Usuń cel")); msg.setText(_("Czy na pewno chcesz usunąć cel: {}?").format(goal_name))
        msg.setInformativeText(_("Historia wpłat pozostanie w systemie, ale cel zniknie z listy."))
        msg.setStandardButtons(QMessageBox.Yes | QMessageBox.No)
        if msg.exec() == QMessageBox.Yes: self.db.delete_goal(goal_id); self.schedule_update()

    def update_liabilities_display(self):
        self._clear_layout_safely(self.liabilities_layout)

        debts = self.db.get_liabilities_status()

        # Licznik faktycznie aktywnych długów (kwota > 0)
        active_count = 0
        today = datetime.now().date()

        for d in debts:
            rem = d['total'] - d['paid']
            if rem <= 0: continue  # Pomijamy spłacone

            active_count += 1 # Znaleźliśmy dług do spłacenia

            w = QWidget(); v = QVBoxLayout(w); v.setContentsMargins(0, 0, 0, 8); v.setSpacing(2)
            try:
                deadline_dt = datetime.strptime(d['deadline'], "%Y-%m-%d").date()
                delta = (deadline_dt - today).days
                if delta < 0: status_text = _("PRZETERMINOWANE: {} dni").format(abs(delta)); col = "#e74c3c"; is_overdue=True
                else:
                    weeks = delta // 7; days = delta % 7
                    status_text = _("Pozostało: {} tyg. i {} dni").format(weeks, days) if weeks > 0 else _("Pozostało: {} dni").format(days)
                    col = "#7f8c8d"; is_overdue=False
            except: status_text = _("Błąd daty"); col = "gray"; is_overdue=False

            h_top = QHBoxLayout()
            # ZMIANA: Używamy ClickableDebtLabel zamiast zwykłego QLabel
            info_lbl = ClickableDebtLabel(f"• {d['name']}: {rem:.2f} zł", d['id'], 'lia')
            info_lbl.clicked.connect(self.show_debt_details)
            info_lbl.setStyleSheet("font-size: 11px;")
            btn_del = QPushButton("x"); btn_del.setFixedSize(16, 16); btn_del.setStyleSheet("border: none; color: gray; font-weight: bold;")
            btn_del.clicked.connect(lambda ch, lid=d['id']: self.delete_liability(lid))
            h_top.addWidget(info_lbl); h_top.addStretch(); h_top.addWidget(btn_del)

            pbar = QProgressBar(); pbar.setFixedHeight(10); percent = int((d['paid'] / d['total']) * 100) if d['total'] > 0 else 0; pbar.setValue(percent)
            chunk_color = "#e57373" if is_overdue else "#3498db"
            pbar.setStyleSheet(f"QProgressBar {{ border: 1px solid #ccc; border-radius: 4px; background-color: transparent; }} QProgressBar::chunk {{ background-color: {chunk_color}; border-radius: 3px; }}"); pbar.setTextVisible(False)
            status_lbl = QLabel(status_text); status_lbl.setStyleSheet(f"font-size: 10px; color: {col}; font-style: italic;")
            v.addLayout(h_top); v.addWidget(pbar); v.addWidget(status_lbl); self.liabilities_layout.addWidget(w)

        # KLUCZOWY MOMENT: Pokazujemy ramkę tylko, jeśli licznik > 0
        self.lia_box.setVisible(active_count > 0)

    def delete_liability(self, lid):
        if QMessageBox.Yes == QMessageBox.question(self, _("Usuń"), _("Usunąć ten dług z listy? (Historia wpłat zostanie)")):
            self.db.delete_liability(lid); self.schedule_update()

    def export_selected_to_pdf(self):
        from config import _
        from PySide6.QtWidgets import QFileDialog, QMessageBox, QDialog, QVBoxLayout, QHBoxLayout, QLabel, QPushButton
        from PySide6.QtGui import QColor
        from reportlab.lib.pagesizes import A4
        from reportlab.lib import colors
        from reportlab.platypus import SimpleDocTemplate, Table, TableStyle, Paragraph, Spacer
        from reportlab.lib.styles import ParagraphStyle
        from reportlab.pdfbase import pdfmetrics
        from reportlab.pdfbase.ttfonts import TTFont
        from reportlab.pdfgen import canvas
        import os
        import io

        # --- KOMPLETNE IMPORTY DO ŁĄCZENIA PLIKÓW I OBRAZÓW ---
        try:
            # Próba dla najnowszego pypdf (Arch Linux / Python 3.14)
            try:
                from pypdf import PdfWriter as PdfMerger, PdfReader
            except ImportError:
                from pypdf import PdfMerger, PdfReader
        except ImportError:
            # Fallback dla starszych wersji PyPDF2
            try:
                from PyPDF2 import PdfMerger, PdfReader
            except ImportError:
                QMessageBox.critical(self, _("Błąd"), _("Brak biblioteki pypdf. Zainstaluj ją: sudo pacman -S python-pypdf"))
                return

        try:
            from PIL import Image
        except ImportError:
            QMessageBox.critical(self, _("Błąd"), _("Brak biblioteki Pillow. Zainstaluj ją: sudo pacman -S python-pillow"))
            return
        # ----------------------------------------------------

        selected_indexes = self.table.selectionModel().selectedRows()
        if not selected_indexes:
            QMessageBox.warning(self, _("Błąd"), _("Proszę najpierw zaznaczyć transakcje w tabeli."))
            return

        path, filter_name = QFileDialog.getSaveFileName(
            self, _("Zapisz jako PDF"),
            os.path.expanduser("~/potwierdzenie_transakcji.pdf"),
            "PDF Files (*.pdf)",
            options=QFileDialog.DontConfirmOverwrite
        )

        if not path:
            return

        # --- OSTATECZNY FIX: Własne okno zamiast QMessageBox ---
        if os.path.exists(path):
            from PySide6.QtWidgets import QDialog, QVBoxLayout, QHBoxLayout, QLabel, QPushButton

            diag = QDialog(self)
            diag.setWindowTitle(_("Potwierdzenie"))
            diag_layout = QVBoxLayout(diag)

            diag_layout.addWidget(QLabel(_('Plik "{}" już istnieje. Czy chcesz go zastąpić?').format(os.path.basename(path))))

            btn_layout = QHBoxLayout()
            btn_yes = QPushButton(_("Tak"))
            btn_no = QPushButton(_("Nie"))

            # Stylizujemy przyciski, żeby wyglądały jak standardowe
            btn_yes.setFixedWidth(80)
            btn_no.setFixedWidth(80)

            btn_layout.addStretch()
            btn_layout.addWidget(btn_yes)
            btn_layout.addWidget(btn_no)
            diag_layout.addLayout(btn_layout)

            # Logika przycisków
            btn_yes.clicked.connect(diag.accept)
            btn_no.clicked.connect(diag.reject)

            if diag.exec() == QDialog.Rejected:
                return # Użytkownik kliknął Nie lub zamknął okno

        try:
            # --- REJESTRACJA CZCIONEK ---
            font_name = 'Helvetica'
            bold_font_name = 'Helvetica-Bold'
            paths = ["/usr/share/fonts/TTF/DejaVuSans.ttf", "/usr/share/fonts/dejavu/DejaVuSans.ttf", "DejaVuSans.ttf"]
            b_paths = ["/usr/share/fonts/TTF/DejaVuSans-Bold.ttf", "/usr/share/fonts/dejavu/DejaVuSans-Bold.ttf", "DejaVuSans-Bold.ttf"]

            for p in paths:
                if os.path.exists(p):
                    pdfmetrics.registerFont(TTFont('DejaVuSans', p))
                    font_name = 'DejaVuSans'
                    break
            for p in b_paths:
                if os.path.exists(p):
                    pdfmetrics.registerFont(TTFont('DejaVuSans-Bold', p))
                    bold_font_name = 'DejaVuSans-Bold'
                    break
                else:
                    bold_font_name = font_name

            # --- NOWA LOGIKA: Bufor zamiast pliku ---
            # doc = SimpleDocTemplate(path, pagesize=A4) # ZAKOMENTOWANE
            main_pdf_buffer = io.BytesIO()
            doc = SimpleDocTemplate(main_pdf_buffer, pagesize=A4)

            elements = []
            polish_style = ParagraphStyle('PolishStyle', fontName=font_name, fontSize=10, leading=12)
            title_style = ParagraphStyle('TitleStyle', fontName=font_name, fontSize=16, alignment=1)

            elements.append(Paragraph(_("Zestawienie wybranych transakcji"), title_style))
            elements.append(Spacer(1, 20))

            # --- NAGŁÓWEK TABELI (Dodajemy kolumnę Nr) ---
            data = [[_("Nr"), _("Data"), _("Typ"), _("Kategoria / Cel"), _("Szczegóły"), _("Kwota")]]

            total_inc = 0.0
            total_exp = 0.0

            selected_rows = sorted([idx.row() for idx in selected_indexes])

            # Lista do przechowywania ID transakcji z plikami do doklejenia
            files_to_attach = []

            for row in selected_rows:
                tid = int(self.table.item(row, 0).text())
                date = self.table.item(row, 1).text()
                t_display_type = self.table.item(row, 2).text()
                cat = self.table.item(row, 3).text()

                # --- NOWA LOGIKA: OBLICZANIE NUMERU W MIESIĄCU DLA TABELI ---
                rok_miesiac = date[:7]
                all_rows_in_month = []
                for r in range(self.table.rowCount()):
                    row_date = self.table.item(r, 1).text()
                    if row_date.startswith(rok_miesiac):
                        all_rows_in_month.append(int(self.table.item(r, 0).text()))

                all_rows_in_month.reverse() # Ta sama logika co w załącznikach
                try:
                    num_in_month = all_rows_in_month.index(tid) + 1
                except ValueError:
                    num_in_month = "???"
                # ----------------------------------------------------------

                details_item = self.table.item(row, 5)
                details_text = details_item.text().replace("📎", "").strip() if details_item else ""

                # Sprawdzamy czy jest spinacz (załącznik) w opisie
                if details_item and "📎" in details_item.text():
                    files_to_attach.append({'id': tid, 'date': date, 'cat': cat})

                amt_item = self.table.item(row, 4)
                if not amt_item: continue

                # Pobieramy czystą liczbę
                amt_str = amt_item.text().replace(" zł", "").replace(" ", "").replace(",", ".")
                try:
                    val = abs(float(amt_str))
                except:
                    val = 0.0

                # --- KLUCZOWA POPRAWKA: Rozpoznawanie po kolorze lub nazwie ---
                is_income = False
                cell_color = amt_item.foreground().color()

                if cell_color.name().lower() in ["#27ae60", "#2ecc71"]:
                    is_income = True
                elif any(x in t_display_type.lower() for x in ["wpływ", "przychód", "zwrot", "repayment", "income"]):
                    is_income = True

                if is_income:
                    total_inc += val
                    display_val = f"{val:.2f}"
                else:
                    total_exp += val
                    display_val = f"-{val:.2f}"

                # Dodajemy num_in_month na początek wiersza
                data.append([str(num_in_month), date, t_display_type, cat, Paragraph(details_text, polish_style), display_val])

            # Pusty wiersz separatora
            data.append(["", "", "", "", ""])

            # Podsumowanie
            if total_inc > 0:
                data.append(["", "", "", _("SUMA WPŁYWÓW:"), f"{total_inc:.2f} zł"])
            if total_exp > 0:
                data.append(["", "", "", _("SUMA WYDATKÓW:"), f"-{total_exp:.2f} zł"])

            if total_inc > 0 and total_exp > 0:
                balance = total_inc - total_exp
                data.append(["", "", "", _("BILANS:"), f"{balance:.2f} zł"])

            # --- STYLIZACJA ---
            t = Table(data, colWidths=[30, 65, 75, 90, 180, 80])

            footer_rows = 0
            if total_inc > 0: footer_rows += 1
            if total_exp > 0: footer_rows += 1
            if total_inc > 0 and total_exp > 0: footer_rows += 1

            ts = TableStyle([
                ('BACKGROUND', (0, 0), (-1, 0), colors.grey),
                ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
                ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
                ('FONTNAME', (0, 0), (-1, -1), font_name),
                ('FONTSIZE', (0, 0), (-1, -1), 10),
                # GRID rysuje siatkę od początku do wiersza przed podsumowaniem
                ('GRID', (0, 0), (-1, -(footer_rows + 1)), 0.5, colors.grey),
                ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),

                # POPRAWIONE INDEKSY:
                # Kolumna 4 (wcześniej 3) to "Szczegóły" -> do lewej
                ('ALIGN', (4, 1), (4, -1), 'LEFT'),
                # Kolumna 5 (wcześniej 4) to "Kwota" -> do prawej
                ('ALIGN', (5, 1), (5, -1), 'RIGHT'),
            ])

            # Pogrubienie wierszy podsumowania dla kolumn od "Szczegóły" do końca
            if footer_rows > 0:
                ts.add('FONTNAME', (4, -footer_rows), (-1, -1), bold_font_name)

            t.setStyle(ts)
            elements.append(t)
            doc.build(elements)

            # --- NOWE: ŁĄCZENIE Z ZAŁĄCZNIKAMI ---
            merger = PdfMerger()
            main_pdf_buffer.seek(0)
            merger.append(main_pdf_buffer)

            # --- SŁOWNIK MIESIĘCY ---
            miesiace = {
                '01': 'stycznia', '02': 'lutego', '03': 'marca', '04': 'kwietnia',
                '05': 'maja', '06': 'czerwca', '07': 'lipca', '08': 'sierpnia',
                '09': 'września', '10': 'października', '11': 'listopada', '12': 'grudnia'
            }

            # --- PĘTLA DLA ZAŁĄCZNIKÓW ---
            for f_info in files_to_attach:
                raw_bytes = self.db.get_attachment(f_info['id'])
                if not raw_bytes: continue

                try:
                    # 1. Obliczamy numer transakcji w miesiącu
                    rok_miesiac = f_info['date'][:7]
                    all_rows_in_month = []
                    for r in range(self.table.rowCount()):
                        row_date = self.table.item(r, 1).text()
                        if row_date.startswith(rok_miesiac):
                            all_rows_in_month.append(int(self.table.item(r, 0).text()))

                    all_rows_in_month.reverse()
                    try:
                        num = all_rows_in_month.index(f_info['id']) + 1
                    except ValueError:
                        num = "???"

                    # 2. Formatowanie daty
                    d = f_info['date'][8:10].lstrip('0')
                    m_idx = f_info['date'][5:7]
                    y = f_info['date'][:4]
                    data_str = f"{d} {miesiace.get(m_idx, '')} {y}"
                    tekst_naglowka = f"ZAŁĄCZNIK DO TRANSAKCJI nr {num} | z dnia {data_str}"

                    # 3. Wczytujemy stronę
                    if raw_bytes.startswith(b"%PDF"):
                        input_pdf = PdfReader(io.BytesIO(raw_bytes))
                        page = input_pdf.pages[0]
                    else:
                        img = Image.open(io.BytesIO(raw_bytes))
                        if img.mode != 'RGB': img = img.convert('RGB')
                        img_pdf_buf = io.BytesIO()
                        img.save(img_pdf_buf, format="PDF")
                        img_pdf_buf.seek(0)
                        img_reader = PdfReader(img_pdf_buf)
                        page = img_reader.pages[0]

                    # --- KLUCZOWA POPRAWKA: DYNAMICZNE SKALOWANIE ---
                    # Pobieramy fizyczne wymiary strony (w punktach lub pikselach)
                    p_width = float(page.mediabox.width)
                    p_height = float(page.mediabox.height)

                    # Ustawiamy rozmiar czcionki na 1.8% szerokości strony
                    # Dzięki temu na dużym zdjęciu napis będzie odpowiednio wielki
                    dynamic_font_size = p_width * 0.018

                    # Marginesy (3% szerokości i wysokości)
                    margin_x = p_width * 0.03
                    margin_y = p_height * 0.03

                    overlay_buffer = io.BytesIO()
                    # Tworzymy canvas o wymiarach DOKŁADNIE takich jak strona załącznika
                    c = canvas.Canvas(overlay_buffer, pagesize=(p_width, p_height))

                    # Ustawiamy czcionkę (używamy zarejestrowanej DejaVuSans-Bold)
                    c.setFont(bold_font_name, dynamic_font_size)
                    c.setFillColorRGB(0.3, 0.3, 0.3) # Ciemnoszary, profesjonalny

                    # Rysujemy napis.
                    # X: Szerokość strony minus margines (wyrównanie do prawej)
                    # Y: Wysokość strony minus margines minus rozmiar czcionki
                    c.drawRightString(p_width - margin_x, p_height - (margin_y + dynamic_font_size), tekst_naglowka)
                    c.save()

                    overlay_buffer.seek(0)
                    overlay_reader = PdfReader(overlay_buffer)

                    # Nakładamy przezroczystą warstwę z napisem na stronę załącznika
                    page.merge_page(overlay_reader.pages[0])

                    # Dodajemy gotową stronę do dokumentu finalnego
                    merger.add_page(page)

                except Exception as e:
                    print(f"Błąd stemplowania ID {f_info['id']}: {e}")

            # Zapis końcowy na dysk
            with open(path, "wb") as f_final:
                merger.write(f_final)
            merger.close()
            # --------------------------------------

            QMessageBox.information(self, _("Sukces"), _("PDF został wygenerowany pomyślnie (wraz z załącznikami)."))

        except Exception as e:
            QMessageBox.warning(self, _("Błąd"), f"{_('Błąd generowania PDF')}: {str(e)}")


    def closeEvent(self, e):
        import time
        from dialogs import ProcessingDialog
        from config import save_table_widths  # Import tutaj lub na górze pliku

        if self.guide:
            self.guide.stop_guide()
            self.guide = None

        if self.current_account_history_dialog:
            self.current_account_history_dialog.close()
            self.current_account_history_dialog = None

        self.update_timer.stop()
        if hasattr(self, "search_timer"):
            self.search_timer.stop()

        # 1. ZAPIS SZEROKOŚCI KOLUMN (Indeksy 1-4, bo 5 jest Stretch, a 0 ukryte)
        try:
            widths = {
                1: self.table.columnWidth(1),
                2: self.table.columnWidth(2),
                3: self.table.columnWidth(3),
                4: self.table.columnWidth(4)
            }
            save_table_widths(widths)
        except Exception as err:
            print(f"Problem przy pobieraniu szerokości kolumn: {err}")

        # 2. ZAPIS USTAWIEŃ OKNA I DATY
        self.settings.setValue("geometry", self.saveGeometry())
        self.settings.setValue("windowState", self.saveState())
        self.settings.setValue("last_year", self.current_year)
        self.settings.setValue("last_month", self.current_month)

        # 3. AUTOMATYCZNY BACKUP
        cfg = self.db.get_config("backup_config")
        if cfg and cfg.get("auto_backup"):
            pd = ProcessingDialog(self, _("Zamykanie"), _("Backup..."))
            pd.show()
            QApplication.processEvents()
            time.sleep(0.5)
            self.db.perform_backup()
            pd.close()

        e.accept()

    def run_guide(self):
        if self.guide:
            self.guide.stop_guide()
        self.guide = AppGuide(self)
        self.guide.start()

if __name__ == "__main__":
    setup_crash_handlers()
    app = QApplication(sys.argv)
    app.setStyle("Fusion")
    class HardcodedSystemTranslator(QTranslator):
        def __init__(self):
            super().__init__()
            self.translations = {
                "&Yes": "Tak", "Yes": "Tak", "&No": "Nie", "No": "Nie", "&Cancel": "Anuluj", "Cancel": "Anuluj",
                "&OK": "OK", "OK": "OK", "&Save": "Zapisz", "Save": "Zapisz", "&Open": "Otwórz", "Open": "Otwórz",
                "&Close": "Zamknij", "Close": "Zamknij", "Apply": "Zastosuj", "Reset": "Resetuj", "&Discard": "Porzuć",
                "Discard": "Porzuć", "Help": "Pomoc", "&Help": "Pomoc", "Show Details...": "Pokaż szczegóły...",
                "Hide Details...": "Ukryj szczegóły...", "AM": "AM", "PM": "PM", "Look in:": "Szukaj w:",
                "File name:": "Nazwa pliku:", "Files of type:": "Pliki typu:", "All Files (*)": "Wszystkie pliki (*)",
                "Back": "Wstecz", "Parent Directory": "Katalog nadrzędny", "Create New Folder": "Utwórz nowy folder",
                "List View": "Lista", "Detail View": "Szczegóły",
                "%1 already exists.\nDo you want to replace it?": "%1 już istnieje.\nCzy chcesz go nadpisać?",
                "The file %1 already exists.\nDo you want to replace it?": "Plik %1 już istnieje.\nCzy chcesz go nadpisać?",
                "%1\nFile not found.\nPlease verify the correct file name was given.": "%1\nNie znaleziono pliku.\nSprawdź, czy podana nazwa jest poprawna.",
                "Could not delete directory.": "Nie można usunąć katalogu.", "New Folder": "Nowy folder", "Directory:": "Katalog:"
            }
        def translate(self, context, source_text, disambiguation=None, n=-1):
            if source_text in self.translations: return self.translations[source_text]
            return ""
    if QLocale.system().language() == QLocale.Language.Polish:
        manual_translator = HardcodedSystemTranslator()
        app.installTranslator(manual_translator)
        app._manual_translator_ref = manual_translator
    desktop_id = os.environ.get("APP_ID", "budget-app")
    app.setDesktopFileName(desktop_id)
    app.setWindowIcon(QIcon(icon_path))
    w = BudgetApp()
    w.show()
    sys.exit(app.exec())
