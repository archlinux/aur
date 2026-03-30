#!/usr/bin/env python
import gi
gi.require_version('Gtk', '3.0')
gi.require_version('WebKit2', '4.0')

from gi.repository import Gtk, WebKit2

URL = "https://zepyx.home.kg/ripple/"

class RippleApp(Gtk.Window):
    def __init__(self):
        super().__init__(title="Ripple")
        self.set_default_size(1000, 700)

        self.webview = WebKit2.WebView()

        settings = self.webview.get_settings()

        # ✅ Critical fixes
        settings.set_user_agent(
            "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 Chrome/120 Safari/537.36"
        )

        settings.set_enable_javascript(True)

        # Load
        self.webview.load_uri(URL)

        # Retry once on failure (kills the TLS glitch)
        self.webview.connect("load-failed", self.retry_once)

        self.retried = False

        self.add(self.webview)

    def retry_once(self, webview, load_event, uri, error):
        print(f"[WARN] Load failed: {error}")

        if not self.retried:
            self.retried = True
            print("[INFO] Retrying...")
            webview.load_uri(URL)
            return True  # handled

        return False

win = RippleApp()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
