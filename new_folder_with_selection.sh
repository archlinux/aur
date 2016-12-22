#!/bin/sh

dirname="$(kdialog \
  --inputbox "Folder to be created" "New Folder" \
  )" &&

mkdir -p -- "$dirname" &&

mv --target-directory="$dirname" -- "$@" ||

kdialog --error "Something went wrong"
