#! /bin/bash

item=$(wget -qO- "https://arc.msn.com/v3/Delivery/Cache?pid=279978&fmt=json&ua=WindowsShellClient&lc=en,en-US&ctry=US" | jq -r ".batchrsp.items | .[0].item")

landscapeUrl=$(echo $item | jq -r ".ad.image_fullscreen_001_landscape.u")
title=$(echo $item | jq -r ".ad.title_text.tx")
titleUrl=$(echo $item | jq -r ".ad.title_destination_url.u" | perl -pe 's/.*?(http.*)/\1/')

mkdir -p "$HOME/.spotlight"
path="$HOME/.spotlight/background.jpg"
	
wget -qO "$path" "$landscapeUrl"

gsettings set org.gnome.desktop.background picture-options "zoom"
gsettings set org.gnome.desktop.background picture-uri "file://$path"

notify-send "Background changed" "$title ($titleUrl)" --icon=preferences-desktop-wallpaper --urgency=low --hint=string:desktop-entry:spotlight
echo "Background changed to $title ($titleUrl)" | systemd-cat -t spotlight
