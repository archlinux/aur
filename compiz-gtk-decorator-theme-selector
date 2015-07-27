#!/bin/bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

if [ ! -f /usr/bin/metacity ]; then
  zenity --warning --text="<b>You do not appear to have Metacity installed.</b>\n\nThe Compiz GTK window decorator uses Metacity libraries to operate. The Metacity theme is what this tool adjusts.\n\nInstall the metacity package if you would like to use the Compiz GTK window decorator."
fi

if [ ! -f ~/.config/compiz-gtk-decorator-theme.cfg ]; then
  if zenity --question --title="First run setup" --text="<b>First run setup</b>\n\n<b>Do you want to set the title bar\nfont to the system font?</b>\n\nIf unsure, click Yes."; then
    gconftool-2 -s /apps/metacity/general/titlebar_uses_system_font -t bool true
  else
    gconftool-2 -s /apps/metacity/general/titlebar_uses_system_font -t bool false
  fi
  if zenity --question --title="First run setup" --text="<b>Apply bugfix to window control buttons?</b>\n\nIf unsure, click Yes.\n\nIf you've custom configured your window\nbutton positions in GConf already, click No,\nas this will reset it."; then
    gconftool-2 -s /apps/metacity/general/button_layout -t string ":minimize,maximize,close"
  fi
  touch ~/.config/compiz-gtk-decorator-theme.cfg
  zenity --info --text="<b>First run setup complete.</b>\n\nIf you ever want to be asked those questions again, delete:\n<b>~/.config/compiz-gtk-decorator-theme.cfg</b>\nand run the Compiz GTK decorator theme selector again."
fi
  

main_window() {
  selection=$(
    zenity --height 450 --width 300 --list --ok-label="Apply" --cancel-label="Close" --title="Compiz GTK decorator theme" \
    --column="Installed Metacity themes:" "Compiz GWD default" \
    $(
      for i in /usr/share/themes/*; do
        if [ -f "$i"/metacity-1/metacity-theme-2.xml ]; then
          cat "$i"/metacity-1/metacity-theme-2.xml | grep "</name>" | sed 's/^.*<name>//' | sed 's|</name>||' | sed 's/ /-/'
        fi
        if [ -f "$i"/metacity-1/metacity-theme-1.xml ] && [ ! -f "$i"/metacity-1/metacity-theme-2.xml ]; then
          cat "$i"/metacity-1/metacity-theme-1.xml | grep "</name>" | sed 's/^.*<name>//' | sed 's|</name>||' | sed 's/ /-/'
        fi
      done
    )
  )
}

while [ $? = 0 ]; do
if [ "$selection" == "Compiz GWD default" ]; then
  gconftool-2 -u /apps/metacity/general/theme
elif [ "$selection" != "" ]; then
  gconftool-2 -s /apps/metacity/general/theme -t string "$selection"
fi
main_window
done

IFS=$SAVEIFS
