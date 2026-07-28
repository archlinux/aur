#!/usr/bin/env python3
"""
Mahmoud Presser - Modern Cross-Platform Auto-Clicker, Macro Sequence Builder & Auto-Typer
Compatible with Linux (Wayland/X11), Windows (10/11), and macOS.

Features:
 1. Multi-Column X11 & Cross-Platform Latin Base Key Resolution: Iterates all OS KeySym columns (0 to 7) to dynamically detect the exact Latin base character (A-Z, 0-9) for every physical key. Fully portable across all devices, OS platforms, and active keyboard layout groups without hardcoded maps.
 2. Discard Stop Action: Clicking 'Stop Live Recording' automatically discards the trailing Mouse 1 click so it is NEVER saved into your macro sequence!
 3. Resolved ASCII Collision: Key 'O' records as 'O' and 'Up' arrow records as 'UP'.
 4. ESC & F8 Stop Triggers for Live Sequence Recording: Pressing ESC or F8 cleanly stops live recording without saving ESC/F8 into the sequence.
 5. Overriding show_all() in GTK & QStackedWidget in Qt: Fixes startup tab bleed / overlapping widgets glitch.
 6. Premium Modern Dark Theme: Sleek dark palette (#1e1e2e), rounded cards, high-contrast action badges.
 7. Named Macro Sequence Profiles Manager: Save As, Load, Rename, and Delete custom profiles.
 8. Dual Step Editing: Direct double-click table cell editing + Edit Selected / Update Selected buttons.
 9. Fixed Step Reordering: Move Up & Move Down with live selection tracking in Qt & GTK.
 10. Multi-Key & Combination Support: e.g., ALT+A, CTRL+SHIFT+E, CTRL+C, F8, Mouse 1.
 11. Combo-Aware Global Hotkey Listener: Starts/Stops on single keys OR key combinations.
 12. 20ms Micro-Hold Synthesis for 100% reliable combination registration across OS & apps.
"""

import sys
import os
import tempfile
import time
import json
import signal
import threading
import subprocess
import select
import re
import argparse
import platform

# Platform Flags (Hardcoded for Linux Only)
SYSTEM_NAME = "linux"
IS_WINDOWS = False
IS_LINUX = True
IS_MACOS = False

# Auto-redirect execution to virtual environment if available
venv_linux = os.path.expanduser("~/venv/bin/python3")
venv_win = os.path.expanduser("~/venv/Scripts/python.exe")
venv_python = venv_win if IS_WINDOWS else venv_linux

if not getattr(sys, 'frozen', False) and os.path.exists(venv_python) and sys.executable != venv_python and "--no-reexec" not in sys.argv:
    try:
        os.execv(venv_python, [venv_python] + sys.argv)
    except Exception:
        pass

# Optional Imports
EVDEV_AVAILABLE = False
if IS_LINUX:
    try:
        from evdev import UInput, ecodes as e
        EVDEV_AVAILABLE = True
    except ImportError:
        EVDEV_AVAILABLE = False

try:
    import pynput
    PYNPUT_AVAILABLE = True
    if IS_LINUX and hasattr(pynput.keyboard, '_xorg'):
        # Monkey patch pynput on X11 to extract raw hardware keycodes so we can dynamically 
        # resolve base Latin keys regardless of active layout/Shift state.
        _original_event_to_key = pynput.keyboard._xorg.Listener._event_to_key
        def _patched_event_to_key(self, display, event):
            key = _original_event_to_key(self, display, event)
            if key is not None:
                key.hardware_keycode = event.detail
            return key
        pynput.keyboard._xorg.Listener._event_to_key = _patched_event_to_key
except ImportError:
    PYNPUT_AVAILABLE = False

# Cross-platform File Paths
if IS_WINDOWS:
    CONFIG_DIR = os.environ.get("APPDATA", os.path.expanduser("~"))
    CONFIG_FILE = os.path.join(CONFIG_DIR, "mahmoud_presser.json")
    PID_FILE = os.path.join(tempfile.gettempdir(), "mahmoud_presser.pid")
else:
    CONFIG_FILE = os.path.expanduser("~/.config/wayland_mahmoud_presser.json")
    PID_FILE = os.path.join(tempfile.gettempdir(), "mahmoud_presser.pid")

# Cached X11 Display instance for dynamic system key queries
X11_DISPLAY = None
X11_XK = None
if IS_LINUX:
    try:
        import Xlib.display
        import Xlib.XK
        X11_DISPLAY = Xlib.display.Display()
        X11_XK = Xlib.XK
    except Exception:
        X11_DISPLAY = None
        X11_XK = None

# Extended Symbol & Layout Map (Maps Shifted symbols / Arabic layout diacritics back to QWERTY base keys)
SYMBOL_TO_KEY = {
    '~': 'Z', 'ْ': 'X', '}': 'C', '{': 'V', 'لآ': 'B', 'آ': 'N', '’': 'M', '‘': 'U',
    'َ': 'Q', 'ً': 'W', 'ُ': 'E', 'ٍ': 'R', 'لإ': 'T', 'إ': 'Y', '×': 'O', '÷': 'P',
    'ِ': 'A', 'لأ': 'G', 'أ': 'H', 'ـ': 'J', '،': 'K',
    'ذ': '`', 'ض': 'Q', 'ص': 'W', 'ث': 'E', 'ق': 'R', 'ف': 'T', 'غ': 'Y', 'ع': 'U', 'ه': 'I', 'خ': 'O', 'ح': 'P', 'ج': '[', 'د': ']',
    'ش': 'A', 'س': 'S', 'ي': 'D', 'ب': 'F', 'ل': 'G', 'ت': 'J', 'ن': 'K', 'م': 'L', 'ك': ';', 'ط': '\'',
    'ئ': 'Z', 'ء': 'X', 'ؤ': 'C', 'ر': 'V', 'لا': 'B', 'ى': 'N', 'ة': 'M', 'و': ',', 'ز': '.', 'ظ': '/'
}

COMMON_PRESET_KEYS = [
    "Mouse 1", "Mouse 2", "Mouse 3",
    "SHIFT+M", "SHIFT+A", "ALT+A", "CTRL+C", "CTRL+V", "CTRL+SHIFT+S", "ALT+F4",
    "Space", "Enter", "Tab", "Escape", "Backspace",
    "Shift", "Ctrl", "Alt", "Caps Lock",
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
    "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
    "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12",
    "Up", "Down", "Left", "Right", "Insert", "Delete", "Home", "End", "Page Up", "Page Down"
]

HOTKEY_PRESET_KEYS = [
    "F8", "F9", "F10", "F11", "F12", "F6", "F5", "F1", "F2", "F3", "F4", "F7",
    "ALT+A", "CTRL+F8", "CTRL+SHIFT+S", "CTRL+SHIFT+E", "Insert", "Delete", "Home", "End", "Page Up", "Page Down"
]

if EVDEV_AVAILABLE:
    CHAR_MAP = {
        'a': e.KEY_A, 'b': e.KEY_B, 'c': e.KEY_C, 'd': e.KEY_D, 'e': e.KEY_E,
        'f': e.KEY_F, 'g': e.KEY_G, 'h': e.KEY_H, 'i': e.KEY_I, 'j': e.KEY_J,
        'k': e.KEY_K, 'l': e.KEY_L, 'm': e.KEY_M, 'n': e.KEY_N, 'o': e.KEY_O,
        'p': e.KEY_P, 'q': e.KEY_Q, 'r': e.KEY_R, 's': e.KEY_S, 't': e.KEY_T,
        'u': e.KEY_U, 'v': e.KEY_V, 'w': e.KEY_W, 'x': e.KEY_X, 'y': e.KEY_Y,
        'z': e.KEY_Z,
        '0': e.KEY_0, '1': e.KEY_1, '2': e.KEY_2, '3': e.KEY_3, '4': e.KEY_4,
        '5': e.KEY_5, '6': e.KEY_6, '7': e.KEY_7, '8': e.KEY_8, '9': e.KEY_9,
        ' ': e.KEY_SPACE, '\n': e.KEY_ENTER, '\r': e.KEY_ENTER, '\t': e.KEY_TAB,
        '-': e.KEY_MINUS, '=': e.KEY_EQUAL, '[': e.KEY_LEFTBRACE, ']': e.KEY_RIGHTBRACE,
        ';': e.KEY_SEMICOLON, "'": e.KEY_APOSTROPHE, '`': e.KEY_GRAVE, '\\': e.KEY_BACKSLASH,
        ',': e.KEY_COMMA, '.': e.KEY_DOT, '/': e.KEY_SLASH
    }

    SHIFT_CHAR_MAP = {
        'A': e.KEY_A, 'B': e.KEY_B, 'C': e.KEY_C, 'D': e.KEY_D, 'E': e.KEY_E,
        'F': e.KEY_F, 'G': e.KEY_G, 'H': e.KEY_H, 'I': e.KEY_I, 'J': e.KEY_J,
        'K': e.KEY_K, 'L': e.KEY_L, 'M': e.KEY_M, 'N': e.KEY_N, 'O': e.KEY_O,
        'P': e.KEY_P, 'Q': e.KEY_Q, 'R': e.KEY_R, 'S': e.KEY_S, 'T': e.KEY_T,
        'U': e.KEY_U, 'V': e.KEY_V, 'W': e.KEY_W, 'X': e.KEY_X, 'Y': e.KEY_Y,
        'Z': e.KEY_Z,
        '!': e.KEY_1, '@': e.KEY_2, '#': e.KEY_3, '$': e.KEY_4, '%': e.KEY_5,
        '^': e.KEY_6, '&': e.KEY_7, '*': e.KEY_8, '(': e.KEY_9, ')': e.KEY_0,
        '_': e.KEY_MINUS, '+': e.KEY_EQUAL, '{': e.KEY_LEFTBRACE, '}': e.KEY_RIGHTBRACE,
        ':': e.KEY_SEMICOLON, '"': e.KEY_APOSTROPHE, '~': e.KEY_GRAVE, '|': e.KEY_BACKSLASH,
        '<': e.KEY_COMMA, '>': e.KEY_DOT, '?': e.KEY_SLASH
    }


def get_running_pid():
    if os.path.exists(PID_FILE):
        try:
            with open(PID_FILE, "r") as f:
                pid = int(f.read().strip())
            os.kill(pid, 0)
            return pid
        except Exception:
            pass
    return None


# Handle CLI Toggle
running_pid = get_running_pid()
if "--toggle" in sys.argv:
    if running_pid:
        try:
            if hasattr(signal, "SIGUSR1"):
                os.kill(running_pid, signal.SIGUSR1)
            else:
                os.kill(running_pid, signal.SIGTERM)
            print("Toggled Mahmoud Presser.")
            sys.exit(0)
        except Exception as err:
            print(f"Error toggling presser: {err}")
            sys.exit(1)
    else:
        print("Mahmoud Presser is not currently running.")
        sys.exit(1)

# Write PID
try:
    with open(PID_FILE, "w") as f:
        f.write(str(os.getpid()))
except Exception:
    pass


def normalize_key_str(k):
    """Sanitizes key strings by mapping Shifted symbols / Arabic layout characters to standard ASCII QWERTY equivalents."""
    if not k:
        return "Mouse 1"
    k_upper = str(k).upper().strip()
    parts = [p.strip() for p in k_upper.split("+") if p.strip()]

    mods = []
    others = []

    for p in parts:
        clean = SYMBOL_TO_KEY.get(p, "".join(SYMBOL_TO_KEY.get(ch, ch) for ch in p)).upper()
        if clean in ["CTRL", "CONTROL", "LEFTCTRL", "RIGHTCTRL"]:
            mods.append("CTRL")
        elif clean in ["ALT", "LEFTALT", "RIGHTALT"]:
            mods.append("ALT")
        elif clean in ["SHIFT", "LEFTSHIFT", "RIGHTSHIFT"]:
            mods.append("SHIFT")
        elif clean in ["SUPER", "WIN", "CMD", "LEFTMETA", "RIGHTMETA"]:
            mods.append("SUPER")
        else:
            others.append(clean)

    ordered = [m for m in ["CTRL", "ALT", "SHIFT", "SUPER"] if m in mods] + others
    return "+".join(ordered) if ordered else "Mouse 1"


def resolve_x11_latin_base(code):
    """Iterates across all X11 KeySym columns (0-7) to dynamically extract the base Latin letter/digit for a keycode."""
    if not X11_DISPLAY or not isinstance(code, int) or not (8 <= code <= 255):
        return None
    for col in range(8):
        try:
            sym = X11_DISPLAY.keycode_to_keysym(code, col)
            if sym:
                if 97 <= sym <= 122: return chr(sym).upper()
                if 65 <= sym <= 90: return chr(sym)
                if 48 <= sym <= 57: return chr(sym)
                if X11_XK:
                    name = X11_XK.keysym_to_string(sym)
                    if name and len(name) == 1:
                        ch_u = name.upper()
                        if ('A' <= ch_u <= 'Z') or ('0' <= ch_u <= '9'):
                            return ch_u
        except Exception:
            pass
    return None


