#!/usr/bin/env python3
import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, Gdk, GLib
import subprocess
import threading
import re
import json
import os

DEBOUNCE_MS = 500
CONFIG_DIR = os.path.expanduser("~/.config/translator")
CONFIG_FILE = os.path.join(CONFIG_DIR, "config.json")

# Common languages: (display name, trans code)
LANGUAGES = [
    ("Afrikaans", "af"), ("Albanian", "sq"), ("Amharic", "am"),
    ("Arabic", "ar"), ("Armenian", "hy"), ("Azerbaijani", "az"),
    ("Basque", "eu"), ("Belarusian", "be"), ("Bengali", "bn"),
    ("Bosnian", "bs"), ("Bulgarian", "bg"), ("Catalan", "ca"),
    ("Chinese (Simplified)", "zh-CN"), ("Chinese (Traditional)", "zh-TW"),
    ("Croatian", "hr"), ("Czech", "cs"), ("Danish", "da"),
    ("Dutch", "nl"), ("English", "en"), ("Esperanto", "eo"),
    ("Estonian", "et"), ("Finnish", "fi"), ("French", "fr"),
    ("Galician", "gl"), ("Georgian", "ka"), ("German", "de"),
    ("Greek", "el"), ("Gujarati", "gu"), ("Haitian Creole", "ht"),
    ("Hausa", "ha"), ("Hebrew", "he"), ("Hindi", "hi"),
    ("Hungarian", "hu"), ("Icelandic", "is"), ("Igbo", "ig"),
    ("Indonesian", "id"), ("Irish", "ga"), ("Italian", "it"),
    ("Japanese", "ja"), ("Javanese", "jv"), ("Kannada", "kn"),
    ("Kazakh", "kk"), ("Khmer", "km"), ("Korean", "ko"),
    ("Kurdish", "ku"), ("Kyrgyz", "ky"), ("Lao", "lo"),
    ("Latin", "la"), ("Latvian", "lv"), ("Lithuanian", "lt"),
    ("Luxembourgish", "lb"), ("Macedonian", "mk"), ("Malagasy", "mg"),
    ("Malay", "ms"), ("Malayalam", "ml"), ("Maltese", "mt"),
    ("Maori", "mi"), ("Marathi", "mr"), ("Mongolian", "mn"),
    ("Nepali", "ne"), ("Norwegian", "no"), ("Pashto", "ps"),
    ("Persian", "fa"), ("Polish", "pl"), ("Portuguese", "pt"),
    ("Punjabi", "pa"), ("Romanian", "ro"), ("Russian", "ru"),
    ("Samoan", "sm"), ("Serbian", "sr"), ("Shona", "sn"),
    ("Sindhi", "sd"), ("Sinhala", "si"), ("Slovak", "sk"),
    ("Slovenian", "sl"), ("Somali", "so"), ("Spanish", "es"),
    ("Sundanese", "su"), ("Swahili", "sw"), ("Swedish", "sv"),
    ("Tagalog", "tl"), ("Tajik", "tg"), ("Tamil", "ta"),
    ("Telugu", "te"), ("Thai", "th"), ("Turkish", "tr"),
    ("Ukrainian", "uk"), ("Urdu", "ur"), ("Uzbek", "uz"),
    ("Vietnamese", "vi"), ("Welsh", "cy"), ("Xhosa", "xh"),
    ("Yiddish", "yi"), ("Yoruba", "yo"), ("Zulu", "zu"),
]

LANG_BY_CODE = {code: name for name, code in LANGUAGES}


def load_config():
    if os.path.exists(CONFIG_FILE):
        try:
            with open(CONFIG_FILE) as f:
                cfg = json.load(f)
            if "lang_a" in cfg and "lang_b" in cfg:
                return cfg
        except Exception:
            pass
    return None


def save_config(lang_a, lang_b):
    os.makedirs(CONFIG_DIR, exist_ok=True)
    with open(CONFIG_FILE, "w") as f:
        json.dump({"lang_a": lang_a, "lang_b": lang_b}, f)


