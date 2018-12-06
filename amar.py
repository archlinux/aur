#!/usr/bin/python
#Created by Baoréla alias..... SOON
#Old parts of code Fredo, Rhylx, Francky, hRF, Pepito

import sys
import os
import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

class Handler:
    def onDestroy(self, *args):
        Gtk.main_quit()

    def onClickActive(self, button):
        pressActive()
        Gtk.main()
    def onClickDesactive(self, button):
        pressDesactive()
        Gtk.main()

amarpath = "/usr/share/amar/amar.glade"
builder = Gtk.Builder()
builder.add_from_file(amarpath)
builder.connect_signals(Handler())

os.system("xrdb -load /dev/null")

pacmanfichier = "/etc/pacman.conf"
amarfinalstate = builder.get_object("amarfinalstate")
buttonactive = builder.get_object("buttonActive")
buttondesactive = builder.get_object("buttonDesactive")

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

configamar = "\n#Do not disable AMAR manually if you use the app\nInclude = /etc/pacman.d/amar.conf\n"

def errorButtons():

    dialog = Gtk.MessageDialog(None, 0, Gtk.MessageType.ERROR, Gtk.ButtonsType.OK, "ERREUR")
    dialog.format_secondary_text("Fichier pacman.conf non accessible en écriture\nVérifiez vos droit et relancer"
                                       " le script\nVérifier aussi que vous ne faite une mise à jours en même temps")
    dialog.run()
    dialog.destroy()

def pressActive():
    buttonactive.set_sensitive(False)
    buttondesactive.set_sensitive(True)
    try:
        with open(pacmanfichier, "a") as ecrire:
            ecrire.write(configamar)
            ecrire.close()
            os.system("pacman -Syy")
            amarfinalstate.set_markup('<span foreground="blue" face="sans">ACTIF</span>')
            etatamar = 1
            ecrire.close()
    except OSError:
        errorButtons()

def pressDesactive():
    buttonactive.set_sensitive(True)
    buttondesactive.set_sensitive(False)
    try:
        with open((pacmanfichier), "r") as f:
            lines = f.readlines()
            lines.remove("#Do not disable AMAR manually if you use the app\n")
            lines.remove("Include = /etc/pacman.d/amar.conf\n")
        with open((pacmanfichier), "w") as new_f:
            for line in lines:
                new_f.write(line)
        os.system ("pacman -Syy")
        amarfinalstate.set_markup('<span foreground="red" face="sans">INACTIF</span>')
        etatamar = 0
        f.close()
        new_f.close()
    except OSError:
        errorButtons()


print(etatamar)
if etatamar == 0:
    buttonactive.set_sensitive(True)
    buttondesactive.set_sensitive(False)
else:
    buttondesactive.set_sensitive(True)
    buttonactive.set_sensitive(False)

if etatamar == 0:
    amarfinalstate.set_markup('<span foreground="red" face="sans">INACTIF</span>')  # on active le depot AMAR, donc on ecrit sur le fichier.
else:
    amarfinalstate.set_markup('<span foreground="blue" face="sans">ACTIF</span>')  # on active le depot AMAR, donc on ecrit sur le fichier.

window = builder.get_object("mainWindow")
window.show_all()

Gtk.main()