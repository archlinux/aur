#!/usr/bin/python3

import argparse
import glob
import re
import shlex
import shutil
import subprocess
import sys

from os import path

from xdg import BaseDirectory
from xdg.DesktopEntry import DesktopEntry

# allow matching empty envs with .*
env_re = re.compile(r'\w+=.*')

# installed gapps
gapps = []

def is_valid_cmd(cmd_args: list[str]):
    if cmd_args[0] == 'exec':
        return is_valid_cmd(cmd_args[1:])
    if cmd_args[0] == 'env':
        return is_valid_cmd(cmd_args[1:])

    for tok in cmd_args:
        # ignore all attempts to set environment variables
        if not env_re.match(tok):
            if shutil.which(tok):
                return True
    return False

def is_valid_gapp_cmd(cmd_args: list[str]):
    if is_gapp_cmd(cmd_args):
        app_id = cmd_args[2]
        if not gapps:
            try:
                output = subprocess.check_output(['gapplication', 'list-apps'], text=True)
                gapps.extend((output or '').split('\n'))
            except subprocess.CalledProcessError:
                gapps.append('')
        return app_id in gapps
    return False

def is_gapp_cmd(cmd_args: list[str]):
    return len(cmd_args) > 2 and cmd_args[0] == 'gapplication' and cmd_args[1] == 'launch'

def find_missing_desktop_files(desktop_dir: str, show_all: bool):
    for df in glob.iglob('*.desktop', root_dir=desktop_dir):
        file_path = path.join(desktop_dir, df)
        de = DesktopEntry(file_path)
        if show_all or not de.getNoDisplay():
            if exc := (de.getTryExec() or de.getExec()):
                try:
                    cmd = shlex.split(exc)
                except ValueError as err:
                    print (f"Error parsing '{file_path}': {err}", file=sys.stderr)
                    continue
                if is_gapp_cmd(cmd):
                    if not is_valid_gapp_cmd(cmd):
                        yield shlex.quote(de.getFileName())
                elif not is_valid_cmd(cmd):
                    yield shlex.quote(de.getFileName())

def find_desktop_directories():
    """
    https://wiki.archlinux.org/title/desktop_entries#Modify_desktop_files
    https://wiki.archlinux.org/title/XDG_Autostart#Directories
    """
    yield from BaseDirectory.load_data_paths('applications')
    yield from BaseDirectory.load_config_paths('autostart')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='Find desktop entries files with broken executables'
    )
    parser.add_argument('-a', '--all', 
        action='store_true', 
        help='show all desktop entries regardless of "NoDisplay" value', 
        default=False
    )
    args = parser.parse_args()
    for d in find_desktop_directories():
        for df in find_missing_desktop_files(d, args.all):
            print (df)
