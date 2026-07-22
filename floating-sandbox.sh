#!/bin/sh
# Force X11 backend and use Light theme for best UI
export GDK_BACKEND=x11
export GTK_THEME=Adwaita:light
exec /opt/floating-sandbox/FloatingSandbox "$@"
