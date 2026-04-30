import sqlite3
import os
import json
import uuid
from datetime import datetime, timedelta
from config import APP_DIR

class DatabaseManager:
    def __init__(self, db_name="budzet.db"):
        self.db_path = os.path.join(APP_DIR, db_name)

        # --- NOWE: Folder na załączniki ---
        self.attachments_dir = os.path.join(APP_DIR, "attachments")
        if not os.path.exists(self.attachments_dir):
            os.makedirs(self.attachments_dir, exist_ok=True)

        self.conn = sqlite3.connect(self.db_path)
        self.create_tables()
        self.update_goals_table_structure()
        self.run_fix_savings_names()
        self.initialize_config()

    def create_tables(self):
        # 1. Podstawowe tabele
        self.conn.execute("""
        CREATE TABLE IF NOT EXISTS transactions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date TEXT, type TEXT, category TEXT, subcategory TEXT,
            amount REAL, currency TEXT, exchange_rate REAL,
            exclude_from_weekly INTEGER DEFAULT 0,
            details TEXT DEFAULT '',
            attachment TEXT,
            ref_id INTEGER
        )""")
        self.conn.execute("CREATE TABLE IF NOT EXISTS people (name TEXT PRIMARY KEY)")
        self.conn.execute("INSERT OR IGNORE INTO people VALUES ('Mąż')")
        self.conn.execute("INSERT OR IGNORE INTO people VALUES ('Żona')")
        self.conn.execute("CREATE TABLE IF NOT EXISTS month_locks (month_str TEXT PRIMARY KEY)")
        self.conn.execute("CREATE TABLE IF NOT EXISTS categories (name TEXT PRIMARY KEY)")
        self.conn.execute("CREATE TABLE IF NOT EXISTS goals (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT UNIQUE, target_amount REAL)")

        # 2. Długi i Dłużnicy - Definicja (bez UNIQUE)
        self.conn.execute("CREATE TABLE IF NOT EXISTS liabilities (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, total_amount REAL, deadline TEXT)")
        self.conn.execute("CREATE TABLE IF NOT EXISTS debtors (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, total_amount REAL, deadline TEXT)")

        # --- MIGRACJA: USUNIĘCIE BLOKADY UNIQUE (NAPRAWA BŁĘDU) ---
        for table in ["liabilities", "debtors"]:
            try:
                cursor = self.conn.execute(f"SELECT sql FROM sqlite_master WHERE type='table' AND name='{table}'")
                sql_def = cursor.fetchone()[0]
                if "UNIQUE" in sql_def.upper():
                    print(f"Naprawiam strukturę tabeli {table} (usuwam UNIQUE)...")
                    # Tworzymy kopię bez UNIQUE
                    self.conn.execute(f"CREATE TABLE {table}_new (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, total_amount REAL, deadline TEXT)")
                    # Przepisujemy dane
                    self.conn.execute(f"INSERT INTO {table}_new SELECT id, name, total_amount, deadline FROM {table}")
                    # Zamieniamy tabele
                    self.conn.execute(f"DROP TABLE {table}")
                    self.conn.execute(f"ALTER TABLE {table}_new RENAME TO {table}")
            except Exception as e:
                print(f"Info: Tabela {table} jest już poprawna lub: {e}")

        # 3. Pozostałe tabele systemowe
        self.conn.execute("CREATE TABLE IF NOT EXISTS app_config (key TEXT PRIMARY KEY, value TEXT)")
        self.conn.execute("CREATE TABLE IF NOT EXISTS shopping_lists (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, created_at TEXT, status TEXT DEFAULT 'open')")
        self.conn.execute("""
            CREATE TABLE IF NOT EXISTS shopping_items (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                list_id INTEGER,
                product_name TEXT,
                quantity TEXT,
                store TEXT DEFAULT '',
                is_checked INTEGER DEFAULT 0,
                FOREIGN KEY(list_id) REFERENCES shopping_lists(id) ON DELETE CASCADE
            )
        """)

        # --- MIGRACJE KOLUMN (Try-Except) ---
        migrations = [
            ("shopping_items", "store", "TEXT DEFAULT ''"),
            ("transactions", "exclude_from_weekly", "INTEGER DEFAULT 0"),
            ("transactions", "details", "TEXT DEFAULT ''"),
            ("transactions", "attachment", "TEXT"),
            ("transactions", "ref_id", "INTEGER"),
            # --- DODAJ TE DWIE LINIE PONIŻEJ ---
            ("liabilities", "attachment", "TEXT"),
            ("debtors", "attachment", "TEXT")
        ]
        for table, col, col_def in migrations:
            try:
                self.conn.execute(f"ALTER TABLE {table} ADD COLUMN {col} {col_def}")
            except: pass

        # --- NAPRAWA STARYCH POWIĄZAŃ (OPCJA A) ---
        self.conn.execute("""
            UPDATE transactions
            SET ref_id = (SELECT id FROM liabilities WHERE liabilities.name = transactions.subcategory)
            WHERE type = 'liability_repayment' AND ref_id IS NULL
        """)
        self.conn.execute("""
            UPDATE transactions
            SET ref_id = (SELECT id FROM debtors WHERE debtors.name = transactions.subcategory)
            WHERE type = 'debtor_repayment' AND ref_id IS NULL
        """)

        # 4. Dane domyślne (Shops & Categories)
        self.conn.execute("CREATE TABLE IF NOT EXISTS shops (name TEXT PRIMARY KEY)")
        if self.conn.execute("SELECT count(*) FROM shops").fetchone()[0] == 0:
            for s in ["Biedronka", "Dino", "Lidl", "Polo", "Kaufland", "Apteka", "Rossmann", "Pepco"]:
                self.conn.execute("INSERT OR IGNORE INTO shops VALUES (?)", (s,))

        if self.conn.execute("SELECT count(*) FROM categories").fetchone()[0] == 0:
            for d in ["Zakupy", "Remonty", "Spłata Długu", "Samochód", "Ciuchy", "Opłaty", "Rozrywka", "Inne", "Zdrowie", "Pożyczki"]:
                self.conn.execute("INSERT OR IGNORE INTO categories VALUES (?)", (d,))

        # 5. Tabele historii i rachunków
        self.conn.execute("CREATE TABLE IF NOT EXISTS weekly_history (monday_date TEXT PRIMARY KEY, amount REAL, categories TEXT)")
        self.conn.execute("""
            CREATE TABLE IF NOT EXISTS pending_bills (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                due_date TEXT, amount REAL, category TEXT, description TEXT, is_paid INTEGER DEFAULT 0
            )
        """)

        # --- TABELA KONT ---
        # 1. Tworzymy tabelę w podstawowej formie (jeśli nie istnieje)
        self.conn.execute("""
            CREATE TABLE IF NOT EXISTS accounts (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT UNIQUE,
                initial_balance REAL DEFAULT 0.0
            )
        """)

        # 2. MIGRACJA: Dodajemy kolumnę color ZANIM zrobimy INSERT
        # To naprawia błąd OperationalError w istniejących bazach
        try:
            self.conn.execute("ALTER TABLE accounts ADD COLUMN color TEXT DEFAULT '#7f8c8d'")
        except:
            pass # Kolumna już istnieje

        # 3. Teraz bezpiecznie dodajemy domyślne konto "Gotówka"
        self.conn.execute("""
            INSERT OR IGNORE INTO accounts (name, initial_balance, color)
            VALUES ('Gotówka', 0.0, '#27ae60')
        """)

        # --- POZOSTAŁE MIGRACJE ---

        # Migracja tabeli transakcji - dodajemy kolumnę account_id
        try:
            self.conn.execute("ALTER TABLE transactions ADD COLUMN account_id INTEGER")
            # Przypisujemy stare transakcje do konta 'Gotówka' (id=1)
            self.conn.execute("UPDATE transactions SET account_id = 1 WHERE account_id IS NULL")
        except:
            pass

        # Tabela modułów
        self.conn.execute("""
            CREATE TABLE IF NOT EXISTS modules (
                module_name TEXT PRIMARY KEY,
                is_enabled INTEGER DEFAULT 1
            )
        """)

        # Inicjalizacja domyślnych modułów
        self.conn.execute("INSERT OR IGNORE INTO modules VALUES ('shopping_list', 1)")
        self.conn.execute("INSERT OR IGNORE INTO modules VALUES ('weekly_limit', 1)")

        self.conn.commit()

    def initialize_config(self):
        if not self.get_config("backup_config"):
            self.save_config("backup_config", {"auto_backup": False, "backup_path": os.path.join(APP_DIR, "backups")})
        if not self.get_config("weekly_limit_config"):
            self.save_config("weekly_limit_config", {"enabled": False, "amount": 500.0, "categories": self.get_categories()})

    def get_config(self, key):
        cursor = self.conn.execute("SELECT value FROM app_config WHERE key=?", (key,))
        res = cursor.fetchone()
        if res:
            try: return json.loads(res[0])
            except: return res[0]
        return None

    def save_config(self, key, value):
        json_val = json.dumps(value)
        self.conn.execute("INSERT OR REPLACE INTO app_config (key, value) VALUES (?, ?)", (key, json_val))
        self.conn.commit()

    # --- TUTAJ DODAJEMY NOWE METODY ---

    def get_config_bool(self, key, default=True):
        """Pobiera wartość konfiguracji jako True/False."""
        res = self.get_config(key)
        if res is None: return default
        # Sprawdzamy różne warianty zapisu prawdy w SQLite
        return str(res).lower() in ['true', '1', 'yes', 't', 'y']

    def set_config(self, key, value):
        """Zapisuje prostą wartość (np. bool lub string) do konfiguracji."""
        # Konwertujemy na string "1"/"0" dla SQLite, co ułatwia późniejszy odczyt
        if isinstance(value, bool):
            val_to_save = "1" if value else "0"
        else:
            val_to_save = value

        self.conn.execute("INSERT OR REPLACE INTO app_config (key, value) VALUES (?, ?)", (key, val_to_save))
        self.conn.commit()

    # ----------------------------------

    def get_weekly_config(self):
        cfg = self.get_config("weekly_limit_config")
        if not cfg: return False, 0.0, None
        return cfg.get("enabled", False), cfg.get("amount", 0.0), cfg.get("categories", None)

    def run_fix_savings_names(self):
        """Jednorazowa poprawka nazw podkategorii oszczędności."""
        try:
            # Sprawdzamy, czy w ogóle mamy coś do poprawienia
            check = self.conn.execute(
                "SELECT COUNT(*) FROM transactions WHERE subcategory = 'Oszczędności gotówka'"
            ).fetchone()[0]

            if check > 0:
                self.conn.execute("BEGIN TRANSACTION")
                self.conn.execute(
                    "UPDATE transactions SET subcategory = 'Oszczędności' WHERE subcategory = 'Oszczędności gotówka'"
                )
                self.conn.commit()
                print(f"Sukces: Zaktualizowano {check} wpisów z 'Oszczędności gotówka' na 'Oszczędności'.")
            else:
                # Jeśli check == 0, to znaczy, że albo już to zrobiliśmy, albo nie było takich wpisów
                pass
        except Exception as e:
            self.conn.rollback()
            print(f"Błąd podczas aktualizacji nazw oszczędności: {e}")

    def update_goals_table_structure(self):
        """Dodaje brakującą kolumnę default_account_id do tabeli goals."""
        try:
            # Próbujemy dodać kolumnę. Jeśli już istnieje, SQLite rzuci błędem, który przechwycimy.
            self.conn.execute("ALTER TABLE goals ADD COLUMN default_account_id INTEGER")
            self.conn.commit()
            print("Sukces: Dodano kolumnę default_account_id do tabeli goals.")
        except Exception as e:
            # Jeśli błąd zawiera informację, że kolumna już jest, to ignorujemy go
            if "duplicate column name" in str(e).lower():
                pass
            else:
                print(f"Informacja: {e}")

    def _copy_with_progress(self, src, dst, progress_callback=None):
        """Kopiuje plik bajt po bajcie, informując o postępie."""
        import os
        total_size = os.path.getsize(src)
        current_size = 0
        chunk_size = 1024 * 1024  # 1MB

        with open(src, 'rb') as fsrc:
            with open(dst, 'wb') as fdst:
                while True:
                    chunk = fsrc.read(chunk_size)
                    if not chunk:
                        break
                    fdst.write(chunk)
                    current_size += len(chunk)
                    if progress_callback:
                        percent = int((current_size / total_size) * 100)
                        progress_callback(percent)

    def perform_backup(self, progress_callback=None):
        import os
        import zipfile
        from datetime import datetime
        from config import _

        cfg = self.get_config("backup_config")
        if not cfg: return False, _("Błąd konfiguracji")
        target_dir = cfg.get("backup_path", "")
        if not target_dir or not os.path.exists(target_dir):
            return False, _("Brak prawidłowej ścieżki backupu")

        filename = f"{datetime.now().strftime('%Y-%m-%d')}.zip"
        target_path = os.path.join(target_dir, filename)

        try:
            with zipfile.ZipFile(target_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
                zipf.write(self.db_path, "budzet.db")
                if progress_callback:
                    progress_callback(30)

                if os.path.exists(self.attachments_dir):
                    files = [f for f in os.listdir(self.attachments_dir) if os.path.isfile(os.path.join(self.attachments_dir, f))]
                    total_files = len(files)
                    for i, f in enumerate(files):
                        file_full_path = os.path.join(self.attachments_dir, f)
                        zipf.write(file_full_path, os.path.join("attachments", f))

                        if progress_callback and total_files > 0:
                            p = 30 + int((i + 1) / total_files * 70)
                            progress_callback(p)

            self._cleanup_backups(target_dir)
            return True, target_path
        except Exception as e:
            return False, str(e)

    def _cleanup_backups(self, folder):
        import glob
        import os
        try:
            files = glob.glob(os.path.join(folder, "*.zip"))
            files.sort(key=os.path.getmtime)
            while len(files) > 10:
                oldest = files.pop(0)
                os.remove(oldest)
        except: pass

    def restore_database(self, backup_file, progress_callback=None):
        import os
        import gc
        import zipfile
        import shutil
        import sqlite3
        if not os.path.exists(backup_file): return False

        try:
            self.conn.close()
            self.conn = None
            gc.collect()

            with zipfile.ZipFile(backup_file, 'r') as zipf:
                contents = zipf.namelist()

                if "budzet.db" not in contents:
                    raise ValueError("Nieprawidlowy plik kopii: brak budzet.db")

                if progress_callback:
                    progress_callback(20)

                zipf.extract("budzet.db", os.path.dirname(self.db_path))
                if progress_callback:
                    progress_callback(50)

                if os.path.exists(self.attachments_dir):
                    shutil.rmtree(self.attachments_dir)
                os.makedirs(self.attachments_dir, exist_ok=True)

                for member in contents:
                    if member.startswith("attachments/"):
                        zipf.extract(member, os.path.dirname(self.attachments_dir))

                if progress_callback:
                    progress_callback(100)

            self.conn = sqlite3.connect(self.db_path)
            self.create_tables()
            self.update_goals_table_structure()
            self.run_fix_savings_names()
            self.initialize_config()
            return True
        except Exception as e:
            print(f"Błąd przywracania: {e}")
            if not self.conn:
                self.conn = sqlite3.connect(self.db_path)
            return False

    def add_transaction(self, date, t_type, category, subcategory, amount, exclude=0, details="", attachment=None, ref_id=None, account_id=1, commit=True):
        filename = None
        if attachment and isinstance(attachment, bytes):
            filename = f"{uuid.uuid4().hex}.dat"
            with open(os.path.join(self.attachments_dir, filename), "wb") as f:
                f.write(attachment)

        self.conn.execute("""
            INSERT INTO transactions (
                date, type, category, subcategory, amount,
                currency, exchange_rate, exclude_from_weekly,
                details, attachment, ref_id, account_id
            )
            VALUES (?, ?, ?, ?, ?, 'PLN', 1.0, ?, ?, ?, ?, ?)""",
            (date, t_type, category, subcategory, amount, exclude, details, filename, ref_id, account_id))

        if commit:
            self.conn.commit()

    def transfer_savings(self, from_acc_id, to_acc_id, amount, goal_name):
        """Migracja oszczędności z pobieraniem nazw kont mBank/Gotówka zamiast ID."""
        from datetime import datetime
        try: from config import _
        except ImportError: _ = lambda x: x

        date_str = datetime.now().strftime("%Y-%m-%d")

        try:
            res_from = self.conn.execute("SELECT name FROM accounts WHERE id=?", (from_acc_id,)).fetchone()
            from_name = res_from[0] if res_from else str(from_acc_id)

            res_to = self.conn.execute("SELECT name FROM accounts WHERE id=?", (to_acc_id,)).fetchone()
            to_name = res_to[0] if res_to else str(to_acc_id)

            self.conn.execute("BEGIN TRANSACTION")

            self.add_transaction(
                date=date_str,
                t_type='savings_migration',
                category=_("Migracja oszczędności"),
                subcategory=_("Wypłata: {}").format(goal_name),
                amount=-amount,
                details=f"Przeniesiono do: {to_name}",
                account_id=from_acc_id,
                commit=False
            )

            self.add_transaction(
                date=date_str,
                t_type='savings_migration',
                category=_("Migracja oszczędności"),
                subcategory=_("Wpłata: {}").format(goal_name),
                amount=amount,
                details=f"Pobrano z: {from_name}",
                account_id=to_acc_id,
                commit=False
            )

            self.conn.commit()
            return True
        except Exception as e:
            if self.conn.in_transaction:
                self.conn.rollback()
            print(f"Błąd migracji oszczędności: {e}")
            return False

    def update_transaction(self, tid, tdate, ttype, tcat, tsub, tamt, tdetails, attachment=None):
        try:
            if attachment and isinstance(attachment, bytes):
                # Usuń stary plik jeśli istniał
                old = self.conn.execute("SELECT attachment FROM transactions WHERE id=?", (tid,)).fetchone()
                if old and old[0]:
                    old_path = os.path.join(self.attachments_dir, old[0])
                    if os.path.exists(old_path): os.remove(old_path)

                # Zapisz nowy plik
                filename = f"{uuid.uuid4().hex}.dat"
                with open(os.path.join(self.attachments_dir, filename), "wb") as f:
                    f.write(attachment)

                self.conn.execute("""
                    UPDATE transactions
                    SET date=?, type=?, category=?, subcategory=?, amount=?, details=?, attachment=?
                    WHERE id=?
                """, (tdate, ttype, tcat, tsub, tamt, tdetails, filename, tid))
            else:
                self.conn.execute("""
                    UPDATE transactions
                    SET date=?, type=?, category=?, subcategory=?, amount=?, details=?
                    WHERE id=?
                """, (tdate, ttype, tcat, tsub, tamt, tdetails, tid))
            self.conn.commit()
        except Exception as e:
            print(f"Błąd aktualizacji: {e}")

    def delete_transaction(self, t_id):
        # --- NOWE: Usuwanie pliku przy usuwaniu transakcji ---
        res = self.conn.execute("SELECT attachment FROM transactions WHERE id=?", (t_id,)).fetchone()
        if res and res[0]:
            file_path = os.path.join(self.attachments_dir, res[0])
            if os.path.exists(file_path):
                try: os.remove(file_path)
                except: pass

        self.conn.execute("DELETE FROM transactions WHERE id=?", (t_id,))
        self.conn.commit()

    def get_all_transactions(self):
        try:
            # Musimy pobrać account_id, żeby load_transactions wiedziało jak liczyć salda kont
            cursor = self.conn.execute("""
                SELECT id, date, type, category, subcategory, amount, details,
                CASE WHEN attachment IS NOT NULL AND attachment != '' THEN 1 ELSE 0 END,
                account_id
                FROM transactions
                ORDER BY date DESC, id DESC
            """)
            return cursor.fetchall()
        except sqlite3.OperationalError:
            return []

    def get_year_transactions(self, year_str):
        try:
            cursor = self.conn.execute("SELECT id, date, type, category, subcategory, amount FROM transactions WHERE date LIKE ? ORDER BY date", (f"{year_str}%",))
            return cursor.fetchall()
        except: return []

    def get_transaction_by_id(self, t_id):
        cursor = self.conn.execute("SELECT id, date, type, category, subcategory, amount, details FROM transactions WHERE id=?", (t_id,))
        return cursor.fetchone()

    def get_expenses_in_range(self, start_date, end_date, allowed_categories=None):
        query = """
            SELECT category, SUM(amount)
            FROM transactions
            WHERE type='expense'
            AND exclude_from_weekly = 0
            AND date >= ? AND date <= ?
        """
        params = [start_date, end_date]
        if allowed_categories is not None:
            if not allowed_categories: return []
            placeholders = ','.join('?' for _ in allowed_categories)
            query += f" AND category IN ({placeholders})"
            params.extend(allowed_categories)
        query += " GROUP BY category ORDER BY SUM(amount) DESC"
        return self.conn.execute(query, params).fetchall()

    def add_person(self, name):
        if name:
            self.conn.execute("INSERT OR IGNORE INTO people VALUES (?)", (name,))
            self.conn.commit()

    def add_category(self, name):
        if name:
            name = name.strip()
            self.conn.execute("INSERT OR IGNORE INTO categories VALUES (?)", (name,))
            cfg = self.get_config("weekly_limit_config")
            if cfg:
                if "categories" not in cfg or cfg["categories"] is None: cfg["categories"] = []
                if name not in cfg["categories"]:
                    cfg["categories"].append(name)
                    self.save_config("weekly_limit_config", cfg)

            today = datetime.now().date()
            monday = (today - timedelta(days=today.weekday())).strftime("%Y-%m-%d")
            found, amt, cats = self.get_weekly_limit_for_week(monday)
            if found:
                if name not in cats:
                    cats.append(name)
                    self.set_weekly_limit_for_week(monday, amt, cats)
            self.conn.commit()

    def delete_category_safe(self, name):
        fallback_cat = "Inne"
        if name == fallback_cat: return False
        try:
            self.conn.execute("INSERT OR IGNORE INTO categories VALUES (?)", (fallback_cat,))
            self.conn.execute("UPDATE transactions SET category=? WHERE category=? AND type='expense'", (fallback_cat, name))
            self.conn.execute("DELETE FROM categories WHERE name=?", (name,))
            self.conn.commit()
            return True
        except: return False

    def get_people(self):
        return [r[0] for r in self.conn.execute("SELECT name FROM people ORDER BY name").fetchall()]

    def get_categories(self):
        return [r[0] for r in self.conn.execute("SELECT name FROM categories ORDER BY name").fetchall()]

    def add_goal(self, name, target_amount, default_account_id):
        try:
            self.conn.execute(
                "INSERT INTO goals (name, target_amount, default_account_id) VALUES (?, ?, ?)",
                (name, target_amount, default_account_id)
            )
            self.conn.commit()
            return True
        except Exception as e:
            print(f"Błąd: {e}")
            return False

    def delete_goal(self, goal_id):
        self.conn.execute("DELETE FROM goals WHERE id=?", (goal_id,))
        self.conn.commit()

    def get_goals(self):
        return [r[0] for r in self.conn.execute("SELECT name FROM goals ORDER BY name").fetchall()]

    def get_goals_progress_simple(self):
        goals_data = []
        for g_id, g_name, g_target in self.conn.execute("SELECT id, name, target_amount FROM goals").fetchall():
            res = self.conn.execute("SELECT SUM(amount) FROM transactions WHERE type='savings' AND subcategory=?", (g_name,)).fetchone()[0]
            current_sum = res if res else 0.0
            goals_data.append({'id': g_id, 'name': g_name, 'target': g_target, 'collected': current_sum})
        return goals_data

    # --- DŁUGI (MOJE ZOBOWIĄZANIA) ---
    # --- DŁUGI (MOJE ZOBOWIĄZANIA) ---
    def add_liability(self, name, amount, deadline, attachment=None):
        filename = None
        if attachment and isinstance(attachment, bytes):
            import uuid
            filename = f"{uuid.uuid4().hex}.dat"
            with open(os.path.join(self.attachments_dir, filename), "wb") as f:
                f.write(attachment)

        try:
            cursor = self.conn.execute(
                "INSERT INTO liabilities (name, total_amount, deadline, attachment) VALUES (?, ?, ?, ?)",
                (name, amount, deadline, filename)
            )
            self.conn.commit()
            return cursor.lastrowid
        except Exception as e:
            print(f"Błąd add_liability: {e}")
            return False

    def delete_liability(self, lid):
        self.conn.execute("DELETE FROM liabilities WHERE id=?", (lid,))
        self.conn.commit()

    def get_liabilities_list(self):
        """Zwraca listę nazw długów, które mają jeszcze coś do spłacenia."""
        active_liabilities = []
        # Pobieramy wszystkie długi
        query = "SELECT name, total_amount FROM liabilities"
        for name, total in self.conn.execute(query).fetchall():
            # Sprawdzamy sumę spłat dla tego konkretnego długu w transakcjach
            res = self.conn.execute(
                "SELECT SUM(amount) FROM transactions WHERE type='liability_repayment' AND subcategory=?",
                (name,)
            ).fetchone()[0]
            paid = res if res else 0.0

            # Jeśli suma spłat jest mniejsza niż całkowita kwota długu, dodajemy do listy
            if paid < total:
                active_liabilities.append(name)

        return sorted(active_liabilities)

    def get_liabilities_status(self):
        liabilities = []
        for lid, name, total, deadline in self.conn.execute("SELECT id, name, total_amount, deadline FROM liabilities").fetchall():
            # ZMIANA: Sumujemy po ref_id zamiast po subcategory
            res = self.conn.execute("SELECT SUM(amount) FROM transactions WHERE type='liability_repayment' AND ref_id=?", (lid,)).fetchone()[0]
            paid = res if res else 0.0
            liabilities.append({'id': lid, 'name': name, 'total': total, 'paid': paid, 'deadline': deadline})
        return liabilities

    # --- DŁUŻNICY (LUDZIE WISZĄ MI KASĘ) - NOWE ---
    # --- DŁUŻNICY (LUDZIE WISZĄ MI KASĘ) ---
    def add_debtor(self, name, amount, deadline, attachment=None):
        filename = None
        if attachment and isinstance(attachment, bytes):
            import uuid
            filename = f"{uuid.uuid4().hex}.dat"
            with open(os.path.join(self.attachments_dir, filename), "wb") as f:
                f.write(attachment)

        try:
            cursor = self.conn.execute(
                "INSERT INTO debtors (name, total_amount, deadline, attachment) VALUES (?, ?, ?, ?)",
                (name, amount, deadline, filename)
            )
            self.conn.commit()
            return cursor.lastrowid
        except Exception as e:
            print(f"Błąd add_debtor: {e}")
            return False

    def delete_debtor(self, did):
        self.conn.execute("DELETE FROM debtors WHERE id=?", (did,))
        self.conn.commit()

    def get_debtors_list(self):
        """Zwraca listę nazw dłużników, którzy jeszcze nie oddali całości kwoty."""
        active_debtors = []
        # 1. Pobieramy wszystkich dłużników z tabeli debtors
        query = "SELECT name, total_amount FROM debtors"
        for name, total in self.conn.execute(query).fetchall():

            # 2. Sumujemy wszystkie zwroty od tego dłużnika z tabeli transakcji
            # Zakładamy, że w subcategory zapisujesz imię dłużnika
            res = self.conn.execute(
                "SELECT SUM(amount) FROM transactions WHERE type='debtor_repayment' AND subcategory=?",
                (name,)
            ).fetchone()[0]

            paid = res if res else 0.0

            # 3. Dodajemy do listy tylko tych, którzy mają jeszcze dług (total > paid)
            if paid < total:
                active_debtors.append(name)

        return sorted(active_debtors)

    def get_debtors_status(self):
        debtors = []
        for did, name, total, deadline in self.conn.execute("SELECT id, name, total_amount, deadline FROM debtors").fetchall():
            # ZMIANA: Sumujemy po ref_id (ID dłużnika)
            res = self.conn.execute("SELECT SUM(amount) FROM transactions WHERE type='debtor_repayment' AND ref_id=?", (did,)).fetchone()[0]
            paid = res if res else 0.0
            debtors.append({'id': did, 'name': name, 'total': total, 'paid': paid, 'deadline': deadline})
        return debtors

    def get_all_historical_liabilities(self):
        # Pobiera nazwy z historii transakcji (zarówno moje długi jak i dłużników)
        l1 = [r[0] for r in self.conn.execute("SELECT DISTINCT subcategory FROM transactions WHERE type='liability_repayment'").fetchall()]
        l2 = [r[0] for r in self.conn.execute("SELECT DISTINCT subcategory FROM transactions WHERE type='debtor_repayment'").fetchall()]
        return list(set(l1 + l2))

    def is_month_locked(self, month_str):
        return self.conn.execute("SELECT 1 FROM month_locks WHERE month_str=?", (month_str,)).fetchone() is not None

    def lock_month(self, month_str):
        self.conn.execute("INSERT OR IGNORE INTO month_locks VALUES (?)", (month_str,))
        self.conn.commit()

    def unlock_month(self, month_str):
        self.conn.execute("DELETE FROM month_locks WHERE month_str=?", (month_str,))
        self.conn.commit()

    def get_total_savings_cash_pln(self):
        """
        Pobiera sumę wszystkich oszczędności z całej historii bazy.
        Uwzględnia standardowe oszczędności, migracje oraz WPŁATY NA CELE.
        """
        # Używamy IN, aby złapać 'savings' oraz 'goal_deposit'
        query = """
            SELECT SUM(amount)
            FROM transactions
            WHERE type IN ('savings', 'savings_migration', 'goal_deposit')
        """
        try:
            cursor = self.conn.execute(query)
            res = cursor.fetchone()[0]
            return res if res is not None else 0.0
        except Exception as e:
            print(f"Błąd bazy przy sumowaniu oszczędności: {e}")
            return 0.0

    def get_net_balance_pln_before_date(self, date_limit_str):
        balance = 0.0
        for t_type, amt in self.conn.execute("SELECT type, amount FROM transactions WHERE date < ?", (date_limit_str,)).fetchall():
            if t_type == 'income': balance += amt
            elif t_type in ['expense', 'savings', 'liability_repayment']: balance -= amt
            elif t_type == 'debtor_repayment': balance += amt # Zwrot od dłużnika to plus
        return balance

    def create_shopping_list(self, name):
        created = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        cur = self.conn.execute("INSERT INTO shopping_lists (name, created_at, status) VALUES (?, ?, 'open')", (name, created))
        self.conn.commit()
        return cur.lastrowid

    def get_shopping_lists(self):
        return self.conn.execute("SELECT id, name, created_at, status FROM shopping_lists ORDER BY created_at DESC").fetchall()

    def add_shopping_item(self, list_id, product, quantity, store=""):
        self.conn.execute("INSERT INTO shopping_items (list_id, product_name, quantity, store) VALUES (?, ?, ?, ?)", (list_id, product, quantity, store))
        self.conn.commit()

    def get_shopping_items(self, list_id):
        cursor = self.conn.execute(
            "SELECT id, product_name, quantity, store FROM shopping_items WHERE list_id=? ORDER BY store ASC, product_name ASC",
            (list_id,)
        )
        return cursor.fetchall()

    def delete_shopping_item(self, item_id):
        self.conn.execute("DELETE FROM shopping_items WHERE id=?", (item_id,))
        self.conn.commit()

    def update_shopping_item(self, item_id, p, q):
        self.conn.execute("UPDATE shopping_items SET product_name=?, quantity=? WHERE id=?", (p, q, item_id))
        self.conn.commit()

    def close_shopping_list(self, list_id):
        self.conn.execute("UPDATE shopping_lists SET status='closed' WHERE id=?", (list_id,))
        self.conn.commit()

    def delete_shopping_list(self, list_id):
        self.conn.execute("DELETE FROM shopping_items WHERE list_id=?", (list_id,))
        self.conn.execute("DELETE FROM shopping_lists WHERE id=?", (list_id,))
        self.conn.commit()

    def add_shop(self, name):
        if name and name.strip():
            self.conn.execute("INSERT OR IGNORE INTO shops VALUES (?)", (name.strip(),))
            self.conn.commit()

    def get_shops(self):
        shops = [r[0] for r in self.conn.execute("SELECT name FROM shops ORDER BY name").fetchall()]
        return [""] + shops

    def set_weekly_limit_for_week(self, monday_date, amount, categories_list):
        cat_json = json.dumps(categories_list)
        self.conn.execute("INSERT OR REPLACE INTO weekly_history (monday_date, amount, categories) VALUES (?, ?, ?)", (monday_date, amount, cat_json))
        self.conn.commit()

    def get_weekly_limit_for_week(self, monday_date):
        cursor = self.conn.execute("SELECT amount, categories FROM weekly_history WHERE monday_date=?", (monday_date,))
        row = cursor.fetchone()
        if row:
            try: cats = json.loads(row[1])
            except: cats = []
            return True, row[0], cats
        return False, 0.0, []

    def is_weekly_system_enabled(self):
        cfg = self.get_config("weekly_limit_config")
        return cfg.get("enabled", False) if cfg else False

    def set_weekly_system_enabled(self, enabled):
        cfg = self.get_config("weekly_limit_config") or {}
        cfg["enabled"] = enabled
        self.save_config("weekly_limit_config", cfg)

    def get_pending_bills(self):
        # Automatyczna szybka migracja - dodaje kolumny, jeśli ich nie ma
        try:
            self.conn.execute("ALTER TABLE pending_bills ADD COLUMN is_recurring INTEGER DEFAULT 0")
            self.conn.commit()
        except:
            pass # Kolumna już istnieje

        try:
            # NOWE: Dodajemy kolumnę ref_id dla powiązania z długami
            self.conn.execute("ALTER TABLE pending_bills ADD COLUMN ref_id INTEGER")
            self.conn.commit()
        except:
            pass # Kolumna już istnieje

        # Pobieramy 7 kolumn: id, data, kwota, kategoria, opis, czy_staly, ref_id
        cursor = self.conn.execute("""
            SELECT id, due_date, amount, category, description, is_recurring, ref_id
            FROM pending_bills
            WHERE is_paid = 0
            ORDER BY due_date ASC
        """)
        return cursor.fetchall()

    def add_pending_bill(self, due_date, amount, category, description, is_recurring=0, ref_id=None):
        # Dodajemy obsługę ref_id w zapytaniu INSERT
        self.conn.execute("""
            INSERT INTO pending_bills (due_date, amount, category, description, is_recurring, ref_id)
            VALUES (?, ?, ?, ?, ?, ?)
        """, (due_date, amount, category, description, is_recurring, ref_id))
        self.conn.commit()

    def mark_bill_paid(self, bill_id):
        self.conn.execute("UPDATE pending_bills SET is_paid = 1 WHERE id = ?", (bill_id,))
        self.conn.commit()

    def delete_pending_bill(self, bill_id):
        self.conn.execute("DELETE FROM pending_bills WHERE id = ?", (bill_id,))
        self.conn.commit()

    def toggle_bill_recurring(self, bill_id, current_status):
        new_status = 0 if current_status == 1 else 1
        self.conn.execute("UPDATE pending_bills SET is_recurring = ? WHERE id = ?", (new_status, bill_id))
        self.conn.commit()

    def get_available_years(self):
        res = self.conn.execute("SELECT DISTINCT strftime('%Y', date) as y FROM transactions ORDER BY y DESC").fetchall()
        return [int(r[0]) for r in res if r[0]]

    def get_savings_total_for_subcat(self, subcat):
        query = "SELECT SUM(amount) FROM transactions WHERE type = 'savings' AND subcategory = ?"
        # Używamy standardowego połączenia sqlite, które masz w klasie
        cursor = self.conn.cursor()
        cursor.execute(query, (subcat,))
        res = cursor.fetchone()
        return res[0] if res and res[0] else 0.0

    def get_attachment(self, transaction_id):
        # --- ZMIANA: Pobieranie z pliku zamiast z bazy ---
        res = self.conn.execute("SELECT attachment FROM transactions WHERE id = ?", (transaction_id,)).fetchone()
        if res and res[0]:
            file_path = os.path.join(self.attachments_dir, res[0])
            if os.path.exists(file_path):
                try:
                    with open(file_path, "rb") as f:
                        return f.read()
                except: pass
        return None

    def get_active_liabilities_detailed(self):
        """Zwraca listę aktywnych długów: (id, nazwa, pozostało_do_spłaty)"""
        query = """
            SELECT l.id, l.name, (l.total_amount - IFNULL(SUM(t.amount), 0)) as remaining
            FROM liabilities l
            LEFT JOIN transactions t ON l.id = t.ref_id AND t.type = 'liability_repayment'
            GROUP BY l.id
            HAVING remaining > 0.001
            ORDER BY l.name ASC
        """
        return self.conn.execute(query).fetchall()

    def get_active_debtors_detailed(self):
        """Zwraca listę aktywnych dłużników: (id, nazwa, pozostało_do_oddania)"""
        query = """
            SELECT d.id, d.name, (d.total_amount - IFNULL(SUM(t.amount), 0)) as remaining
            FROM debtors d
            LEFT JOIN transactions t ON d.id = t.ref_id AND t.type = 'debtor_repayment'
            GROUP BY d.id
            HAVING remaining > 0.001
            ORDER BY d.name ASC
        """
        return self.conn.execute(query).fetchall()

    def add_account(self, name, initial_balance, color="#7f8c8d"):
        """Dodaje nowe konto z określonym kolorem."""
        try:
            self.conn.execute(
                "INSERT INTO accounts (name, initial_balance, color) VALUES (?, ?, ?)",
                (name, initial_balance, color)
            )
            self.conn.commit()
            return True
        except:
            return False

    def get_accounts(self):
        """Pobiera wszystkie konta wraz z kolorami."""
        try:
            # Upewnij się, że 'color' jest na końcu (indeks 3)
            cursor = self.conn.execute("SELECT id, name, initial_balance, color FROM accounts")
            return cursor.fetchall()
        except Exception as e:
            print(f"Błąd pobierania kont: {e}")
            return []

    def delete_account(self, acc_id):
        if acc_id == 1: return False # Nie pozwalamy usunąć głównej Gotówki
        self.conn.execute("DELETE FROM accounts WHERE id=?", (acc_id,))
        # Stare transakcje usuwanego konta przenosimy na Gotówkę
        self.conn.execute("UPDATE transactions SET account_id = 1 WHERE account_id = ?", (acc_id,))
        self.conn.commit()
        return True

    def get_account_history(self, account_id, date_from, date_to, t_type=None):
        query = """
            SELECT date, type, category, subcategory, amount, details
            FROM transactions
            WHERE account_id = ? AND date BETWEEN ? AND ?
        """
        params = [account_id, date_from, date_to]
        if t_type:
            query += " AND type = ?"
            params.append(t_type)

        query += " ORDER BY date DESC"
        cursor = self.conn.execute(query, params)
        return cursor.fetchall()

    def is_module_enabled(self, name):
        res = self.conn.execute("SELECT is_enabled FROM modules WHERE module_name=?", (name,)).fetchone()
        return res[0] == 1 if res else False

    def set_module_state(self, name, state):
        self.conn.execute("INSERT OR REPLACE INTO modules VALUES (?, ?)", (name, 1 if state else 0))
        self.conn.commit()

    def get_account_balance(self, account_id, date_limit=None):
        """
        Oblicza saldo konta: saldo_początkowe + przychody - wydatki.
        Opcjonalnie uwzględnia limit daty dla raportów historycznych.
        """
        try:
            # 1. Pobierz saldo początkowe konta
            res = self.conn.execute("SELECT initial_balance FROM accounts WHERE id = ?", (account_id,)).fetchone()
            initial_balance = res[0] if res else 0.0

            # 2. Przygotuj zapytanie SQL (z limitem daty lub bez)
            if date_limit:
                # SQL weźmie tylko transakcje do wskazanego dnia włącznie
                query = "SELECT type, amount FROM transactions WHERE account_id = ? AND date <= ?"
                params = (account_id, date_limit)
            else:
                query = "SELECT type, amount FROM transactions WHERE account_id = ?"
                params = (account_id,)

            transactions = self.conn.execute(query, params).fetchall()

            current_balance = initial_balance
            for t_type, amt in transactions:
                if t_type in ['income', 'debtor_repayment']:
                    # Przychody i zwroty od dłużników zwiększają stan konta
                    current_balance += amt
                elif t_type in ['expense', 'savings', 'liability_repayment', 'goal_deposit']:
                    # Wydatki, oszczędności i spłaty długów zmniejszają stan konta
                    current_balance -= amt
                elif t_type == 'savings_migration':
                    # Migracja ma już znak w bazie (- dla wyjścia, + dla wejścia)
                    # Używamy +=, aby matematycznie zachować ten znak.
                    current_balance += amt

            return current_balance
        except Exception as e:
            print(f"Błąd obliczania salda konta {account_id}: {e}")
            return 0.0

    def update_account_color(self, acc_id, new_color):
        try:
            self.conn.execute("UPDATE accounts SET color = ? WHERE id = ?", (new_color, acc_id))
            self.conn.commit()
            return True
        except:
            return False

    def get_liability_full_info(self, l_id):
        res = self.conn.execute("SELECT name, total_amount, deadline, attachment FROM liabilities WHERE id = ?", (l_id,)).fetchone()
        if not res: return None
        paid = self.conn.execute("SELECT SUM(amount) FROM transactions WHERE ref_id = ? AND type = 'liability_repayment'", (l_id,)).fetchone()[0] or 0.0
        return {"name": res[0], "total": res[1], "deadline": res[2], "attachment": res[3], "remaining": res[1] - paid}

    def get_debtor_full_info(self, d_id):
        res = self.conn.execute("SELECT name, total_amount, deadline, attachment FROM debtors WHERE id = ?", (d_id,)).fetchone()
        if not res: return None
        paid = self.conn.execute("SELECT SUM(amount) FROM transactions WHERE ref_id = ? AND type = 'debtor_repayment'", (d_id,)).fetchone()[0] or 0.0
        return {"name": res[0], "total": res[1], "deadline": res[2], "attachment": res[3], "remaining": res[1] - paid}
