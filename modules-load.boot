#!/bin/sh sh
for d in /etc/modules-load.d /run/modules-load.d /usr/lib/modules-load.d; do
	[ -d "$d" ] || continue
	find "$d" -name '*.conf' \
	| while read -r file; do
		grep -v "^#" "$file" | xargs modprobe -a
	done
done
