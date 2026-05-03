import os
import platform
import sys
import shutil

APP_NAME = "BrosLauncher"
APP_VERSION = "1.1.0"
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


def get_qemu_binary():
    qemu_path = shutil.which("qemu-system-x86_64")
    if qemu_path:
        return "qemu-system-x86_64"
    return "qemu-system-x86_64"


QEMU_BIN = get_qemu_binary()


def get_base_path():
    if getattr(sys, "frozen", False):
        return os.path.dirname(sys.executable)
    return os.path.dirname(os.path.abspath(__file__))


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

    xdg_data = os.environ.get("XDG_DATA_HOME", os.path.expanduser("~/.local/share"))
    possible_paths.append(os.path.join(xdg_data, "broslauncher", "bros.iso"))

    for path in possible_paths:
        if os.path.exists(path):
            return path

    return possible_paths[0]


def get_logo_path():
    if getattr(sys, "frozen", False):
        base = os.path.dirname(sys.executable)
    else:
        base = os.path.dirname(os.path.abspath(__file__))

    for path in [
        os.path.join(base, "bros-logo.png"),
        os.path.join(base, "..", "share", "pixmaps", "broslauncher.png"),
        "/usr/share/pixmaps/broslauncher.png",
    ]:
        if os.path.exists(path):
            return path

    return None


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
