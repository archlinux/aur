#!/bin/bash

/opt/tModLoader/setup.sh

user_dir="$HOME/.local/share/tModLoader"

"$user_dir/start-tModLoader-FamilyShare.sh" "${@:1}"
