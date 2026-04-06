#!/usr/bin/env python3

import gi
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk, Gdk

import subprocess
from datetime import datetime


class EverydayLinuxUserTools(Gtk.Window):
    def __init__(self):
        super().__init__(title="Everyday Linux User Tools")
        self.set_default_size(800, 500)

        main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        self.add(main_box)

        # 🔥 Menu Bar
        menubar = Gtk.MenuBar()

        help_menu = Gtk.Menu()
        help_item = Gtk.MenuItem(label="Help")
        help_item.set_submenu(help_menu)

        about_item = Gtk.MenuItem(label="About")
        about_item.connect("activate", self.on_about_clicked)
        help_menu.append(about_item)

        menubar.append(help_item)
        main_box.pack_start(menubar, False, False, 0)

        # Notebook
        notebook = Gtk.Notebook()
        main_box.pack_start(notebook, True, True, 0)

        # --- Bluetooth Tab ---
        bluetooth_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        bluetooth_box.set_border_width(10)

        # Status rectangle
        self.status_box = Gtk.Box()
        self.status_box.set_size_request(-1, 60)

        self.status_label = Gtk.Label()
        self.status_label.set_markup("<span foreground='white' size='large'><b>Loading...</b></span>")
        self.status_box.pack_start(self.status_label, True, True, 0)

        bluetooth_box.pack_start(self.status_box, False, False, 0)

        # Buttons
        button_box = Gtk.Box(spacing=6)

        self.toggle_button = Gtk.Button()
        self.toggle_button.connect("clicked", self.on_toggle_clicked)
        button_box.pack_start(self.toggle_button, False, False, 0)

        self.info_button = Gtk.Button(label="More Info")
        self.info_button.connect("clicked", self.on_info_clicked)
        button_box.pack_start(self.info_button, False, False, 0)

        bluetooth_box.pack_start(button_box, False, False, 0)

        # Info panel
        self.info_revealer = Gtk.Revealer()
        self.info_revealer.set_reveal_child(False)

        scrolled_window = Gtk.ScrolledWindow()
        scrolled_window.set_hexpand(True)
        scrolled_window.set_vexpand(True)

        self.textview = Gtk.TextView()
        self.textview.set_editable(False)
        self.textbuffer = self.textview.get_buffer()

        scrolled_window.add(self.textview)
        self.info_revealer.add(scrolled_window)

        bluetooth_box.pack_start(self.info_revealer, True, True, 0)

        notebook.append_page(bluetooth_box, Gtk.Label(label="Bluetooth"))

        # CSS
        self.apply_css()

        self.update_bluetooth_status()

    def apply_css(self):
        css = b"""
        .status-enabled {
            background-color: #2ecc71;
            border-radius: 8px;
            padding: 10px;
        }
        .status-disabled {
            background-color: #e74c3c;
            border-radius: 8px;
            padding: 10px;
        }
        """
        provider = Gtk.CssProvider()
        provider.load_from_data(css)
        Gtk.StyleContext.add_provider_for_screen(
            Gdk.Screen.get_default(),
            provider,
            Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
        )

    def run_command(self, cmd):
        try:
            result = subprocess.run(cmd, capture_output=True, text=True)
            return result.stdout.strip()
        except:
            return ""

    def is_bluetooth_active(self):
        return self.run_command(["systemctl", "is-active", "bluetooth"]) == "active"

    def on_toggle_clicked(self, widget):
        try:
            if self.is_bluetooth_active():
                subprocess.run(
                    ["pkexec", "systemctl", "disable", "--now", "bluetooth"],
                    check=True
                )
            else:
                subprocess.run(
                    ["pkexec", "systemctl", "enable", "--now", "bluetooth"],
                    check=True
                )
        except Exception as e:
            self.textbuffer.set_text(f"Error:\n{e}")

        self.update_bluetooth_status()

    def on_info_clicked(self, widget):
        self.info_revealer.set_reveal_child(
            not self.info_revealer.get_reveal_child()
        )

    def update_bluetooth_status(self):
        try:
            result = subprocess.run(
                ["systemctl", "status", "bluetooth"],
                capture_output=True,
                text=True
            )
            output = result.stdout + result.stderr
        except Exception as e:
            output = f"Error retrieving Bluetooth status:\n{e}"

        self.textbuffer.set_text(output)

        context = self.status_box.get_style_context()

        if self.is_bluetooth_active():
            context.remove_class("status-disabled")
            context.add_class("status-enabled")
            self.status_label.set_markup(
                "<span foreground='white' size='large'><b>Enabled</b></span>"
            )
            self.toggle_button.set_label("Disable Bluetooth")
        else:
            context.remove_class("status-enabled")
            context.add_class("status-disabled")
            self.status_label.set_markup(
                "<span foreground='white' size='large'><b>Disabled</b></span>"
            )
            self.toggle_button.set_label("Enable Bluetooth")

    # 🔥 About Dialog
    def on_about_clicked(self, widget):
        about = Gtk.AboutDialog(transient_for=self, modal=True)

        about.set_program_name("Everyday Linux User Tools")
        about.set_version("1.0")
        about.set_authors(["Gary Newell"])

        current_date = datetime.now().strftime("%Y-%m-%d")

        about.set_comments(
            f"A simple GTK application providing everyday Linux utilities.\n"
            f"Currently includes Bluetooth service management.\n\n"
            f"Build date: {current_date}"
        )

        about.set_license_type(Gtk.License.GPL_3_0)

        about.run()
        about.destroy()


def main():
    app = EverydayLinuxUserTools()
    app.connect("destroy", Gtk.main_quit)
    app.show_all()
    Gtk.main()


if __name__ == "__main__":
    main()