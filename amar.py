#!/usr/bin/python
#Created by Baoréla alias..... SOON
#Old parts of code Fredo, Rhylx, Francky, hRF, Pepito

import sys
import os
import gi
from threading import Thread
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk
from gi.overrides import GLib

class Handler:
    def onDestroy(self, *args):
        Gtk.main_quit()

    def onClickActive(self, button):
        buttonactive.set_sensitive(False)  # Now the button is greyed, working :)
        buttonactive.set_label('ATTENDEZ SVP')  # Sure the button text change to this
        thread = Thread(target=pressActive)
        thread.daemon = True
        thread.start()


amarpath = "/usr/share/amar/amar.glade"
builder = Gtk.Builder()
builder.add_from_file(amarpath)
builder.connect_signals(Handler())

os.system("xrdb -load /dev/null")

pacmanfichier = "/etc/pacman.conf"
buttonactive = builder.get_object("buttonActive")

try:
    etatamar = 0
    searchfile = open(pacmanfichier, "r")
    for line in searchfile:
        if "amar.conf" in line:
            etatamar = 1
    searchfile.close()

except OSError:
    print("pacman.conf non acessible, donnez le chemin vers votre fichier")
    sys.exit(1)

if etatamar == 1:
    buttonactive.set_label('DESACTIVER')
else:
    buttonactive.set_label('ACTIVER')


configamar = "\n#Do not disable AMAR manually if you use the app\nInclude = /etc/pacman.d/amar.conf\n"

def errorButtons():

    print("bad")

def success1():
    buttonactive.set_sensitive(True)
    buttonactive.set_label('DESACTIVER')

def success2():
    buttonactive.set_sensitive(True)
    buttonactive.set_label('ACTIVER')

def pressActive():
    global etatamar
    if etatamar == 0:
        try:
            with open(pacmanfichier, "a") as ecrire:
                ecrire.write(configamar)
                ecrire.close()
                os.system("pacman -Syy")
                etatamar = 1
                ecrire.close()
                GLib.idle_add(success1)
        except OSError:
             errorButtons()
    else:
        try:
            with open((pacmanfichier), "r") as f:
                lines = f.readlines()
                lines.remove("#Do not disable AMAR manually if you use the app\n")
                lines.remove("Include = /etc/pacman.d/amar.conf\n")
            with open((pacmanfichier), "w") as new_f:
                for line in lines:
                    new_f.write(line)
            os.system ("pacman -Syy")
            etatamar = 0
            f.close()
            new_f.close()
            GLib.idle_add(success2)
        except OSError:
            errorButtons()



print(etatamar)
window = builder.get_object("mainWindow")
window.show_all()

Gtk.main()
