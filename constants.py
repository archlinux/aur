"""BROS VM Application - Constants"""

import os
import platform
import sys

APP_NAME = "Bros Launcher"
APP_VERSION = "1.0.5"
APP_TITLE = f"{APP_NAME} v{APP_VERSION}"

CPU_NAME = "BROS HM-1 Bahar"
CPU_MANUFACTURER = "Berke Oruc"
CPU_DESCRIPTION = "x86_64 Operating System for testing"

DEFAULT_RAM = 2048
DEFAULT_CORES = 1
DEFAULT_FREQ = 2400
DEFAULT_STORAGE = 512

MIN_RAM = 512
MAX_RAM = 8192
MIN_CORES = 1
MAX_CORES = 3
MIN_FREQ = 800
MAX_FREQ = 3600
MIN_STORAGE = 64
MAX_STORAGE = 4096

PLATFORM = platform.system()
QEMU_BIN = "qemu-system-x86_64"


def get_base_path():
    return os.path.abspath(os.path.join(os.path.dirname(__file__), "../../.."))


def get_iso_path():
    possible_paths = []

    if hasattr(sys, "_MEIPASS"):
        bundle_dir = sys._MEIPASS
        possible_paths.append(os.path.join(bundle_dir, "bros.iso"))

    if getattr(sys, "frozen", False):
        bundle_dir = os.path.dirname(sys.executable)
        possible_paths.append(os.path.join(bundle_dir, "bros.iso"))
        possible_paths.append(
            os.path.join(bundle_dir, "usr", "share", "broslauncher", "bros.iso")
        )

    script_dir = os.path.dirname(os.path.abspath(__file__))
    possible_paths.append(os.path.join(script_dir, "bros.iso"))

    possible_paths.append("/usr/share/broslauncher/bros.iso")

    for path in possible_paths:
        if os.path.exists(path):
            return path

    return possible_paths[0]


def get_logo_path():
    base = get_base_path()
    logo = os.path.join(base, "ASSETS", "bros-logo.png")
    if os.path.exists(logo):
        return logo
    script_dir = os.path.dirname(os.path.abspath(__file__))
    logo = os.path.join(script_dir, "bros-logo.png")
    if os.path.exists(logo):
        return logo
    logo = "/usr/share/broslauncher/bros-logo.png"
    if os.path.exists(logo):
        return logo
    return os.path.join(base, "ASSETS", "bros-logo.png")


COLOR_BG_DARK = "#0a0a0a"
COLOR_BG_MEDIUM = "#141414"
COLOR_BG_LIGHT = "#1e1e1e"
COLOR_TEXT = "#e0e0e0"
COLOR_TEXT_DIM = "#606060"
COLOR_BORDER = "#2a2a2a"

FONT_PRIMARY = ("Segoe UI", 10)
FONT_SECONDARY = ("Segoe UI", 8)
FONT_MONO = ("Consolas", 9)
FONT_TITLE = ("Segoe UI", 14, "bold")
FONT_HEADER = ("Segoe UI", 11, "bold")
