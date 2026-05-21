#!/bin/bash
# Copyright (c) 2024-2025 Jim Philip, with Reserved Package Name "vencord-hook"
# Copyright (c) 2022-2025 Vendicated and Vencord contributors, with Reserved Project Name "Vencord"

set -eo pipefail

echo_hook() {
	# echo -ne "\e[35mHOOK  \e[39m"
	echo -n "HOOK  "
	echo $@
}

err_handler() {
	echo_hook "An error occurred. If unresolvable, contact the package maintainer: https://aur.archlinux.org/packages/vencord-hook"
}
trap err_handler ERR

if [ -z "$SUDO_USER" ] && [ -z "$DOAS_USER" ]; then
	echo_hook "Using unsupported privilege escalation utility; Manually setting SUDO_USER."

	WEIRD_HELPERS=(pamac)

	for helper in "${WEIRD_HELPERS[@]}"; do
		user=$(ps -eo user:32,comm --no-headers | awk -v h="$helper" '$1 != "root" && $2 ~ ("^"h) {print $1; exit}')

		if [ -n "$user" ]; then
			break
		fi
	done

	if [ -z "$user" ]; then
		echo_hook "Failed to determine user. Please set SUDO_USER manually or use an officially supported package manager (e.g. 'pacman -S discord')."
		exit 1
	fi

	echo_hook "SUDO_USER=$user"
	export SUDO_USER="$user"
fi

if [ -z "$SUDO_HOME" ]; then
	SUDO_HOME=$(awk -F: '$1 == "$SUDO_USER" {print $6}' /etc/passwd)

	if [ -z "$SUDO_HOME" ]; then
		echo_hook "Failed to determine user home. Please set SUDO_HOME manually."
		exit 1
	fi
fi

while IFS= read -r package || [ -n "$package" ]; do
	branch=${package#discord}
	branch=${branch#-}
	branch=${branch:-stable}

	config=""

	case "$branch" in
		stable)
			config="discord"
		;;
		canary)
			config="discordcanary"
		;;
		ptb)
			config="discordptb"
		;;
		*)
			echo_hook "Unsupported branch: $branch"
			exit 1
		;;
	esac

	echo_hook "Installing Vencord for $branch branch..."
	vencordinstallercli -install -location $SUDO_HOME/.config/$config/app-*/ || {
		err_handler
		exit 1
	}
done
