#!/bin/bash

# For mpvcut.hook: Install/upgrade/remove mpvcut-for all user with /home directory.

#Install
if [ -d "/etc/skel/.config/mpv/scripts/mpvcut" ]; then
    for user_home in /home/*; do
        if [ -d "$user_home" ]; then
            username=$(basename "$user_home")
            if id "$username" &>/dev/null; then
                mkdir -p "$user_home/.config/mpv/scripts/"
                cp -r /etc/skel/.config/mpv/scripts/mpvcut "$user_home/.config/mpv/scripts/"
            fi
        fi
    done
else
    # Remove
    for user_home in /home/*; do
        if [ -d "$user_home" ]; then
            username=$(basename "$user_home")
            if id "$username" &>/dev/null; then
                rm -rf "$user_home/.config/mpv/scripts/mpvcut"
            fi
        fi
    done
fi
