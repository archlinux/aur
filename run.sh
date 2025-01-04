#!/usr/bin/bash

mkdir -p ~/.local/share/phira/data/
mkdir -p ~/.cache/phira/

if [ -d ~/.config/phira/data ]; then
  mv ~/.config/phira/data ~/.local/share/phira/data
fi

if [ -d ~/.config/phira/cache ]; then
  mv ~/.config/phira/cache ~/.cache/phira
fi

bwrap \
    --new-session \
    --dev-bind /run/dbus /run/dbus \
    --ro-bind / / \
    --ro-bind /run/user/$UID/bus /run/user/$UID/bus \
    --ro-bind /usr/lib/snapd-xdg-open/xdg-open /usr/bin/xdg-open \
    --ro-bind /sys /sys \
    --dev-bind /tmp /tmp \
    --proc /proc \
    --dev-bind /dev /dev \
    --tmpfs /usr/share/phira/ \
    --bind /usr/share/phira/phira-main /usr/share/phira/phira-main \
    --bind /usr/share/phira/assets/ /usr/share/phira/assets/ \
    --bind ~/.local/share/phira/data/ /usr/share/phira/data/ \
    --bind ~/.cache/phira/ /usr/share/phira/cache/ \
    /usr/share/phira/phira-main
