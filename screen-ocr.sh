#!/bin/bash

# Based on https://askubuntu.com/a/280713 by Salem
# Ported from X11 GNOME to Wayland KDE and added language detection by Maneren
export LC_ALL=en_US.UTF-8

while read -r lang; do
  if [ "$lang" != "osd" ]; then
    available_langs+=("$lang" "$lang" off)
  fi
done < <(tesseract --list-langs | tail -n +2)

LANG="$(kdialog --icon "spectacle" --title "Screen OCR" \
  --radiolist "Select a language:" "${available_langs[@]}")"

RET=$? # check return status

if [ "$LANG" = "" ]; then
  echo "Operation cancelled: $RET ($LANG)"
  exit
fi

echo "Language set to $LANG"

SCR_IMG=$(mktemp)        # create tempfile
trap "rm $SCR_IMG*" EXIT # make sure tempfiles get deleted afterwards

spectacle -brSeo "$SCR_IMG".png # select area

if [ ! -f "$SCR_IMG".png ]; then
  echo "Operation cancelled"
  exit
fi

mogrify -modulate 100,0 -resize 400% "$SCR_IMG".png # postprocess to prepare for OCR
tesseract -l "$LANG" "$SCR_IMG".png "$SCR_IMG"      # OCR in given language
xsel -bi <"$SCR_IMG".txt                            # pass to clipboard
notify-send -u normal -e -i "spectacle" -a "Screen OCR" "Text copied to clipboard" "$(<"$SCR_IMG".txt)"
exit
