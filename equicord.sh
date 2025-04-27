#!/bin/sh
# Copyright (c) 2024-2025 Jim Philip, with Reserved Package Name "equicord-hook"
# Copyright (c) 2024-2025 Equicord contributors, with Reserved Project Name "Equicord"

set -e

err_handler() {
    echo "An error occurred, please contact the package maintainer: https://aur.archlinux.org/packages/equicord-hook"
}
trap err_handler ERR

installer=$(mktemp /tmp/equicord.XXXXXX)
trap 'rm -f "$installer"' EXIT

curl -sSL https://github.com/Equicord/Installer/releases/latest/download/EquilotlCli-linux \
    --output "$installer"

chmod +x "$installer"

while IFS= read -r package || [ -n "$package" ]; do
    branch=$(echo "$package" | sed 's/^discord-*//')

    if [ -z "$branch" ]; then
        branch="stable"
    fi

    echo "Installing Equicord for $branch branch..."
    "$installer" -install -branch "$branch" || {
        echo "Falling back to auto branch..."
        "$installer" -install -branch auto
    }
done

