#!/usr/bin/env python3

import os
import subprocess
from urllib.parse import unquote, urlparse

import gi
from gi.repository import GObject, Nautilus

gi.require_version("Gtk", "4.0")


def uri_to_path(file):
    p = urlparse(file.get_activation_uri())
    return os.path.abspath(os.path.join(p.netloc, unquote(p.path)))


class SendToBluetoothExtension(GObject.GObject, Nautilus.MenuProvider):
    def __init__(self):
        GObject.Object.__init__(self)

    def send_action(self, menu, files):
        paths = []
        for file in files:
            paths.append(uri_to_path(file))
        subprocess.Popen(["/usr/bin/blueman-sendto"] + paths)

    def get_file_items(self, *args):
        files = args[-1]
        if len(files) < 1:
            return

        for file in files:
            if file.is_directory():
                return

        item = Nautilus.MenuItem(
            name="SendToBluetooth::MenuItem",
            label="Send to bluetooth device",
            tip="Send to bluetooth device",
        )
        item.connect("activate", self.send_action, files)

        return [item]
