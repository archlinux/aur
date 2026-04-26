import urllib.request
import urllib.parse
import json
import threading
# import time
from functools import lru_cache
import gi
gi.require_version('IBus', '1.0')
from gi.repository import IBus, GLib, GObject

@lru_cache(maxsize=512)

def get_bangla_suggestions(text: str, num: int = 8) -> tuple:
    url = "https://inputtools.google.com/request"
    params = urllib.parse.urlencode({
        "text": text,
        "itc": "bn-t-i0-und",
        "num": num,
        "cp": 0, "cs": 1,
        "ie": "utf-8", "oe": "utf-8"
    })
    try:
        with urllib.request.urlopen(f"{url}?{params}", timeout=3) as r:
            data = json.loads(r.read().decode("utf-8"))
            if data[0] == "SUCCESS":
                return tuple(data[1][0][1])
            return ()
    except Exception:
        return ()


class BanglaEngine(IBus.Engine):
    __gtype_name__ = "BanglaEngine"

    def __init__(self):
        super().__init__()
        self._buffer = ""          # accumulates what user types in roman
        self._lookup_table = IBus.LookupTable.new(9, 0, True, True)
        self._suggestions = []
        self._debounce_timer = None
        self._opener = urllib.request.build_opener()

    def _fetch_and_show(self, text):
        # Cancel previous pending request
        if self._debounce_timer:
            self._debounce_timer.cancel()

        # Wait 150ms before actually fetching
        self._debounce_timer = threading.Timer(
            0.15, self._do_fetch, args=[text]
        )
        self._debounce_timer.start()

    def _do_fetch(self, text):
        suggestions = list(get_bangla_suggestions(text))
        GLib.idle_add(self._update_lookup_table, suggestions)

    def do_process_key_event(self, keyval, keycode, state):
        # Ignore key release events
        if state & IBus.ModifierType.RELEASE_MASK:
            return False

        # Ignore Ctrl, Alt, Super (Windows key) combos
        if state & (IBus.ModifierType.CONTROL_MASK |
                 IBus.ModifierType.MOD1_MASK |    # Alt
                 IBus.ModifierType.SUPER_MASK):   # Windows key
            return False

        # Ignore arrow keys, function keys, and other special keys
        ignored_keys = {
            IBus.KEY_Left, IBus.KEY_Right, IBus.KEY_Up, IBus.KEY_Down,
            IBus.KEY_Home, IBus.KEY_End, IBus.KEY_Page_Up, IBus.KEY_Page_Down,
            IBus.KEY_Insert, IBus.KEY_Delete,
            IBus.KEY_Tab, IBus.KEY_Caps_Lock,
            IBus.KEY_Shift_L, IBus.KEY_Shift_R,
            IBus.KEY_Control_L, IBus.KEY_Control_R,
            IBus.KEY_Alt_L, IBus.KEY_Alt_R,
            IBus.KEY_Super_L, IBus.KEY_Super_R,
            IBus.KEY_F1, IBus.KEY_F2, IBus.KEY_F3, IBus.KEY_F4,
            IBus.KEY_F5, IBus.KEY_F6, IBus.KEY_F7, IBus.KEY_F8,
            IBus.KEY_F9, IBus.KEY_F10, IBus.KEY_F11, IBus.KEY_F12,
        }

        if keyval in ignored_keys:
             return False
        

        # char = chr(keyval)
        char = chr(keyval) if keyval < 0x110000 else "" 

        # Backspace — remove last char from buffer
        if keyval == IBus.KEY_BackSpace:
            if self._buffer:
                self._buffer = self._buffer[:-1]
                if self._buffer:
                   # UPDATE: show the shorter buffer in preedit
                    self.update_preedit_text(
                        IBus.Text.new_from_string(self._buffer), len(self._buffer), True
                    )
                    self._fetch_and_show(self._buffer)
                else:
                    self._clear()
                return True
            return False
        

        # Space — commit the top suggestion (or the buffer as-is)
        if keyval == IBus.KEY_space:
            if self._suggestions:
                self._commit(self._suggestions[0])
            elif self._buffer:
                self.commit_text(IBus.Text.new_from_string(self._buffer))
                self._clear()
            else:
                return False  # let space pass through normally
            return True

        if keyval == IBus.KEY_Return:
            if self._suggestions:
                self._commit(self._suggestions[0])
            elif self._buffer:
                self.commit_text(IBus.Text.new_from_string(self._buffer))
                self._clear()
            else:
                return False  # let space pass through normally
            return True

        # Number keys 1-9 — pick suggestion by number
        if IBus.KEY_1 <= keyval <= IBus.KEY_9 and self._suggestions:
            index = keyval - IBus.KEY_1
            if index < len(self._suggestions):
                self._commit(self._suggestions[index])
            return True

        # Escape — cancel and clear
        if keyval == IBus.KEY_Escape:
            if self._buffer:
                self._clear()
                return True
            return False

        # Regular letter — add to buffer
        if char.isalpha():
            self._buffer += char
            self.update_preedit_text(
                IBus.Text.new_from_string(self._buffer), len(self._buffer), True
            )
            self._fetch_and_show(self._buffer)
            return True

        return False

    # def _fetch_and_show(self, text):
    #     # Fetch in a background thread so typing stays responsive
    #     def fetch():
    #         suggestions = get_bangla_suggestions(text)
    #         GLib.idle_add(self._update_lookup_table, suggestions)
    #     threading.Thread(target=fetch, daemon=True).start()

    def _update_lookup_table(self, suggestions):
        self._suggestions = suggestions
        self._lookup_table.clear()
        for word in suggestions:
            self._lookup_table.append_candidate(IBus.Text.new_from_string(word))
        self.update_lookup_table(self._lookup_table, True)

    def _commit(self, word):
        self.commit_text(IBus.Text.new_from_string(word + " "))
        self._clear()

    def _clear(self):
        self._buffer = ""
        self._suggestions = []
        self._lookup_table.clear()
        self.update_preedit_text(IBus.Text.new_from_string(""), 0, False)
        self.hide_lookup_table()

    def do_focus_out(self):
        self._clear()

    def do_reset(self):
        self._clear()


def main():
    IBus.init()
    bus = IBus.Bus()

    if not bus.is_connected():
        print("ERROR: IBus daemon is not running. Start it with: ibus-daemon -drx")
        return

    factory = IBus.Factory.new(bus.get_connection())
    factory.add_engine("bangla-google", GObject.type_from_name("BanglaEngine"))

    bus.request_name("org.freedesktop.IBus.BanglaGoogle", 0)
    IBus.main()

if __name__ == "__main__":
    main()
