#!/usr/bin/env bash

DATA_DIR="/usr/share/adwaita-for-steam-git"
SCRIPT="install.py"

[[ ! -d "$DATA_DIR" ]] && echo "$DATA_DIR not found" && exit
[[ ! -f "$DATA_DIR/install.py" ]] && echo "$DATA_DIR/install.py not found" && exit

cd "$DATA_DIR" || exit
python "install.py" "$@"
