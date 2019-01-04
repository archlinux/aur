#!/bin/sh

cd /usr/share/jellyfin-theater-electron
exec electron /usr/share/jellyfin-theater-electron/jellyfin-theater-electron.asar "$@"
