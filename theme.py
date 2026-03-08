import subprocess
import configparser
import os


def get_system_theme():
    """Returns 'dark' or 'light' based on desktop theme settings."""

    # 1. GNOME / freedesktop color-scheme via gsettings
    try:
        out = subprocess.check_output(
            ["gsettings", "get", "org.gnome.desktop.interface", "color-scheme"],
            stderr=subprocess.DEVNULL, text=True
        ).strip().strip("'")
        if "dark" in out:
            return "dark"
        if out in ("default", "prefer-light"):
            return "light"
    except Exception:
        pass

    # 2. GTK3 settings.ini
    gtk3_settings = os.path.expanduser("~/.config/gtk-3.0/settings.ini")
    try:
        cfg = configparser.ConfigParser()
        cfg.read(gtk3_settings)
        val = cfg.get("Settings", "gtk-application-prefer-dark-theme", fallback="").strip()
        if val in ("1", "true", "True"):
            return "dark"
        if val in ("0", "false", "False"):
            return "light"
    except Exception:
        pass

    # 3. GTK4 settings.ini
    gtk4_settings = os.path.expanduser("~/.config/gtk-4.0/settings.ini")
    try:
        cfg = configparser.ConfigParser()
        cfg.read(gtk4_settings)
        val = cfg.get("Settings", "gtk-application-prefer-dark-theme", fallback="").strip()
        if val in ("1", "true", "True"):
            return "dark"
        if val in ("0", "false", "False"):
            return "light"
    except Exception:
        pass

    # 4. KDE color scheme name
    kdeglobals = os.path.expanduser("~/.config/kdeglobals")
    try:
        cfg = configparser.ConfigParser()
        cfg.read(kdeglobals)
        scheme = cfg.get("General", "ColorScheme", fallback="").lower()
        if "dark" in scheme:
            return "dark"
        if scheme:
            return "light"
    except Exception:
        pass

    return "dark"  # safe default
