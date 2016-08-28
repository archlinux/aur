#! /bin/bash

url=$(curl -s "https://arc.msn.com/v3/Delivery/Cache?pid=209567&fmt=json&ua=WindowsShellClient" | tr -d '\\' | perl -pe 's/.*?image_fullscreen_001_landscape.*?\"u\":\"(.*?)\".*/\1/')

mkdir -p "$HOME/.spotlight"
curl -so "$HOME/.spotlight/background.jpg" $url

gsettings set org.gnome.desktop.background picture-options "zoom"
gsettings set org.gnome.desktop.background picture-uri "file:///$HOME/.spotlight/background.jpg"
