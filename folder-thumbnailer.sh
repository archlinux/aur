#!/bin/bash

if [ -f "$2/.folder.jpg" ]; then
	convert -thumbnail "$1" "$2/.folder.jpg" "$3" 1>/dev/null 2>&1
elif [ -f "$2/.folder.png" ]; then
	convert -thumbnail "$1" "$2/.folder.png" "$3" 1>/dev/null 2>&1
elif [ -f "$2/.folder.svg" ]; then
	inkscape --export-type=png --export-dpi=500 "$2/.folder.svg" --export-filename="$3" 1>/dev/null 2>&1
	convert -thumbnail "$1" "$3" "$3" 1>/dev/null 2>&1
else
	rm -f "$HOME/.cache/thumbnails/normal/$(echo -n "$4" | md5sum | cut -d " " -f1).png" || \
	rm -f "$HOME/.thumbnails/normal/$(echo -n "$4" | md5sum | cut -d " " -f1).png" || \
	rm -f "$HOME/.cache/thumbnails/large/$(echo -n "$4" | md5sum | cut -d " " -f1).png" || \
	rm -f "$HOME/.thumbnails/large/$(echo -n "$4" | md5sum | cut -d " " -f1).png"
fi
