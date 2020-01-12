#!/usr/bin/env python3

"""Run nvim inside gnome-terminal"""

import sys
import os
import subprocess
import dbus
from time import time


APP_ID = 'org.neovim'
CLASS = 'neovim'
NAME = 'Neovim'

def find_terminal_server():
    candidates = list(filter(os.path.exists, \
                            ('/usr/lib/gnome-terminal/gnome-terminal-server', # arch et al
                             '/usr/lib/gnome-terminal-server',
                             '/usr/libexec/gnome-terminal-server')))          # fedora 22
    if len(candidates) > 0:
        return candidates[0]
    else:
        print("nvim-wrapper needs gnome-terminal-server, but it wasn't found.")
        sys.exit()

SERVER_CMD = [
    find_terminal_server(),
    '--app-id', APP_ID,
    '--class', CLASS,
    '--name', NAME,
]
TERM_CMD = [
    'gnome-terminal',
    '--app-id', APP_ID,
    '--class', CLASS,
    '--name', NAME,
    '--hide-menubar',
    '-x',
    'nvim',
]
GTERM_PASSTHROUGH_OPTIONS = [
    '--full-screen',
    '--maximize',
    '--profile',
    '--geometry',
    '--working-directory',
    '--display'
]

def processArgv():
    argv = sys.argv[1:]
    gtermOptions = []
    nvimOptions = []

    for arg in argv:
        argParts = arg.split('=', 1)
        if argParts[0] in GTERM_PASSTHROUGH_OPTIONS:
            gtermOptions.append(arg)
        elif arg=='-f':
            gtermOptions.append('--wait')
        else:
            nvimOptions.append(arg)

    # launch the wrapper in the current directory by default
    if not any([o.startswith('--working-directory') for o in gtermOptions]):
        gtermOptions.append('--working-directory='+os.path.abspath(os.curdir))

    # enable title by default
    nvimOptions.append("+set title")

    # enable 24-bit color
    nvimOptions.append("+set termguicolors")

    return {
        'gterm': gtermOptions,
        'nvim': nvimOptions
    }

def main():
    """Run nvim inside gnome-terminal"""
    session_bus = dbus.SessionBus()

    # launch the terminal server with a custom app-id
    # and window class (so the .desktop file gets associated)
    if not session_bus.name_has_owner(APP_ID):
        subprocess.Popen(SERVER_CMD)

    # wait until the name is registered, or 2 seconds pass (when launching from
    # cold cache it might take more time)
    timeout = time() + 2
    while not session_bus.name_has_owner(APP_ID) and time() <= timeout:
        pass
    # launch nvim in a gnome-terminal instance
    if session_bus.name_has_owner(APP_ID):
        options = processArgv()
        cmd = [] + TERM_CMD[:-2] + options['gterm'] + TERM_CMD[-2:] + options['nvim']
        with open(os.devnull, 'wb') as fnull:
            p=subprocess.Popen(cmd,
                             stdout=fnull,
                             stderr=fnull)
        if '--wait' in options['gterm']:
            p.wait()

if __name__ == '__main__':
    main()
