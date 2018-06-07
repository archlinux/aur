#!/bin/bash
mkdir -p $HOME/.local/share/mcpelauncher
cd $HOME/.local/share/mcpelauncher
mkdir -p libs
for i in /opt/mcpelauncher-git/libs/*; do
    i=$(basename $i)
    if ! [[ -d libs/$i ]]; then
        ln -s /opt/mcpelauncher-git/libs/$i libs/$i
    fi
done
if ! [[ -f mcpelauncher-icon.png ]]; then
    ln -s /opt/mcpelauncher-git/mcpelauncher-icon.png mcpelauncher-icon.png
fi
if ! [[ -d src ]]; then
    ln -s /opt/mcpelauncher-git/src src
fi
export LD_LIBRARY_PATH=/opt/mcpelauncher-git/
/opt/mcpelauncher-git/mcpelauncher "$@"
