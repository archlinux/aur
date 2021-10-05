#!/bin/sh sh
find \
	/etc/modules-load.d \
	/run/modules-load.d \
	/usr/lib/modules-load.d \
	-name '*.conf' \
| while read -r file; do
	grep -v "^#" "$file" | xargs modprobe
done
