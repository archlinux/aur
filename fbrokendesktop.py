#!/usr/bin/python3

import glob
import re
import shlex
import shutil
import subprocess

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
            break
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

def find_missing_desktop_files(desktop_dir: str):
    for df in glob.iglob('*.desktop', root_dir=desktop_dir):
        de = DesktopEntry(path.join(desktop_dir, df))
        if exc := (de.getTryExec() or de.getExec()):
            cmd = shlex.split(exc)
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

# TODO add option to respect NotShowIn and NoDisplay options
if __name__ == '__main__':
    for d in find_desktop_directories():
        for df in find_missing_desktop_files(d):
            print (df)