def do_translate(text, source_code, target_code):
    tgt_name = LANG_BY_CODE.get(target_code, target_code)
    if source_code == "auto":
        label = f"? → {tgt_name}"
        cmd = ["trans", "-brief", "-no-ansi", "-no-warn", "-t", target_code, text]
    else:
        src_name = LANG_BY_CODE.get(source_code, source_code)
        label = f"{src_name} → {tgt_name}"
        cmd = ["trans", "-brief", "-no-ansi", "-no-warn",
               "-s", source_code, "-t", target_code, text]
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=8)
        return label, result.stdout.strip()
    except subprocess.TimeoutExpired:
        return label, "⚠ Timed out"
    except Exception as e:
        return label, f"⚠ Error: {e}"


def get_script_pattern(lang_code):
    """Return a compiled regex matching chars distinctive to this language's script, or None."""
    if lang_code in ("el",):
        return re.compile(r'[\u0370-\u03FF\u1F00-\u1FFF]')
    if lang_code in ("ar", "fa", "ur", "ps", "sd"):
        return re.compile(r'[\u0600-\u06FF]')
    if lang_code in ("he", "yi"):
        return re.compile(r'[\u0590-\u05FF]')
    if lang_code in ("ru", "uk", "bg", "sr", "mk", "be", "kk", "ky", "tg", "mn"):
        return re.compile(r'[\u0400-\u04FF]')
    if lang_code in ("zh-CN", "zh-TW"):
        return re.compile(r'[\u4E00-\u9FFF\u3400-\u4DBF]')
    if lang_code in ("ja",):
        return re.compile(r'[\u3040-\u30FF\u4E00-\u9FFF]')
    if lang_code in ("ko",):
        return re.compile(r'[\uAC00-\uD7AF]')
    if lang_code in ("hi", "mr", "ne"):
        return re.compile(r'[\u0900-\u097F]')
    if lang_code in ("bn",):
        return re.compile(r'[\u0980-\u09FF]')
    if lang_code in ("ta",):
        return re.compile(r'[\u0B80-\u0BFF]')
    if lang_code in ("te",):
        return re.compile(r'[\u0C00-\u0C7F]')
    if lang_code in ("kn",):
        return re.compile(r'[\u0C80-\u0CFF]')
    if lang_code in ("ml",):
        return re.compile(r'[\u0D00-\u0D7F]')
    if lang_code in ("th",):
        return re.compile(r'[\u0E00-\u0E7F]')
    if lang_code in ("am",):
        return re.compile(r'[\u1200-\u137F]')
    if lang_code in ("ka",):
        return re.compile(r'[\u10A0-\u10FF]')
    if lang_code in ("hy",):
        return re.compile(r'[\u0530-\u058F]')
    return None


def detect_source_lang(text, lang_a_code, lang_b_code):
    """Detect which of the two configured languages the text is in.
    Returns the source language code, or 'auto' to let trans decide."""
    pat_a = get_script_pattern(lang_a_code)
    pat_b = get_script_pattern(lang_b_code)

    matches_a = bool(pat_a and pat_a.search(text))
    matches_b = bool(pat_b and pat_b.search(text))

    if matches_a and not matches_b:
        return lang_a_code
    if matches_b and not matches_a:
        return lang_b_code
    # Both scripts present, neither detected, or two Latin-script languages:
    # let trans auto-detect and pick the other language as target
    return "auto"


