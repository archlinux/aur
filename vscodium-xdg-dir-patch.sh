#!/usr/bin/env bash

list=(
    /usr/share/vscodium/resources/app/product.json # vscodium
    /usr/lib/vscodium-electron/product.json # vscodium-electron-bin
    /usr/lib/vscodium/product.json # vscodium-electron
    /usr/share/vscodium-git/resources/app/product.json # vscodium-git
)

for f in ${list[@]}; do
    if [ -f "$f" ]; then
        printf "[$(basename $0)] Patching «$f»\n"
        sed -i 's|"dataFolderName": ".*"|"dataFolderName": ".local/share/codium"|g' "$f"
    fi
done
