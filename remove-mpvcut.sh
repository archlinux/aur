#!/bin/bash

# For mpvcut.hook: Remove mpvcut for all user.

echo "Remove mpvcut for all user..."

for user_home in /home/*; do
    if [ -d "$user_home" ]; then
        username=$(basename "$user_home")
        if id "$username" >/dev/null 2>&1; then
            if [ -d "$user_home/.config/mpv/scripts/mpvcut" ]; then
                rm -rf "$user_home/.config/mpv/scripts/mpvcut"
                echo "  Entfernt: $user_home/.config/mpv/scripts/mpvcut"
            fi
        fi
    fi
done

echo "Done!"
