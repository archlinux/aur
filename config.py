import sys
import os
import gettext

# --- STAŁE APLIKACJI ---
WERSJA = "1.3.7"
PRODUCENT = "KlapkiSzatana"
CASH_SAVINGS_NAME = "Oszczędności"  # Nazwa techniczna w bazie (nie tłumaczyć klucza)


# --- KONFIGURACJA ŚCIEŻEK ---
if getattr(sys, 'frozen', False):
    BASE_DIR = os.path.dirname(sys.executable)
else:
    BASE_DIR = os.path.dirname(os.path.abspath(__file__))

LOCALEDIR = os.path.join(BASE_DIR, 'locales')
USER_HOME = os.path.expanduser("~")
APP_DIR = os.path.join(USER_HOME, ".BudgetApp")

# Tworzenie katalogu aplikacji
if not os.path.exists(APP_DIR):
    try:
        os.makedirs(APP_DIR)
    except OSError:
        APP_DIR = USER_HOME  # Fallback

ERROR_LOG_PATH = os.path.join(APP_DIR, "error_log.txt")
CRASH_LOG_PATH = os.path.join(APP_DIR, "crash_log.txt")

# --- KONFIGURACJA TŁUMACZEŃ (i18n) ---
try:
    # Inicjalizacja gettext - globalnie dla całej aplikacji
    translator = gettext.translation('base', LOCALEDIR, fallback=True)
    _ = translator.gettext
except Exception:
    def _(s): return s

APPNAME = _("Budżet Domowy")

# Stałe tekstowe wymagające tłumaczeń (muszą być po definicji _)
MONTH_NAME = [
    _("Styczeń"), _("Luty"), _("Marzec"), _("Kwiecień"), _("Maj"), _("Czerwiec"),
    _("Lipiec"), _("Sierpień"), _("Wrzesień"), _("Październik"), _("Listopad"), _("Grudzień")
]

DAYS_PL = [
    _("Poniedziałek"), _("Wtorek"), _("Środa"), _("Czwartek"),
    _("Piątek"), _("Sobota"), _("Niedziela")
]

# --- SYSTEM OBSŁUGI BŁĘDÓW ---

def setup_crash_handlers():
    """Inicjalizuje obsługę twardych crashy (C++) oraz wyjątków Pythona."""
    import faulthandler

    # 1. Obsługa twardych crashy (SIGSEGV)
    try:
        crash_file = open(CRASH_LOG_PATH, "w")
        faulthandler.enable(file=crash_file)
    except Exception:
        pass

    # 2. Globalny hook na wyjątki Pythona
    sys.excepthook = global_exception_handler

def global_exception_handler(exc_type, exc_value, exc_traceback):
    """Przechwytuje nieobsłużone wyjątki i wyświetla okno błędu."""
    import traceback
    from datetime import datetime
    from PySide6.QtWidgets import QMessageBox, QApplication

    if issubclass(exc_type, KeyboardInterrupt):
        sys.__excepthook__(exc_type, exc_value, exc_traceback)
        return

    error_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    error_msg = "".join(traceback.format_exception(exc_type, exc_value, exc_traceback))
    full_log = f"--- CRITICAL ERROR {error_time} ---\n{error_msg}\n"

    # Zapis do pliku
    try:
        with open(ERROR_LOG_PATH, "a") as f:
            f.write(full_log)
    except Exception:
        pass

    # Wyświetlenie GUI (jeśli możliwe)
    try:
        app = QApplication.instance()
        if not app:
            app = QApplication(sys.argv)

        msg_box = QMessageBox()
        msg_box.setIcon(QMessageBox.Critical)
        msg_box.setWindowTitle(_("Błąd Krytyczny"))
        msg_box.setText(_("Wystąpił nieoczekiwany błąd aplikacji."))
        msg_box.setInformativeText(
            _("Log został zapisany w:\n{}\n\nMożesz skopiować błąd poniżej:").format(ERROR_LOG_PATH)
        )
        msg_box.setDetailedText(error_msg)
        msg_box.setStandardButtons(QMessageBox.Close)
        msg_box.exec()
    except Exception:
        # Fallback na stderr jeśli GUI zawiedzie
        print("CRITICAL ERROR (GUI FAILED):", file=sys.stderr)
        print(error_msg, file=sys.stderr)

import json
from pathlib import Path

# Ścieżka do pliku konfiguracyjnego tabeli
TABLE_CONFIG_PATH = Path.home() / ".config" / "BudgetApp" / "table.conf"

def save_table_widths(widths_dict):
    """Zapisuje słownik szerokości kolumn do pliku JSON."""
    try:
        TABLE_CONFIG_PATH.parent.mkdir(parents=True, exist_ok=True)
        with open(TABLE_CONFIG_PATH, 'w') as f:
            json.dump(widths_dict, f)
    except Exception as e:
        print(f"Błąd zapisu szerokości kolumn: {e}")

def load_table_widths():
    """Wczytuje szerokości kolumn. Zwraca słownik lub None."""
    if TABLE_CONFIG_PATH.exists():
        try:
            with open(TABLE_CONFIG_PATH, 'r') as f:
                return json.load(f)
        except Exception as e:
            print(f"Błąd odczytu szerokości kolumn: {e}")
    return None
