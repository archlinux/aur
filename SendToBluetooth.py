#!/usr/bin/env python3

import os, gi

try:
    gi.require_version('Nautilus', '3.0')
except:
    exit(1)

from gi.repository import Nautilus, GObject
import subprocess

class ColumnExtension(GObject.GObject, Nautilus.MenuProvider):
    def __init__(self):
        pass

    def send_action(self, menu, files):
        paths = []
        for file in files:
            paths.append(file.get_uri())
        subprocess.Popen(['/usr/bin/bluetooth-sendto'] + paths )

    def get_file_items(self, window, files):
        if len(files) < 1:
            return
        
        for file in files:
            if file.is_directory():
                return

        item = Nautilus.MenuItem(
            name="SendToBluetooth::MenuItem",
            label="Send to bluetooth device",
            tip="Send to bluetooth device"
        )
        item.connect('activate', self.send_action, files)
        
        return [item]

