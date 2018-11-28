#!/bin/bash
if [ ! -d "$HOME/.local/share/lizzie" ]; then
    mkdir -p "$HOME"/.local/share/lizzie
    cp /usr/share/lizzie/config.txt "$HOME"/.local/share/lizzie
    if [ -f "$HOME/.local/share/leela-zero/leelaz_opencl_tuning" ]; then
        ln -s "$HOME"/.local/share/leela-zero/leelaz_opencl_tuning "$HOME"/.local/share/lizzie/leelaz_opencl_tuning
    fi
fi
cd "$HOME"/.local/share/lizzie && java -jar '/usr/share/java/lizzie/lizzie.jar' "$@"