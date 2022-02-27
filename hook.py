#!/usr/bin/env python3

import json
import re
import sys

from subprocess import run, PIPE
from glob import glob
from os import path

from HardcodeTray.const import DB_FOLDER, USERHOME

HARDCORE_TRAY_PACKAGES = ['hardcode-tray-git', 'hardcode-tray']
BLACKLIST = ['mullvad'] # Added cause got /usr/bin in it paths

CONVERSION_TOOL = 'RSVGConvert' # None if not needed
THEME = 'Papirus-Dark' # None if not needed


class Hook:
    userhome_re = r"{userhome}"

    def __init__(self, packages):
        self.__packages = packages
        self.__db = self.read_db_files()


    def read_db_files(self):
        """ Reading all package paths """

        files = glob("{0}*.json".format(path.join(DB_FOLDER, "")))
        db = {}

        for db_file in files:
            script_name = path.splitext(path.basename(db_file))[0]

            if script_name in BLACKLIST:
                continue

            with open(db_file, 'r') as db_file:
                app_path = json.load(db_file)['app_path']
                db[script_name] = [re.sub(Hook.userhome_re, USERHOME, sctipt_path) for sctipt_path in app_path]

        return db

    def get_package_paths(self, package):
        """ Reading all package paths from pacman """

        regex = r"^%s\s+" % re.escape(package)
        proc = run(
            [
                "pacman", "-Ql",
                package
            ],
            stdout=PIPE,
            stderr=PIPE,
        )

        if proc.returncode == 0:
            output = str(proc.stdout, "utf-8").split('\n')
            return [re.sub(regex, '',line) for line in output if re.match(regex, line)]
        else:
            return []

    def get_supported_scripts(self):
        """ Finding supported scripts """

        supported_scripts = [];

        for package in self.__packages:
            package_paths = self.get_package_paths(package)
            for path in package_paths:
                for script_name, script_paths in self.__db.items():
                    if path in script_paths:
                        supported_scripts.append(script_name)

        return set(supported_scripts)

    def run_hadcode_tray(self, packages = None):
        """ Hardcode tray bit execution """

        args = ["hardcode-tray"]

        if CONVERSION_TOOL != None:
            args += ["--conversion-tool", CONVERSION_TOOL]

        if THEME != None:
            args += ["--theme", THEME]

        if packages != None:
            args += ["--only", ','.join(packages)]

        args.append("--apply")

        proc = run(
            args,
            stdout=PIPE,
            stderr=PIPE,
        )

        return (proc.returncode == 0)

    def execute(self):
        """ Execution method running hardcode-tray for supported apps"""

        for package in self.__packages:
            if package in HARDCORE_TRAY_PACKAGES:
                if self.run_hadcode_tray():
                    print("All packages are updated.")
                    return True
                else:
                    print("Packages update failed.")
                    return False

        packages_for_update = self.get_supported_scripts()

        if len(packages_for_update) == 0:
            print("No packages for update has been found.")
            return True
        else:
            if self.run_hadcode_tray(packages_for_update):
                print("Packages: %s - updated." % ', '.join(packages_for_update))
                return True
            else:
                print("Packages: %s - failed." % ', '.join(packages_for_update))
                return False

        return True

input_str = sys.stdin.read()
packages = [x for x in input_str.split('\n') if x]
hook = Hook(packages)

if not hook.execute():
    sys.exit('Hook failed')
