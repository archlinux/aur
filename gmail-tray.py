#!/usr/bin/env python3
import gi
import subprocess
import signal
import threading
import fcntl
import json
import os

gi.require_version('Gtk', '3.0')

import shutil
from gi.repository import Gtk, GLib

gi.require_version('AyatanaAppIndicator3', '0.1')
from gi.repository import AyatanaAppIndicator3 as AppIndicator


LOCK_FILE = "/tmp/gmail-tray.lock"

def already_running() -> bool:
    global lock_fp
    try:
        lock_fp = open(LOCK_FILE, 'w')
        fcntl.flock(lock_fp, fcntl.LOCK_EX | fcntl.LOCK_NB)
        return False
    except OSError:
        return True

def verify_configs() -> str:
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

def get_configs(config_file):
    with open(config_file, "r") as f:
        configs = json.load(f)
        return configs

def open_browser(browser, flags, url) -> None:
    print("Opening browser")
    print(f"Browser: {browser}, Flags: {flags}, URL: {url}")
    subprocess.Popen([browser, *flags, url]).wait()
    print("Browser opened.")

class GenericTrayApp:
    def __init__(self, config_file) -> None:
        self.prev_unread = 0
        # get the variables from the gmail-tray-configs.json file
        try:
            configs = get_configs(config_file)
            self.url = configs["url"]
            self.icon = configs["icon"]
            self.title = configs["title"]
            self.interval = configs["interval"]
            self.browser = configs["browser"]
            self.flags = configs["flags"]
        except Exception as e:
            print("Error reading configuration file:", e)
            return None
        self.indicator = AppIndicator.Indicator.new(
            self.title,
            self.icon,
            AppIndicator.IndicatorCategory.APPLICATION_STATUS
        )
        self.users = []
        self.indicator.set_status(AppIndicator.IndicatorStatus.ACTIVE)
        self.indicator.set_menu(self.build_menu())
        self.update_label()
        GLib.timeout_add_seconds(self.interval, self.update_label)

    def build_menu(self):
        menu = Gtk.Menu()

        display_item = Gtk.MenuItem(label="Show unread counts per users")
        display_item.connect("activate", lambda x: self.display_users_unread())
        menu.append(display_item)

        toggle_item = Gtk.MenuItem(label=f"Open {self.title}")
        toggle_item.connect("activate", self.launch_app)
        menu.append(toggle_item)

        quit_item = Gtk.MenuItem(label="Quit")
        quit_item.connect("activate", self.quit)
        menu.append(quit_item)

        for (user, unread) in self.users:
            user_item = Gtk.MenuItem(label=f"{user}: {unread} unread")
            user_item.set_sensitive(False)
            menu.append(user_item)

        menu.show_all()
        return menu

    def get_unread_count(self) -> int:
        try:
            output = subprocess.run(["fetchmail", "-c"], stdout=subprocess.PIPE, stderr=subprocess.DEVNULL).stdout
            output = output.decode().strip().splitlines()
            print("Output from fetchmail:\n", output)
            total_unread = 0
            for u, line in enumerate(output):
                user = line.strip().split()[-3]
                if len(self.users) < len(output):
                    self.users.append([user, 0])
                print("Processing user:", user)
                line = line.strip().split()
                kw = "message" if "message" in line else "messages"
                if kw not in line:
                    print("No message count found in fetchmail output.")
                    continue
                idx = line.index(kw) - 1
                msg = int(line[idx])
                print("Message count:", msg)
                unread = 0
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
                print("Unread count for user", user, ":", unread)
                total_unread += unread
                self.users[u][1] = unread
            print("Total unread count:", total_unread)
            return total_unread
        except Exception as e:
            print("Erro em get_unread_count", e)
            return 0
    
    def update_label(self) -> bool:
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
            self.indicator.set_menu(self.build_menu())
            # changes the icon if there are unread emails
            if self.prev_unread > 0:
                self.indicator.set_icon("gmail-tray-unread")
                self.indicator.set_status(AppIndicator.IndicatorStatus.ATTENTION)
            return True
        except Exception as e:
            print("Erro em update_label-->", e)
            self.indicator.set_label("?", self.title)
            return False

    def display_users_unread(self) -> None:
        print("Displaying users unread counts:")
        for user, unread in self.users:
            print(f"User: {user}, Unread: {unread}")
            self.notify_new_mail(unread, user)

    def notify_new_mail(self, count, user=None) -> None:
        print(f"New mail notification: {count} new email(s)")
        try:
            subprocess.run(["notify-send",
                            "-a", "Gmail",
                            "-u", "normal",
                            "-t", "2000",
                            "-i", self.icon,
                            f"{count} new Gmail message(s)" if user is None else f"{count} new Gmail message(s) for {user}"
            ])
        except FileNotFoundError:
            print("notify-send not found.")
        except Exception as e:
            print("Erro em notify_new_mail", e)

    def launch_app(self, _) -> None:
        print("Launching app...")
        open_browser(self.browser, self.flags, self.url)
        print("App launched.")
        # Update the unread count after launching the app
        self.update_label()

    def quit(self, _):
        print("Exiting...")
        Gtk.main_quit()


def main(config_file) -> None:
    signal.signal(signal.SIGINT, signal.SIG_DFL)
    _ = GenericTrayApp(config_file)
    Gtk.main()

if __name__ == "__main__":
    config_file = verify_configs()
    if already_running():
        print("Gmail Tray is already running.")
        configs = get_configs(config_file)
        open_browser(configs["browser"], configs["flags"], configs["url"])
    else:
        main(config_file)
