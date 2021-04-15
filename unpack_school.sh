#!/bin/bash
function unpack () {
	innoextract SchoolDaysHQ.exe $(innoextract -l SchoolDaysHQ.exe | grep -v -E 'nice_boat|updater' | cut -f 2 -d '"' | sed 's/app\//-I /' | tail -n +2 | head -n -1) -d /opt/SchoolDays
	mv /opt/SchoolDays/app/* /opt/SchoolDays
	rmdir /opt/SchoolDays/app
}
#Check utils
if [ $USER = "root" ]
	then
	if [ -f "$(pwd)/SchoolDaysHQ.exe" ]
		then
		if [ -f "/bin/innoextract" ]
			then
			if [ -f "/bin/grep" ]
				then
				if [ -f "/bin/sed" ]
					then unpack
				else
					echo "Please, install sed!"
				fi
			else
				echo "Please, install grep!"
			fi
		else
			echo "Please, install innoextract!"
		fi
	else
		echo "Resources not found!"
	fi
else
	echo "Please run as root!"
fi
