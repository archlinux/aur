#!usr/bin/env/ python
# coding: utf-8
"""
Projet AMAR
Remerciements : Baba, Fredo, Rhylx, Francky, hRF, Pepito...
Date : 14 Oct 2K17,
       1.0.1 : 19 Nov 2017
version :  1.0.1
gksudo -s python amar.py
"""

import os
import sys
from PIL import Image 
import subprocess
from tkinter import *

if sys.version_info[0] == 3:
    from tkinter import messagebox
else:
    import tkMessageBox as messagebox

if os.getuid() != 0:
    os.system ("gksudo python /usr/bin/amar.py")
    #print("Utiliser le script en tant qu'administrateur, lancer le avec 'gksudo -s python amar.py'")
    sys.exit(1)

pacmanfichier = "/etc/pacman.conf"

try:
    #On suppose d'abord qu'AMAR est désactivé. On met donc etatamar = 0 au départ.
    etatamar = 0
    with open(pacmanfichier, 'r') as searchfile:
        for line in searchfile:
            #Si la chaîne '[AMAR]' est écrit quelque part dans pacman.conf, alors le dépôt est activé et on met etatamar = 1.
            if 'amar.conf' in line:
                etatamar = 1
    searchfile.close()
except OSError:
    print("pacman.conf non acessible, donnez le chemin vers votre fichier")
    sys.exit(1)

configamar = "\n#Do not disable AMAR manually if you use the app\nInclude = /etc/pacman.d/amar.conf\n"

def pressA():
    A.config(state=DISABLED)
    B.config(state=ACTIVE)
    try:
        with open(pacmanfichier, "a") as ecrire:
            ecrire.write(configamar)
            ecrire.close()
            os.system("sudo pacman -Syy")
            INFO.config(text="Actif", fg="green")  # on active le depot AMAR, donc on ecrit sur le fichier.
            etatamar = 1
            ecrire.close()
    except OSError:
        messagebox.showerror("Erreur", "Ficher pacman.conf non accessible en écrture\nVérifier vos droit et relancer"
                                       " le script\nVérifier aussi que vous ne faite une mise à jours en même temps")

 
def pressB():
    A.config(state=ACTIVE)
    B.config(state=DISABLED)
    try:
        with open((pacmanfichier), "r") as f:
            lines = f.readlines()
            lines.remove("#Do not disable AMAR manually if you use the app\n")
            lines.remove("Include = /etc/pacman.d/amar.conf\n")
        with open((pacmanfichier), "w") as new_f:
            for line in lines:
                new_f.write(line)
        os.system ("sudo pacman -Syy")
        INFO.config(text="Inactif", fg="red")  # on active le depot AMAR, donc on ecrit sur le fichier.
        etatamar = 0
        f.close()
        new_f.close()
    except OSError:
        messagebox.showerror("Erreur", "Ficher pacman.conf non accessible en écrture\nVérifier vos droit et relancer"
                                       " le script\nVérifier aussi que vous ne faite une mise à jours en même temps")


win = Tk()
win.title("TNV A.M.A.R - Configuration")
win.geometry("620x280")
tux = PhotoImage(file="/usr/share/icons/amar.png")  # lien vers l'icone de la fenetre
win.tk.call('wm', 'iconphoto', win._w, tux)  # application de la fenetre

TEXTE = Label(win, text='TNV AMAR', fg="blue")
TEXTE2 = Label(win, text="Le dépôt AMAR (Arch/Manjaro Alternate Repository) est un dépôt tiers donnant\n"
                           "accès à des logiciels supplémentaires non-accessibles via les dépôts officiels."
                           "\n\nCe dépôt a été créé afin de pouvoir donner accès simplement à des logiciels dont"
                           " l'installation\nvia AUR est problématique ou des logiciels qui ne concernent que"
                           " Manjaro\net qui sont expulsés d'AUR pour cette raison.", fg="purple")
TEXTE.pack(side=TOP, padx=5, pady=3)  # Titre de l'application de texte
TEXTE2.pack(side=TOP, padx=5, pady=10)  # Titre de l'application de texte

A = Button(win, text='ACTIVER', height=2, width=30, command=pressA)
B = Button(win, text='DESACTIVER', height=2, width=30, command=pressB)

INFO = Label(win, text='', fg="black")  # Informations qui changent en fonction du bouton appuyé par l'utilisateur
MESSAGE = Label(win, text='ETAT DU DEPÔT', fg="blue")

INFO.pack(side=BOTTOM)  # on ferme les boutons en décidant de leur amplacement
MESSAGE.pack(side=BOTTOM)

if etatamar:
    A.pack()
    A.config(state=DISABLED)
    B.pack()
    B.config(state=ACTIVE)
else:
    A.pack()
    A.config(state=ACTIVE)
    B.pack()
    B.config(state=DISABLED)

if etatamar == 0:
    INFO.config(text="Inactif", fg="red")  # on active le depot AMAR, donc on ecrit sur le fichier.
else:
    INFO.config(text="Actif", fg="green")  # on active le depot AMAR, donc on ecrit sur le fichier.
    
win.mainloop()
