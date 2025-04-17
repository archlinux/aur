#!/bin/bash

url=$(grep -E '^URL=' "$1" | cut -d= -f2-)

if [ -n "$url" ]; then
    xdg-open "$url"
else
    notify-send "Error" "No URL found in .url file"
    exit 1
fi
