#!/bin/bash

case "${DESKTOP_SESSION-}" in
  gnome) # Done by gnome-settings-daemon
  ;;
  *)
    # Extra check in case DESKTOP_SESSION is not set correctly
    if [[ -z ${GNOME_DESKTOP_SESSION_ID-} ]]; then
      if [[ -z ${GTK_MODULES-} ]]; then
        GTK_MODULES="canberra-gtk-module"
      else
        GTK_MODULES="$GTK_MODULES:canberra-gtk-module"
      fi
      export GTK_MODULES
    fi
  ;;
esac
