#!/usr/bin/env bash

list=(
    /usr/lib/code/product.json                          # code
    /opt/visual-studio-code/resources/app/product.json  # visual-studio-code-bin
)

for f in "${list[@]}"; do
    if [ -f "$f" ]; then
        printf "[$(basename "$0")] Patching «$f»\n"

        sed -i -E '/"(dataFolderName|sharedDataFolderName)":/ {
            /"\.local\// !s|": "\.|": ".local/share/|
        }' "$f"
    fi
done
