#!/usr/bin/python

import os, sys

try:
    import easygui as eg
    dialogs = True
except ModuleNotFoundError:
    dialogs = False

uninstaller = '/opt/xdroid/remove-xdroid-launcher'
reinstall = 'Upgrade/Reinstall'
uninstall = 'Uninstall'

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
        option = eg.choicebox("You have xDroid installed already. What do you want to do next?", 
                            title="xDroid Installer",
                            choices=[reinstall, uninstall])
    else:
        option = uninstall

    if option == reinstall:
        install()
    elif option == uninstall:
        os.system(uninstaller)

else:
    install()