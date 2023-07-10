#!/bin/bash

/opt/tModLoader/setup.sh

user_dir="$HOME/.local/share/tModLoader"

(cd "$user_dir" && "./start-tModLoader.sh" "${@:1}")