def get_key_name_normalized(key):
    """Fully Automatic Multi-Column Dynamic Key Detection Engine across Linux (X11/Wayland), Windows, and macOS."""
    try:
        # 1. Special Named Keys (pynput.keyboard.Key instances like Key.up, Key.space, Key.shift)
        if hasattr(key, 'name') and key.name:
            name = key.name.upper()
            if 'ALT' in name: return 'ALT'
            if 'CTRL' in name or 'CONTROL' in name: return 'CTRL'
            if 'SHIFT' in name: return 'SHIFT'
            if 'CMD' in name or 'WIN' in name or 'SUPER' in name: return 'SUPER'
            if name == 'SPACE': return 'SPACE'
            if name in ['ESC', 'ESCAPE']: return 'ESC'
            if name in ['ENTER', 'RETURN']: return 'ENTER'
            if name == 'TAB': return 'TAB'
            if name == 'BACKSPACE': return 'BACKSPACE'
            if name == 'UP': return 'UP'
            if name == 'DOWN': return 'DOWN'
            if name == 'LEFT': return 'LEFT'
            if name == 'RIGHT': return 'RIGHT'
            if name == 'DELETE': return 'DELETE'
            if name == 'INSERT': return 'INSERT'
            if name == 'HOME': return 'HOME'
            if name == 'END': return 'END'
            if name in ['PAGE_UP', 'PAGEUP']: return 'PAGE UP'
            if name in ['PAGE_DOWN', 'PAGEDOWN']: return 'PAGE DOWN'
            return name

        # 2. Dynamic OS Hardware Keycode Resolution (Multi-Column X11 Base KeySym Search)
        code = getattr(key, 'hardware_keycode', None) or getattr(key, 'scancode', None) or getattr(key, 'vk', None)
        if isinstance(code, int):
            latin = resolve_x11_latin_base(code)
            if latin:
                return latin
            if 65 <= code <= 90: return chr(code)
            if 97 <= code <= 122: return chr(code).upper()
            if 48 <= code <= 57: return chr(code)

        # 3. Fallback to key.char attribute
        if hasattr(key, 'char') and key.char:
            ch = key.char
            if ch == ' ': return 'SPACE'
            if ch in SYMBOL_TO_KEY:
                return SYMBOL_TO_KEY[ch]
            ch_upper = ch.upper()
            if len(ch_upper) == 1 and (('A' <= ch_upper <= 'Z') or ('0' <= ch_upper <= '9')):
                return ch_upper

        # 4. Fallback for symbols
        if hasattr(key, 'char') and key.char:
            if ord(key.char) <= 127:
                return key.char.upper()
    except Exception:
        pass
    return str(key).upper()


def save_config_atomic(filepath, cfg_data):
    """Atomic configuration file write to prevent file corruption."""
    try:
        dir_name = os.path.dirname(filepath)
        os.makedirs(dir_name, exist_ok=True)
        temp_fd, temp_path = tempfile.mkstemp(dir=dir_name, prefix="cfg_", suffix=".tmp")
        with os.fdopen(temp_fd, 'w') as f:
            json.dump(cfg_data, f, indent=2)
        os.replace(temp_path, filepath)
        return True
    except Exception as ex:
        print("Error saving config:", ex)
        return False


class PresserEngine:
    """Universal Cross-Platform Automation Engine (Linux evdev/pynput, Windows & macOS pynput)."""

    def __init__(self):
        self.backend = "pynput"
        self.ui = None
        self.pynput_kb = None
        self.pynput_ms = None
        self.stop_event = threading.Event()

        self.init_input_backend()

    def init_input_backend(self):
        if IS_LINUX and EVDEV_AVAILABLE:
            caps = {
                e.EV_KEY: list(range(0, 0x2ff)),
                e.EV_REL: [e.REL_X, e.REL_Y, e.REL_WHEEL]
            }
            try:
                self.ui = UInput(caps, name="Mahmoud Presser Virtual Device")
                self.backend = "evdev"
                return
            except Exception:
                self.ui = None

        if PYNPUT_AVAILABLE:
            try:
                self.pynput_kb = pynput.keyboard.Controller()
                self.pynput_ms = pynput.mouse.Controller()
                self.backend = "pynput"
                return
            except Exception as ex:
                print("Error initializing pynput controller:", ex)

        self.backend = "none"

    def parse_single_key(self, key_str):
        key_norm = normalize_key_str(key_str)
        key_upper = key_norm.upper()

        if self.backend == "evdev":
            if key_upper in ["MOUSE 1", "LEFT", "BTN_LEFT"]: return e.BTN_LEFT
            if key_upper in ["MOUSE 2", "MIDDLE", "BTN_MIDDLE"]: return e.BTN_MIDDLE
            if key_upper in ["MOUSE 3", "RIGHT", "BTN_RIGHT"]: return e.BTN_RIGHT
            if key_upper in ["SPACE", "KEY_SPACE"]: return e.KEY_SPACE
            if key_upper in ["ENTER", "RETURN"]: return e.KEY_ENTER
            if key_upper in ["TAB"]: return e.KEY_TAB
            if key_upper in ["ESCAPE", "ESC"]: return e.KEY_ESC
            if key_upper in ["BACKSPACE"]: return e.KEY_BACKSPACE
            if key_upper in ["SHIFT", "LEFTSHIFT", "SHIFT_L", "SHIFT_R"]: return e.KEY_LEFTSHIFT
            if key_upper in ["CTRL", "LEFTCTRL", "CTRL_L", "CTRL_R", "CONTROL"]: return e.KEY_LEFTCTRL
            if key_upper in ["ALT", "LEFTALT", "ALT_L", "ALT_R"]: return e.KEY_LEFTALT
            if key_upper in ["SUPER", "WIN", "CMD"]: return e.KEY_LEFTMETA
            if hasattr(e, "KEY_" + key_upper): return getattr(e, "KEY_" + key_upper)
            return e.BTN_LEFT

        elif self.backend == "pynput":
            if key_upper in ["MOUSE 1", "LEFT", "BTN_LEFT"]:
                return ("mouse", pynput.mouse.Button.left)
            if key_upper in ["MOUSE 2", "MIDDLE", "BTN_MIDDLE"]:
                return ("mouse", pynput.mouse.Button.middle)
            if key_upper in ["MOUSE 3", "RIGHT", "BTN_RIGHT"]:
                return ("mouse", pynput.mouse.Button.right)

            pynput_map = {
                "SPACE": pynput.keyboard.Key.space,
                "ENTER": pynput.keyboard.Key.enter,
                "RETURN": pynput.keyboard.Key.enter,
                "TAB": pynput.keyboard.Key.tab,
                "ESCAPE": pynput.keyboard.Key.esc,
                "ESC": pynput.keyboard.Key.esc,
                "BACKSPACE": pynput.keyboard.Key.backspace,
                "SHIFT": pynput.keyboard.Key.shift,
                "CTRL": pynput.keyboard.Key.ctrl,
                "ALT": pynput.keyboard.Key.alt,
                "SUPER": pynput.keyboard.Key.cmd,
                "CAPS LOCK": pynput.keyboard.Key.caps_lock,
                "UP": pynput.keyboard.Key.up,
                "DOWN": pynput.keyboard.Key.down,
                "LEFT": pynput.keyboard.Key.left,
                "RIGHT": pynput.keyboard.Key.right,
                "DELETE": pynput.keyboard.Key.delete,
                "INSERT": pynput.keyboard.Key.insert,
                "HOME": pynput.keyboard.Key.home,
                "END": pynput.keyboard.Key.end,
                "PAGE UP": pynput.keyboard.Key.page_up,
                "PAGE DOWN": pynput.keyboard.Key.page_down,
                "F1": pynput.keyboard.Key.f1, "F2": pynput.keyboard.Key.f2, "F3": pynput.keyboard.Key.f3,
                "F4": pynput.keyboard.Key.f4, "F5": pynput.keyboard.Key.f5, "F6": pynput.keyboard.Key.f6,
                "F7": pynput.keyboard.Key.f7, "F8": pynput.keyboard.Key.f8, "F9": pynput.keyboard.Key.f9,
                "F10": pynput.keyboard.Key.f10, "F11": pynput.keyboard.Key.f11, "F12": pynput.keyboard.Key.f12,
            }
            if key_upper in pynput_map:
                return ("keyboard", pynput_map[key_upper])
            elif len(key_upper) == 1:
                return ("keyboard", key_upper.lower())
            else:
                return ("keyboard", key_upper.lower())

        return None

    def parse_combo(self, combo_str):
        combo_clean = normalize_key_str(combo_str)
        parts = [p.strip() for p in combo_clean.split("+") if p.strip()]
        if not parts:
            parts = ["Mouse 1"]
        return [self.parse_single_key(p) for p in parts]

    def press_down(self, parsed_key):
        if self.backend == "evdev" and self.ui:
            self.ui.write(e.EV_KEY, parsed_key, 1)
            self.ui.syn()
        elif self.backend == "pynput" and self.pynput_kb:
            kind, obj = parsed_key
            if kind == "mouse":
                self.pynput_ms.press(obj)
            else:
                self.pynput_kb.press(obj)

    def release(self, parsed_key):
        if self.backend == "evdev" and self.ui:
            self.ui.write(e.EV_KEY, parsed_key, 0)
            self.ui.syn()
        elif self.backend == "pynput" and self.pynput_kb:
            kind, obj = parsed_key
            if kind == "mouse":
                self.pynput_ms.release(obj)
            else:
                self.pynput_kb.release(obj)

    def press_combo_down(self, parsed_keys):
        for p_key in parsed_keys:
            if p_key:
                self.press_down(p_key)

    def release_combo_up(self, parsed_keys):
        for p_key in reversed(parsed_keys):
            if p_key:
                self.release(p_key)

    def click_loop(self, delay, combo_str, on_stop_cb):
        parsed_keys = self.parse_combo(combo_str)
        if not parsed_keys:
            on_stop_cb()
            return

        self.stop_event.clear()
        try:
            self.stop_event.wait(max(0.3, delay))
            while not self.stop_event.is_set():
                self.press_combo_down(parsed_keys)
                self.stop_event.wait(0.02)
                self.release_combo_up(parsed_keys)
                self.stop_event.wait(delay)
        except Exception as ex:
            print("Clicker loop notice:", ex)
        finally:
            on_stop_cb()

    def sequence_loop(self, steps, sequence_delay, loop_count, on_stop_cb, on_step_progress_cb=None):
        if not steps:
            on_stop_cb()
            return

        self.stop_event.clear()
        try:
            self.stop_event.wait(max(0.3, sequence_delay))
            current_loop = 0
            while not self.stop_event.is_set():
                current_loop += 1
                for idx, step in enumerate(steps):
                    if self.stop_event.is_set():
                        break

                    combo_str = step.get("key", "Mouse 1")
                    hold_s = float(step.get("hold_ms", 50)) / 1000.0
                    delay_s = float(step.get("delay_ms", 200)) / 1000.0
                    parsed_keys = self.parse_combo(combo_str)

                    if on_step_progress_cb:
                        on_step_progress_cb(idx, len(steps), current_loop, normalize_key_str(combo_str))

                    # Press Key / Combination Down
                    self.press_combo_down(parsed_keys)

                    # Hold Duration
                    if hold_s > 0:
                        self.stop_event.wait(hold_s)
                    else:
                        self.stop_event.wait(0.02)

                    # Release Key / Combination
                    self.release_combo_up(parsed_keys)

                    # Delay to Next Action
                    if delay_s > 0:
                        self.stop_event.wait(delay_s)

                if loop_count > 0 and current_loop >= loop_count:
                    break

                if sequence_delay > 0 and not self.stop_event.is_set():
                    self.stop_event.wait(sequence_delay)
        except Exception as ex:
            print("Sequence loop notice:", ex)
        finally:
            on_stop_cb()

    def type_loop(self, text, char_delay, interval_delay, on_stop_cb):
        if not text:
            on_stop_cb()
            return

        self.stop_event.clear()
        try:
            self.stop_event.wait(max(0.3, interval_delay))
            while not self.stop_event.is_set():
                if self.backend == "evdev" and self.ui:
                    for char in text:
                        if self.stop_event.is_set(): break
                        use_shift = char in SHIFT_CHAR_MAP
                        keycode = SHIFT_CHAR_MAP.get(char) if use_shift else CHAR_MAP.get(char)
                        if keycode is not None:
                            if use_shift:
                                self.ui.write(e.EV_KEY, e.KEY_LEFTSHIFT, 1)
                                self.ui.syn()
                            self.ui.write(e.EV_KEY, keycode, 1)
                            self.ui.write(e.EV_KEY, keycode, 0)
                            self.ui.syn()
                            if use_shift:
                                self.ui.write(e.EV_KEY, e.KEY_LEFTSHIFT, 0)
                                self.ui.syn()
                        self.stop_event.wait(char_delay)
                elif self.backend == "pynput" and self.pynput_kb:
                    for char in text:
                        if self.stop_event.is_set(): break
                        self.pynput_kb.type(char)
                        self.stop_event.wait(char_delay)

                if interval_delay > 0:
                    self.stop_event.wait(interval_delay)
                else:
                    break
        except Exception as ex:
            print("Typer loop notice:", ex)
        finally:
            on_stop_cb()

    def stop(self):
        self.stop_event.set()


