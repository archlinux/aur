#!/usr/bin/env python2

# Author: Michael Goehler
# Description: Gently shutdown Chrome on logout from Gnome Shell.
#
# Based on a script by Seamus Phelan
# http://unix.stackexchange.com/questions/49333/

import sys
import subprocess
import datetime
import gnome
import gnome.ui
import gtk

def chrome_clean_shutdown(*args):
    subprocess.call("/usr/bin/pkill -15 -P 1 chrome", shell=True)
    return True

def main():
    prog = gnome.init("chrome_clean_shutdown", "1.1")
    client = gnome.ui.master_client()
    client.connect("save-yourself", chrome_clean_shutdown)

main()
gtk.main()

# vim: set ts=4 sw=4 et:
