#!/usr/bin/env python
# PYTHON_ARGCOMPLETE_OK
# ▓█████▄ ▓█████  ▄████▄   ██▓███   ██ ▄█▀  ▄████
# ▒██▀ ██▌▓█   ▀ ▒██▀ ▀█  ▓██░  ██▒ ██▄█▒  ██▒ ▀█▒
# ░██   █▌▒███   ▒▓█    ▄ ▓██░ ██▓▒▓███▄░ ▒██░▄▄▄░
# ░▓█▄   ▌▒▓█  ▄ ▒▓▓▄ ▄██▒▒██▄█▓▒ ▒▓██ █▄ ░▓█  ██▓
# ░▒████▓ ░▒████▒▒ ▓███▀ ░▒██▒ ░  ░▒██▒ █▄░▒▓███▀▒
#  ▒▒▓  ▒ ░░ ▒░ ░░ ░▒ ▒  ░▒▓▒░ ░  ░▒ ▒▒ ▓▒ ░▒   ▒
#  ░ ▒  ▒  ░ ░  ░  ░  ▒   ░▒ ░     ░ ░▒ ▒░  ░   ░
#  ░ ░  ░    ░   ░        ░░       ░ ░░ ░ ░ ░   ░
#    ░       ░  ░░ ░               ░  ░         ░
#  ░             ░
#
# (Copyright (c) 2025 maaru.tan \ Marat Arzymatov. All Rights Reserved.)
# https://github.com/maarutan/

# ----------------------------------------------------------------------

# this project was created for declarative interaction with packages
# this project uses
# utelites such as toml yaml
# paru, yay pacman
# popular package managers for archlinux
# this project is strictly for archlinux users.

import os
import subprocess
from time import sleep
import pathlib
import argparse
import shutil
import json
import datetime
import sys
import re

HOME = pathlib.Path.home()
CFG = ".config"
CONFIG_DIR = f"{HOME}/{CFG}/declarative_package"
CONFIG_JSON = f"{CONFIG_DIR}/config.jsonc"
HISTORY_JSON = f"{CONFIG_DIR}/.history.json"

NAME = "decpkg"
VERSION = "0.1.0"
REQUIRES = "> 3.13.2"

RESET = "\033[0m"
UNDERLINE = "\033[4m"

RED = "\033[31m"
GREEN = "\033[32m"
YELLOW = "\033[33m"
BLUE = "\033[34m"
MAGENTA = "\033[35m"
CYAN = "\033[36m"


def main():
    check_all_dirs()
    ascii_art()
    if args.aur:
        Aur_helper_soft()
    elif args.version:
        Version()
    elif args.generate:
        GenerateConfigure()
    elif args.sync:
        DecpkgSync()


def check_all_dirs():
    pathlib.Path(CFG).mkdir(parents=True, exist_ok=True)
    pathlib.Path(CONFIG_DIR).mkdir(parents=True, exist_ok=True)


class DecpkgSync:
    def __init__(self) -> None:
        self.relative = self.check_relative_sync()
        self.absolute = self.check_absolute_sync()
        self.root = self.root_status()
        self.noconfirm = self.set_noconfirm()
        self.aur_helper = self.get_aur_helper()
        self.notify = self.get_notify()
        if self.state_update():
            UpdateSystem()

        if self.relative and self.absolute:
            print(
                f"\n{YELLOW}WARN: you can't have both 'absolute_sync' and 'relative_sync' set to true"
            )
            self.sync_handler_false()

        if self.relative:
            self.relative_sync_install_pkg()
        elif self.absolute:
            self.absolute_sync_install_pkg()
        else:
            print(
                f"\n {YELLOW}~~~  select at least 1 installation\n option relative or absolute  :( \n"
            )
            self.sync_handler_true()

            if self.check_relative_sync():
                self.relative_sync_install_pkg()
            elif self.check_absolute_sync():
                self.absolute_sync_install_pkg()
            else:
                print(
                    f"\n {YELLOW}~~~  select at least 1 installation\n option relative or absolute write true is manual  :( \n"
                )
                return sys.exit(0)

            if self.notify:
                subprocess.run(["notify-send", f"deckpkg Sync"])

    def write_hystory_pkg(self, content) -> None:
        with open(HISTORY_JSON, "w") as f:
            json.dump(content, f, indent=2)

    def read_hystory_pkg(self) -> list:
        if not pathlib.Path(HISTORY_JSON).exists():
            return []
        with open(HISTORY_JSON, "r") as f:
            return json.load(f)

    def absolute_sync_install_pkg(self):
        jsons = self.read_json_without_comments()

        pacman_list = jsons["packages"][0]["pacman"]
        aurhelper_list = jsons["packages"][1]["aur"]
        aurhelper = self.aur_helper
        haven_list = []
        nohaven_list = []

        aur_haven_list = []
        aur_nohaven_list = []

        history_package = []

        for pkg in aurhelper_list:
            command = f"{aurhelper} -Q {pkg}"
            result = subprocess.run(
                command,
                shell=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
            )
            if result.returncode == 0:
                aur_haven_list.append(
                    f"{YELLOW} ~~>   {MAGENTA}AUR{CYAN} {UNDERLINE}{pkg}{RESET}{GREEN} installed"
                )
                history_package.append(pkg)
            else:
                aur_nohaven_list.append(pkg)

        for pkg in pacman_list:
            command = f"{self.root} pacman -Q {pkg}"
            result = subprocess.run(
                command,
                shell=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
            )
            if result.returncode == 0:
                haven_list.append(
                    f"{YELLOW} ~~>  {MAGENTA}PACMAN{CYAN} {UNDERLINE}{pkg}{RESET}{GREEN} installed"
                )
                history_package.append(pkg)
            else:
                nohaven_list.append(pkg)

        print("▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁\n")
        for i in haven_list:
            print(i)
            self.notify_send(f"haven pkg list: {len(haven_list)}")

        print("▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁\n")
        for i in aur_haven_list:
            print(i)
            self.notify_send(f"AUR haven pkg list: {len(aur_haven_list)}", r="9998")
        print("▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁")

        for i in nohaven_list:
            print(f" {YELLOW}PACMAN{CYAN} ~~> not found {YELLOW}{UNDERLINE}{i}{RESET}")
        print()

        for i in aur_nohaven_list:
            print(f" {MAGENTA}AUR {CYAN} ~~> not found {YELLOW}{UNDERLINE}{i}{RESET}")
        print()

        for pkg in nohaven_list:
            command = f"{self.root} pacman -S {pkg} {self.noconfirm}"
            os.system(command)

        for pkg in aur_nohaven_list:
            command = f"{aurhelper} -Sa {pkg} {self.noconfirm}"
            os.system(command)

        removed_packages = set(self.read_hystory_pkg()) - set(history_package)
        if removed_packages:
            print(f"{RED}deleted old packages :{RESET}")
            for pkg in removed_packages:
                if pkg in pacman_list:
                    command = f"{self.root} pacman -Rns {pkg} {self.noconfirm}"
                else:
                    command = f"{aurhelper} -Rns {pkg} {self.noconfirm}"
                os.system(command)
                print(f"{YELLOW}delete: {MAGENTA}{UNDERLINE}{pkg}{RESET}")

        # Write the updated history
        self.write_hystory_pkg(history_package)

    def state_update(self) -> bool:
        obj = UpdateSystem.__new__(UpdateSystem)
        state = obj.get_state_update()
        return state

    def get_notify(self) -> bool:
        obj = UpdateSystem.__new__(UpdateSystem)
        state = obj.get_notify()
        return state

    def relative_sync_install_pkg(self):
        jsons = self.read_json_without_comments()

        pacman_list = jsons["packages"][0]["pacman"]
        aurhelper_list = jsons["packages"][1]["aur"]
        aurhelper = self.aur_helper
        haven_list = []
        nohaven_list = []

        aur_haven_list = []
        aur_nohaven_list = []

        for pkg in aurhelper_list:
            command = f"{aurhelper} -Q {pkg}"
            result = subprocess.run(
                command,
                shell=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
            )
            if result.returncode == 0:
                aur_haven_list.append(
                    f"{CYAN} ~~>   {MAGENTA}AUR{CYAN} {UNDERLINE}{pkg}{RESET}{GREEN} installed"
                )
            else:
                aur_nohaven_list.append(pkg)

        for pkg in pacman_list:
            command = f"{self.root} pacman -Q {pkg}"
            result = subprocess.run(
                command,
                shell=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
            )
            if result.returncode == 0:
                haven_list.append(
                    f"{CYAN} ~~>   package {UNDERLINE}{pkg}{RESET}{GREEN} installed"
                )
            else:
                nohaven_list.append(pkg)

        for i in haven_list:
            print(i)
            self.notify_send(f"haven pkg list: {len(haven_list)}")

        sleep(0.5)

        for i in aur_haven_list:
            print(i)
            self.notify_send(f"AUR haven pkg list: {len(aur_haven_list)}", r="9998")

        for i in nohaven_list:
            print(f" {YELLOW}PACMAN{CYAN} ~~> not found {YELLOW}{UNDERLINE}{i}{RESET}")
        print()

        for i in aur_nohaven_list:
            print(f" {MAGENTA}AUR {CYAN} ~~> not found {YELLOW}{UNDERLINE}{i}{RESET}")

        print()

        for pkg in nohaven_list:
            command = f"{self.root} pacman -S {pkg} {self.noconfirm}"
            os.system(command)

        for pkg in aur_nohaven_list:
            command = f"{aurhelper} -Sa {pkg} {self.noconfirm}"
            os.system(command)

    def notify_send(self, command: str, r: str = "9999") -> None:
        """notify-send {command}"""
        if self.notify:
            subprocess.run(
                f"notify-send -t 4000 -r {r if r else ''} '{command}'", shell=True
            )

    def get_aur_helper(self) -> str:
        try:
            aur = self.read_json_without_comments()
            aur = aur.get("aur_helper", "")
            return aur
        except KeyError:
            print(f"\n{YELLOW} ~~~>  '{self.aur_helper}' not found in config.")
            return ""

    def set_noconfirm(self) -> str:
        data = self.read_json_without_comments()
        value = data.get("noconfirm", False)

        if not isinstance(value, bool):
            value = False
        return "--noconfirm" if value else ""

    def root_status(self) -> str:
        json = self.read_json_without_comments()
        json = json["use_root"]
        return f"{json if json else print('you not have root')}"

    def sync_handler_false(self):
        ask = input(
            f"{MAGENTA}Choose one to turn false\n"
            f"-- [ 1. {YELLOW}relative_sync{MAGENTA}: 'true'\n"
            f"-- [ 2. {YELLOW}absolute_sync{RESET}: {MAGENTA}'true'{RESET}\n"
            f"{CYAN}~~~~> : "
        )

        if ask.lower() in ["1", "relative"]:
            config_update = ["relative_sync", "false,"]
        elif ask.lower() in ["2", "absolute"]:
            config_update = ["absolute_sync", "false,"]

        else:
            print(f"\n{RED}   ~~~   failed to record     :( ")
            return sys.exit(0)

        if "config_update" in locals():
            self.update_configure(config_update)  # type: ignore

    def sync_handler_true(self):
        ask = input(
            f"{MAGENTA}Choose one to turn true\n"
            f"-- [ 1. {YELLOW}relative_sync{MAGENTA}: 'false'\n"
            f"-- [ 2. {YELLOW}absolute_sync{RESET}: {MAGENTA}'false'{RESET}\n"
            f"{CYAN}~~~~> : "
        )
        if ask.lower() in ["1", "relative"]:
            config_update = ["relative_sync", "true,"]
        elif ask.lower() in ["2", "absolute"]:
            config_update = ["absolute_sync", "true,"]
        else:
            print(f"\n{RED}   ~~~   failed to record     :( ")
            return sys.exit(0)

        if "config_update" in locals():
            self.update_configure(config_update)  # type: ignore

    def update_configure(self, entry):
        if not isinstance(entry, list) or len(entry) != 2:
            raise ValueError("Entry must be a list of [key, value]")

        key, value = entry

        if isinstance(value, str):
            value = value.strip(",")

            if value.lower() == "true":
                value = True
            elif value.lower() == "false":
                value = False
            else:
                try:
                    value = int(value) if "." not in value else float(value)
                except ValueError:
                    try:
                        value = json.loads(value)
                    except json.JSONDecodeError:
                        pass
        if not pathlib.Path(CONFIG_JSON).exists():
            raise FileNotFoundError(f"Config file not found: {CONFIG_JSON}")

        with open(CONFIG_JSON, "r") as f:
            lines = f.readlines()

        new_lines = []
        updated = False

        for line in lines:
            pattern = rf'^(\s*"{re.escape(key)}"\s*:\s*)(.+?)(,?)\s*$'
            match = re.match(pattern, line)
            if match:
                if isinstance(value, bool):
                    new_value = "true" if value else "false"
                else:
                    new_value = json.dumps(value)
                line = f"{match.group(1)}{new_value}{match.group(3)}\n"
                updated = True
            new_lines.append(line)

        if updated:
            with open(CONFIG_JSON, "w") as f:
                f.writelines(new_lines)
            print(f"✔ Key '{key}' updated successfully.")
        else:
            print(f"⚠ Key '{key}' not found. No changes made.")

    def check_relative_sync(self) -> bool:
        data = self.read_json_without_comments()
        value = data.get("relative_sync", False)
        if not isinstance(value, bool):
            value = False

        return value

    def check_absolute_sync(self):
        data = self.read_json_without_comments()
        value = data.get("absolute_sync", False)
        if not isinstance(value, bool):
            value = False

        return value

    def read_json_without_comments(self) -> dict:
        with open(CONFIG_JSON, "r") as f:
            jsonc_content = f.read()
            jsonc_content = re.sub(r"//.*", "", jsonc_content)
            jsonc_content = re.sub(r",\s*(]|})", r"\1", jsonc_content)
            data = json.loads(jsonc_content)
            return data


def ascii_art() -> str:
    obj = DecpkgSync.__new__(DecpkgSync)
    if pathlib.Path(CONFIG_JSON).exists():
        data = obj.read_json_without_comments()
        value = data.get("logo_ascii", False)
        if not isinstance(value, bool):
            value = False
        if value:
            logo = """
    ▓█████▄ ▓█████  ▄████▄   ██▓███   ██ ▄█▀  ▄████
    ▒██▀ ██▌▓█   ▀ ▒██▀ ▀█  ▓██░  ██▒ ██▄█▒  ██▒ ▀█▒
    ░██   █▌▒███   ▒▓█    ▄ ▓██░ ██▓▒▓███▄░ ▒██░▄▄▄░
    ░▓█▄   ▌▒▓█  ▄ ▒▓▓▄ ▄██▒▒██▄█▓▒ ▒▓██ █▄ ░▓█  ██▓
    ░▒████▓ ░▒████▒▒ ▓███▀ ░▒██▒ ░  ░▒██▒ █▄░▒▓███▀▒
     ▒▒▓  ▒ ░░ ▒░ ░░ ░▒ ▒  ░▒▓▒░ ░  ░▒ ▒▒ ▓▒ ░▒   ▒
     ░ ▒  ▒  ░ ░  ░  ░  ▒   ░▒ ░     ░ ░▒ ▒░  ░   ░
     ░ ░  ░    ░   ░        ░░       ░ ░░ ░ ░ ░   ░
       ░       ░  ░░ ░               ░  ░         ░
     ░             ░
                """
            return f"{print(logo)}"
        else:
            return ""
    return ""


class UpdateSystem:
    def __init__(self) -> None:
        self.notify = self.get_notify()
        self.aur_helper = self.get_aur_helper()
        self.noconfirm = self.get_noconfirm()
        self.state_update = self.get_state_update()

        self.state_pacman = self.get_state_pacman_update()
        self.state_aur = self.get_state_aur_update()
        self.state_flatpak = self.get_state_flatpak_update()

        self.status_counter = self.get_state_update_counter()
        self.main()

    def get_notify(self):
        data = self.get_read_json_without_comments()
        value = data.get("notify", False)
        if not isinstance(value, bool):
            value = False
        return value

    def get_state_update(self) -> bool:
        data = self.get_read_json_without_comments()
        value = data.get("update_pkg_with_install", False)
        if not isinstance(value, bool):
            value = False
        return value

    def get_state_update_counter(self) -> bool:
        data = self.get_read_json_without_comments()
        value = data.get("update_counter", False)
        if not isinstance(value, bool):
            value = False
        return value

    def get_state_flatpak_update(self) -> bool:
        data = self.get_read_json_without_comments()
        value = data.get("update_flatpak", False)
        if not isinstance(value, bool):
            value = False
        return value

    def get_state_aur_update(self) -> bool:
        data = self.get_read_json_without_comments()
        value = data.get("update_aur", False)
        if not isinstance(value, bool):
            value = False
        return value

    def get_state_pacman_update(self) -> bool:
        data = self.get_read_json_without_comments()
        value = data.get("update_pacman", False)
        if not isinstance(value, bool):
            value = False
        return value

    def get_read_json_without_comments(self) -> dict:
        obj = DecpkgSync.__new__(DecpkgSync)
        aur = obj.read_json_without_comments()
        return aur

    def get_aur_helper(self) -> str:
        obj = DecpkgSync.__new__(DecpkgSync)
        aur = obj.get_aur_helper()
        return f"{aur}"

    def get_noconfirm(self) -> str:
        obj = DecpkgSync.__new__(DecpkgSync)
        noconfirm = obj.set_noconfirm()
        return f"{noconfirm}"

    def main(self) -> None:
        self.counter_ui()
        self.start_update()

    def shell(self, command) -> str:
        return subprocess.getoutput(command)

    def ending(self):
        print(
            f"{RESET}▁" * 40 + f"{RESET}\n\n"
            f"{YELLOW}\n === Done ==="
            f"{RESET}\n\n" + "▁" * 40 + f"{RESET}\n\n"
        )
        sleep(5)

    def start_update(self):
        if self.state_update:
            if self.notify:
                self.shell(f"notify-send ' Updating !!! \nSudo password needed'")

            if self.state_pacman:
                os.system(f"sudo pacman -Syu {self.noconfirm}")

            elif self.state_aur:
                self.update_wtih_aur_helper()

            elif self.state_flatpak:
                self.flatpak_update()

            self.ending()

            if self.notify:
                subprocess.run(["notify-send", f"Update Ending"])
        else:
            return

    def update_wtih_aur_helper(self) -> int | None:
        if not self.shell(f"command -v {self.aur_helper}"):
            print(f"{self.aur_helper} not found")
            return
        return os.system(f"{self.aur_helper} -Syu {self.noconfirm}")

    def flatpak_update(self) -> int | None:
        if not self.shell("command -v flatpak"):
            print("flatpak not found")
            return
        return os.system("flatpak update")

    def counter_ui(self):
        if self.status_counter:
            output = []
            if self.state_pacman:
                output.append(
                    f"{YELLOW}~~>   󰮯  :  Pacman   ===     {self.check_pacman()}{RESET}"
                )
            if bool(self.state_aur):
                output.append(
                    f"{BLUE}~~>     :  {self.aur_helper}      ===     {self.check_aur_helper()}{RESET}"
                )
            if self.state_flatpak:
                output.append(
                    f"{CYAN}~~>     :  Flatpak  ===     {self.check_flatpak()}{RESET}"
                )

            output.append(
                f"{RESET}▁" * 40
                + f"\n\n {GREEN}=== Updates : {self.sum_updates()} ==={RESET}\n"
            )
            print("\n".join(output))

            if self.notify:
                subprocess.run(["notify-send", f"Updates : {self.sum_updates()}"])

    def get_check_pacman(self) -> int:
        if not self.shell("command -v checkupdates"):
            return 0

        attempt = 0
        while attempt < 5:
            result = self.shell("checkupdates | wc -l")
            if "ERROR: Cannot fetch updates" in result or result.strip() == "":
                attempt += 1
            else:
                return int(result) if result.strip().isdigit() else 0

        print(YELLOW, f" Pacman could not update", RESET)
        return 0

    def check_pacman(self) -> int:
        return self.get_check_pacman()

    def check_aur_helper(self) -> int:
        if not self.shell(f"command -v {self.aur_helper}"):
            return 0
        updates = self.shell(f"{self.aur_helper} -Qua | wc -l")
        return int(updates) if updates.strip().isdigit() else 0

    def check_flatpak(self) -> int:
        if not self.shell("command -v flatpak"):
            return 0
        updates = self.shell("flatpak remote-ls --updates | wc -l")
        return int(updates) if updates.strip().isdigit() else 0

    def sum_updates(self):
        total = 0
        if self.state_pacman:
            total += self.check_pacman()
        if self.state_aur:
            total += self.check_aur_helper()
        if self.state_flatpak:
            total += self.check_flatpak()

        if self.get_notify:
            self.shell(f"notify-send ' Updates : {total}'")

        return total


class GenerateConfigure:
    def __init__(self) -> None:
        if not pathlib.Path(CONFIG_JSON).exists():
            self.write_config()
            print(f"{YELLOW}configure file: {CONFIG_JSON} {MAGENTA}created :D")
        else:
            self.handle_existing_config()

    def config_here(self):
        default_config = """
//  ▓█████▄ ▓█████  ▄████▄   ██▓███   ██ ▄█▀  ▄████
//  ▒██▀ ██▌▓█   ▀ ▒██▀ ▀█  ▓██░  ██▒ ██▄█▒  ██▒ ▀█▒
//  ░██   █▌▒███   ▒▓█    ▄ ▓██░ ██▓▒▓███▄░ ▒██░▄▄▄░
//  ░▓█▄   ▌▒▓█  ▄ ▒▓▓▄ ▄██▒▒██▄█▓▒ ▒▓██ █▄ ░▓█  ██▓
//  ░▒████▓ ░▒████▒▒ ▓███▀ ░▒██▒ ░  ░▒██▒ █▄░▒▓███▀▒
//   ▒▒▓  ▒ ░░ ▒░ ░░ ░▒ ▒  ░▒▓▒░ ░  ░▒ ▒▒ ▓▒ ░▒   ▒
//   ░ ▒  ▒  ░ ░  ░  ░  ▒   ░▒ ░     ░ ░▒ ▒░  ░   ░
//   ░ ░  ░    ░   ░        ░░       ░ ░░ ░ ░ ░   ░
//     ░       ░  ░░ ░               ░  ░         ░
//   ░             ░
//
//  (Copyright (c) 2025 maaru.tan \\ Marat Arzymatov. All Rights Reserved.)
//  https://github.com/maarutan/decpkg 
//
//  ------------------------------------------------
{
  // Startup
  "logo_ascii"   : true , // there will be a logo at the beginning. 
  "absolute_sync": true , // absolute installation where you clearly specify what to remove and what to install if a package is not in the list, then it will be removed. 
  "relative_sync": false, // Relative package installation it you can determine which packages to install but not remove, If you installed through the carrier option you will have to uninstall manually. 
  "noconfirm"    : true , // If that's true, then the packets will settle without confirmation.  

  // Updates package
  "update_pkg_with_install": false, // You can upgrade your system before you start installing your packages.
  "update_counter"         : false, // If you choose to update the system before installation you can see the number of updates. 

  "update_pacman" : true,  // allow pacman to be updated first  
  "update_aur"    : true,  // allow Arch User Rep to be updated first 
  "update_flatpak": false, // allow flatpak to be updated first

  // set root
  "use_root"  : "sudo",  // To install packages you need to have super user rights in order to install them. 

  // aur 
  "aur_helper": "paru",  // Better aur helper utils.

  // other
  "notify"    : true,   // If you want to be notified.
  "packages": [
    {
      "pacman": [
        // "git",          // Popular utelita for version control.
        // "neovim"        // Best text editor.
        ]
    },
    {
      "aur": [
        //  "peaclock",    // Utelita for look clock.
        //  "unimatrix"    // Huckers background.
      ]
    }
  ]
}
"""
        return default_config

    def write_config(self):
        config_path = pathlib.Path(CONFIG_JSON)

        if config_path.exists():
            timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
            backup_path = config_path.with_suffix(f".bak.{timestamp}")
            shutil.copy2(config_path, backup_path)
            print(f"{CYAN}Backup created at: {backup_path}")

        with open(config_path, "w") as f:
            f.write(self.config_here())

    def handle_existing_config(self):
        ask = (
            input(
                f"{YELLOW}configure file: {CONFIG_JSON} {MAGENTA}now exists\n"
                f"{CYAN}~~~ Do you want to replace? [ ( y/N ) ]\n ~> : "
            )
            .strip()
            .lower()
        )

        match ask:
            case "y":
                self.write_config()
                print(f"{YELLOW}configure file replaced successfully!")
            case "n" | "":
                print(f"\n {MAGENTA}   ~~ good ")
            case _:
                print(f"\n {RED}~~~~~~   I don't know what the problem is :(")


class Aur_helper_soft:
    def __init__(self) -> None:
        ask = input(
            f"   \n"
            f"   {YELLOW}~~~~> [ 1. | `paru` |{RESET}"
            f"   \n"
            f"   {YELLOW}~~~~> [ 2. | `yay ` |{RESET}"
            f"   \n"
            f"   {MAGENTA}|~~> : "
        )
        if ask.lower() in {"paru", "1"}:
            self.manual_paru()
        elif ask.lower() in ["yay", "2"]:
            self.manual_yay()
        else:
            print("\n        ~~ sory only `paru` and `yay`    :(  ")

    def manual_paru(self):
        if not shutil.which("paru"):
            ask = input(
                f"\n{MAGENTA}|------------------------------------|\n"
                f"{MAGENTA}| manual install {YELLOW}{UNDERLINE}`paru`{RESET}{GREEN} with deckpkg |\n"
                f"{MAGENTA}| ~~~~> {UNDERLINE}( Y/n ){RESET} ]--------------------|\n"
                f"{CYAN}| ~> : "
            )
            if ask.lower() in ["y", ""]:
                if shutil.which("git"):
                    try:
                        print(f"{CYAN}Cloning paru from AUR...{RESET}")
                        subprocess.check_call(
                            [
                                "git",
                                "clone",
                                "https://aur.archlinux.org/paru.git",
                                "/tmp/paru/",
                            ]
                        )
                        print(f"{CYAN}Building package...{RESET}")
                        subprocess.check_call(["makepkg", "-si"], cwd="/tmp/paru/")
                    except:
                        print(f"{RED}Error: Installation failed!{RESET}")
                else:
                    print(
                        f"{RED}Error: git not found, please install git first!{RESET}"
                    )
        else:
            print(f"{GREEN}paru is already installed.{RESET}")

    def manual_yay(self):
        if not shutil.which("yay"):
            ask = input(
                f"\n{MAGENTA}|-----------------------------------|\n"
                f"{MAGENTA}| manual install {YELLOW}{UNDERLINE}`yay`{RESET}{GREEN} with deckpkg |\n"
                f"{MAGENTA}| ~~~~> {UNDERLINE}( Y/n ){RESET} ]-------------------|\n"
                f"{CYAN}| ~> : "
            )
            if ask.lower() in ["y", ""]:
                if shutil.which("git"):
                    try:
                        print(f"{CYAN}Cloning yay from AUR...{RESET}")
                        subprocess.check_call(
                            [
                                "git",
                                "clone",
                                "https://aur.archlinux.org/yay.git",
                                "/tmp/yay/",
                            ]
                        )
                        print(f"{CYAN}Building package...{RESET}")
                        subprocess.check_call(["makepkg", "-si"], cwd="/tmp/yay/")
                    except subprocess.CalledProcessError as e:
                        print(f"{RED}Error: Installation failed!{RESET}")
                else:
                    print(
                        f"{RED}Error: git not found, please install git first!{RESET}"
                    )
        else:
            print(f"{GREEN}yay is already installed.{RESET}")


class Version:
    def __init__(self) -> None:
        ask = input(
            f"   \n"
            + (f"\n   {YELLOW}~~~~> [ 0. | `decpkg` |{RESET} ")
            + (
                f"\n   {YELLOW}~~~~> [ 1. | `pacman` |{RESET} "
                if shutil.which("pacman")
                else ""
            )
            + (
                f"\n   {YELLOW}~~~~> [ 2. |  `paru`  |{RESET} "
                if shutil.which("paru")
                else ""
            )
            + (
                f"\n   {YELLOW}~~~~> [ 3. |  `yay`  |{RESET} "
                if shutil.which("yay")
                else ""
            )
            + f"\n   {MAGENTA}|~~> : "
        )

        if ask.lower() in {"decpkg", "0"}:
            self.decpkg_version()
        elif ask.lower() in {"pacman", "1"} and shutil.which("pacman"):
            self.pacman_version()
        elif ask.lower() in {"paru", "2"} and shutil.which("paru"):
            self.paru_version()
        elif ask.lower() in {"yay", "3"} and shutil.which("yay"):
            self.yay_version()
        else:
            print(
                "\n        ~~ Sorry, only `paru`, `yay`, and `pacman` are available. :( "
            )

    def decpkg_version(self):
        print(
            """
    ┌┬┐┌─┐┌─┐┌─┐┬┌─┌─┐
     ││├┤ │  ├─┘├┴┐│ ┬
    ─┴┘└─┘└─┘┴  ┴ ┴└─┘
▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    """
        )
        print(f"  ~~~>  Name: {NAME}")
        print(f"  ~~~>  Version: {VERSION}")
        print(f"  ~~~>  Requires Python: {REQUIRES} ")

    def pacman_version(self, V: bool = True):
        subprocess.check_call(["pacman", "-V"]) if V else subprocess.check_call(
            ["pacman", "-v"]
        )

    def paru_version(self):
        if shutil.which("paru"):
            print("""
    ┌─┐┌─┐┬─┐┬ ┬
    ├─┘├─┤├┬┘│ │
    ┴  ┴ ┴┴└─└─┘
▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
            """)
            subprocess.check_call(["paru", "-V"])
        else:
            print(f"\n{RED}Error: {UNDERLINE}`paru`{RESET} not found")

    def yay_version(self):
        if shutil.which("yay"):
            print("""
    ┬ ┬┌─┐┬ ┬
    └┬┘├─┤└┬┘
     ┴ ┴ ┴ ┴
▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
            """)
            subprocess.check_call(["yay", "-V"])
        else:
            print(f"\n{RED}Error: {UNDERLINE}`yay`{RESET} not found")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="declarative package manager")
    parser.add_argument("-s", "--sync", action="store_true", help="Sync `deckpkg`")
    parser.add_argument(
        "-v", "--version", action="store_true", help="Version `deckpkg`"
    )
    parser.add_argument(
        "-g", "--generate", action="store_true", help="Generate config `deckpkg`"
    )
    parser.add_argument(
        "-a",
        "--aur",
        action="store_true",
        help="paru or yay for `AUR` in `deckpkg`",
    )
    args, unknown = parser.parse_known_args()

    try:
        main()
    except KeyboardInterrupt:
        print(f"\n\n {MAGENTA}     ~~ cancel ^^")
