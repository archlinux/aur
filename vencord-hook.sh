#!/bin/bash
# Copyright (c) 2024-2025 Jim Philip, with Reserved Package Name "vencord-hook"
# Copyright (c) 2022-2025 Vendicated and Vencord contributors, with Reserved Project Name "Vencord"

set -euo pipefail

echo_hook() {
	# echo -ne "\e[35mHOOK  \e[39m"
	echo -n "HOOK  "
	echo $@
}

err_handler() {
	echo_hook "An error occurred. If unresolvable, contact the package maintainer: https://aur.archlinux.org/packages/vencord-hook"
}
trap err_handler ERR

installer=$(mktemp /tmp/vencord-hook.XXXXXX)
cleanup() {
	rm -f "$installer"
}
trap cleanup EXIT

curl -fsSLo "$installer" \
	https://github.com/Vendicated/VencordInstaller/releases/latest/download/VencordInstallerCli-Linux \
|| {
	err_handler
	exit 1
}

chmod +x "$installer"

while IFS= read -r package || [ -n "$package" ]; do
	branch=${package#discord}
	branch=${branch#-}
	branch=${branch:-stable}

	echo_hook "Installing Vencord for $branch branch..."
	"$installer" -install -branch "$branch" || {
		err_handler
		exit 1
	}
done
