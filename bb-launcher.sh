#!/bin/sh

prefix=/opt/bb
unset APPIMAGE APPDIR

# AppRun sets up the AppImage's required library and desktop-data environment.
# Running it from the extracted package avoids FUSE while retaining upstream's
# supported launch behavior.
exec "$prefix/AppRun" "$@"
