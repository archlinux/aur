#!/bin/sh

save_path="${XDG_DATA_HOME:-$HOME/.config/EasyRPG/saved}/space-funeral"
mkdir -p $save_path
exec easyrpg-player --project-path /opt/space-funeral --save-path "$save_path"
