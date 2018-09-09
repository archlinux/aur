#!/bin/sh
EPIPHANY_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/epiphany/app-epiphany-conversejs"
trap 'kill %1' 0
cd /usr/share/webapps/converse.js
python -m http.server 40123 &
mkdir -p "$EPIPHANY_DIR"
epiphany --application-mode --profile="$EPIPHANY_DIR" http://127.0.0.1:40123/fullscreen.html
