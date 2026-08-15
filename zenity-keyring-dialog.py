#!/usr/bin/env python3
"""GTK3 keyring password dialog with show/hide toggle."""
import sys
import os

try:
    import gi
    gi.require_version('Gtk', '3.0')
    from gi.repository import Gtk, Gio, Pango
except ImportError:
    # Fallback to zenity if GTK3 not available
    import subprocess
    mode = sys.argv[1] if len(sys.argv) > 1 else "unlock"
    text = sys.argv[2] if len(sys.argv) > 2 else "Enter password:"
    cmd = ["zenity", "--password", "--title=Cinnamon Keyring", f"--text={text}"]
    res = subprocess.run(cmd, capture_output=True, text=True)
    if res.returncode == 0:
        print(res.stdout.strip())
    sys.exit(res.returncode)


class KeyringPasswordDialog(Gtk.Dialog):
    def __init__(self, message="Enter password:", title="Cinnamon Keyring",
                 confirm_mode=False):
        super().__init__(
            title=title,
            flags=Gtk.DialogFlags.MODAL | Gtk.DialogFlags.DESTROY_WITH_PARENT,
        )
        self.add_buttons(
            Gtk.STOCK_CANCEL, Gtk.ResponseType.CANCEL,
            Gtk.STOCK_OK, Gtk.ResponseType.OK,
        )
        self.set_default_response(Gtk.ResponseType.OK)
        self.set_resizable(False)
        self.set_border_width(12)

        content = self.get_content_area()
        content.set_spacing(12)

        # Header label
        header = Gtk.Label()
        header.set_markup(f'<span size="large"><b>{title}</b></span>')
        header.set_halign(Gtk.Align.START)
        header.set_line_wrap(True)
        content.add(header)

        # Message label
        if message:
            msg_label = Gtk.Label(label=message)
            msg_label.set_halign(Gtk.Align.START)
            msg_label.set_line_wrap(True)
            msg_label.get_style_context().add_class("dim-label")
            content.add(msg_label)

        # Password entry with toggle
        self._password_entry = self._create_password_entry(
            "Password:" if not confirm_mode else "New password:")
        content.add(self._password_entry)

        if confirm_mode:
            self._confirm_entry = self._create_password_entry("Confirm password:")
            content.add(self._confirm_entry)
        else:
            self._confirm_entry = None

        self.show_all()

    def _create_password_entry(self, label_text):
        box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=4)

        label = Gtk.Label(label=label_text)
        label.set_halign(Gtk.Align.START)
        box.add(label)

        entry_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=0)

        entry = Gtk.Entry()
        entry.set_visibility(False)
        entry.set_input_purpose(Gtk.InputPurpose.PASSWORD)
        entry.set_hexpand(True)
        entry.connect("activate", self._on_entry_activate)
        entry_box.pack_start(entry, True, True, 0)

        # Eye toggle button
        toggle = Gtk.ToggleButton()
        toggle.set_relief(Gtk.ReliefStyle.NONE)
        toggle.set_tooltip_text("Show/Hide password")

        # Use an icon if available, otherwise text
        icon = Gio.ThemedIcon(name="view-reveal-symbolic")
        image = Gtk.Image.new_from_gicon(icon, Gtk.IconSize.BUTTON)
        toggle.add(image)

        toggle.connect("toggled", self._on_toggle_clicked, entry)
        entry_box.pack_end(toggle, False, False, 0)

        box.add(entry_box)

        # Store entry reference on the box for easy access
        box._entry = entry
        return box

    def _on_toggle_clicked(self, button, entry):
        entry.set_visibility(button.get_active())

    def _on_entry_activate(self, entry):
        self.response(Gtk.ResponseType.OK)

    def get_password(self):
        return self._password_entry._entry.get_text()

    def get_confirm(self):
        if self._confirm_entry:
            return self._confirm_entry._entry.get_text()
        return None


def main():
    args = sys.argv[1:]
    mode = "unlock"
    text = "Enter password:"

    i = 0
    while i < len(args):
        arg = args[i]
        if arg in ("unlock", "create", "confirm"):
            mode = arg
        elif not arg.startswith("-"):
            text = arg
        i += 1

    confirm_mode = (mode == "create")
    dialog = KeyringPasswordDialog(message=text, confirm_mode=confirm_mode)

    response = dialog.run()
    password = dialog.get_password()
    dialog.destroy()

    if response == Gtk.ResponseType.OK and password:
        if confirm_mode:
            confirm = dialog.get_confirm()
            if password != confirm:
                sys.stderr.write("Passwords do not match\n")
                sys.exit(1)
        print(password)
        sys.exit(0)
    else:
        sys.exit(1)


if __name__ == "__main__":
    main()
