#!/usr/bin/env python3
from calendar import c
import re
import gi
import subprocess
import signal
import threading
import fcntl
import json
import os

gi.require_version('Gtk', '3.0')
gi.require_version('AppIndicator3', '0.1')
from gi.repository import Gtk, AppIndicator3, GLib # type: ignore

LOCK_FILE = "/tmp/gmail-tray.lock"

def already_running():
    global lock_fp
    try:
        lock_fp = open(LOCK_FILE, 'w')
        fcntl.flock(lock_fp, fcntl.LOCK_EX | fcntl.LOCK_NB)
        return False
    except OSError:
        return True

def verify_configs():
    config_path = os.path.expanduser("~/.config/gmail-tray")
    config_file = os.path.join(config_path, "gmail-tray-configs.json")
    if not os.path.exists(config_file):
        print("Configuration file not found. Creating a new one...")
        os.makedirs(os.path.dirname(config_file), exist_ok=True)
        # copies the default config file to the user's home directory
        default_config = "/usr/share/gmail-tray/gmail-tray-configs.json"
        if os.path.exists(default_config):
            print("Copying default configuration file...")
            with open(default_config, "r") as src, open(config_file, "w") as dst:
                dst.write(src.read())
            print("Default configuration file copied.")
            return config_file
        else:
            print("Default configuration file not found. Please create it manually.")
            exit(1)
    else:
        print("Configuration file found.")
        return config_file


class GenericTrayApp:
    def __init__(self, config_file):
        self.prev_unread = 0
        # get the variables from the gmail-tray-configs.json file
        try:
            with open(config_file, "r") as f:
                configs = json.load(f)
                self.url = configs["url"]
                self.icon = configs["icon"]
                self.title = configs["title"]
                self.interval = configs["interval"]
                self.browser = configs["browser"]
                self.flags = configs["flags"]
        except Exception as e:
            print("Error reading configuration file:", e)
            return None
        self.indicator = AppIndicator3.Indicator.new(
            self.title,
            self.icon,
            AppIndicator3.IndicatorCategory.APPLICATION_STATUS
        )
        self.indicator.set_status(AppIndicator3.IndicatorStatus.ACTIVE)
        self.indicator.set_menu(self.build_menu())
        self.update_label()
        GLib.timeout_add_seconds(self.interval, self.update_label)

    def build_menu(self):
        menu = Gtk.Menu()

        toggle_item = Gtk.MenuItem(label=f"Open {self.title}")
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
            output = output.decode().strip().splitlines()
            print("Output from fetchmail:\n", output)
            unread = 0
            for line in output:
                line = line.strip().split()
                kw = "message" if "message" in line else "messages"
                idx = line.index(kw) - 1
                msg = int(line[idx])
                print("Message count:", msg)
                if "seen)" in line:
                    print("Seen count found in fetchmail output.")
                    # remove parenteses
                    seen = int(line[line.index("seen)") - 1][1:])
                    print("Seen count:", seen)
                    unread -= seen
                kw = "unread)" if "unread)" in line else "unseen"
                if kw not in line:
                    print("No unread count found in fetchmail output.")
                    unread += msg
                else:
                    # verify if unread count is available
                    print("finding idx for", kw, "in", line)
                    idx_unread = line.index(kw) - 1
                    unread += int(line[idx_unread][1:])
                print("Unread count:", unread)
            return unread
        except Exception as e:
            print("Erro em get_unread_count", e)
            return 0
    
    def update_label(self):
        print("Updating label...")
        print("previous unread count:", self.prev_unread)
        try:
            count = self.get_unread_count()
            if count > self.prev_unread:
                print(f"New unread msgs: {count} (previous: {self.prev_unread})")
                threading.Thread(target=self.notify_new_mail, args=(count,)).start()
            self.prev_unread = count
            print("Current unread count:", self.prev_unread)
            label = f"{self.prev_unread}"
            self.indicator.set_label(label, self.title)
            return True
        except Exception as e:
            print("Erro em update_label-->", e)
            self.indicator.set_label("?", self.title)
    

    def notify_new_mail(self, count):
        print(f"New mail notification: {count} new email(s)")
        try:
            print("Using dunstify for notification...")
            subprocess.run([
                "dunstify", "-a", "Gmail", "-u", "normal",
                "-I", self.icon, "-c", "gmail", "-t", "1000", 
                "-h", "string:x-dunst-stack-tag:gmail",
                f"{count} new email(s)"
            ])
        except FileNotFoundError:
            print("dunstify not found, using notify-send instead.")
            subprocess.run(["notify-send", f"> {count} new Gmail message(s)"])
        except Exception as e:
            print("Erro em notify_new_mail", e)

    def launch_app(self, _):
        print("Launching app...")
        subprocess.Popen([self.browser, *self.flags, self.url]).wait()
        print("App launched.")
        # Update the unread count after launching the app
        self.update_label()

    def quit(self, _):
        print("Exiting...")
        Gtk.main_quit()


def main(config_file):
    signal.signal(signal.SIGINT, signal.SIG_DFL)
    _ = GenericTrayApp(config_file)
    Gtk.main()

if __name__ == "__main__":
    config_file = verify_configs()
    if already_running():
        print("Gmail Tray is already running.")
    else:
        main(config_file)