class GlobalHotkeyListener:
    """Monitors global system-wide single keys or key combinations (e.g., ALT+A) to toggle start/stop."""

    def __init__(self, toggle_callback):
        self.toggle_callback = toggle_callback
        self.toggle_combo_set = set(["F8"])
        self.toggle_str = "F8"
        self.current_pressed = set()
        self.listener = None
        self.running = False
        self.last_trigger_time = 0

    def set_toggle_key(self, key_str):
        if key_str:
            norm = normalize_key_str(key_str)
            self.toggle_str = norm.upper().strip()
            parts = [p.strip() for p in self.toggle_str.split("+") if p.strip()]
            self.toggle_combo_set = set(parts)

    def start(self):
        if not PYNPUT_AVAILABLE or self.running:
            return
        self.running = True

        def on_press(key):
            if not self.running:
                return False
            name = get_key_name_normalized(key)
            if name:
                self.current_pressed.add(name)
                now = time.time()
                if self.toggle_combo_set and self.toggle_combo_set.issubset(self.current_pressed):
                    if (now - self.last_trigger_time) > 0.4:
                        self.last_trigger_time = now
                        self.toggle_callback()

        def on_release(key):
            name = get_key_name_normalized(key)
            if name in self.current_pressed:
                self.current_pressed.remove(name)

        try:
            self.listener = pynput.keyboard.Listener(on_press=on_press, on_release=on_release)
            self.listener.daemon = True
            self.listener.start()
        except Exception as ex:
            print("Global hotkey listener notice:", ex)

    def stop(self):
        self.running = False


def record_hotkey_universal(callback):
    """Universal Key & Key Combination Recorder."""
    def _worker():
        captured = ""
        done_event = threading.Event()
        current_keys = []

        if PYNPUT_AVAILABLE:
            def on_key_press(key):
                k_name = get_key_name_normalized(key)
                if k_name and k_name not in current_keys:
                    current_keys.append(k_name)

            def on_key_release(key):
                nonlocal captured
                if current_keys and not done_event.is_set():
                    mods = [k for k in ['CTRL', 'ALT', 'SHIFT', 'SUPER'] if k in current_keys]
                    others = [k for k in current_keys if k not in ['CTRL', 'ALT', 'SHIFT', 'SUPER']]
                    combo = mods + others
                    captured = "+".join(combo)
                    done_event.set()
                    return False

            def on_mouse_click(x, y, button, pressed):
                nonlocal captured
                if pressed and not done_event.is_set():
                    btn_name = "Mouse 1"
                    if button == pynput.mouse.Button.middle: btn_name = "Mouse 2"
                    elif button == pynput.mouse.Button.right: btn_name = "Mouse 3"

                    if current_keys:
                        mods = [k for k in ['CTRL', 'ALT', 'SHIFT', 'SUPER'] if k in current_keys]
                        combo = mods + [btn_name]
                        captured = "+".join(combo)
                    else:
                        captured = btn_name
                    done_event.set()
                    return False

            k_listener = pynput.keyboard.Listener(on_press=on_key_press, on_release=on_key_release)
            m_listener = pynput.mouse.Listener(on_click=on_mouse_click)

            k_listener.start()
            m_listener.start()

            done_event.wait(timeout=10.0)

            try:
                k_listener.stop()
                m_listener.stop()
            except Exception: pass
        elif IS_LINUX:
            proc = None
            try:
                import pty
                m, s = pty.openpty()
                proc = subprocess.Popen(["wev"], stdout=s, stderr=s)
                os.close(s)
                start_t = time.time()
                while time.time() - start_t < 10.0:
                    r, _, _ = select.select([m], [], [], 0.2)
                    if r:
                        data = os.read(m, 4096).decode(errors='ignore')
                        if not data: break
                        if "wl_keyboard" in data and "state: 1 (pressed)" in data:
                            match = re.search(r"sym: ([^)]+)", data)
                            if match:
                                captured = match.group(1).split()[0].upper()
                                break
                        elif "wl_pointer" in data and "state: 1 (pressed)" in data:
                            match = re.search(r"button: [0-9]+ \(([^)]+)\)", data)
                            if match:
                                btn = match.group(1)
                                if btn == "BTN_LEFT": captured = "Mouse 1"
                                elif btn == "BTN_RIGHT": captured = "Mouse 3"
                                elif btn == "BTN_MIDDLE": captured = "Mouse 2"
                                else: captured = "Mouse 1"
                                break
            except Exception: pass
            finally:
                if proc:
                    try:
                        proc.kill()
                        proc.wait()
                    except Exception: pass

        callback(normalize_key_str(captured))

    threading.Thread(target=_worker, daemon=True).start()


def record_live_macro_sequence(on_step_added, stop_event, toggle_key_str="F8", on_stopped_cb=None):
    """Measures real-time key/mouse presses, hold durations, and delays between actions with ESC / F8 stop trigger."""
    def _live_worker():
        if not PYNPUT_AVAILABLE: return

        last_release_time = None
        press_times = {}
        active_modifiers = []
        used_modifiers = set()
        toggle_key_upper = normalize_key_str(toggle_key_str).upper().strip() if toggle_key_str else "F8"

        def on_key_press(key):
            nonlocal last_release_time
            if stop_event.is_set(): return False
            k = get_key_name_normalized(key)
            if k in ["ESC", "ESCAPE", toggle_key_upper]:
                stop_event.set()
                press_times.clear()
                if on_stopped_cb:
                    on_stopped_cb()
                return False

            now = time.time()
            if k in ['SHIFT', 'CTRL', 'ALT', 'SUPER']:
                if k not in active_modifiers:
                    active_modifiers.append(k)
                if k not in press_times:
                    delay = int((now - last_release_time) * 1000) if last_release_time else 200
                    press_times[k] = (now, delay, k)
            else:
                if k not in press_times:
                    delay = int((now - last_release_time) * 1000) if last_release_time else 200
                    combo = [m for m in ['CTRL', 'ALT', 'SHIFT', 'SUPER'] if m in active_modifiers] + [k]
                    combo_str = "+".join(combo)
                    for m in active_modifiers:
                        used_modifiers.add(m)
                    press_times[k] = (now, delay, combo_str)

        def on_key_release(key):
            nonlocal last_release_time
            if stop_event.is_set(): return False
            k = get_key_name_normalized(key)
            if k in ["ESC", "ESCAPE", toggle_key_upper]:
                return False

            now = time.time()
            if k in press_times:
                press_t, delay, combo_str = press_times.pop(k)
                hold = max(20, int((now - press_t) * 1000))
                last_release_time = now

                if k in ['SHIFT', 'CTRL', 'ALT', 'SUPER']:
                    if k in active_modifiers:
                        active_modifiers.remove(k)
                    if k in used_modifiers:
                        used_modifiers.remove(k)
                        return

                if not stop_event.is_set():
                    on_step_added({"key": combo_str, "hold_ms": hold, "delay_ms": delay})

        def on_mouse_click(x, y, button, pressed):
            nonlocal last_release_time
            if stop_event.is_set(): return False
            btn_name = "Mouse 1"
            if button == pynput.mouse.Button.middle: btn_name = "Mouse 2"
            elif button == pynput.mouse.Button.right: btn_name = "Mouse 3"

            now = time.time()
            if pressed:
                if btn_name not in press_times:
                    delay = int((now - last_release_time) * 1000) if last_release_time else 200
                    combo = [m for m in ['CTRL', 'ALT', 'SHIFT', 'SUPER'] if m in active_modifiers] + [btn_name]
                    combo_str = "+".join(combo)
                    for m in active_modifiers:
                        used_modifiers.add(m)
                    press_times[btn_name] = (now, delay, combo_str)
            else:
                if btn_name in press_times:
                    press_t, delay, combo_str = press_times.pop(btn_name)
                    hold = max(20, int((now - press_t) * 1000))
                    last_release_time = now
                    if not stop_event.is_set():
                        on_step_added({"key": combo_str, "hold_ms": hold, "delay_ms": delay})

        k_listener = pynput.keyboard.Listener(on_press=on_key_press, on_release=on_key_release)
        m_listener = pynput.mouse.Listener(on_click=on_mouse_click)

        k_listener.start()
        m_listener.start()

        while not stop_event.is_set():
            time.sleep(0.1)

        try:
            k_listener.stop()
            m_listener.stop()
        except Exception: pass

    threading.Thread(target=_live_worker, daemon=True).start()


# --- Qt GUI Implementation ---
MODERN_QT_STYLE = """
QWidget {
    background-color: #1e1e2e;
    color: #cdd6f4;
    font-family: 'Segoe UI', Roboto, Ubuntu, sans-serif;
    font-size: 13px;
}
QGroupBox {
    border: 1px solid #313244;
    border-radius: 8px;
    margin-top: 10px;
    font-weight: bold;
    color: #89b4fa;
    padding-top: 10px;
}
QGroupBox::title {
    subcontrol-origin: margin;
    subcontrol-position: top left;
    padding: 0 6px;
}
QLineEdit, QTextEdit, QComboBox {
    background-color: #181825;
    color: #cdd6f4;
    border: 1px solid #45475a;
    border-radius: 6px;
    padding: 6px;
}
QLineEdit:focus, QTextEdit:focus, QComboBox:focus {
    border: 1px solid #89b4fa;
}
QPushButton {
    background-color: #313244;
    color: #cdd6f4;
    border: 1px solid #45475a;
    border-radius: 6px;
    padding: 6px 14px;
    font-weight: bold;
}
QPushButton:hover {
    background-color: #45475a;
}
QPushButton:pressed {
    background-color: #585b70;
}
QTableWidget {
    background-color: #181825;
    gridline-color: #313244;
    selection-background-color: #89b4fa;
    selection-color: #1e1e2e;
    border-radius: 6px;
    color: #cdd6f4;
}
QHeaderView::section {
    background-color: #313244;
    color: #89b4fa;
    padding: 6px;
    border: 1px solid #45475a;
    font-weight: bold;
}
"""


