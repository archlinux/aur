#!/bin/sh
case $1 in
disable)
 match=$(cat /etc/xdg/autostart/fcitx-autostart.desktop | grep -o imchooser-helper)
 [[ z$match == zimchooser-helper ]] || sed -i 's:^Exec=[^\n]*$:Exec=/usr/share/imchooser/imchooser-helper fcitx:g' /etc/xdg/autostart/fcitx-autostart.desktop
;;
enable)
 sed -i 's:^Exec=[^\n]*$:Exec=fcitx-autostart:g' /etc/xdg/autostart/fcitx-autostart.desktop
;;
fcitx)
 [[ "$XDG_SESSION_DESKTOP" == "KDE" ]] || /usr/bin/fcitx-autostart
;;
*)
 true
;;
esac