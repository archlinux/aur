#!/usr/bin/bash
if [ ! -d ~/.config/phira/cache/ ]; then mkdir -p ~/.config/phira/cache/ ; fi
if [ ! -d ~/.config/phira/data/ ]; then mkdir -p ~/.config/phira/data/ ; fi
bwrap \
    --bind / / \
    --ro-bind /run/user/$UID/bus /run/user/$UID/bus \
    --ro-bind /usr/lib/snapd-xdg-open/xdg-open /usr/bin/xdg-open \
    --ro-bind /sys /sys \
    --tmpfs /tmp \
    --proc /proc \
    --dev /dev \
    --tmpfs /usr/share/phira/ \
    --bind /usr/share/phira/phira-main /usr/share/phira/phira-main \
    --bind /usr/share/phira/assets/ /usr/share/phira/assets/ \
    --bind ~/.config/phira/data/ /usr/share/phira/data/ \
    --bind ~/.config/phira/cache/ /usr/share/phira/cache/ \
    --unshare-all \
    --share-net \
    --new-session \
    /usr/share/phira/phira-main
