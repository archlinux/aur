#!/bin/sh
# Copyright (c) 2018, Joe Davis <me@jo.ie>
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

set -e

AURDIR=${AURDIR:-$HOME/aur}
AUR_PATH=${AUR_PATH:-https://aur.archlinux.org/}

PROG=$(basename "$0")

usage() {
	printf 'USAGE: %s fetch [pkg...]\n' "$PROG" 2>&1
	printf '       %s update\n' "$PROG" 2>&1
	printf '       %s help\n' "$PROG" 2>&1
	exit $1
}

update() {
	printf "The following packages need updating: "
	none="none found"

	for pkg in $*; do
		out=$(cd "$pkg" && git pull)
		if [ "$out" != "Already up to date." ]; then
			none=''
			printf '\n  %s' "$pkg"
		fi
	done
	echo $none
}

fetch() {
	while [ $# -gt 0 ]; do
		git clone "${AUR_PATH}$1.git"
		shift
	done
}

if [ $# -eq 0 ]; then
	usage 1
fi

if [ "$1" = "help" ]; then
	usage 0
fi

cd "$AURDIR"

if [ "$1" = "fetch" ]; then
	shift
	if [ $# -eq 0 ]; then
		usage 1
	fi
	fetch $*
elif [ "$1" = "update" ]; then
	# Skip folders containing spaces, newlines and those beginning with '.'
	# This avoids problems with for loops over find output
	PKGS=$(find . -maxdepth 1 \
		! -name ".*" \
		! -name "* *" ! -name "$(printf "*\\n*")" \
		-type d)
	update $PKGS
else
	echo "Unknown command: $1" 2>&1
	usage
	exit 1
fi
