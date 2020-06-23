#!/usr/bin/python

import os, sys

try:
    import easygui as eg
    dialogs = True
except:
    dialogs = False

uninstaller = '/opt/xdroid/remove-xdroid-launcher'

def install():
    sys.exit(os.system('tar -xzvf /opt/xdroid-installer/xdroid.tar.gz -C /tmp \
                        && /tmp/xDroidInstall-x86_64/install.sh'))

if os.getuid() == 0:
    err = "Don't run this installer as root!"
    if dialogs:
        eg.msgbox(err, "Error!")
        sys.exit(1)
    else:
        raise OSError(err)

if os.path.isfile(uninstaller):

    if dialogs:
        option = eg.choicebox("Do you want to reinstall or uninstall xDroid?", "xDroid Installer",
                            choices=["Reinstall", "Uninstall"])
    else:
        option = "Uninstall"

    if option == "Reinstall":
        install()
    elif option == "Uninstall":
        os.system(uninstaller)

else:
    install()