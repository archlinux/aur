#!/bin/bash

pacman_error () {
zenity --error --text="Error: $1"
killall zenity
exit 
}

updates=$(checkupdates)
if [ $? -eq 0 ]; then

	zenity --info --width=400\
		  --text="Updated packages:\n$(echo "$updates" | awk '{if(FNR <= 10) {print $1} }')"

	zenity --question \
	--text="Do yout want to continue with the updates?" --width=400

	if [ $? -eq 0 ]; then
	    echo "Upgrade starten!"
		(
			echo "10" ; sleep 1
			echo "# Sync Databases" 
			echo "30" ; nice -15 sudo -S pacman -Syy --noconfirm || pacman_error "Sync"
			echo "# Downloading Packages" ; sleep 1
			echo "60" ; nice -15 sudo -S pacman -Syw --noconfirm || pacman_error "Download"
			echo "# Installing updates" ; sleep 1
			echo "80" ; nice -15 sudo -S pacman -Syu --noconfirm || pacman_error "Update"
			echo "# Finished with the updates"
			echo "100"
		) |
		zenity --progress \
		  --title="System Update" \
		  --text="Databases will be updated …" \
		  --percentage=0 --width=400 || pacman_error
		
			
	elif [ $? -eq 1 ]; then
	    echo "Upgrades stopped!"
	else
	    echo "An unexpected error was encountered."
	fi

else
	zenity --info --text="No updates available." --width=400 
	exit
fi

