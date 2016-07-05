#!/bin/sh

dirname="$(kdialog \
  --inputbox "Folder to be created" "New Folder" \
  --title "Create New Folder with selection" \
  --caption "Dolphin" --icon "dolphin" \
  )" &&

mkdir -p -- "$dirname" &&

mv --target-directory="$dirname" -- "$@" ||

kdialog --error "Something went wrong"
