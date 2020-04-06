#!/bin/python3
import json
import urllib.request
import subprocess

# get info
json = json.loads(urllib.request.urlopen("https://dolphin-emu.org/update/latest/beta/").read())

rev = json['shortrev'].split("-")
hash = json['hash']
hashshort = hash[:10]

# update pkgbuild
with open("PKGBUILD", "r") as file:
	pkgbuild = file.readlines()

pkgbuild[7] = "pkgver=" + rev[0] + ".r" + rev[1] + "." + hashshort + "\n"

pkgbuild[23] = "source=('dolphin-emu::git+https://github.com/dolphin-emu/dolphin.git#commit=" + hash + "')" + "\n"

with open("PKGBUILD", "w") as file:
	file.writelines(pkgbuild)

# update srcinfo
# makepkg --printsrcinfo > .SRCINFO
with open(".SRCINFO", "w") as file:
	file.write(subprocess.check_output(["makepkg", "--printsrcinfo"]).decode("utf-8"))
