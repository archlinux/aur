#!/bin/bash

set -e

. /usr/share/makepkg/util/message.sh && colorize

eval "$(LANG= xargs pacman -Qo 2> /dev/null | awk '
{
	files[$5][i++] = $1;
}; END {
	printf "packages=(";
	for (pkg in files)
		printf pkg " ";
	print ")";

	for (pkg in files) {
		printf "files_" pkg "=(";
		for (i in files[pkg])
			printf files[pkg][i] " ";
		print ")";
	}
}
')"

nl=1
for package in ${packages[@]}; do
	[ "$nl" ] && unset nl || echo
	msg "$package:"
	var="files_$package[@]"
	echo "${!var}" | while read -r file; do
		service="${file##*/}"
		msg2 "$service"
	done
done
