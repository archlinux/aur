#! /usr/bin/env bash

set -e

blue=$(tput setaf 4)
normal=$(tput sgr0)

yaourt -Qqe > packages.txt
cp packages.txt wanted.txt

printf "Disclaimer: ${blue}if you delete something important, it's not my fault.${normal}\n"
printf "Delete the packages from the list in order to mark them for removal.\nGot it? (Y or N). "
read USER_BEGIN

if [ "$USER_BEGIN" != y ] && [ "$USER_BEGIN" != "Y" ]; then
	exit 1
fi

$EDITOR wanted.txt

if [ "$(diff -q packages.txt wanted.txt)" == "" ]; then
	printf "${blue}No changes to list.${normal}\n"
else

	comm -23 <(sort packages.txt) <(sort wanted.txt) > to_delete.txt # Like diff, but without the other crap it sticks in

	cat to_delete.txt
	printf "${blue}Really delete these packages? Y or N.${normal} "
	read USER_CONT

	if [ "$USER_CONT" == "y" ] || [ "$USER_CONT" == "Y" ]
	then
		yaourt -Rsn - < to_delete.txt
	fi
fi

rm packages.txt wanted.txt to_delete.txt
