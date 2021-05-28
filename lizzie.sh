#!/bin/bash
if [ ! -d "$HOME/.local/share/lizzie/sound" ]; then
    mkdir -p "$HOME"/.local/share/lizzie
    cp -r /usr/share/lizzie/sound "$HOME"/.local/share/lizzie/
    cp /usr/share/lizzie/config.txt "$HOME"/.local/share/lizzie
fi
cd "$HOME"/.local/share/lizzie && java -jar '/usr/share/java/lizzie/lizzie.jar' "$@"