CSS = b"""
window {
    background-color: #1a1a1a;
    border: 1px solid #333;
    border-radius: 6px;
}
#input {
    background-color: transparent;
    color: #f0f0f0;
    border: none;
    font-size: 25px;
    font-family: "Atkinson Hyperlegible", sans-serif;
    padding: 12px 14px;
    caret-color: #7eb8f7;
}
#input:focus {
    outline: none;
    box-shadow: none;
}
#separator {
    background-color: #2a2a2a;
    min-height: 1px;
}
#result {
    color: #7eb8f7;
    font-size: 35px;
    font-family: "Atkinson Hyperlegible", "Noto Sans", sans-serif;
    padding: 10px 14px;
}
#footer {
    background-color: transparent;
    padding: 0px 10px 6px 10px;
}
#settings-btn {
    background: transparent;
    border: none;
    color: #444;
    font-size: 11px;
    padding: 2px 4px;
    min-height: 0;
    min-width: 0;
}
#settings-btn:hover {
    color: #888;
    background: transparent;
    border: none;
    box-shadow: none;
}
#lang-display {
    color: #444;
    font-size: 11px;
    font-family: monospace;
}
/* Language picker dialog */
#picker-window {
    background-color: #1a1a1a;
    border: 1px solid #444;
    border-radius: 8px;
}
#picker-title {
    color: #aaa;
    font-size: 13px;
    font-family: monospace;
    padding: 14px 16px 6px 16px;
}
#picker-search {
    background-color: #252525;
    color: #e0e0e0;
    border: 1px solid #333;
    border-radius: 4px;
    font-size: 13px;
    padding: 6px 10px;
    caret-color: #7eb8f7;
}
#picker-search:focus {
    border-color: #7eb8f7;
    box-shadow: none;
}
#lang-list {
    background-color: #1e1e1e;
    border: none;
}
#lang-list row {
    padding: 4px 8px;
    color: #d0d0d0;
    font-size: 13px;
    font-family: "Atkinson Hyperlegible", sans-serif;
}
#lang-list row:selected {
    background-color: #2a3a50;
    color: #7eb8f7;
}
#lang-list row:hover {
    background-color: #252525;
}
#picker-confirm {
    background-color: #2a3a50;
    color: #7eb8f7;
    border: 1px solid #3a5070;
    border-radius: 4px;
    font-size: 13px;
    padding: 6px 18px;
}
#picker-confirm:hover {
    background-color: #3a4f6a;
}
#picker-confirm:disabled {
    background-color: #252525;
    color: #555;
    border-color: #333;
}
#picker-step {
    color: #7eb8f7;
    font-size: 12px;
    font-family: monospace;
    padding: 0 16px 4px 16px;
}
"""


