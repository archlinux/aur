#!/bin/sh

# Script preparing working environment and launching dbanszewski-launcher

mkdir -p ~/.config/dbanaszewski-launcher/
cd ~/.config/dbanaszewski-launcher/
cp -r /opt/dbanaszewski-launcher/.minecraft .

/opt/dbanaszewski-launcher/dbanaszewski.pl\ launcher

read -srp "Press enter to close"