def run_qt_app(engine):
    try:
        from PyQt6.QtWidgets import (QApplication, QWidget, QVBoxLayout, QHBoxLayout,
                                     QGroupBox, QLabel, QLineEdit, QPushButton, QGridLayout,
                                     QRadioButton, QTextEdit, QStackedWidget,
                                     QTableWidget, QTableWidgetItem, QHeaderView, QComboBox,
                                     QAbstractItemView, QMessageBox, QInputDialog)
        from PyQt6.QtCore import pyqtSignal, QObject, Qt, QTimer
        from PyQt6.QtGui import QShortcut, QKeySequence
    except ImportError:
        try:
            from PyQt5.QtWidgets import (QApplication, QWidget, QVBoxLayout, QHBoxLayout,
                                         QGroupBox, QLabel, QLineEdit, QPushButton, QGridLayout,
                                         QRadioButton, QTextEdit, QStackedWidget,
                                         QTableWidget, QTableWidgetItem, QHeaderView, QComboBox,
                                         QAbstractItemView, QMessageBox, QInputDialog)
            from PyQt5.QtCore import pyqtSignal, QObject, Qt, QTimer
            from PyQt5.QtGui import QShortcut, QKeySequence
        except ImportError:
            print("Qt bindings (PyQt6/PyQt5) not found.")
            return False

    class QtSignalDispatcher(QObject):
        hotkey_recorded = pyqtSignal(str, object)
        live_step_added = pyqtSignal(dict)
        live_rec_stopped = pyqtSignal()
        step_progress = pyqtSignal(int, int, int, str)
        stop_signal = pyqtSignal()
        toggle_signal = pyqtSignal()


    class KeyRecorderDialog(QDialog):
        def __init__(self, parent=None):
            super().__init__(parent)
            self.setWindowTitle("Record Keybind")
            self.setFixedSize(350, 180)
            self.setWindowFlags(self.windowFlags() | Qt.WindowType.WindowStaysOnTopHint | Qt.WindowType.FramelessWindowHint)
            self.setStyleSheet("background-color: #1e1e2e; color: #cdd6f4; border: 2px solid #89b4fa; border-radius: 8px;")
            layout = QVBoxLayout(self)
            self.lbl = QLabel("Press any key or combination...\n(e.g., CTRL + H, or Mouse Button)\n\nPress ESC to cancel.")
            self.lbl.setAlignment(Qt.AlignmentFlag.AlignCenter)
            self.lbl.setStyleSheet("font-size: 14px; font-weight: bold; border: none;")
            layout.addWidget(self.lbl)
            self.recorded_key = ""
            self.setFocusPolicy(Qt.FocusPolicy.StrongFocus)
            self.grabKeyboard()
        
        def keyPressEvent(self, event):
            mods = []
            if event.modifiers() & Qt.KeyboardModifier.ControlModifier: mods.append("CTRL")
            if event.modifiers() & Qt.KeyboardModifier.AltModifier: mods.append("ALT")
            if event.modifiers() & Qt.KeyboardModifier.ShiftModifier: mods.append("SHIFT")
            if event.modifiers() & Qt.KeyboardModifier.MetaModifier: mods.append("SUPER")
            
            key = event.key()
            if key == Qt.Key.Key_Escape and not mods:
                self.reject()
                return
                
            if key in [Qt.Key.Key_Control, Qt.Key.Key_Shift, Qt.Key.Key_Alt, Qt.Key.Key_Meta]:
                return # Wait for actual key
            
            key_name = QKeySequence(key).toString().upper()
            if not key_name and key < 256:
                key_name = chr(key).upper()
                
            if key_name:
                self.recorded_key = "+".join(mods + [key_name])
                self.accept()
                
        def mousePressEvent(self, event):
            mods = []
            if event.modifiers() & Qt.KeyboardModifier.ControlModifier: mods.append("CTRL")
            if event.modifiers() & Qt.KeyboardModifier.AltModifier: mods.append("ALT")
            if event.modifiers() & Qt.KeyboardModifier.ShiftModifier: mods.append("SHIFT")
            if event.modifiers() & Qt.KeyboardModifier.MetaModifier: mods.append("SUPER")
            
            btn = "Mouse 1"
            if event.button() == Qt.MouseButton.RightButton: btn = "Mouse 3"
            elif event.button() == Qt.MouseButton.MiddleButton: btn = "Mouse 2"
            elif event.button() == Qt.MouseButton.ExtraButton1: btn = "Mouse 4"
            elif event.button() == Qt.MouseButton.ExtraButton2: btn = "Mouse 5"
            
            self.recorded_key = "+".join(mods + [btn])
            self.accept()

    class MahmoudPresserQtWindow(QWidget):
        def __init__(self):
            super().__init__()
            os_title = f" ({platform.system()} Edition)"
            self.setWindowTitle("Mahmoud Presser" + os_title)
            self.resize(800, 720)
            self.setStyleSheet(MODERN_QT_STYLE)

            self.engine = engine
            self.is_running = False
            self.is_live_recording = False
            self.live_rec_stop_event = threading.Event()
            self.sequence_steps = []
            self.profiles = {}

            self.dispatcher = QtSignalDispatcher()
            self.dispatcher.hotkey_recorded.connect(self.on_hotkey_recorded)
            self.dispatcher.live_step_added.connect(self.on_live_step_added)
            self.dispatcher.live_rec_stopped.connect(self.on_live_rec_stopped)
            self.dispatcher.step_progress.connect(self.on_step_progress)
            self.dispatcher.stop_signal.connect(self.on_stop_ui)
            self.dispatcher.toggle_signal.connect(self.toggle_action)

            self.saved_config = self.load_config()
            self.start_stop_keybind = normalize_key_str(self.saved_config.get("start_stop_hotkey", "F8"))
            self.profiles = self.saved_config.get("profiles", {"Default": self.saved_config.get("sequence_steps", [])})

            for p_name, p_steps in self.profiles.items():
                for s in p_steps:
                    s["key"] = normalize_key_str(s.get("key", "Mouse 1"))

            self.global_listener = GlobalHotkeyListener(lambda: self.dispatcher.toggle_signal.emit())
            self.global_listener.set_toggle_key(self.start_stop_keybind)
            self.global_listener.start()

            self.init_ui()

            self.sig_timer = QTimer()
            self.sig_timer.timeout.connect(lambda: None)
            self.sig_timer.start(200)

            if hasattr(signal, "SIGUSR1"):
                signal.signal(signal.SIGUSR1, lambda signum, frame: self.dispatcher.toggle_signal.emit())

        def load_config(self):
            cfg = {
                "mode": "single",
                "start_stop_hotkey": "F8",
                "hotkey": "Mouse 1",
                "text": "Hello World!",
                "char_delay_ms": "20",
                "hours": "0", "mins": "0", "secs": "0", "ms": "60",
                "sequence_steps": [
                    {"key": "Mouse 1", "hold_ms": 50, "delay_ms": 200},
                    {"key": "ALT+A", "hold_ms": 100, "delay_ms": 500}
                ],
                "seq_loop_count": "0",
                "profiles": {
                    "Default": [
                        {"key": "Mouse 1", "hold_ms": 50, "delay_ms": 200},
                        {"key": "ALT+A", "hold_ms": 100, "delay_ms": 500}
                    ]
                }
            }
            if os.path.exists(CONFIG_FILE):
                try:
                    with open(CONFIG_FILE, "r") as f:
                        cfg.update(json.load(f))
                except Exception:
                    pass

            cfg["start_stop_hotkey"] = normalize_key_str(cfg.get("start_stop_hotkey", "F8"))
            cfg["hotkey"] = normalize_key_str(cfg.get("hotkey", "Mouse 1"))

            steps = cfg.get("sequence_steps", [])
            for s in steps:
                s["key"] = normalize_key_str(s.get("key", "Mouse 1"))

            profiles = cfg.get("profiles", {})
            for p_k, p_steps in profiles.items():
                for s in p_steps:
                    s["key"] = normalize_key_str(s.get("key", "Mouse 1"))

            return cfg

        def save_config(self):
            mode_str = "single"
            if self.seq_mode_rb.isChecked(): mode_str = "sequence"
            elif self.text_mode_rb.isChecked(): mode_str = "text"

            cfg = {
                "mode": mode_str,
                "start_stop_hotkey": normalize_key_str(self.toggle_hk_entry.text()),
                "hotkey": normalize_key_str(self.hotkey_entry.text()),
                "text": self.text_edit.toPlainText(),
                "char_delay_ms": self.char_delay_entry.text(),
                "hours": self.hours_entry.text(),
                "mins": self.mins_entry.text(),
                "secs": self.secs_entry.text(),
                "ms": self.ms_entry.text(),
                "sequence_steps": self.sequence_steps,
                "seq_loop_count": self.seq_loop_entry.text(),
                "profiles": self.profiles
            }
            save_config_atomic(CONFIG_FILE, cfg)

        def init_ui(self):
            main_layout = QVBoxLayout(self)

            # Global Start/Stop Keybind Banner Box
            hk_banner = QGroupBox("Global Start / Stop Keybind (Works System-Wide)")
            hk_banner_layout = QHBoxLayout(hk_banner)

            self.banner_lbl = QLabel(f"⚡ Press [{self.start_stop_keybind}] anywhere to Start/Stop:")
            self.banner_lbl.setStyleSheet("font-weight: bold; color: #a6e3a1;")
            hk_banner_layout.addWidget(self.banner_lbl)

            self.toggle_hk_entry = QLineEdit(self.start_stop_keybind)
            self.toggle_hk_entry.setFixedWidth(85)
            self.toggle_hk_entry.setAlignment(Qt.AlignmentFlag.AlignCenter)
            hk_banner_layout.addWidget(self.toggle_hk_entry)

            self.hk_preset_combo = QComboBox()
            self.hk_preset_combo.addItems(["Preset..."] + HOTKEY_PRESET_KEYS)
            self.hk_preset_combo.currentIndexChanged.connect(self.on_start_stop_preset_selected)
            hk_banner_layout.addWidget(self.hk_preset_combo)

            self.rec_toggle_hk_btn = QPushButton("Record Keybind")
            self.rec_toggle_hk_btn.clicked.connect(lambda: self.start_record(self.rec_toggle_hk_btn, self.toggle_hk_entry, is_start_stop_record=True))
            hk_banner_layout.addWidget(self.rec_toggle_hk_btn)

            main_layout.addWidget(hk_banner)

            # Mode Selector
            mode_group = QGroupBox("Operation Mode")
            mode_layout = QHBoxLayout(mode_group)
            self.single_mode_rb = QRadioButton("Single Click / Key Combination")
            self.seq_mode_rb = QRadioButton("Multi-Step Action Sequence (Macro)")
            self.text_mode_rb = QRadioButton("Auto-Type Text")

            mode_layout.addWidget(self.single_mode_rb)
            mode_layout.addWidget(self.seq_mode_rb)
            mode_layout.addWidget(self.text_mode_rb)
            main_layout.addWidget(mode_group)

            # Interval Group
            self.interval_group = QGroupBox("Interval / Repeat Delay (Hover for info ℹ️)")
            self.interval_group.setToolTip("H = Hours, M = Minutes, S = Seconds, MS = Milliseconds\n\nThis defines the wait time before the macro loops and repeats itself.\nApplies to Single-Click, Sequence, and Auto-Type modes.")
            interval_layout = QHBoxLayout(self.interval_group)
            self.hours_entry = self.create_time_entry("H (Hours)", interval_layout, self.saved_config.get("hours", "0"))
            self.mins_entry = self.create_time_entry("M (Mins)", interval_layout, self.saved_config.get("mins", "0"))
            self.secs_entry = self.create_time_entry("S (Secs)", interval_layout, self.saved_config.get("secs", "0"))
            self.ms_entry = self.create_time_entry("MS (Millis)", interval_layout, self.saved_config.get("ms", "60"))
            main_layout.addWidget(self.interval_group)

            # Isolated QStackedWidget for Clean Mode Switching
            self.stack_widget = QStackedWidget()

            # --- Page 1: Single Clicker ---
            click_widget = QWidget()
            click_layout = QGridLayout(click_widget)

            click_layout.addWidget(QLabel("Target Key, Combo or Button:"), 0, 0)
            self.hotkey_entry = QLineEdit(self.saved_config.get("hotkey", "Mouse 1"))
            click_layout.addWidget(self.hotkey_entry, 0, 1)

            self.preset_combo = QComboBox()
            self.preset_combo.addItems(["Quick Preset..."] + COMMON_PRESET_KEYS)
            self.preset_combo.currentIndexChanged.connect(
                lambda idx: self.on_preset_selected(self.preset_combo, self.hotkey_entry, idx)
            )
            click_layout.addWidget(self.preset_combo, 0, 2)

            self.record_btn = QPushButton("Record Key / Combo")
            self.record_btn.clicked.connect(lambda: self.start_record(self.record_btn, self.hotkey_entry, is_sequence_record=False))
            click_layout.addWidget(self.record_btn, 0, 3)

            self.stack_widget.addWidget(click_widget)

            # --- Page 2: Multi-Step Sequence Builder ---
            seq_widget = QWidget()
            seq_layout = QVBoxLayout(seq_widget)

            # Profile Manager Bar
            prof_box = QGroupBox("Named Macro Sequence Profiles")
            prof_layout = QHBoxLayout(prof_box)
            prof_layout.addWidget(QLabel("Profile:"))
            self.profile_combo = QComboBox()
            self.refresh_profile_combo()
            self.profile_combo.currentIndexChanged.connect(self.on_profile_selected)
            prof_layout.addWidget(self.profile_combo)

            save_prof_btn = QPushButton("💾 Save As...")
            save_prof_btn.clicked.connect(self.save_current_profile_as)
            prof_layout.addWidget(save_prof_btn)

            rename_prof_btn = QPushButton("✏️ Rename")
            rename_prof_btn.clicked.connect(self.rename_current_profile)
            prof_layout.addWidget(rename_prof_btn)

            del_prof_btn = QPushButton("🗑️ Delete Profile")
            del_prof_btn.clicked.connect(self.delete_current_profile)
            prof_layout.addWidget(del_prof_btn)

            seq_layout.addWidget(prof_box)

            # Live Execution Indicator Banner
            self.seq_status_box = QGroupBox("Macro Execution Status")
            seq_status_layout = QHBoxLayout(self.seq_status_box)
            self.seq_status_lbl = QLabel("Status: ⏹ Idle (Ready)")
            self.seq_status_lbl.setStyleSheet("font-weight: bold; color: #a6adc8;")
            seq_status_layout.addWidget(self.seq_status_lbl)
            seq_layout.addWidget(self.seq_status_box)

            live_bar = QHBoxLayout()
            self.live_rec_btn = QPushButton("🔴 Record Sequence Live")
            self.live_rec_btn.setStyleSheet("font-weight: bold; background-color: #f38ba8; color: #11111b;")
            self.live_rec_btn.setMinimumHeight(35)
            self.live_rec_btn.clicked.connect(self.toggle_live_recording)
            live_bar.addWidget(self.live_rec_btn)
            seq_layout.addLayout(live_bar)

            self.seq_table = QTableWidget(0, 4)
            self.seq_table.setHorizontalHeaderLabels(["#", "Action / Keybind", "Hold Time (ms)", "Delay to Next (ms)"])
            self.seq_table.horizontalHeader().setSectionResizeMode(QHeaderView.ResizeMode.Stretch)
            self.seq_table.setSelectionBehavior(QAbstractItemView.SelectionBehavior.SelectRows)

            # Direct Table Cell Editing
            self.seq_table.itemChanged.connect(self.on_table_item_changed)
            seq_layout.addWidget(self.seq_table)

            # Step Manual Editor / Creator Box
            creator_box = QGroupBox("Manual Step Editor / Adder")
            creator_layout = QHBoxLayout(creator_box)

            creator_layout.addWidget(QLabel("Key/Combo:"))
            self.seq_step_key = QLineEdit("Mouse 1")
            self.seq_step_key.setFixedWidth(90)
            creator_layout.addWidget(self.seq_step_key)

            self.seq_preset_combo = QComboBox()
            self.seq_preset_combo.addItems(["Preset..."] + COMMON_PRESET_KEYS)
            self.seq_preset_combo.currentIndexChanged.connect(
                lambda idx: self.on_preset_selected(self.seq_preset_combo, self.seq_step_key, idx)
            )
            creator_layout.addWidget(self.seq_preset_combo)

            self.seq_record_btn = QPushButton("Record")
            self.seq_record_btn.clicked.connect(lambda: self.start_record(self.seq_record_btn, self.seq_step_key, is_sequence_record=True))
            creator_layout.addWidget(self.seq_record_btn)

            creator_layout.addWidget(QLabel("Hold (ms):"))
            self.seq_hold_entry = QLineEdit("50")
            self.seq_hold_entry.setFixedWidth(45)
            creator_layout.addWidget(self.seq_hold_entry)

            creator_layout.addWidget(QLabel("Next Delay (ms):"))
            self.seq_delay_entry = QLineEdit("200")
            self.seq_delay_entry.setFixedWidth(45)
            creator_layout.addWidget(self.seq_delay_entry)

            add_step_btn = QPushButton("➕ Add Step")
            add_step_btn.setStyleSheet("font-weight: bold; background-color: #89b4fa; color: #11111b;")
            add_step_btn.clicked.connect(self.add_sequence_step)
            creator_layout.addWidget(add_step_btn)

            update_selected_btn = QPushButton("💾 Update Selected")
            update_selected_btn.setStyleSheet("font-weight: bold; background-color: #a6e3a1; color: #11111b;")
            update_selected_btn.clicked.connect(self.update_selected_step_from_editor)
            creator_layout.addWidget(update_selected_btn)

            seq_layout.addWidget(creator_box)

            ctrl_bar = QHBoxLayout()
            edit_btn = QPushButton("✏️ Edit Selected Step")
            edit_btn.clicked.connect(self.load_selected_step_to_editor)
            ctrl_bar.addWidget(edit_btn)

            rem_btn = QPushButton("Remove Selected")
            rem_btn.clicked.connect(self.remove_sequence_step)
            ctrl_bar.addWidget(rem_btn)

            move_up_btn = QPushButton("⬆️ Move Up")
            move_up_btn.clicked.connect(lambda: self.move_sequence_step(-1))
            ctrl_bar.addWidget(move_up_btn)

            move_dn_btn = QPushButton("⬇️ Move Down")
            move_dn_btn.clicked.connect(lambda: self.move_sequence_step(1))
            ctrl_bar.addWidget(move_dn_btn)

            clear_btn = QPushButton("Clear All")
            clear_btn.clicked.connect(self.clear_sequence_steps)
            ctrl_bar.addWidget(clear_btn)

            ctrl_bar.addStretch()
            ctrl_bar.addWidget(QLabel("Repeat Count (0=Inf):"))
            self.seq_loop_entry = QLineEdit(self.saved_config.get("seq_loop_count", "0"))
            self.seq_loop_entry.setFixedWidth(50)
            ctrl_bar.addWidget(self.seq_loop_entry)

            seq_layout.addLayout(ctrl_bar)
            self.stack_widget.addWidget(seq_widget)

            # --- Page 3: Auto-Type Text ---
            text_widget = QWidget()
            text_layout = QVBoxLayout(text_widget)

            t_top_layout = QHBoxLayout()
            t_top_layout.addWidget(QLabel("Text to Auto-Type (Word, Sentence, or Paragraph):"))
            t_top_layout.addStretch()
            t_top_layout.addWidget(QLabel("Char Delay (ms):"))
            self.char_delay_entry = QLineEdit(self.saved_config.get("char_delay_ms", "20"))
            self.char_delay_entry.setFixedWidth(60)
            t_top_layout.addWidget(self.char_delay_entry)
            text_layout.addLayout(t_top_layout)

            self.text_edit = QTextEdit()
            self.text_edit.setPlainText(self.saved_config.get("text", "Hello World!"))
            text_layout.addWidget(self.text_edit)

            self.stack_widget.addWidget(text_widget)
            main_layout.addWidget(self.stack_widget)

            # Start / Stop Buttons
            btn_layout = QHBoxLayout()
            self.start_btn = QPushButton(f"Start ({self.start_stop_keybind})")
            self.start_btn.setMinimumHeight(45)
            self.start_btn.setStyleSheet("font-weight: bold; background-color: #a6e3a1; color: #11111b; font-size: 14px;")
            self.start_btn.clicked.connect(self.on_start)
            btn_layout.addWidget(self.start_btn)

            self.stop_btn = QPushButton(f"Stop ({self.start_stop_keybind})")
            self.stop_btn.setMinimumHeight(45)
            self.stop_btn.setEnabled(False)
            self.stop_btn.setStyleSheet("font-weight: bold; font-size: 14px;")
            self.stop_btn.clicked.connect(self.on_stop)
            btn_layout.addWidget(self.stop_btn)

            main_layout.addLayout(btn_layout)

            self.update_keybind_ui(self.start_stop_keybind)

            self.sequence_steps = self.saved_config.get("sequence_steps", [])
            self.refresh_sequence_table()

            saved_mode = self.saved_config.get("mode", "single")
            if saved_mode == "sequence":
                self.seq_mode_rb.setChecked(True)
            elif saved_mode == "text":
                self.text_mode_rb.setChecked(True)
            else:
                self.single_mode_rb.setChecked(True)

            self.single_mode_rb.toggled.connect(self.on_mode_changed)
            self.seq_mode_rb.toggled.connect(self.on_mode_changed)
            self.text_mode_rb.toggled.connect(self.on_mode_changed)

            self.on_mode_changed()

        def create_time_entry(self, label, parent_layout, default):
            vbox = QVBoxLayout()
            entry = QLineEdit(default)
            entry.setAlignment(Qt.AlignmentFlag.AlignCenter)
            lbl = QLabel(label)
            lbl.setAlignment(Qt.AlignmentFlag.AlignCenter)
            vbox.addWidget(entry)
            vbox.addWidget(lbl)
            parent_layout.addLayout(vbox)
            return entry

        def refresh_profile_combo(self):
            self.profile_combo.blockSignals(True)
            self.profile_combo.clear()
            self.profile_combo.addItems(list(self.profiles.keys()))
            self.profile_combo.blockSignals(False)

        def on_profile_selected(self, idx):
            name = self.profile_combo.currentText()
            if name in self.profiles:
                self.sequence_steps = json.loads(json.dumps(self.profiles[name]))
                self.refresh_sequence_table()
                self.save_config()

        def save_current_profile_as(self):
            name, ok = QInputDialog.getText(self, "Save Macro Profile", "Enter profile name:")
            if ok and name.strip():
                p_name = name.strip()
                self.profiles[p_name] = json.loads(json.dumps(self.sequence_steps))
                self.refresh_profile_combo()
                self.profile_combo.setCurrentText(p_name)
                self.save_config()

        def rename_current_profile(self):
            old_name = self.profile_combo.currentText()
            if not old_name: return
            new_name, ok = QInputDialog.getText(self, "Rename Profile", "Enter new profile name:", text=old_name)
            if ok and new_name.strip():
                p_name = new_name.strip()
                if p_name in self.profiles and p_name != old_name:
                    QMessageBox.warning(self, "Notice", "A profile with that name already exists.")
                    return
                self.profiles[p_name] = self.profiles.pop(old_name)
                self.refresh_profile_combo()
                self.profile_combo.setCurrentText(p_name)
                self.save_config()

        def delete_current_profile(self):
            name = self.profile_combo.currentText()
            if name and len(self.profiles) > 1:
                del self.profiles[name]
                self.refresh_profile_combo()
                first_name = self.profile_combo.currentText()
                self.sequence_steps = json.loads(json.dumps(self.profiles[first_name]))
                self.refresh_sequence_table()
                self.save_config()
            elif len(self.profiles) <= 1:
                QMessageBox.warning(self, "Notice", "Cannot delete the last remaining profile.")

        def on_start_stop_preset_selected(self, idx):
            if idx > 0:
                selected = self.hk_preset_combo.currentText()
                self.toggle_hk_entry.setText(selected)
                self.hk_preset_combo.setCurrentIndex(0)
                self.update_keybind_ui(selected)
                self.save_config()

        def update_keybind_ui(self, key_str):
            key_str = normalize_key_str(key_str)
            if not key_str: key_str = "F8"
            self.start_stop_keybind = key_str
            self.toggle_hk_entry.setText(key_str)
            self.banner_lbl.setText(f"⚡ Press [{key_str}] anywhere to Start/Stop:")
            self.start_btn.setText(f"Start ({key_str})")
            self.stop_btn.setText(f"Stop ({key_str})")

            try:
                if hasattr(self, 'shortcut_keybind'):
                    self.shortcut_keybind.setEnabled(False)
                self.shortcut_keybind = QShortcut(QKeySequence(key_str), self)
                self.shortcut_keybind.activated.connect(self.toggle_action)
            except Exception:
                pass

            if hasattr(self, 'global_listener') and self.global_listener:
                self.global_listener.set_toggle_key(key_str)

        def on_preset_selected(self, combo, target_entry, idx):
            if idx > 0:
                selected = combo.currentText()
                target_entry.setText(selected)
                combo.setCurrentIndex(0)

        def on_mode_changed(self):
            if self.single_mode_rb.isChecked():
                self.stack_widget.setCurrentIndex(0)
            elif self.seq_mode_rb.isChecked():
                self.stack_widget.setCurrentIndex(1)
            else:
                self.stack_widget.setCurrentIndex(2)

        def start_record(self, btn, target_entry, is_sequence_record=False, is_start_stop_record=False):
            dlg = KeyRecorderDialog(self)
            if dlg.exec() == QDialog.DialogCode.Accepted and dlg.recorded_key:
                res = dlg.recorded_key
                self.on_hotkey_recorded(res, (btn, target_entry, is_sequence_record, is_start_stop_record))
            else:
                self.on_hotkey_recorded(None, (btn, target_entry, is_sequence_record, is_start_stop_record))

        def on_hotkey_recorded(self, res, refs):
            btn, target_entry, is_sequence_record, is_start_stop_record = refs
            btn.setText("Record Keybind" if is_start_stop_record else ("Record" if is_sequence_record else "Record Key / Combo"))
            btn.setEnabled(True)

            if res:
                formatted = normalize_key_str(res)
                target_entry.setText(formatted)
                if is_start_stop_record:
                    self.update_keybind_ui(formatted)
                    self.save_config()
                elif is_sequence_record:
                    self.add_sequence_step()
                else:
                    self.save_config()

        def toggle_live_recording(self):
            if self.is_live_recording:
                self.live_rec_stop_event.set()
                self.on_live_rec_stopped()
            else:
                self.is_live_recording = True
                self.live_rec_stop_event.clear()
                self.live_rec_btn.setText("⏹ Stop Live Recording (or press ESC)")
                self.live_rec_btn.setStyleSheet("font-weight: bold; background-color: #fab387; color: #11111b;")
                self.seq_status_lbl.setText("Status: 🔴 RECORDING LIVE ACTIONS IN REAL-TIME...")
                self.seq_status_lbl.setStyleSheet("font-weight: bold; color: #f38ba8;")

                def on_step_added(step):
                    self.dispatcher.live_step_added.emit(step)

                def on_stopped():
                    self.dispatcher.live_rec_stopped.emit()

                record_live_macro_sequence(on_step_added, self.live_rec_stop_event, self.start_stop_keybind, on_stopped)

        def on_live_step_added(self, step):
            if self.sequence_steps:
                self.sequence_steps[-1]["delay_ms"] = step.get("delay_ms", 200)
            step["key"] = normalize_key_str(step.get("key", "Mouse 1"))
            step["delay_ms"] = 200
            self.sequence_steps.append(step)
            self.refresh_sequence_table()
            self.seq_status_lbl.setText(f"Status: 🔴 RECORDING LIVE — Captured {len(self.sequence_steps)} steps")
            self.save_config()

        def on_live_rec_stopped(self):
            self.is_live_recording = False
            # Cleanly pop trailing Mouse 1 click used to click the Stop button!
            if self.sequence_steps and self.sequence_steps[-1].get("key") in ["Mouse 1", "MOUSE 1"]:
                self.sequence_steps.pop()
            self.refresh_sequence_table()

            self.live_rec_btn.setText("🔴 Record Sequence Live")
            self.live_rec_btn.setStyleSheet("font-weight: bold; background-color: #f38ba8; color: #11111b;")
            self.seq_status_lbl.setText(f"Status: ⏹ Idle ({len(self.sequence_steps)} steps ready)")
            self.seq_status_lbl.setStyleSheet("font-weight: bold; color: #a6adc8;")
            self.save_config()

        def on_step_progress(step_idx, total_steps, current_loop, key_name):
            if 0 <= step_idx < self.seq_table.rowCount():
                self.seq_table.selectRow(step_idx)
            self.seq_status_lbl.setText(f"Status: ▶ RUNNING MACRO | Loop {current_loop} | Step {step_idx+1}/{total_steps} [{key_name}]")
            self.seq_status_lbl.setStyleSheet("font-weight: bold; color: #a6e3a1;")

        def add_sequence_step(self):
            key = normalize_key_str(self.seq_step_key.text().strip() or "Mouse 1")
            try: hold = float(self.seq_hold_entry.text() or 50)
            except Exception: hold = 50
            try: delay = float(self.seq_delay_entry.text() or 200)
            except Exception: delay = 200

            self.sequence_steps.append({
                "key": key,
                "hold_ms": hold,
                "delay_ms": delay
            })
            self.refresh_sequence_table()
            self.save_config()

        def load_selected_step_to_editor(self):
            row = self.seq_table.currentRow()
            if 0 <= row < len(self.sequence_steps):
                step = self.sequence_steps[row]
                self.seq_step_key.setText(normalize_key_str(step.get("key", "Mouse 1")))
                self.seq_hold_entry.setText(str(step.get("hold_ms", 50)))
                self.seq_delay_entry.setText(str(step.get("delay_ms", 200)))

        def update_selected_step_from_editor(self):
            row = self.seq_table.currentRow()
            if 0 <= row < len(self.sequence_steps):
                key = normalize_key_str(self.seq_step_key.text().strip() or "Mouse 1")
                try: hold = float(self.seq_hold_entry.text() or 50)
                except Exception: hold = 50
                try: delay = float(self.seq_delay_entry.text() or 200)
                except Exception: delay = 200

                self.sequence_steps[row] = {
                    "key": key,
                    "hold_ms": hold,
                    "delay_ms": delay
                }
                self.refresh_sequence_table()
                self.seq_table.selectRow(row)
                self.save_config()

        def on_table_item_changed(self, item):
            row = item.row()
            col = item.column()
            if 0 <= row < len(self.sequence_steps):
                text = item.text().replace("🖱️ ", "").replace("⌨️ ", "").strip()
                if col == 1:
                    self.sequence_steps[row]["key"] = normalize_key_str(text) or "Mouse 1"
                elif col == 2:
                    try: self.sequence_steps[row]["hold_ms"] = float(text)
                    except Exception: pass
                elif col == 3:
                    try: self.sequence_steps[row]["delay_ms"] = float(text)
                    except Exception: pass
                self.save_config()

        def remove_sequence_step(self):
            row = self.seq_table.currentRow()
            if 0 <= row < len(self.sequence_steps):
                self.sequence_steps.pop(row)
                self.refresh_sequence_table()
                self.save_config()

        def move_sequence_step(self, direction):
            row = self.seq_table.currentRow()
            if row < 0: return
            new_row = row + direction
            if 0 <= row < len(self.sequence_steps) and 0 <= new_row < len(self.sequence_steps):
                self.sequence_steps[row], self.sequence_steps[new_row] = self.sequence_steps[new_row], self.sequence_steps[row]
                self.refresh_sequence_table()
                self.seq_table.selectRow(new_row)
                self.save_config()

        def clear_sequence_steps(self):
            self.sequence_steps.clear()
            self.refresh_sequence_table()
            self.save_config()

        def refresh_sequence_table(self):
            self.seq_table.blockSignals(True)
            self.seq_table.setRowCount(0)
            for idx, step in enumerate(self.sequence_steps):
                self.seq_table.insertRow(idx)

                key_str = normalize_key_str(step.get("key", "Mouse 1"))
                step["key"] = key_str
                badge = "🖱️ " if "Mouse" in key_str else "⌨️ "

                item_num = QTableWidgetItem(str(idx + 1))
                item_num.setFlags(item_num.flags() & ~Qt.ItemFlag.ItemIsEditable)

                item_key = QTableWidgetItem(badge + key_str)
                item_hold = QTableWidgetItem(str(step.get("hold_ms", 50)))
                item_delay = QTableWidgetItem(str(step.get("delay_ms", 200)))

                self.seq_table.setItem(idx, 0, item_num)
                self.seq_table.setItem(idx, 1, item_key)
                self.seq_table.setItem(idx, 2, item_hold)
                self.seq_table.setItem(idx, 3, item_delay)

            self.seq_table.blockSignals(False)
            self.seq_status_lbl.setText(f"Status: ⏹ Idle ({len(self.sequence_steps)} steps in macro)")

        def toggle_action(self):
            if self.is_running: self.on_stop()
            else: self.on_start()

        def on_start(self):
            if self.is_running: return
            self.save_config()

            try:
                h = float(self.hours_entry.text() or 0)
                m = float(self.mins_entry.text() or 0)
                s = float(self.secs_entry.text() or 0)
                ms = float(self.ms_entry.text() or 0)
                interval_delay = (h * 3600) + (m * 60) + s + (ms / 1000.0)
            except Exception: interval_delay = 0.05

            self.is_running = True
            self.start_btn.setEnabled(False)
            self.stop_btn.setEnabled(True)
            self.stop_btn.setStyleSheet("font-weight: bold; background-color: #f38ba8; color: #11111b; font-size: 14px;")

            def on_stop_cb():
                self.dispatcher.stop_signal.emit()

            if self.single_mode_rb.isChecked():
                key_str = self.hotkey_entry.text()
                self.seq_status_lbl.setText(f"Status: ▶ RUNNING SINGLE CLICKER [{key_str}]")
                self.seq_status_lbl.setStyleSheet("font-weight: bold; color: #a6e3a1;")
                threading.Thread(
                    target=self.engine.click_loop,
                    args=(interval_delay, key_str, on_stop_cb),
                    daemon=True
                ).start()

            elif self.seq_mode_rb.isChecked():
                if not self.sequence_steps:
                    QMessageBox.warning(self, "Warning", "Please add at least one step to the action sequence.")
                    self.on_stop_ui()
                    return
                try: loop_cnt = int(self.seq_loop_entry.text() or 0)
                except Exception: loop_cnt = 0

                def on_progress(step_idx, total_steps, loop_num, key_name):
                    self.dispatcher.step_progress.emit(step_idx, total_steps, loop_num, key_name)

                threading.Thread(
                    target=self.engine.sequence_loop,
                    args=(self.sequence_steps, interval_delay, loop_cnt, on_stop_cb, on_progress),
                    daemon=True
                ).start()

            else:
                text = self.text_edit.toPlainText()
                self.seq_status_lbl.setText("Status: ▶ RUNNING AUTO-TYPER")
                self.seq_status_lbl.setStyleSheet("font-weight: bold; color: #a6e3a1;")
                try: cdelay = float(self.char_delay_entry.text() or 20) / 1000.0
                except Exception: cdelay = 0.02
                threading.Thread(
                    target=self.engine.type_loop,
                    args=(text, cdelay, interval_delay, on_stop_cb),
                    daemon=True
                ).start()

        def on_stop(self):
            self.engine.stop()

        def on_stop_ui(self):
            self.is_running = False
            self.start_btn.setEnabled(True)
            self.stop_btn.setEnabled(False)
            self.stop_btn.setStyleSheet("font-weight: bold; font-size: 14px;")
            self.seq_status_lbl.setText(f"Status: ⏹ Idle ({len(self.sequence_steps)} steps in macro)")
            self.seq_status_lbl.setStyleSheet("font-weight: bold; color: #a6adc8;")
            self.seq_table.clearSelection()

        def closeEvent(self, event):
            self.engine.stop()
            if hasattr(self, 'global_listener') and self.global_listener:
                self.global_listener.stop()
            if os.path.exists(PID_FILE):
                try: os.remove(PID_FILE)
                except Exception: pass
            event.accept()

    app = QApplication(sys.argv)
    win = MahmoudPresserQtWindow()
    win.show()
    sys.exit(app.exec())
    return True


