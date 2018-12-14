#!/usr/bin/python
# Created by Baba Orhum
# NO MORE THIRD PARTS OF CODE SPECIAL THANKS FOR MORAL SUPPORT OF TUXNVAPE
# AND MY DEVEL TEACHER WASCAR

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

def errorButtons():
    dialog = Gtk.MessageDialog(parent=Gtk.Window(), flags=0, message_type=Gtk.MessageType.ERROR,
                               buttons=Gtk.ButtonsType.OK, text="FATAL")
    dialog.format_secondary_text("Erreur dans l'execution vérifiez les permissions")
    dialog.run()
    dialog.destroy()
    Gtk.main_quit()

try:
    etatamar = 0
    searchfile = open(pacmanfichier, "r")
    for line in searchfile:
        if "amar.conf" in line:
            etatamar = 1
    searchfile.close()

except OSError:
    errorButtons()

if etatamar == 1:
    buttonactive.set_label('DESACTIVER')
else:
    buttonactive.set_label('ACTIVER')

configamar = "\n#Do not disable AMAR manually if you use the app\nInclude = /etc/pacman.d/amar.conf\n"

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
            GLib.idle_add(errorButtons)
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
            GLib.idle_add(errorButtons)

window = builder.get_object("mainWindow")
window.show_all()
Gtk.main()
