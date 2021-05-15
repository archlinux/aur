#!/bin/bash

_ble_base_package_type=AUR

function ble/base/package:AUR/version_check {
	 LC_ALL=C pacman -Qi blesh-git | sed -n 's/^Version\s*:\s*//p'
}

function ble/base/package:AUR/update {
	local PKGNAME="blesh-git"
	PRE_VERSION="$(ble/base/package:AUR/version_check)"
	# Try to use an AUR helper
	local helper_exit
	(
		# Check for common AUR helpers
		for helper in yay paru pacaur pikaur pakku aura yaourt; do
			type -P &>/dev/null "$helper" && {
				echo "Found helper: $helper"
				exec "$helper" -S "$PKGNAME"
			}
		done
		# Did not exec into a helper
		exit 1
	) 
	helper_exit="$?"

	# Don't start """manual""" build process if user pressed ^C.
	local makepkg_exit
	if (("$helper_exit" != 0 && "$helper_exit" != 130 )); then
		# Try to build from scratch
		(
			echo >&2 'AUR helper failed or not found.'
			LOCALR="$HOME/.cache/blesh-update"
			echo >&2 'Trying set up a build environment at' "$LOCALR"
			AURREPO="https://aur.archlinux.org/${PKGNAME}.git"
	
			set -ex
			[[ -w "${LOCALR%/*}" ]]
			mkdir -p "$LOCALR" && cd "$LOCALR"
			git clone "$AURREPO" || [ "$(cd "$PKGNAME" && git remote get-url origin)" = "$AURREPO" ]
			cd "$PKGNAME"
			git pull
			exec makepkg -fsi
		) && return 0
		makepkg_exit="$?"
	else
		makepkg_exit="$helper_exit"
	fi

	POST_VERSION="$(ble/base/package:AUR/version_check)"

	# TODO: make AUR helpers not build already up-to-date packages:
	# (could be used to check for makepkg (1) exit code 13)
	# [ "$makepkg_exit" -eq 13 ] && return 6
	[[ "$PRE_VERSION" = "$POST_VERSION" ]] && return 6
	(($makepkg_exit==0)) && return 0 
	# Just return 1 if we reached this point
	return 1
}
