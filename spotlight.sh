#! /bin/bash

item=$(wget -qO- "https://arc.msn.com/v3/Delivery/Cache?pid=279978&fmt=json&ua=WindowsShellClient&lc=en,en-US&ctry=US" | jq -r ".batchrsp.items | .[0].item")
url=$(echo $item | jq -r ".ad.image_fullscreen_001_landscape.u")
title=$(echo $item | jq -r ".ad.title_text.tx")
titleUrl=$(echo $item | jq -r ".ad.title_destination_url.u" | perl -pe 's/.*?(http.*)/\1/')

mkdir -p "$HOME/.spotlight"
wget -qO "$HOME/.spotlight/background.jpg" $url
echo "$title" > "$HOME/.spotlight/background_info"
echo "$titleUrl" >> "$HOME/.spotlight/background_info"

gsettings set org.gnome.desktop.background picture-options "zoom"
gsettings set org.gnome.desktop.background picture-uri "file:///$HOME/.spotlight/background.jpg"
