#!/usr/bin/bash
echo "Checking for GNOME Shell version update"

installed_version=$(pacman -Qi gnome-shell | grep "^Version" | sed -E 's/^.*:.*:(.*)-.*$/\1/')
echo "Installed: $installed_version"

nvchecker_config=/usr/share/notify-gnome-shell-update/gnome-shell-archpkg.toml
released_version=$(nvchecker --file="$nvchecker_config" --logger=json | jq '.version' | sed -E 's/^"(.*)"$/\1/')

if [[ $released_version == null$'\n'null ]]; then
  released_version="Unknown"
fi

echo "Released: $released_version"

if [[ $released_version != $installed_version ]] && [[ $released_version != "Unknown" ]]; then
  notify-send "New GNOME Version" "GNOME $released_version is now available on Arch"
fi