class LanguagePickerDialog(Gtk.Window):
    """Two-step language picker: choose lang A, then lang B."""

    def __init__(self, parent, current_a=None, current_b=None, callback=None):
        super().__init__(type=Gtk.WindowType.TOPLEVEL)
        self._callback = callback
        self._step = 1  # 1 = picking A, 2 = picking B
        self._lang_a = current_a
        self._lang_b = current_b
        self._all_rows = []

        self.set_title("Choose Languages")
        self.set_default_size(320, 420)
        self.set_resizable(False)
        self.set_decorated(False)
        self.set_keep_above(True)
        self.set_modal(True)
        self.set_position(Gtk.WindowPosition.CENTER)
        if parent:
            self.set_transient_for(parent)
        self.set_name("picker-window")

        outer = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=0)
        self.add(outer)

        # Title
        self._title_lbl = Gtk.Label()
        self._title_lbl.set_name("picker-title")
        self._title_lbl.set_xalign(0)
        outer.pack_start(self._title_lbl, False, False, 0)

        # Step indicator
        self._step_lbl = Gtk.Label()
        self._step_lbl.set_name("picker-step")
        self._step_lbl.set_xalign(0)
        outer.pack_start(self._step_lbl, False, False, 0)

        # Search
        self._search = Gtk.Entry()
        self._search.set_name("picker-search")
        self._search.set_placeholder_text("Search…")
        self._search.connect("changed", self._on_search)
        search_box = Gtk.Box()
        search_box.set_margin_start(12)
        search_box.set_margin_end(12)
        search_box.set_margin_bottom(6)
        search_box.pack_start(self._search, True, True, 0)
        outer.pack_start(search_box, False, False, 0)

        # List in a scrolled window
        scroll = Gtk.ScrolledWindow()
        scroll.set_policy(Gtk.PolicyType.NEVER, Gtk.PolicyType.AUTOMATIC)
        scroll.set_margin_start(12)
        scroll.set_margin_end(12)
        scroll.set_margin_bottom(8)

        self._listbox = Gtk.ListBox()
        self._listbox.set_name("lang-list")
        self._listbox.set_selection_mode(Gtk.SelectionMode.SINGLE)
        self._listbox.connect("row-activated", self._on_row_activated)
        self._listbox.connect("selected-rows-changed", self._on_selection_changed)
        scroll.add(self._listbox)
        outer.pack_start(scroll, True, True, 0)

        # Confirm button
        btn_box = Gtk.Box()
        btn_box.set_halign(Gtk.Align.END)
        btn_box.set_margin_end(12)
        btn_box.set_margin_bottom(12)

        self._confirm_btn = Gtk.Button(label="Next →")
        self._confirm_btn.set_name("picker-confirm")
        self._confirm_btn.set_sensitive(False)
        self._confirm_btn.connect("clicked", self._on_confirm)
        btn_box.pack_start(self._confirm_btn, False, False, 0)
        outer.pack_start(btn_box, False, False, 0)

        self._populate_list()
        self._update_step_ui()
        self.connect("key-press-event", self._on_key)
        self.show_all()
        self._search.grab_focus()

    def _populate_list(self):
        for child in self._listbox.get_children():
            self._listbox.remove(child)
        self._all_rows = []

        query = self._search.get_text().lower().strip()
        for name, code in LANGUAGES:
            if query and query not in name.lower() and query not in code.lower():
                continue
            row = Gtk.ListBoxRow()
            lbl = Gtk.Label(label=name)
            lbl.set_xalign(0)
            lbl.set_margin_start(8)
            lbl.set_margin_top(3)
            lbl.set_margin_bottom(3)
            row.add(lbl)
            row._lang_code = code
            row._lang_name = name
            self._listbox.add(row)
            self._all_rows.append(row)

        self._listbox.show_all()

        # Re-select current choice if visible
        current = self._lang_a if self._step == 1 else self._lang_b
        if current:
            for row in self._listbox.get_children():
                if row._lang_code == current:
                    self._listbox.select_row(row)
                    break

        self._confirm_btn.set_sensitive(self._get_selected_code() is not None)

    def _on_search(self, widget):
        self._populate_list()

    def _get_selected_code(self):
        row = self._listbox.get_selected_row()
        return row._lang_code if row else None

    def _on_selection_changed(self, listbox):
        self._confirm_btn.set_sensitive(self._get_selected_code() is not None)

    def _on_row_activated(self, listbox, row):
        self._on_confirm(None)

    def _on_confirm(self, widget):
        code = self._get_selected_code()
        if not code:
            return
        if self._step == 1:
            self._lang_a = code
            self._step = 2
            self._search.set_text("")
            self._populate_list()
            self._update_step_ui()
        else:
            self._lang_b = code
            save_config(self._lang_a, self._lang_b)
            if self._callback:
                self._callback(self._lang_a, self._lang_b)
            self.destroy()

    def _update_step_ui(self):
        if self._step == 1:
            self._title_lbl.set_text("Choose first language")
            self._step_lbl.set_text("Step 1 of 2")
            self._confirm_btn.set_label("Next →")
        else:
            a_name = LANG_BY_CODE.get(self._lang_a, self._lang_a)
            self._title_lbl.set_text(f"Choose second language")
            self._step_lbl.set_text(f"Step 2 of 2  —  translating to/from {a_name}")
            self._confirm_btn.set_label("Save")

    def _on_key(self, widget, event):
        if event.keyval == Gdk.KEY_Escape:
            # On escape: if step 2, go back; if step 1 and we have existing config, close
            if self._step == 2:
                self._step = 1
                self._search.set_text("")
                self._populate_list()
                self._update_step_ui()
            else:
                self.destroy()


