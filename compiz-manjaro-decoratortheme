#!/bin/bash
gsettings reset org.gnome.desktop.wm.preferences theme

if [ -f /usr/bin/xfconf-query ] && [ "$(xfconf-query -c xsettings -p /Net/ThemeName)" == "Menda" ]; then
	gsettings set org.gnome.desktop.wm.preferences theme "Menda"
fi

mkdir -p ~/.config/autostart
rm ~/.config/autostart/compiz-manjaro-decoratortheme.desktop
cp /etc/xdg/autostart/compiz-manjaro-decoratortheme.desktop ~/.config/autostart/
sed -i 's|Hidden=false|Hidden=true|' ~/.config/autostart/compiz-manjaro-decoratortheme.desktop
