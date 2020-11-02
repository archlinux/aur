#!/usr/bin/env bash

readonly excalidraw_dir="/usr/share/joplin/"

if [[ ! -d $excalidraw_dir ]]; then
  echo "Cannot find /usr/share/joplin/"
  exit 1
fi

cd $excalidraw_dir

electron /usr/share/excalidraw-desktop/main.js "$@"


