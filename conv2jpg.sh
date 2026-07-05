#!/bin/bash

input=$(kdialog --title "JPEG Quality" --inputbox "Enter the JPEG Quality (0-100):")

if [ $? -eq 1 ]; then
    exit 0
fi

if [[ ! "$input" =~ ^[0-9]+$ ]]; then
    exit 1
fi

echo $input

if [ -f "${1%.*}.jpg" ]; then
    DEST="${1%.*}2.jpg"
else
    DEST="${1%.*}.jpg"
fi

magick "$1" -quality $input $DEST 

if [[ "$2" == "del" ]]; then
    rm "$1"
fi