# Helper GTK Prompt Text Dialog
def gtk_prompt_text(parent_win, title, message, default_text=""):
    try:
        import gi
        gi.require_version('Gtk', '3.0')
        from gi.repository import Gtk
        dialog = Gtk.MessageDialog(
            transient_for=parent_win,
            flags=0,
            message_type=Gtk.MessageType.QUESTION,
            buttons=Gtk.ButtonsType.OK_CANCEL,
            text=title
        )
        dialog.format_secondary_text(message)
        entry = Gtk.Entry(text=default_text)
        dialog.get_content_area().pack_end(entry, True, True, 5)
        dialog.show_all()
        response = dialog.run()
        text_val = entry.get_text().strip()
        dialog.destroy()
        if response == Gtk.ResponseType.OK and text_val:
            return text_val
    except Exception as ex:
        print("GTK prompt notice:", ex)
    return None


# GTK Modern Dark CSS
MODERN_GTK_CSS = """
window {
    background-color: #1e1e2e;
    color: #cdd6f4;
    font-family: "Segoe UI", Ubuntu, Roboto, sans-serif;
}
button {
    background-image: none;
    background-color: #313244;
    color: #cdd6f4;
    border-radius: 6px;
    border: 1px solid #45475a;
    padding: 6px 12px;
    font-weight: bold;
}
button:hover {
    background-color: #45475a;
}
entry {
    background-color: #181825;
    color: #cdd6f4;
    border: 1px solid #45475a;
    border-radius: 6px;
    padding: 6px;
}
entry:focus {
    border-color: #89b4fa;
}
frame {
    border-radius: 8px;
    border: 1px solid #313244;
    padding: 6px;
}
treeview {
    background-color: #181825;
    color: #cdd6f4;
    border-radius: 6px;
}
treeview:selected {
    background-color: #89b4fa;
    color: #1e1e2e;
}
textview text {
    background-color: #181825;
    color: #cdd6f4;
}
"""


