#!/usr/bin/python3

import argparse
import glob
import re
import shlex
import shutil
import subprocess
import sys

from typing import cast
from os import path

from xdg import BaseDirectory
from xdg.DesktopEntry import DesktopEntry

# allow matching empty envs with .*
env_re = re.compile(r"\w+=.*")

# installed gapps
gapps = []


def strip_command_parent(cmd_args: list[str], is_first: bool = True) -> list[str]:
    while cmd_args and env_re.match(cmd_args[0]):
        cmd_args = cmd_args[1:]
    try:
        cmd = cmd_args[0]
    except IndexError:
        cmd = ""
    if is_first and cmd == "exec":
        return strip_command_parent(cmd_args[1:], is_first=False)
    if cmd == "env" or cmd.endswith("/env"):
        return strip_command_parent(cmd_args[1:], is_first=False)
    return cmd_args


def is_valid_gapp_cmd(cmd: str):
    app_id = cmd
    if not gapps:
        try:
            output = subprocess.check_output(["gapplication", "list-apps"], text=True)
            gapps.extend((output or "").split("\n"))
        except subprocess.CalledProcessError:
            gapps.append("")
    return app_id in gapps


def is_gapp_cmd(cmd_args: list[str]):
    return (
        len(cmd_args) > 2
        and (cmd_args[0] == "gapplication" or cmd_args[0].endswith("/gapplication"))
        and cmd_args[1] == "launch"
    )


def find_missing_desktop_files(desktop_dir: str, show_all: bool):
    for df in glob.iglob("*.desktop", root_dir=desktop_dir):
        file_path = path.join(desktop_dir, df)
        de = DesktopEntry(file_path)
        if show_all or not de.getNoDisplay():
            if exc := cast(str | None, (de.getExec() or de.getTryExec())):
                try:
                    cmd = shlex.split(exc)
                    cmd = strip_command_parent(cmd)
                    if is_gapp_cmd(cmd):
                        if not is_valid_gapp_cmd(cmd[2]):
                            yield shlex.quote(de.getFileName())
                    elif not (cmd and shutil.which(cmd[0])):
                        yield shlex.quote(de.getFileName())
                except ValueError as err:
                    print(f"Error parsing '{file_path}': {err}", file=sys.stderr)


def find_desktop_directories():
    """
    https://wiki.archlinux.org/title/desktop_entries#Modify_desktop_files
    https://wiki.archlinux.org/title/XDG_Autostart#Directories
    """
    yield from BaseDirectory.load_data_paths("applications")
    yield from BaseDirectory.load_config_paths("autostart")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Find desktop entries files with broken executables"
    )
    parser.add_argument(
        "-a",
        "--all",
        action="store_true",
        help='show all desktop entries regardless of "NoDisplay" value',
        default=False,
    )
    args = parser.parse_args()
    for d in find_desktop_directories():
        for df in find_missing_desktop_files(d, args.all):
            print(df)
