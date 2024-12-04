#!/bin/bash

. /usr/share/makepkg/util/message.sh && colorize

set -Eeo pipefail

LANG= xargs pacman -Qo 2> /dev/null | awk '
{
	files[$5][i++] = $1;
}; END {
	for (pkg in files) {
		printf "%s", pkg;
		for (i in files[pkg])
			printf " %s", files[pkg][i];
		print "";
	}
}
' | while read -r package units; do
	[[ ! "${nl}" ]] && nl=1 || echo
	msg "${package}:"
	for unit in "${units}"; do
		msg2 "${unit##*/}"
	done
done