# --- GTK GUI Implementation ---
def run_gtk_app(engine):
    try:
        import gi
        gi.require_version('Gtk', '3.0')
        gi.require_version('Gdk', '3.0')
        from gi.repository import Gtk, Gdk, GLib
        gtk_version = 3
    except Exception:
        print("PyGObject GTK bindings not found.")
        return False

    try:
        css_provider = Gtk.CssProvider()
        css_provider.load_from_data(MODERN_GTK_CSS.encode())
        Gtk.StyleContext.add_provider_for_screen(
            Gdk.Screen.get_default(),
            css_provider,
            Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
        )
    except Exception:
        pass

    cfg_data = {
        "mode": "single", "start_stop_hotkey": "F8", "hotkey": "Mouse 1",
        "text": "Hello World!", "char_delay_ms": "20",
        "hours": "0", "mins": "0", "secs": "0", "ms": "60",
        "sequence_steps": [
            {"key": "Mouse 1", "hold_ms": 50, "delay_ms": 200},
            {"key": "ALT+A", "hold_ms": 100, "delay_ms": 500}
        ],
        "seq_loop_count": "0",
        "profiles": {
            "Default": [
                {"key": "Mouse 1", "hold_ms": 50, "delay_ms": 200},
                {"key": "ALT+A", "hold_ms": 100, "delay_ms": 500}
            ]
        }
    }
    if os.path.exists(CONFIG_FILE):
        try:
            with open(CONFIG_FILE, "r") as f:
                cfg_data.update(json.load(f))
        except Exception: pass

    class MahmoudPresserGtk3Window(Gtk.Window):
        def __init__(self):
            super().__init__(title="Mahmoud Presser (GTK3 Edition)")
            self.set_default_size(800, 720)
            self.connect("destroy", Gtk.main_quit)
            self.engine = engine
            self.is_running = False
            self.is_live_recording = False
            self.live_rec_stop_event = threading.Event()

            self.start_stop_keybind = normalize_key_str(cfg_data.get("start_stop_hotkey", "F8"))
            self.sequence_steps = cfg_data.get("sequence_steps", [])
            for s in self.sequence_steps:
                s["key"] = normalize_key_str(s.get("key", "Mouse 1"))

            self.profiles = cfg_data.get("profiles", {"Default": self.sequence_steps})
            for p_k, p_steps in self.profiles.items():
                for s in p_steps:
                    s["key"] = normalize_key_str(s.get("key", "Mouse 1"))

            main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
            main_box.set_border_width(12)
            self.add(main_box)

            # Global Start/Stop Keybind Banner Box
            hk_banner = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
            self.banner_lbl = Gtk.Label(label=f"⚡ Global Keybind [{self.start_stop_keybind}] to Start/Stop:")
            self.toggle_hk_entry = Gtk.Entry(text=self.start_stop_keybind)
            rec_toggle_btn = Gtk.Button(label="Record Keybind")
            hk_banner.pack_start(self.banner_lbl, False, False, 0)
            hk_banner.pack_start(self.toggle_hk_entry, False, False, 0)
            hk_banner.pack_start(rec_toggle_btn, False, False, 0)
            main_box.pack_start(hk_banner, False, False, 0)

            self.global_listener = GlobalHotkeyListener(lambda: GLib.idle_add(self.toggle))
            self.global_listener.set_toggle_key(self.start_stop_keybind)
            self.global_listener.start()

            # Mode Frame
            mode_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=15)
            self.rb_single = Gtk.RadioButton.new_with_label(None, "Single Click / Combo")
            self.rb_seq = Gtk.RadioButton.new_with_label_from_widget(self.rb_single, "Sequence (Macro)")
            self.rb_text = Gtk.RadioButton.new_with_label_from_widget(self.rb_single, "Auto-Type Text")

            mode_box.pack_start(self.rb_single, False, False, 0)
            mode_box.pack_start(self.rb_seq, False, False, 0)
            mode_box.pack_start(self.rb_text, False, False, 0)
            main_box.pack_start(mode_box, False, False, 0)

            # Time Interval
            time_frame = Gtk.Frame(label="Interval / Repeat Delay (Hover for info ℹ️)")
            time_frame.set_tooltip_text("H = Hours, M = Minutes, S = Seconds, MS = Milliseconds\n\nThis defines the wait time before the macro loops and repeats itself.\nApplies to Single-Click, Sequence, and Auto-Type modes.")
            time_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
            h_entry = Gtk.Entry(text=cfg_data.get("hours", "0"))
            m_entry = Gtk.Entry(text=cfg_data.get("mins", "0"))
            s_entry = Gtk.Entry(text=cfg_data.get("secs", "0"))
            ms_entry = Gtk.Entry(text=cfg_data.get("ms", "60"))

            time_box.pack_start(Gtk.Label(label="H (Hours):"), False, False, 0)
            time_box.pack_start(h_entry, True, True, 0)
            time_box.pack_start(Gtk.Label(label="M (Mins):"), False, False, 0)
            time_box.pack_start(m_entry, True, True, 0)
            time_box.pack_start(Gtk.Label(label="S (Secs):"), False, False, 0)
            time_box.pack_start(s_entry, True, True, 0)
            time_box.pack_start(Gtk.Label(label="MS (Millis):"), False, False, 0)
            time_box.pack_start(ms_entry, True, True, 0)
            
            time_frame.add(time_box)
            main_box.pack_start(time_frame, False, False, 0)

            # Clean Isolated Gtk.Stack Container for Pages
            self.stack = Gtk.Stack()
            self.stack.set_transition_type(Gtk.StackTransitionType.SLIDE_LEFT_RIGHT)
            self.stack.set_transition_duration(150)

            # --- Page 1: Single Clicker ---
            click_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=8)
            hk_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
            hk_entry = Gtk.Entry(text=normalize_key_str(cfg_data.get("hotkey", "Mouse 1")))
            rec_btn = Gtk.Button(label="Record Key / Combo")
            hk_box.pack_start(Gtk.Label(label="Hotkey/Combo:"), False, False, 0)
            hk_box.pack_start(hk_entry, True, True, 0)
            hk_box.pack_start(rec_btn, False, False, 0)
            click_box.pack_start(hk_box, False, False, 0)

            self.stack.add_named(click_box, "single")

            # --- Page 2: Macro Sequence Builder ---
            seq_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=8)

            # Profiles Bar
            prof_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
            prof_box.pack_start(Gtk.Label(label="Profile:"), False, False, 0)
            self.profile_combo = Gtk.ComboBoxText()
            self.refresh_gtk_profiles()
            prof_box.pack_start(self.profile_combo, False, False, 0)

            save_prof_btn = Gtk.Button(label="💾 Save As...")
            rename_prof_btn = Gtk.Button(label="✏️ Rename")
            del_prof_btn = Gtk.Button(label="🗑️ Delete")
            prof_box.pack_start(save_prof_btn, False, False, 0)
            prof_box.pack_start(rename_prof_btn, False, False, 0)
            prof_box.pack_start(del_prof_btn, False, False, 0)
            seq_box.pack_start(prof_box, False, False, 0)

            # Status Banner
            self.seq_status_lbl = Gtk.Label(label=f"Status: ⏹ Idle ({len(self.sequence_steps)} steps ready)")
            seq_box.pack_start(self.seq_status_lbl, False, False, 0)

            self.live_rec_btn = Gtk.Button(label="🔴 Record Sequence Live")
            seq_box.pack_start(self.live_rec_btn, False, False, 0)

            # Sequence Table (Gtk.TreeView)
            self.seq_store = Gtk.ListStore(str, str, str, str)
            self.seq_tree = Gtk.TreeView(model=self.seq_store)

            col0 = Gtk.TreeViewColumn("#", Gtk.CellRendererText(), text=0)
            self.seq_tree.append_column(col0)

            ren1 = Gtk.CellRendererText()
            ren1.set_property("editable", True)
            def on_key_edited(widget, path, new_text):
                idx = int(path)
                if 0 <= idx < len(self.sequence_steps):
                    self.sequence_steps[idx]["key"] = normalize_key_str(new_text.replace("🖱️ ", "").replace("⌨️ ", "").strip() or "Mouse 1")
                    refresh_sequence_table()
                    self.save_config()
            ren1.connect("edited", on_key_edited)
            col1 = Gtk.TreeViewColumn("Action / Keybind", ren1, text=1)
            col1.set_resizable(True)
            self.seq_tree.append_column(col1)

            ren2 = Gtk.CellRendererText()
            ren2.set_property("editable", True)
            def on_hold_edited(widget, path, new_text):
                idx = int(path)
                if 0 <= idx < len(self.sequence_steps):
                    try: self.sequence_steps[idx]["hold_ms"] = float(new_text)
                    except Exception: pass
                    refresh_sequence_table()
                    self.save_config()
            ren2.connect("edited", on_hold_edited)
            col2 = Gtk.TreeViewColumn("Hold (ms)", ren2, text=2)
            col2.set_resizable(True)
            self.seq_tree.append_column(col2)

            ren3 = Gtk.CellRendererText()
            ren3.set_property("editable", True)
            def on_delay_edited(widget, path, new_text):
                idx = int(path)
                if 0 <= idx < len(self.sequence_steps):
                    try: self.sequence_steps[idx]["delay_ms"] = float(new_text)
                    except Exception: pass
                    refresh_sequence_table()
                    self.save_config()
            ren3.connect("edited", on_delay_edited)
            col3 = Gtk.TreeViewColumn("Next Delay (ms)", ren3, text=3)
            col3.set_resizable(True)
            self.seq_tree.append_column(col3)

            scrolled = Gtk.ScrolledWindow()
            scrolled.set_min_content_height(160)
            scrolled.add(self.seq_tree)
            seq_box.pack_start(scrolled, True, True, 0)

            # Manual Step Editor Box
            creator_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=6)
            creator_box.pack_start(Gtk.Label(label="Key:"), False, False, 0)
            seq_step_key_entry = Gtk.Entry(text="Mouse 1")
            creator_box.pack_start(seq_step_key_entry, False, False, 0)

            seq_rec_btn = Gtk.Button(label="Record")
            creator_box.pack_start(seq_rec_btn, False, False, 0)

            creator_box.pack_start(Gtk.Label(label="Hold (ms):"), False, False, 0)
            seq_hold_entry = Gtk.Entry(text="50")
            creator_box.pack_start(seq_hold_entry, False, False, 0)

            creator_box.pack_start(Gtk.Label(label="Delay (ms):"), False, False, 0)
            seq_delay_entry = Gtk.Entry(text="200")
            creator_box.pack_start(seq_delay_entry, False, False, 0)

            add_step_btn = Gtk.Button(label="➕ Add")
            creator_box.pack_start(add_step_btn, False, False, 0)

            update_step_btn = Gtk.Button(label="💾 Update")
            creator_box.pack_start(update_step_btn, False, False, 0)
            seq_box.pack_start(creator_box, False, False, 0)

            # Sequence Controls Bar
            ctrl_bar = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
            edit_step_btn = Gtk.Button(label="✏️ Edit Selected")
            rem_step_btn = Gtk.Button(label="Remove Selected")
            move_up_btn = Gtk.Button(label="⬆️ Move Up")
            move_dn_btn = Gtk.Button(label="⬇️ Move Down")
            clear_steps_btn = Gtk.Button(label="Clear All")

            ctrl_bar.pack_start(edit_step_btn, False, False, 0)
            ctrl_bar.pack_start(rem_step_btn, False, False, 0)
            ctrl_bar.pack_start(move_up_btn, False, False, 0)
            ctrl_bar.pack_start(move_dn_btn, False, False, 0)
            ctrl_bar.pack_start(clear_steps_btn, False, False, 0)

            ctrl_bar.pack_start(Gtk.Label(label="Repeat (0=Inf):"), False, False, 0)
            seq_loop_cnt_entry = Gtk.Entry(text=cfg_data.get("seq_loop_count", "0"))
            ctrl_bar.pack_start(seq_loop_cnt_entry, False, False, 0)

            seq_box.pack_start(ctrl_bar, False, False, 0)
            self.stack.add_named(seq_box, "sequence")

            # --- Page 3: Auto-Type Text ---
            text_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=8)
            t_top = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
            t_top.pack_start(Gtk.Label(label="Text to Auto-Type:"), False, False, 0)
            char_delay_entry = Gtk.Entry(text=cfg_data.get("char_delay_ms", "20"))
            t_top.pack_start(Gtk.Label(label="Char Delay (ms):"), False, False, 0)
            t_top.pack_start(char_delay_entry, False, False, 0)
            text_box.pack_start(t_top, False, False, 0)

            text_view = Gtk.TextView()
            text_buffer = text_view.get_buffer()
            text_buffer.set_text(cfg_data.get("text", "Hello World!"))
            text_box.pack_start(text_view, True, True, 0)
            self.stack.add_named(text_box, "text")

            main_box.pack_start(self.stack, True, True, 0)

            def refresh_sequence_table():
                self.seq_store.clear()
                for idx, s in enumerate(self.sequence_steps):
                    k = normalize_key_str(s.get("key", "Mouse 1"))
                    s["key"] = k
                    badge = "🖱️ " if "Mouse" in k else "⌨️ "
                    self.seq_store.append([str(idx + 1), badge + k, str(s.get("hold_ms", 50)), str(s.get("delay_ms", 200))])
                self.seq_status_lbl.set_label(f"Status: ⏹ Idle ({len(self.sequence_steps)} steps in macro)")

            refresh_sequence_table()

            def update_vis():
                if self.rb_single.get_active():
                    self.stack.set_visible_child_name("single")
                elif self.rb_seq.get_active():
                    self.stack.set_visible_child_name("sequence")
                else:
                    self.stack.set_visible_child_name("text")

            self.update_vis = update_vis

            saved_mode = cfg_data.get("mode", "single")
            if saved_mode == "sequence": self.rb_seq.set_active(True)
            elif saved_mode == "text": self.rb_text.set_active(True)
            else: self.rb_single.set_active(True)

            self.rb_single.connect("toggled", lambda x: update_vis())
            self.rb_seq.connect("toggled", lambda x: update_vis())
            self.rb_text.connect("toggled", lambda x: update_vis())

            # Profile Handlers
            def on_profile_changed(combo):
                active_text = combo.get_active_text()
                if active_text and active_text in self.profiles:
                    self.sequence_steps = json.loads(json.dumps(self.profiles[active_text]))
                    refresh_sequence_table()
                    self.save_config()

            self.profile_combo.connect("changed", on_profile_changed)

            def on_save_prof_as(btn):
                val = gtk_prompt_text(self, "Save Macro Profile", "Enter new profile name:")
                if val:
                    self.profiles[val] = json.loads(json.dumps(self.sequence_steps))
                    self.refresh_gtk_profiles()
                    self.profile_combo.set_active_id(val)
                    self.save_config()

            save_prof_btn.connect("clicked", on_save_prof_as)

            def on_rename_prof(btn):
                active = self.profile_combo.get_active_text()
                if not active: return
                val = gtk_prompt_text(self, "Rename Macro Profile", "Enter new profile name:", default_text=active)
                if val and val != active:
                    self.profiles[val] = self.profiles.pop(active)
                    self.refresh_gtk_profiles()
                    self.profile_combo.set_active_id(val)
                    self.save_config()

            rename_prof_btn.connect("clicked", on_rename_prof)

            def on_del_prof(btn):
                active = self.profile_combo.get_active_text()
                if active and len(self.profiles) > 1:
                    del self.profiles[active]
                    self.refresh_gtk_profiles()
                    first = list(self.profiles.keys())[0]
                    self.sequence_steps = json.loads(json.dumps(self.profiles[first]))
                    refresh_sequence_table()
                    self.save_config()

            del_prof_btn.connect("clicked", on_del_prof)

            # Move Up / Move Down Handlers
            def move_step(direction):
                model, tree_iter = self.seq_tree.get_selection().get_selected()
                if tree_iter:
                    idx = model.get_path(tree_iter).get_indices()[0]
                    new_idx = idx + direction
                    if 0 <= idx < len(self.sequence_steps) and 0 <= new_idx < len(self.sequence_steps):
                        self.sequence_steps[idx], self.sequence_steps[new_idx] = self.sequence_steps[new_idx], self.sequence_steps[idx]
                        refresh_sequence_table()
                        self.seq_tree.get_selection().select_path(Gtk.TreePath.new_from_string(str(new_idx)))
                        self.save_config()

            move_up_btn.connect("clicked", lambda b: move_step(-1))
            move_dn_btn.connect("clicked", lambda b: move_step(1))

            def on_edit_selected(btn):
                model, tree_iter = self.seq_tree.get_selection().get_selected()
                if tree_iter:
                    idx = model.get_path(tree_iter).get_indices()[0]
                    if 0 <= idx < len(self.sequence_steps):
                        step = self.sequence_steps[idx]
                        seq_step_key_entry.set_text(normalize_key_str(step.get("key", "Mouse 1")))
                        seq_hold_entry.set_text(str(step.get("hold_ms", 50)))
                        seq_delay_entry.set_text(str(step.get("delay_ms", 200)))

            edit_step_btn.connect("clicked", on_edit_selected)

            def on_update_selected(btn):
                model, tree_iter = self.seq_tree.get_selection().get_selected()
                if tree_iter:
                    idx = model.get_path(tree_iter).get_indices()[0]
                    if 0 <= idx < len(self.sequence_steps):
                        key = normalize_key_str(seq_step_key_entry.get_text().strip() or "Mouse 1")
                        try: hold = float(seq_hold_entry.get_text() or 50)
                        except Exception: hold = 50
                        try: delay = float(seq_delay_entry.get_text() or 200)
                        except Exception: delay = 200

                        self.sequence_steps[idx] = {"key": key, "hold_ms": hold, "delay_ms": delay}
                        refresh_sequence_table()
                        self.seq_tree.get_selection().select_path(Gtk.TreePath.new_from_string(str(idx)))
                        self.save_config()

            update_step_btn.connect("clicked", on_update_selected)

            def on_add_step(btn):
                key = normalize_key_str(seq_step_key_entry.get_text().strip() or "Mouse 1")
                try: hold = float(seq_hold_entry.get_text() or 50)
                except Exception: hold = 50
                try: delay = float(seq_delay_entry.get_text() or 200)
                except Exception: delay = 200
                self.sequence_steps.append({"key": key, "hold_ms": hold, "delay_ms": delay})
                refresh_sequence_table()
                self.save_config()

            add_step_btn.connect("clicked", on_add_step)

            def on_remove_step(btn):
                model, tree_iter = self.seq_tree.get_selection().get_selected()
                if tree_iter:
                    path = model.get_path(tree_iter)
                    idx = path.get_indices()[0]
                    if 0 <= idx < len(self.sequence_steps):
                        self.sequence_steps.pop(idx)
                        refresh_sequence_table()
                        self.save_config()

            rem_step_btn.connect("clicked", on_remove_step)

            def on_clear_steps(btn):
                self.sequence_steps.clear()
                refresh_sequence_table()
                self.save_config()

            clear_steps_btn.connect("clicked", on_clear_steps)

            def on_live_rec_stopped_ui():
                def _u():
                    self.is_live_recording = False
                    # Cleanly pop trailing Mouse 1 click used to click the Stop button!
                    if self.sequence_steps and self.sequence_steps[-1].get("key") in ["Mouse 1", "MOUSE 1"]:
                        self.sequence_steps.pop()
                    refresh_sequence_table()

                    self.live_rec_btn.set_label("🔴 Record Sequence Live")
                    self.seq_status_lbl.set_label(f"Status: ⏹ Idle ({len(self.sequence_steps)} steps ready)")
                    self.save_config()
                    return False
                GLib.idle_add(_u)

            def toggle_live_rec(btn):
                if self.is_live_recording:
                    self.live_rec_stop_event.set()
                    on_live_rec_stopped_ui()
                else:
                    self.is_live_recording = True
                    self.live_rec_stop_event.clear()
                    self.live_rec_btn.set_label("⏹ Stop Live Recording (or press ESC)")
                    self.seq_status_lbl.set_label("Status: 🔴 RECORDING LIVE ACTIONS IN REAL-TIME...")

                    def on_step(step):
                        def _u():
                            if self.sequence_steps:
                                self.sequence_steps[-1]["delay_ms"] = step.get("delay_ms", 200)
                            step["key"] = normalize_key_str(step.get("key", "Mouse 1"))
                            step["delay_ms"] = 200
                            self.sequence_steps.append(step)
                            refresh_sequence_table()
                            self.seq_status_lbl.set_label(f"Status: 🔴 RECORDING LIVE — Captured {len(self.sequence_steps)} steps")
                            self.save_config()
                            return False
                        GLib.idle_add(_u)

                    record_live_macro_sequence(on_step, self.live_rec_stop_event, self.start_stop_keybind, on_live_rec_stopped_ui)

            self.live_rec_btn.connect("clicked", toggle_live_rec)

            def on_rec_toggle(btn):
                btn.set_label("Press Keys...")
                btn.set_sensitive(False)
                def _cb(res):
                    def _u():
                        btn.set_label("Record Keybind")
                        btn.set_sensitive(True)
                        if res:
                            formatted = normalize_key_str(res)
                            self.toggle_hk_entry.set_text(formatted)
                            self.start_stop_keybind = formatted
                            self.banner_lbl.set_label(f"⚡ Global Keybind [{formatted}] to Start/Stop:")
                            start_btn.set_label(f"Start ({formatted})")
                            stop_btn.set_label(f"Stop ({formatted})")
                            self.global_listener.set_toggle_key(formatted)
                            self.save_config()
                        return False
                    GLib.idle_add(_u)
                record_hotkey_universal(_cb)

            rec_toggle_btn.connect("clicked", on_rec_toggle)

            def on_rec(btn, target):
                btn.set_label("Press Keys...")
                btn.set_sensitive(False)
                def _rec_cb(res):
                    def _u():
                        btn.set_label("Record")
                        btn.set_sensitive(True)
                        if res:
                            formatted = normalize_key_str(res)
                            target.set_text(formatted)
                        return False
                    GLib.idle_add(_u)
                record_hotkey_universal(_rec_cb)

            rec_btn.connect("clicked", lambda b: on_rec(b, hk_entry))
            seq_rec_btn.connect("clicked", lambda b: on_rec(b, seq_step_key_entry))

            ctrl_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=20)
            start_btn = Gtk.Button(label=f"Start ({self.start_stop_keybind})")
            stop_btn = Gtk.Button(label=f"Stop ({self.start_stop_keybind})")
            stop_btn.set_sensitive(False)
            ctrl_box.pack_start(start_btn, True, True, 0)
            ctrl_box.pack_start(stop_btn, True, True, 0)
            main_box.pack_start(ctrl_box, False, False, 0)

            def on_stop(): self.engine.stop()

            def on_stop_ui():
                def _u():
                    self.is_running = False
                    start_btn.set_sensitive(True)
                    stop_btn.set_sensitive(False)
                    self.seq_status_lbl.set_label(f"Status: ⏹ Idle ({len(self.sequence_steps)} steps in macro)")
                    return False
                GLib.idle_add(_u)

            def on_progress(step_idx, total_steps, current_loop, key_name):
                def _u():
                    self.seq_status_lbl.set_label(f"Status: ▶ RUNNING MACRO | Loop {current_loop} | Step {step_idx+1}/{total_steps} [{key_name}]")
                    try:
                        self.seq_tree.get_selection().select_path(Gtk.TreePath.new_from_string(str(step_idx)))
                    except Exception: pass
                    return False
                GLib.idle_add(_u)

            def on_start(btn):
                if self.is_running: return
                self.save_config()
                try:
                    h = float(h_entry.get_text() or 0)
                    m = float(m_entry.get_text() or 0)
                    s = float(s_entry.get_text() or 0)
                    ms = float(ms_entry.get_text() or 0)
                    delay = (h * 3600) + (m * 60) + s + (ms / 1000.0)
                except Exception: delay = 0.05

                self.is_running = True
                start_btn.set_sensitive(False)
                stop_btn.set_sensitive(True)

                if self.rb_single.get_active():
                    key_str = hk_entry.get_text()
                    threading.Thread(target=self.engine.click_loop, args=(delay, key_str, on_stop_ui), daemon=True).start()
                elif self.rb_seq.get_active():
                    try: loop_cnt = int(seq_loop_cnt_entry.get_text() or 0)
                    except Exception: loop_cnt = 0
                    threading.Thread(target=self.engine.sequence_loop, args=(self.sequence_steps, delay, loop_cnt, on_stop_ui, on_progress), daemon=True).start()
                else:
                    txt = text_buffer.get_text(text_buffer.get_start_iter(), text_buffer.get_end_iter(), True)
                    try: cdelay = float(char_delay_entry.get_text() or 20) / 1000.0
                    except Exception: cdelay = 0.02
                    threading.Thread(target=self.engine.type_loop, args=(txt, cdelay, delay, on_stop_ui), daemon=True).start()

            start_btn.connect("clicked", on_start)
            stop_btn.connect("clicked", lambda x: on_stop())

            def toggle():
                if self.is_running: on_stop()
                else: on_start(start_btn)
            self.toggle = toggle

            if hasattr(signal, "SIGUSR1"):
                signal.signal(signal.SIGUSR1, lambda signum, frame: GLib.idle_add(toggle))

        def show_all(self):
            super().show_all()
            if hasattr(self, 'update_vis'):
                self.update_vis()

        def refresh_gtk_profiles(self):
            self.profile_combo.remove_all()
            for p in self.profiles.keys():
                self.profile_combo.append_text(p)
            if self.profiles:
                self.profile_combo.set_active(0)

        def save_config(self):
            mode_str = "single"
            if self.stack.get_visible_child_name() == "sequence": mode_str = "sequence"
            elif self.stack.get_visible_child_name() == "text": mode_str = "text"

            cfg = {
                "mode": mode_str,
                "start_stop_hotkey": normalize_key_str(self.toggle_hk_entry.get_text()),
                "sequence_steps": self.sequence_steps,
                "profiles": self.profiles
            }
            save_config_atomic(CONFIG_FILE, cfg)

    win = MahmoudPresserGtk3Window()
    win.show_all()
    Gtk.main()
    return True


