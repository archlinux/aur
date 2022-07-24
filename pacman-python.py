#!/usr/bin/python3

import sys
import requests
import os
import platform

ARCH = platform.machine()

NAMES = [
    "$",
    "$-git",
    "python-$",
    "python-$-git"
]

URLS = {
        "community": f"https://archlinux.org/packages/community/{ARCH}/$/",
        "core":      f"https://archlinux.org/packages/core/{ARCH}/$/",
        "extra":     f"https://archlinux.org/packages/extra/{ARCH}/$/",
        "aur":       f"https://aur.archlinux.org/packages/$",
        "pip":       f"https://pypi.org/project/$/"
}

if len(sys.argv) == 1:
    print(f"Usage: {sys.argv[0]} [-r] <package/requirements-file>")
    exit(1)

pkgs = [sys.argv[1]]

if sys.argv[1] == "-r":
    with open(sys.argv[2], 'r') as r:
        pkgs = r.readlines()

for pkg in pkgs:
    for repo in URLS:
        for name in NAMES:
            pkg = pkg.replace('\n', '')
            name = name.replace("$", pkg)
            url = URLS[repo].replace("$", name)
            req = requests.get(url)
            if req.status_code == 200:
                if len(pkgs) == 1:
                    print(f"{repo}/{name}")
                else:
                    print(f"{pkg}: {repo}/{name}")

