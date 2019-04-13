#!/bin/bash
# This script will install osu! using ThePooN's method and tweaks.
# Depends on: wine, dialog..

# Check internet. If no connection was established exit.
ping 1.1.1.1 -c 1 || exit


### Variables
tits="yuri's osu! installing script" # It's for title, not for tiddies.
confused="?!?" # To be used by 'fuck' variable
continue="Press ENTER to continue"

### Functions
fuck() { # This one will tell you an error.
	clear
	echo -e "Something has fucked up.\nLog: $1"
	exit
}

welcome() { # This will greet you :)
	dialog --title "$tits" --msgbox "Hello! This script will install osu! using ThePooN's method, which includes\nthe low latency patch.\n\n\n$continue" 10 50
}

archpreparing() { # This one will prepare all scripts for installation (For arch-based distro)
	dialog --title "$tits" --infobox "I've detected that you use Arch-based distro. \n\n\nPreparing some stuff before starting the installation." 7 50
	sleep 5
	dialog --title "$tits" --msgbox "You are currently entering sudo mode.\n\nYou will be prompted for password, so enter it in.\n\n\n$continue" 11 50
	sudo pacman-key --keyserver hkps://hkps.pool.sks-keyservers.net -r C0E7D0CDB72FBE95
	sudo pacman-key --keyserver hkps://hkps.pool.sks-keyservers.net --lsign-key C0E7D0CDB72FBE95
	cat /etc/pacman.conf | grep thepoon || sudo bash -c 'echo "
[thepoon]
Server = https://archrepo.thepoon.fr
Server = https://mirrors.celianvdb.fr/archlinux/thepoon" >> /etc/pacman.conf'
	sudo pacman --noconfirm -Syy wine-osu
}

setupwine() { # This one will make wineprefix and will install osu!.
	dialog --title "$tits" --infobox "Making wineprefix" 3 21
	sleep 0.5
	export WINEPREFIX=$HOME/.wine_osu # This is the path to a hidden folder in your home folder.
	export WINEARCH=win32 # Only needed when executing the first command with that WINEPREFIX

	# Arch Linux/wine-osu users should uncomment next line
	# to update PATH to make sure we're using the right Wine binary
	export PATH=/opt/wine-osu/bin:$PATH
	dialog --colors --title "WARNING!" --yes-label "CONTINUE" --no-label "No wait..." --yesno "Do not install Mono or Gecko.\n\nPress next at every step.\n\nIf you’re prompted to reboot your computer, no matter the choice it won’t reboot and will be fine." 12 50 || fuck "Nevermind! You can open this script at anytime and the installation will continue." 6 50
	echo -e "This shouldn't take long time.\nDon't care about errors, unless script stops you, then something actually failed."
	sleep 1
	winetricks --unattended gdiplus dotnet462 & sleep 120 && killall wineserver mscorsvw.exe winetricks
	mkdir ~/Downloads || clear
	echo "Downloading osu!"
	curl -o ~/Downloads/osui.exe https://m1.ppy.sh/r/osu\!install.exe
	dialog --title "WARNING!" --msgbox "Leave the install dir as it is, otherwise osu! won't work!\n\nCLOSE osu! AFTER IT WAS INSTALLED, AND PRESS ANY KEY
IN THE TERMINAL TO MAKE THE SCRIPT CONTINUE!\n\n\n$continue" 13 45 || fuck "You've quit lmao"
	wine ~/Downloads/osui.exe
	sleep 15
	read -p "Press any key to continue... " -n1 -s
	wineserver -k
	fixlatency
}

