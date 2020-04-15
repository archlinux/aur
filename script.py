import os
pkglist = {
    "https://aur.archlinux.org/":['lib32-check','lib32-libevdev'],
    "https://github.com/ChristopherHX/":['mcpelauncher-linux-git','mcpelauncher-ui-git']
    }
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

