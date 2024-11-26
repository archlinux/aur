#!/bin/bash
APPLICATION=winscp
CONFIG_DIR="$HOME/.${APPLICATION}"

export WINEPREFIX="${CONFIG_DIR}"
export WINEDLLOVERRIDES="mscoree,mshtml,winemp3.acm="

if [ ! -d "${WINEPREFIX}" ] ; then
  mkdir -p "${WINEPREFIX}" || exit 1
  wineboot -u
  ln -sf "/usr/share/${APPLICATION}/${APPLICATION}.exe" "${CONFIG_DIR}/" || exit 1
  cp -f "/usr/share/${APPLICATION}/${APPLICATION}_default_configuration.ini" "${CONFIG_DIR}/${APPLICATION}.ini" || exit 1
fi

wine "${CONFIG_DIR}/${APPLICATION}.exe" "$@"
