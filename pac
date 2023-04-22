#!/bin/bash
# set proxy for KDE
if command -v kwriteconfig5 >/dev/null 2>&1; then
    if [ "$1" == 'on' ]; then
        kwriteconfig5 --file $HOME/.config/kioslaverc --group "Proxy Settings" --key "ProxyType" 2
        kwriteconfig5 --file $HOME/.config/kioslaverc --group "Proxy Settings" --key "Proxy Config Script" "$2"
    elif [ "$1" == 'off' ]; then
        kwriteconfig5 --file $HOME/.config/kioslaverc --group "Proxy Settings" --key "ProxyType" 0
        kwriteconfig5 --file $HOME/.config/kioslaverc --group "Proxy Settings" --key "Proxy Config Script" "$2" ''
    else
        printf "Usage: %s [on  <pac url> | off [old pac url]]\n" $0
    fi
fi
# set proxy for GNOME
pac-real $@
