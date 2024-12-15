#! /bin/bash
mkdir -p ~/.local/share/rustcraft
/opt/rustcraft/bin/rustcraft --game-folder-path ~/.local/share/rustcraft --assets-folder-path ../data "$@"
