#!/bin/sh

# based on /etc/X11/xinit/xinitrc.d/40-libcanberra-gtk-module.sh

case "${DESKTOP_SESSION-}" in
  gnome*) # Done by gnome-settings-daemon
  ;;
  *)
    # Extra check in case DESKTOP_SESSION is not set correctly
    if [ -z "${GNOME_DESKTOP_SESSION_ID-}" ]; then
      GTK_MODULES="winmenu${GTK_MODULES:+:$GTK_MODULES}"
      export GTK_MODULES
    fi
  ;;
esac
