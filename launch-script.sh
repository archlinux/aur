#!/bin/bash
unset WINEPREFIX

datadir="${XDG_DATA_HOME:-"${HOME}/.local/share"}/key-gunner"
if [ ! -d "${datadir}" ] ; then
   cp -r /usr/share/key-gunner "${datadir}"
fi

wine "${datadir}/KeyGunner.exe" "$@"
