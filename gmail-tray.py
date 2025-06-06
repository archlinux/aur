#!/usr/bin/env python3
import gi
import subprocess
import signal
import threading
import fcntl

LOCK_FILE = "/tmp/gmail-tray.lock"

def already_running():
    global lock_fp
    try:
        lock_fp = open(LOCK_FILE, 'w')
        fcntl.flock(lock_fp, fcntl.LOCK_EX | fcntl.LOCK_NB)
        return False
    except OSError:
        return True

gi.require_version('Gtk', '3.0')
gi.require_version('AppIndicator3', '0.1')
from gi.repository import Gtk, AppIndicator3, GLib

### CONFIGURAÇÃO PERSONALIZÁVEL ###
URL = "https://mail.google.com"
APP_ICON = "gmail-tray"   # ícone do sistema OU caminho absoluto ex: "/home/user/.icons/logo.png"
APP_TITLE = "Gmail"                                 # Título do aplicativo
CHECK_INTERVAL = 60                                 # seconds
BROWSER = "firefox"                                 # Browser to open Gmail
ARGS = ["-P", "Main", "--new-window"]               # Arguments for the browser, e.g., profile and new window
#####################################

class GenericTrayApp:
    def __init__(self):
        self.prev_unread = 0
        self.indicator = AppIndicator3.Indicator.new(
            APP_TITLE,
            APP_ICON,
            AppIndicator3.IndicatorCategory.APPLICATION_STATUS
        )
        self.indicator.set_status(AppIndicator3.IndicatorStatus.ACTIVE)
        self.indicator.set_menu(self.build_menu())
        self.update_label()
        GLib.timeout_add_seconds(CHECK_INTERVAL, self.update_label)

    def build_menu(self):
        menu = Gtk.Menu()

        toggle_item = Gtk.MenuItem(label=f"Open {APP_TITLE}")
        toggle_item.connect("activate", self.launch_app)
        menu.append(toggle_item)

        quit_item = Gtk.MenuItem(label="Quit")
        quit_item.connect("activate", self.quit)
        menu.append(quit_item)

        menu.show_all()
        return menu

    def get_unread_count(self):
        try:
            output = subprocess.run(["fetchmail", "-c"], stdout=subprocess.PIPE, stderr=subprocess.DEVNULL).stdout
            line = output.decode().strip().splitlines()[0].split()
            idx = line.index("fetchmail:") + 3
            # removing parenteses
            count = int(line[idx][1:])
            return count
        except Exception as e:
            print("Erro em get_unread_count", e)
            return 0
    
    def update_label(self):
        print("Updating label...")
        try:
            count = self.get_unread_count()        
            if count > self.prev_unread:
                threading.Thread(target=self.notify_new_mail, args=(count,)).start()
            label = f"{count}"
            self.indicator.set_label(label, APP_TITLE)
            self.prev_unread = count
            return True
        except Exception as e:
            print("Erro em update_label-->", e)
            self.indicator.set_label("?", APP_TITLE)
    

    def notify_new_mail(self, count):
        print(f"New mail notification: {count} new email(s)")
        try:
            subprocess.run([
                "dunstify", "-a", "Gmail", "-u", "normal",
                "-I", APP_ICON, "-c", "gmail", "-t", "1000", 
                "-h", "string:x-dunst-stack-tag:gmail",
                f"> {count} new email(s)"
            ], stderr=subprocess.DEVNULL)
        except FileNotFoundError:
            print("dunstify not found, using notify-send instead.")
            subprocess.run(["notify-send", f"> {count} new Gmail message(s)"])
        except Exception as e:
            print("Erro em notify_new_mail", e)

    def launch_app(self, _):
        print("Launching app...")
        subprocess.Popen([BROWSER, *ARGS, URL], stderr=subprocess.DEVNULL)

    def quit(self, _):
        print("Exiting...")
        Gtk.main_quit()


def main():
    signal.signal(signal.SIGINT, signal.SIG_DFL)
    _ = GenericTrayApp()
    Gtk.main()

if __name__ == "__main__":
    if already_running():
        print("Gmail Tray is already running.")
    else:
        main()
