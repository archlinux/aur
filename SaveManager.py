import os
import json
import sqlite3

import gi
gi.require_version('Gtk', '4.0')
from gi.repository import Gtk, Gdk, GLib, Gio

config_dir = os.path.join(GLib.get_user_config_dir(), "flameget")
settings_file = os.path.join(config_dir, "settings.json")
translations_file = os.path.join(config_dir, "translations.json")
global_style_provider = None

def load_translations():
    if not os.path.exists(translations_file):
        print(f"Error: {translations_file} not found.")
        return {"en": {}}
    
    try:
        with open(translations_file, "r", encoding="utf-8") as f:
            return json.load(f)
    except json.JSONDecodeError as e:
        print(f"Error decoding JSON: {e}")
        return {"en": {}}

def load_css(theme=""):
    display = Gdk.Display.get_default() if hasattr(Gdk, "Display") else None
    screen = Gdk.Screen.get_default() if hasattr(Gdk, "Screen") else None
    global global_style_provider
    if global_style_provider:
        try:
            if display and hasattr(Gtk.StyleContext, "remove_provider_for_display"):
                Gtk.StyleContext.remove_provider_for_display(display, global_style_provider)
            elif screen and hasattr(Gtk.StyleContext, "remove_provider_for_screen"):
                Gtk.StyleContext.remove_provider_for_screen(screen, global_style_provider)
        except Exception as e:
            print(f"CSS remove provider error: {e}")

    print(f"Switching to theme: {theme}")
    if theme == "Custom":
        css_path = os.path.join(config_dir, "custom_style.css")
    else:
        css_path = os.path.join(config_dir, f"{theme.lower()}_style.css")

    css_provider = Gtk.CssProvider()
    css_file = Gio.File.new_for_path(css_path)
    
    try:
        css_provider.load_from_file(css_file)

        if display and hasattr(Gtk.StyleContext, "add_provider_for_display"):
            Gtk.StyleContext.add_provider_for_display(
                display,
                css_provider,
                Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
            )
        elif screen and hasattr(Gtk.StyleContext, "add_provider_for_screen"):
            Gtk.StyleContext.add_provider_for_screen(
                screen,
                css_provider,
                Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
            )
        else:
            print("CSS Load Warning: No GTK display/screen available.")

        global_style_provider = css_provider 
        
    except Exception as e:
        print(f"CSS Load Error: {e}")

def load_settings(download_folder=""):
    default_css = os.path.join(config_dir, "dark_style.css")
    custom_css = os.path.join(config_dir, "custom_style.css")
    if download_folder == "":
        download_folder = GLib.get_user_special_dir(GLib.UserDirectory.DIRECTORY_DOWNLOAD)
    defaults = {
        "engine": "Aria2",
        "css_path": default_css,
        "custom_css_path": custom_css,
        "default_segments": 8,
        "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
        "confirm_delete": True,
        "notifications": True,
        "default_download_dir": download_folder,
        "theme_mode": "Dark",
        "language": "en",
        "font_name": "Sans Regular 11",
        "ui_scale": 100,
        "start_on_boot": False,
        "show_finish_dialog": True,
        "enable_toasts": True,
        "chk_has_borders": True,
        "enable_integration": True,
        "ctx_menu_offsets": {"x": 100, "y": 0},
        "start_in_minimize_mode": False,
        "auto_start": False,
        "global_speed_limit": "0",
        "cells_size": 1,
        "browser_port": 6812,
        "sort_column": "Date Added",
        "sort_direction": 1,
        "on_finish_action": "Do Nothing",
        "custom_finish_cmd": "",
        "shortcuts": {
            "new_download": [int(Gdk.KEY_n), int(Gdk.ModifierType.CONTROL_MASK)],
            "delete": [int(Gdk.KEY_Delete), 0],
            "select_all": [int(Gdk.KEY_a), int(Gdk.ModifierType.CONTROL_MASK)],
            "open_file": [int(Gdk.KEY_o), int(Gdk.ModifierType.CONTROL_MASK)],
            "quit": [int(Gdk.KEY_q), int(Gdk.ModifierType.CONTROL_MASK)],
            "close_window": [int(Gdk.KEY_w), int(Gdk.ModifierType.CONTROL_MASK)]
        }
    }

    if os.path.exists(settings_file):
        try:
            with open(settings_file, 'r') as f:
                data = json.load(f)
                
                for key, value in data.items():
                    if key in defaults and isinstance(defaults[key], dict) and isinstance(value, dict):
                        defaults[key].update(value)
                    else:
                        defaults[key] = value
        except json.JSONDecodeError as e:
            print(f"Settings file is empty or corrupted ({e}). Recreating defaults...")
            save_settings(defaults)
        except Exception as e:
            print(f"Error loading settings: {e}")
    else:
        print("Settings file not found. Creating a new one with default settings...")
        save_settings(defaults)
            
    return defaults

def save_settings(app_settings):
    try:
        if not os.path.exists(config_dir):
            os.makedirs(config_dir, exist_ok=True)
            
        with open(settings_file, 'w') as f:
            json.dump(app_settings, f, indent=4)
    except Exception as e:
        print(f"Failed to save settings: {e}")


class DownloadDatabase:
    def __init__(self, db_name="downloads.db"):
        self.conn = sqlite3.connect(db_name, check_same_thread=False)
        self.conn.row_factory = sqlite3.Row
        self.conn.execute("PRAGMA journal_mode=WAL;")
        self.conn.execute("PRAGMA synchronous=NORMAL;")
        self.create_table()

    def clean_startup(self):
        try:
            cursor = self.conn.cursor()
            
            cursor.execute("""
                UPDATE downloads 
                SET status = 'Stopped'
                WHERE status IN ('downloading', 'Paused', 'Verifying Checksum')
            """)
            
            cursor.execute("""
                UPDATE downloads 
                SET status = 'Finished'
                WHERE status = 'Seeding'
            """)
            
            self.conn.commit()
            print("Cleaned up interrupted downloads and seeds.")
        except Exception as e:
            print(f"Startup cleanup failed: {e}")

    def create_table(self):
        cursor = self.conn.cursor()
        cursor.execute('''
            CREATE TABLE IF NOT EXISTS downloads (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                filename TEXT,
                size TEXT,
                status TEXT,
                progress INTEGER,
                speed TEXT,
                time_left TEXT,
                date_added TEXT,
                category TEXT,
                file_directory TEXT,
                url TEXT,
                pid INTEGER,
                file_size_bytes INTEGER,
                segments INT,
                is_audio BOOL,
                quality_mod TEXT,
                download_playlist BOOL,
                scheduled_time REAL DEFAULT 0,
                finished_downloading BOOL DEFAULT False
            )
        ''')
        cursor.execute('SELECT count(*) FROM downloads')
        self.conn.commit()

    def get_downloads(self, category="All"):
        cursor = self.conn.cursor()
        if category == "All":
            cursor.execute('SELECT * FROM downloads')
        else:
            cursor.execute('SELECT * FROM downloads WHERE category = ?', (category,))
        return cursor.fetchall()
