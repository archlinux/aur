#!/bin/bash
if [ -f ~/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml ] && [ "$(grep 'Menda' ~/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml)" != "" ]; then
	gconftool-2 -s /apps/metacity/general/theme -t string Menda
elif [ -f ~/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml ] && [ "$(grep 'Adwaita-Manjaro-dark' ~/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml)" != "" ]; then
	gconftool-2 -s /apps/metacity/general/theme -t string Adwaita-Manjaro-dark
else
	gconftool-2 -s /apps/metacity/general/theme -t string compiz-xfce-greybird
fi

gconftool-2 -s /apps/metacity/general/titlebar_uses_system_font -t bool true

gconftool-2 -s /apps/metacity/general/button_layout -t string ":minimize,maximize,close"

mkdir -p ~/.config/autostart
rm ~/.config/autostart/compiz-xfce-decoratortheme.desktop
cp /etc/xdg/autostart/compiz-xfce-decoratortheme.desktop ~/.config/autostart/
sed -i 's|Hidden=false|Hidden=true|' ~/.config/autostart/compiz-xfce-decoratortheme.desktop
