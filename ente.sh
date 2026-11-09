#!/bin/sh
# Launch the AppImage bundle extracted to /opt/ente.
export APPDIR=/opt/ente
exec /opt/ente/AppRun "$@"
