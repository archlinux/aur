#!/bin/sh
case $1 in
disable)
 sed -i 's:^Exec=fcitx-autostart$:Exec=/usr/share/imchooser/imchooser-helper fcitx:g' /etc/xdg/autostart/fcitx-autostart.desktop
;;
enable)
 sed -i 's:^Exec=/usr/share/imchooser/imchooser-helper fcitx:Exec=fcitx-autostart:g' /etc/xdg/autostart/fcitx-autostart.desktop
;;
fcitx)
 [[ "$XDG_SESSION_DESKTOP" == "KDE" ]] || /usr/bin/fcitx-autostart
;;
*)
 true
;;
esac