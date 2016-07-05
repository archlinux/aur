#!/bin/bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

foldname=`kdialog --inputbox "Folder to be created" "New Folder" --title "Create New Folder with Selection" --caption "Dolphin" --icon "dolphin"`

if [ $? = 0 ]; then
	dir=`dirname $1`
	mkdir "$dir"/"$foldname"

if [ $? = 1 ]; then
	kdialog --error "Invalid Name"
	else
	for file in ${@} ; do
	mv "$file" -t "$dir"/"$foldname"
	done
fi
fi

IFS=$SAVEIFS
