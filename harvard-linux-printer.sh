#!/bin/bash

echo "Installing dependencies..."

sudo apt-get update > /dev/null
sudo apt-get install cups-client cups-server-common smbclient > /dev/null

echo "Done installing dependencies."

printf "\n"

echo "Go to the following URL and log in to determine your PaperCut username:"
echo "https://papercut.fas.harvard.edu/app"

printf "\n"

read -p "Enter your PaperCut username: " papercut_username
read -sp "Enter your PaperCut password: " papercut_password

sudo sed -i '/syslog/d' /etc/samba/smb.conf
# sudo echo "logging = syslog@0 file" >> /etc/samba/smb.conf

{
	IFS=$'\n'
	print1_array=$(smbclient -L //HUIT-PPC-Print1.fas.harvard.edu -U FAS_DOMAIN/$papercut_username"%"$papercut_password | awk '!/\$/ && !/faculty/ && !/NetBIOS/ && !/Connection/ && !/Sharename/ && !/\-\-/ {print $1}')
} &> /dev/null

printf "\n"

echo "Connected to HUIT-PPC-Print1."

{
	for x in $print1_array; do 
		if [ $x ]
			then 
				sudo lpadmin -p $x -E -v smb://$papercut_username:$papercut_password@FAS_DOMAIN/HUIT-PPC-Print1.fas.harvard.edu/$x
		fi
	done
} &> /dev/null

echo "Added printers from HUIT-PPC-Print1."

printf "\n"

{
	IFS=$'\n'
	print2_array=$(smbclient -L //HUIT-PPC-Print2.fas.harvard.edu -U FAS_DOMAIN/$papercut_username"%"$papercut_password | awk '!/\$/ && !/faculty/ && !/NetBIOS/ && !/Connection/ && !/Sharename/ && !/\-\-/ {print $1}')
} &> /dev/null

echo "Connected to HUIT-PPC-Print2."

{
	for x in $print2_array; do 
		if [ $x ]
			then 
				sudo lpadmin -p $x -E -v smb://$papercut_username:$papercut_password@FAS_DOMAIN/HUIT-PPC-Print2.fas.harvard.edu/$x
		fi
	done
} &> /dev/null

echo "Added printers from HUIT-PPC-Print2."

printf "\n"

echo "Done. Enjoy!"
echo "Please report any bugs to https://github.com/djsavvy/harvard-linux-printer/issues"