def main():
    parser = argparse.ArgumentParser(description="Mahmoud Presser - Cross-Platform Auto Clicker, Macro & Auto Typer")
    parser.add_argument("--qt", action="store_true", help="Force Qt GUI")
    parser.add_argument("--gtk", action="store_true", help="Force GTK GUI")
    parser.add_argument("--toggle", action="store_true", help="Toggle auto-presser state of running instance")
    parser.add_argument("--no-reexec", action="store_true", help=argparse.SUPPRESS)
    args, unknown = parser.parse_known_args()

    engine = PresserEngine()

    if args.qt:
        if not run_qt_app(engine):
            print("Failed to launch Qt app. Falling back to GTK...")
            if not run_gtk_app(engine):
                print("Error: No supported GUI framework found. Please install PyQt6 or PyGObject.")
    elif args.gtk:
        if not run_gtk_app(engine):
            print("Failed to launch GTK app. Falling back to Qt...")
            if not run_qt_app(engine):
                print("Error: No supported GUI framework found. Please install PyQt6 or PyGObject.")
    else:
        success = False
        if IS_LINUX:
            success = run_qt_app(engine) or run_gtk_app(engine)
        else:
            success = run_qt_app(engine) or run_gtk_app(engine)
            
        if not success:
            print("\n" + "="*60)
            print("CRITICAL ERROR: No Graphical User Interface (GUI) Library Found!")
            print("="*60)
            if IS_WINDOWS:
                print("To run this app on Windows, please install PyQt6:")
                print("    pip install PyQt6")
            elif IS_MACOS:
                print("To run this app on macOS, please install PyQt6:")
                print("    pip3 install PyQt6")
            else:
                print("To run this app on Linux, install PyQt6 or GTK3 bindings:")
                print("    pip3 install PyQt6")
                print("    OR  sudo apt install python3-pyqt6 (Ubuntu/Debian)")
                print("    OR  sudo apt install python3-gi gir1.2-gtk-3.0 (GTK)")
            print("="*60 + "\n")
            sys.exit(1)

if __name__ == "__main__":
    main()
