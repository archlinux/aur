#!/bin/bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

if [ ! -f /usr/bin/metacity ]; then
  zenity --warning --text="<b>You do not appear to have Metacity installed.</b>\n\nThe Compiz GTK window decorator uses Metacity libraries to operate. The Metacity theme is what this tool adjusts.\n\nInstall the metacity package if you would like to use the Compiz GTK window decorator."
fi

if [ -f ~/.config/compiz-manjaro-gtk-decorator-theme.cfg ]; then
  rm ~/.config/compiz-manjaro-gtk-decorator-theme.cfg
  gsettings reset org.gnome.desktop.wm.preferences titlebar-uses-system-font
fi

main_window() {
  selection=$(
    zenity --height 450 --width 300 --list --ok-label="Apply" --cancel-label="Close" --title="Compiz GTK decorator theme" \
    --column="Installed Metacity themes:" "Compiz GWD default" \
    $(
      for i in /usr/share/themes/*; do
        if [ -f "$i"/metacity-1/metacity-theme-3.xml ]; then
          cat "$i"/metacity-1/metacity-theme-3.xml | grep "</name>" | sed 's/^.*<name>//' | sed 's|</name>||' | sed 's/ /-/'
        fi
        if [ -f "$i"/metacity-1/metacity-theme-2.xml ] && [ ! -f "$i"/metacity-1/metacity-theme-3.xml ]; then
          cat "$i"/metacity-1/metacity-theme-2.xml | grep "</name>" | sed 's/^.*<name>//' | sed 's|</name>||' | sed 's/ /-/'
        fi
        if [ -f "$i"/metacity-1/metacity-theme-1.xml ] && [ ! -f "$i"/metacity-1/metacity-theme-2.xml ] && [ ! -f "$i"/metacity-1/metacity-theme-3.xml ]; then
          cat "$i"/metacity-1/metacity-theme-1.xml | grep "</name>" | sed 's/^.*<name>//' | sed 's|</name>||' | sed 's/ /-/'
        fi
      done
    )
  )
}

while [ $? = 0 ]; do
if [ "$selection" == "Compiz GWD default" ]; then
  gsettings set org.gnome.metacity theme ""
elif [ "$selection" != "" ]; then
  gsettings set org.gnome.metacity theme "$selection"
fi
main_window
done

IFS=$SAVEIFS
