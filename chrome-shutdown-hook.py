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
    if subprocess.call('/usr/bin/pkill -15 -P 1 chrome', shell=True) == 1:
        subprocess.call('/usr/bin/pkill -15 -o chrome', shell=True) # if no parent, kill the oldest process
    return True


def chromium_clean_shutdown(*args):
    if subprocess.call('/usr/bin/pkill -15 -P 1 chromium', shell=True) == 1:
        subprocess.call('/usr/bin/pkill -15 -o chromium', shell=True)
    return True

def main():
    prog = gnome.init('chrome_clean_shutdown', '1.2.3')
    client = gnome.ui.master_client()
    if subprocess.call('hash chromium', shell=True) == 0:
        client.connect('save-yourself', chromium_clean_shutdown)
    if subprocess.call('hash google-chrome-stable', shell=True) == 0:
        client.connect('save-yourself', chrome_clean_shutdown)


main()
gtk.main()

# vim: set ts=4 sw=4 et:
