#!/usr/bin/python3
import os
import sys
import subprocess
import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, Gdk

class RunDialog(Gtk.Dialog):
    def __init__(self):
        super().__init__(title="Run Command", flags=0)
        self.set_default_size(420, 100)
        self.set_position(Gtk.WindowPosition.CENTER)
        self.set_border_width(12)

        # Header / Box
        box = self.get_content_area()
        box.set_spacing(10)

        label = Gtk.Label(label="Enter command to execute:")
        label.set_xalign(0)
        box.pack_start(label, False, False, 0)

        # Entry with completion
        self.entry = Gtk.Entry()
        self.entry.set_activates_default(True)
        box.pack_start(self.entry, False, False, 0)

        # Build completion from PATH executables
        completion = Gtk.EntryCompletion()
        store = Gtk.ListStore(str)
        
        path_dirs = os.environ.get("PATH", "").split(os.path.pathsep)
        executables = {"r", "restart", "rt", "lg"}
        for p in path_dirs:
            if os.path.isdir(p):
                try:
                    for f in os.listdir(p):
                        executables.add(f)
                except OSError:
                    pass
        
        for exe in sorted(executables):
            store.append([exe])

        completion.set_model(store)
        completion.set_text_column(0)
        completion.set_inline_completion(True)
        completion.set_popup_completion(True)
        self.entry.set_completion(completion)

        # Buttons
        self.add_button(Gtk.STOCK_CANCEL, Gtk.ResponseType.CANCEL)
        run_btn = self.add_button("Run", Gtk.ResponseType.OK)
        run_btn.get_style_context().add_class("suggested-action")
        self.set_default_response(Gtk.ResponseType.OK)

        self.connect("key-press-event", self._on_key_press)
        self.show_all()

    def _on_key_press(self, widget, event):
        if event.keyval == Gdk.KEY_Escape:
            self.response(Gtk.ResponseType.CANCEL)

def main():
    dialog = RunDialog()
    response = dialog.run()
    if response == Gtk.ResponseType.OK:
        command = dialog.entry.get_text().strip()
        dialog.destroy()
        if command:
            if command in ("r", "restart"):
                subprocess.Popen(["cinnamon", "--replace"], start_new_session=True)
            elif command in ("rt", "reload-theme"):
                subprocess.Popen(["gdbus", "call", "--session", "--dest", "org.Cinnamon", "--object-path", "/org/Cinnamon", "--method", "org.Cinnamon.ReloadTheme"], start_new_session=True)
            elif command in ("lg", "lookingglass"):
                subprocess.Popen(["gdbus", "call", "--session", "--dest", "org.Cinnamon", "--object-path", "/org/Cinnamon", "--method", "org.Cinnamon.ToggleLookingGlass"], start_new_session=True)
            else:
                try:
                    subprocess.Popen(command, shell=True, start_new_session=True)
                except Exception as e:
                    err = Gtk.MessageDialog(
                        flags=0,
                        message_type=Gtk.MessageType.ERROR,
                        buttons=Gtk.ButtonsType.OK,
                        text="Failed to execute command:\n" + str(e)
                    )
                    err.run()
                    err.destroy()
    else:
        dialog.destroy()

if __name__ == "__main__":
    main()
