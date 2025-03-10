#!/bin/sh
# Copyright (c) 2024-2025 Jim Philip, with Reserved Package Name "vencord-hook"
# Copyright (c) 2022-2025 Vendicated and Vencord contributors, with Reserved Project Name "Vencord"

set -e

installer=$(mktemp /tmp/vencord.XXXXXX)
trap 'rm -f "$installer"' EXIT

curl -sSL https://github.com/Vendicated/VencordInstaller/releases/latest/download/VencordInstallerCli-Linux \
	--output "$installer"

chmod +x "$installer"

while IFS= read -r package || [ -n "$package" ]; do
	branch=${package#discord}
	branch=${branch#-}

	if [[ -z $branch ]]; then
		branch="stable"
	fi

	"$installer" -install -branch "$branch"
done
