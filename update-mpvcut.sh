#!/bin/bash

# Copy mpvcut-for all user with /home directory.

for user_home in /home/*; do
    if [ -d "$user_home" ]; then
        username=$(basename "$user_home")

        if id "$username" &>/dev/null; then
            mkdir -p "$user_home/.config/mpv/scripts/"
            cp -r /etc/skel/.config/mpv/scripts/mpvcut "$user_home/.config/mpv/scripts/"
            chown -R "$username:$username" "$user_home/.config/mpv/scripts/mpvcut"
        fi
    fi
done
