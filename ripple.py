#!/usr/bin/env python
import gi
import time

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

        # Safer UA (unchanged but stable)
        settings.set_user_agent(
            "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 Chrome/120 Safari/537.36"
        )

        settings.set_enable_javascript(True)

        # 🔧 Stability fixes
        settings.set_enable_page_cache(False)
        settings.set_enable_offline_web_application_cache(False)

        # Load initial page
        self.webview.load_uri(URL)

        # Retry logic
        self.retried = False
        self.webview.connect("load-failed", self.on_load_failed)

        self.add(self.webview)

    def on_load_failed(self, webview, load_event, failing_uri, error):
        print(f"[WARN] Load failed: {failing_uri} -> {error.message}")

        if self.retried:
            return False

        self.retried = True

        print("[INFO] Retrying with backoff...")

        def retry():
            time.sleep(0.5)
            webview.load_uri(failing_uri or URL)
            return False

        retry()
        return True


win = RippleApp()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
