#!/bin/sh
# Starts RakKomik on the system Electron. The web part is the folder `web` next to app.asar: the application finds
# it there and copies it into its cache directory when the cache is empty; the updates of the web part keep that cache.
exec electron /usr/lib/rakkomik/app.asar "$@"
