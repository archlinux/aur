#!/bin/python
import os, sys
argv = sys.argv[1:]
defpkglist = {
    "https://aur.archlinux.org/":['lib32-check','lib32-libevdev'],
    "https://github.com/ChristopherHX/":['mcpelauncher-linux-git','mcpelauncher-ui-git']
    }
pkglist = {
    "https://aur.archlinux.org/":[],
    "https://github.com/ChristopherHX/":[]
    }
if "-h" in argv or "--help" in argv:
    print("""Downloads and installs packages from ChristopherHX's fork of mcpelauncher-linux and their dependencies.
        Use -h or --help to display this message.
        If package names are provided as arguments only those packages will be downloaded.""")
    sys.exit()
if len(argv) > 0:
    for i,arg in enumerate(argv):
        for (url,pkgs) in defpkglist.items():
            if arg in pkgs:
                pkglist[url] += [arg]
                argv[i] = 0
if len(argv) == 0: 
    pkglist = defpkglist
for x in argv: 
    if x: 
        sys.exit("Unreconized package'" + str(x) + "'")

os.system('mkdir -p /tmp/mcpelauncher-hx')
os.chdir("/tmp/mcpelauncher-hx")
for (url,pkgs) in pkglist.items():
    for pkg in pkgs:
        print("====Downloading "+pkg+"====")
        os.system("git clone "+url+pkg+".git")
for (url,pkgs) in pkglist.items():
    for pkg in pkgs:
        print("====Building "+pkg+"====")
        os.chdir("/tmp/mcpelauncher-hx/"+pkg)
        os.system("makepkg --syncdeps")
        os.system("sudo pacman -U *.pkg.* --needed")
        os.chdir("/tmp/mcpelauncher-hx")

