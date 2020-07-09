#!/usr/bin/bash
/usr/bin/checkupdates
pac_updates=$?

printf "$1"

aur_output=$(checkupdates-aur)
printf "$aur_output"

if [[ $aur_output ]]; then
	aur_updates=0
else
	aur_updates=2
fi

if [ $pac_updates -eq 2 ] && [ $aur_updates -eq 2 ]; then
	exit 2
elif [ $pac_updates -eq 0 ] || [ $aur_updates -eq 0 ]; then
	exit 0
else
	exit 1
fi	