class TranslateWindow(Gtk.Window):
    def __init__(self):
        super().__init__(type=Gtk.WindowType.TOPLEVEL)
        self._debounce_id = None
        self._translate_thread = None
        self._lang_a = "el"
        self._lang_b = "en"

        # Apply CSS
        style_provider = Gtk.CssProvider()
        style_provider.load_from_data(CSS)
        Gtk.StyleContext.add_provider_for_screen(
            Gdk.Screen.get_default(),
            style_provider,
            Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
        )

        # Window setup
        self.set_title("Translate")
        self.set_default_size(450, -1)
        self.set_resizable(False)
        self.set_decorated(False)
        self.set_keep_above(True)
        self.set_position(Gtk.WindowPosition.CENTER)
        self.set_skip_taskbar_hint(True)
        self.set_skip_pager_hint(True)

        # Layout
        self._box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        self.add(self._box)

        # Input
        self._entry = Gtk.Entry()
        self._entry.set_name("input")
        self._entry.set_placeholder_text("Type to translate...")
        self._entry.connect("changed", self._on_changed)
        self._entry.connect("key-press-event", self._on_key)
        self._box.pack_start(self._entry, False, False, 0)

        # Separator
        self._sep = Gtk.Separator()
        self._sep.set_name("separator")
        self._sep.set_no_show_all(True)
        self._box.pack_start(self._sep, False, False, 0)

        # Result label
        self._result = Gtk.Label(label="")
        self._result.set_name("result")
        self._result.set_xalign(0)
        self._result.set_line_wrap(True)
        self._result.set_no_show_all(True)
        self._box.pack_start(self._result, False, False, 0)

        # Footer: lang display + settings button
        footer = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL)
        footer.set_name("footer")

        self._lang_display = Gtk.Label()
        self._lang_display.set_name("lang-display")
        self._lang_display.set_xalign(0)
        footer.pack_start(self._lang_display, True, True, 0)

        settings_btn = Gtk.Button(label="⚙ languages")
        settings_btn.set_name("settings-btn")
        settings_btn.set_relief(Gtk.ReliefStyle.NONE)
        settings_btn.connect("clicked", self._open_picker)
        footer.pack_end(settings_btn, False, False, 0)

        self._box.pack_start(footer, False, False, 0)

        self.connect("destroy", Gtk.main_quit)
        self.show_all()
        self._entry.grab_focus()

        # Load config or show picker on first run
        cfg = load_config()
        if cfg:
            self._lang_a = cfg["lang_a"]
            self._lang_b = cfg["lang_b"]
            self._update_lang_display()
        else:
            # First run: open picker immediately
            GLib.idle_add(self._open_picker_first_run)

    def _open_picker_first_run(self):
        picker = LanguagePickerDialog(
            self, current_a=self._lang_a, current_b=self._lang_b,
            callback=self._on_langs_chosen
        )
        return False

    def _open_picker(self, widget=None):
        picker = LanguagePickerDialog(
            self, current_a=self._lang_a, current_b=self._lang_b,
            callback=self._on_langs_chosen
        )

    def _on_langs_chosen(self, lang_a, lang_b):
        self._lang_a = lang_a
        self._lang_b = lang_b
        self._update_lang_display()
        # Re-translate current text if any
        text = self._entry.get_text().strip()
        if text:
            self._trigger_translate(text)

    def _update_lang_display(self):
        a_name = LANG_BY_CODE.get(self._lang_a, self._lang_a)
        b_name = LANG_BY_CODE.get(self._lang_b, self._lang_b)
        self._lang_display.set_text(f"{a_name} ↔ {b_name}")

    def _on_key(self, widget, event):
        if event.keyval == Gdk.KEY_Escape:
            Gtk.main_quit()

    def _on_changed(self, widget):
        text = self._entry.get_text().strip()

        if self._debounce_id:
            GLib.source_remove(self._debounce_id)
            self._debounce_id = None

        if not text:
            self._hide_result()
            return

        self._debounce_id = GLib.timeout_add(DEBOUNCE_MS, self._trigger_translate, text)

    def _trigger_translate(self, text):
        self._debounce_id = None

        # Detect which language the text is in, symmetrically
        source = detect_source_lang(text, self._lang_a, self._lang_b)
        if source == self._lang_a:
            target = self._lang_b
        elif source == self._lang_b:
            target = self._lang_a
        else:
            # "auto": two Latin-script languages or ambiguous; default a→b
            source = "auto"
            target = self._lang_b

        def run():
            label, result = do_translate(text, source, target)
            GLib.idle_add(self._show_result, label, result)

        self._translate_thread = threading.Thread(target=run, daemon=True)
        self._translate_thread.start()
        return False

    def _show_result(self, label, result):
        self._result.set_text(result)
        self._lang_display.set_text(label)
        self._result.show()
        self._sep.show()
        self.resize(450, 1)

    def _hide_result(self):
        self._sep.hide()
        self._result.hide()
        self._update_lang_display()
        self.resize(450, 1)


if __name__ == "__main__":
    win = TranslateWindow()
    Gtk.main()
