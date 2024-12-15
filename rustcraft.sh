#! /bin/bash
mkdir -p ~/.local/share/rustcraft

if [ ! -d ~/.local/share/rustcraft/data ]; then
    echo "Copying assets..."
    cp -R /opt/rustcraft/data ~/.local/share/rustcraft/data
fi

/opt/rustcraft/bin/rustcraft --game-folder-path ~/.local/share/rustcraft --assets-folder-path ../data "$@"