fixlatency() { # This one will set up some things after setupwine has succeeded
	echo "$USER" > /tmp/osuuser
	sudo bash -c 'echo -e "$(cat /tmp/osuuser) - nice -20\n$(cat /tmp/osuuser) - rtprio 99" > /etc/security/limits.conf'

	sudo mkdir -p /etc/pulse/daemon.conf.d/
	echo "high-priority = yes
nice-level = -15

realtime-scheduling = yes
realtime-priority = 50

resample-method = speex-float-0

default-fragments = 2 # Minimum is 2
default-fragment-size-msec = 2 # You can set this to 1, but that will break OBS audio capture." | sudo tee /etc/pulse/daemon.conf.d/10-better-latency.conf

	sudo sed -i -e 's/tsched=1/tsched=0/g' /etc/pulse/default.pa
	afterwine
}

afterwine() { # This one will make osu! scripts
	ln -sv ~/.wine_osu/drive_c/users/$USER/Local\ Settings/Application\ Data/osu\!/ ~/osudir

	echo '#!/bin/bash
# This script will fix the PulseAudio crack.

ok() {
clear
sudo sed -i -e "s/tsched=0/tsched=1/g" /etc/pulse/default.pa
wait # I Don't think, you'll need this, but nevermind lmao
echo -e "Sound has been fixed!\nReboot your computer for these changes to take effect!"
}

cat /etc/pulse/default.pa | grep tsched=0 || exit && echo -e "The sound cracking is already fixed." && sudo rm /bin/fixcrack

ok && sudo rm /bin/fixcrack' | sudo tee -a /bin/fixcrack

	echo '#!/bin/sh
export WINEPREFIX="$HOME/.wine_osu"
export STAGING_AUDIO_DURATION=10000 # This one is the most stable value for most people, you can change this down to 5000 (that is the lowest stable value osu! can handle.)

# Arch Linux/wine-osu users should uncomment next line
# for the patch to be effective
export PATH="/opt/wine-osu/bin:$PATH"

cd ~/osudir
wine osu!.exe "$@"' | sudo tee /bin/osu

	echo '#!/bin/sh
export WINEPREFIX="$HOME/.wine_osu"

wineserver -k' | sudo tee -a /bin/osukill
	sudo chmod +x /bin/osukill /bin/osu /bin/fixcrack
	curl --output ~/.local/share/icons/osu\!.png https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Osulogo.png/220px-Osulogo.png
	echo '[Desktop Entry]
Type=Application
Name=osu!
Icon=osu!.png
Exec=osu %u
StartupWMClass=osu!.exe
Categories=Game;
MimeType=x-scheme-handler/discord-367827983903490050;x-scheme-handler/osu;' > ~/.local/share/applications/osu\!.desktop
}

selection() { # Make dialog select menu for additional things

OPTIONS=(1 "Setup tablet/mouse and much more"
	 2 "Install osu-stuff (Has osu!direct feature without osu! supporter and much more)"
	 3 "Install Asian fonts")

selectoutput=$(dialog --title "$tits" \
                --menu "Do additional things:" \
                15 40 4 \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $selectoutput in
        1)
            xdg-open "https://osu.ppy.sh/community/forums/topics/367783&start=0"
            selection
	    ;;
        2)
            curl -LO yurisuki.github.io/osu-i
	    bash osu-i
	    selection
            ;;
	3)
	    xdg-open "https://osu.ppy.sh/community/forums/topics/367783"
	    selection
	    ;;
esac
}

### Execute variables
# Check if command was executed with sudo.
if [ $USER == root ]; then
	fuck "You executed this script as root."
fi

# Check if dialog is installed
dialog --help || fuck "Dialog is not installed."

# Welcome message
welcome || fuck "Interupted by user."

# AUR! Install do Arch things
archpreparing

# Setup wine after all dependencies were installed
setupwine

# Show select menu for additional things.
selection

# IT'S DONE JNSAEKLODHSAKJLDHASOKJDHASKJDHKASDHAKSED
dialog --title "$tits" --msgbox "Everything has been done! Restart your computer to make the latency patch take effect.\nYou can turn on osu! by using 'osu', and\nkill osu! by using 'osukill' (in case osu! freezes or won't start.)\n\nAlso, sound may be cracking (in whole system), you can fix this by running 'fixcrack' command.\n\n~ Thank you for using this script. <3" 15 80

