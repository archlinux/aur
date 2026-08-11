#!/bin/bash

# For mpvcut.hook: Install/update mpvcut for all user.

for user_home in /home/*; do
    if [ -d "$user_home" ]; then
        username=$(basename "$user_home")
        if id "$username" >/dev/null 2>&1; then
            mkdir -p "$user_home/.config/mpv/scripts/"
            cp -r /etc/skel/.config/mpv/scripts/mpvcut "$user_home/.config/mpv/scripts/"
        fi
    fi
done
