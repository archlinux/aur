#!/bin/bash
CONFIG_DIR="$XDG_CONFIG_HOME"
[ -z "$CONFIG_DIR" ] && CONFIG_DIR="$HOME/.config"

ADMIN_DIR=/usr/share/kerio-firewall-admin/Admin

export WINEPREFIX="$CONFIG_DIR/kerio-firewall-admin"
export WINEDLLOVERRIDES="mscoree,mshtml,winemp3.acm="
export WINEBASE="/usr/lib/kerio-firewall-admin/wine"
export WINESERVER="$WINEBASE/bin/wineserver"
export WINEDEBUG=-all

if [ ! -d "$WINEPREFIX" ] ; then
  mkdir -p "$WINEPREFIX/drive_c/Kerio" || exit 1
  "$WINEBASE/bin/wineboot" -u
fi

if [ ! -e "$WINEPREFIX/drive_c/Kerio/Admin" ]; then
  ln -s "$ADMIN_DIR" "$WINEPREFIX/drive_c/Kerio/Admin"
fi


"$WINEBASE/bin/wine" "C:\\Kerio\\Admin\\kadmin.exe" "$@"
