#!/usr/bin/env python3
"""GTK3 polkit authentication dialog with show/hide password toggle."""
import sys

try:
    import gi
    gi.require_version('Gtk', '3.0')
    from gi.repository import Gtk, Gio
except ImportError:
    # Fallback to zenity if GTK3 not available
    import subprocess
    title = "Authentication Required"
    text = ""
    kind = "password"
    args = sys.argv[1:]
    i = 0
    while i < len(args):
        arg = args[i]
        if arg.startswith("--title="):
            title = arg[8:]
        elif arg.startswith("--text="):
            text = arg[7:]
        elif arg == "--info":
            kind = "info"
        elif arg == "--error":
            kind = "error"
        i += 1
    if kind == "password":
        cmd = ["zenity", "--entry", "--hide-text", f"--title={title}", f"--text={text}", "--width=420"]
        res = subprocess.run(cmd, capture_output=True, text=True)
        if res.returncode == 0:
            sys.stdout.write(res.stdout)
            sys.stdout.flush()
        sys.exit(res.returncode)
    elif kind == "info":
        subprocess.run(["zenity", "--info", f"--title={title}", f"--text={text}", "--width=420"])
        sys.exit(0)
    else:
        subprocess.run(["zenity", "--error", f"--title={title}", f"--text={text}", "--width=420"])
        sys.exit(0)


class PolkitPasswordDialog(Gtk.Dialog):
    def __init__(self, title="Authentication Required", message=""):
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

        # Header
        header = Gtk.Label()
        header.set_markup(f'<span size="large"><b>{title}</b></span>')
        header.set_halign(Gtk.Align.START)
        header.set_line_wrap(True)
        content.add(header)

        # Message
        if message:
            msg_label = Gtk.Label(label=message)
            msg_label.set_halign(Gtk.Align.START)
            msg_label.set_line_wrap(True)
            msg_label.get_style_context().add_class("dim-label")
            content.add(msg_label)

        # Password entry with toggle
        entry_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=0)

        self._entry = Gtk.Entry()
        self._entry.set_visibility(False)
        self._entry.set_input_purpose(Gtk.InputPurpose.PASSWORD)
        self._entry.set_hexpand(True)
        self._entry.connect("activate", lambda e: self.response(Gtk.ResponseType.OK))
        entry_box.pack_start(self._entry, True, True, 0)

        # Eye toggle button
        toggle = Gtk.ToggleButton()
        toggle.set_relief(Gtk.ReliefStyle.NONE)
        toggle.set_tooltip_text("Show/Hide password")

        icon = Gio.ThemedIcon(name="view-reveal-symbolic")
        image = Gtk.Image.new_from_gicon(icon, Gtk.IconSize.BUTTON)
        toggle.add(image)

        toggle.connect("toggled", lambda b: self._entry.set_visibility(b.get_active()))
        entry_box.pack_end(toggle, False, False, 0)

        content.add(entry_box)

        self.show_all()

    def get_password(self):
        return self._entry.get_text()


class PolkitInfoDialog(Gtk.Dialog):
    def __init__(self, title="Authentication Required", message="", is_error=False):
        super().__init__(
            title=title,
            flags=Gtk.DialogFlags.MODAL | Gtk.DialogFlags.DESTROY_WITH_PARENT,
        )
        self.add_buttons(Gtk.STOCK_OK, Gtk.ResponseType.OK)
        self.set_default_response(Gtk.ResponseType.OK)
        self.set_resizable(False)
        self.set_border_width(12)

        content = self.get_content_area()
        content.set_spacing(12)

        icon_name = "dialog-error" if is_error else "dialog-information"
        image = Gtk.Image.new_from_icon_name(icon_name, Gtk.IconSize.DIALOG)
        content.add(image)

        label = Gtk.Label(label=message)
        label.set_line_wrap(True)
        label.set_max_width_chars(60)
        content.add(label)

        self.show_all()


def main():
    title = "Authentication Required"
    text = ""
    kind = "password"

    args = sys.argv[1:]
    i = 0
    while i < len(args):
        arg = args[i]
        if arg.startswith("--title="):
            title = arg[8:]
        elif arg.startswith("--text="):
            text = arg[7:]
        elif arg == "--info":
            kind = "info"
        elif arg == "--error":
            kind = "error"
        i += 1

    if kind == "password":
        dialog = PolkitPasswordDialog(title=title, message=text)
        response = dialog.run()
        password = dialog.get_password()
        dialog.destroy()

        if response == Gtk.ResponseType.OK and password:
            sys.stdout.write(password + "\n")
            sys.stdout.flush()
            sys.exit(0)
        else:
            sys.exit(1)
    else:
        is_error = (kind == "error")
        dialog = PolkitInfoDialog(title=title, message=text, is_error=is_error)
        dialog.run()
        dialog.destroy()
        sys.exit(0)


if __name__ == "__main__":
    main()
