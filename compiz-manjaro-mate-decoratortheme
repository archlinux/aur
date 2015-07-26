#!/bin/bash
gsettings set org.gnome.desktop.wm.preferences theme $(gsettings get org.mate.interface gtk-theme | sed "s/'//g")

mkdir -p ~/.config/autostart
rm ~/.config/autostart/compiz-manjaro-mate-decoratortheme.desktop
cp /etc/xdg/autostart/compiz-manjaro-mate-decoratortheme.desktop ~/.config/autostart/
sed -i 's|Hidden=false|Hidden=true|' ~/.config/autostart/compiz-manjaro-mate-decoratortheme.desktop
