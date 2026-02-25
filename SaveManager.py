import os
import json
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
    display = Gdk.Display.get_default()
    global global_style_provider
    if global_style_provider:
        Gtk.StyleContext.remove_provider_for_display(display, global_style_provider)

    print(f"Switching to theme: {theme}")
    if theme == "Custom":
        css_path = os.path.join(config_dir, "custom_style.css")
    else:
        css_path = os.path.join(config_dir, f"{theme.lower()}_style.css")

    css_provider = Gtk.CssProvider()
    css_file = Gio.File.new_for_path(css_path)
    
    try:
        css_provider.load_from_file(css_file)
        
        Gtk.StyleContext.add_provider_for_display(
            display, 
            css_provider, 
            Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
        )
        
        global_style_provider = css_provider 
        
    except Exception as e:
        print(f"CSS Load Error: {e}")

def load_settings(download_folder):
    default_css = os.path.join(config_dir, "dark_style.css")
    custom_css = os.path.join(config_dir, "custom_style.css")

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
        "browser_port": "6800",
        "sort_column": "Date Added",
        "sort_direction": 1,
        "on_finish_action": "Do Nothing",
        "custom_finish_cmd": "",
        "shortcuts": {
            "new_download": [Gdk.KEY_n, Gdk.ModifierType.CONTROL_MASK],
            "delete": [Gdk.KEY_Delete, 0],
            "select_all": [Gdk.KEY_a, Gdk.ModifierType.CONTROL_MASK],
            "open_file": [Gdk.KEY_o, Gdk.ModifierType.CONTROL_MASK],
            "quit": [Gdk.KEY_q, Gdk.ModifierType.CONTROL_MASK],
            "close_window": [Gdk.KEY_w, Gdk.ModifierType.CONTROL_MASK]
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
        except Exception as e:
            print(f"Error loading settings: {e}")
            
    return defaults

def save_settings(app_settings):
    try:
        if not os.path.exists(config_dir):
            os.makedirs(config_dir, exist_ok=True)
            
        with open(settings_file, 'w') as f:
            json.dump(app_settings, f, indent=4)
    except Exception as e:
        print(f"Failed to save settings: {e}")