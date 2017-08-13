#!/bin/bash

# sudo echo "Installing dependencies..."

# the following lines are for Ubuntu only
# sudo apt-get update > /dev/null
# sudo apt-get install cups-client cups-server-common smbclient > /dev/null
# echo "Done installing dependencies."

# command check courtesy of https://stackoverflow.com/questions/592620/check-if-a-program-exists-from-a-bash-script
command -v smbclient >/dev/null 2>&1 || { echo >&2 "I require smbclient but it's not installed.  Aborting."; exit 1; }
command -v lpadmin >/dev/null 2>&1 || { echo >&2 "I require lpadmin but it's not installed.  Aborting."; exit 1; }
command -v cupsd >/dev/null 2>&1 || { echo >&2 "I require cupsd but it's not installed.  Aborting."; exit 1; }

sudo systemctl enable org.cups.cupsd.service
sudo systemctl start org.cups.cupsd.service

printf "\n"

echo "Go to the following URL and log in to determine your PaperCut username:"
echo "https://papercut.fas.harvard.edu/app"

printf "\n"

read -p "Enter your PaperCut username: " papercut_username
read -sp "Enter your PaperCut password: " papercut_password

while [[ $papercut_username != ${papercut_username/ /} || $papercut_password != ${papercut_password/ /} ]]; do
	echo "Username and password cannot contain spaces. Please try again."
	printf "\n"
	read -p "Enter your PaperCut username: " papercut_username
	read -sp "Enter your PaperCut password: " papercut_password
done


sudo sed -i '/syslog/d' /etc/samba/smb.conf
# sudo echo "logging = syslog@0 file" >> /etc/samba/smb.conf

{
	IFS=$'\n'
	print1_array=$(smbclient -L //HUIT-PPC-Print1.fas.harvard.edu -U FAS_DOMAIN/$papercut_username"%"$papercut_password | awk '!/\$/ && !/faculty/ && !/NetBIOS/ && !/session/ && !/Connection/ && !/Sharename/ && !/\-\-/ {print $1}')
} &> ./harvard-linux-printer.log

printf "\n"

worked=false

# echo $print1_array

for x in $print1_array; do
	if [ $x ];
		then 
		worked=true
	fi
done

if [ "$worked" = false ]; 
	then
		echo "Authentication error. Please make sure you entered your credentials correctly. Note that at this time passwords containing % or : cannot successfully authenticate." 
		echo "If you suspect there is a bug, please submit a bug report at https://github.com/djsavvy/harvard-linux-printer/issues and upload the file harvard-linux-printer.log." 
	exit 1
fi


echo "Connected to HUIT-PPC-Print1."

{
	for x in $print1_array; do 
		if [ $x ];
			then 
				sudo lpadmin -p $x -E -v smb://$papercut_username:$papercut_password@FAS_DOMAIN/HUIT-PPC-Print1.fas.harvard.edu/$x
		fi
	done
} &> ./harvard-linux-printer.log

echo "Added printers from HUIT-PPC-Print1."

# printf "\n"

{
	IFS=$'\n'
	print2_array=$(smbclient -L //HUIT-PPC-Print2.fas.harvard.edu -U FAS_DOMAIN/$papercut_username"%"$papercut_password | awk '!/\$/ && !/faculty/ && !/NetBIOS/ && !/session/ && !/Connection/ && !/Sharename/ && !/\-\-/ {print $1}')
} &> /dev/null

echo "Connected to HUIT-PPC-Print2."

{
	for x in $print2_array; do 
		if [ $x ];
			then 
				sudo lpadmin -p $x -E -v smb://$papercut_username:$papercut_password@FAS_DOMAIN/HUIT-PPC-Print2.fas.harvard.edu/$x
		fi
	done
} &> ./harvard-linux-printer.log

echo "Added printers from HUIT-PPC-Print2."

printf "\n"

rm ./harvard-linux-printer.log

echo "Done. Enjoy!"
echo "Please report any bugs to https://github.com/djsavvy/harvard-linux-printer/issues"
