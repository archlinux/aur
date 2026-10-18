#!/usr/bin/bash
# Run the AppImage contents extracted to /opt/leafsmith, without FUSE.
# AppRun sets up the bundled GTK environment; APPDIR tells it and the app
# where the bundle and its worker resources are.
export APPDIR=/opt/leafsmith
exec /opt/leafsmith/AppRun "$@"
