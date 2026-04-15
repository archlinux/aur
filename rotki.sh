#!/bin/sh
# When APPIMAGE is unset, the app hangs on the loading screen because the initial update-check promise never resolves.
export APPIMAGE="/opt/rotki/rotki"
exec /opt/rotki/rotki "$@"
