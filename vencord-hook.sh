#!/bin/sh
# Copyright (c) 2024-2025 Jim Philip, with Reserved Package Name "vencord-hook"
# Copyright (c) 2022-2025 Vendicated and Vencord contributors, with Reserved Project Name "Vencord"

set -e

err_handler() {
	echo "an error occurred, please contact the package maintainer: https://aur.archlinux.org/packages/vencord-hook"
}
trap err_handler ERR

installer=$(mktemp /tmp/vencord.XXXXXX)
trap 'rm -f "$installer"' EXIT

curl -sSL https://github.com/Vendicated/VencordInstaller/releases/latest/download/VencordInstallerCli-Linux \
	--output "$installer"

chmod +x "$installer"

while IFS= read -r package || [ -n "$package" ]; do
	branch=$(echo "$package" | sed 's/^discord-*//')

	if [ -z "$branch" ]; then
		branch="stable"
	fi

	echo "Installing Vencord for $branch branch..."
	"$installer" -install -branch "$branch" || {
		echo "Falling back to auto branch..."
		"$installer" -install -branch auto
	}
done
