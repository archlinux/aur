#!/bin/sh
export XDG_SESSION_TYPE=x11
exec /opt/scalpel-poe/Scalpel.AppImage --ozone-platform=x11 "$@"
