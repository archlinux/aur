#!/usr/bin/env bash

IGNORE='ls cat'

mkdir -p lists

# Find package by name
get_package() (
	local f="lists/$2"
	[ -f "$f" ] && return 0

	for p in $IGNORE; do
		[ "$2" = "$p" ] && return 0
	done

	local expr
	printf -v expr '(^|/)bin/([a-z0-9_-]+/)?%s$' "$2"

	echo "$1" > "$f"
	pacman -Fqx "$expr" >> "$f"
)

# Get list of programs
programs="$(src/ctpv/deptable/list.awk src/ctpv/sh/prev/*)"

# Search for packages in parallel.
# Search only 3 each time (otherwise OS killes processes)
i=0
IFS=$'\n'
for p in $programs; do
	type="${p%%	*}"
	names="${p##*	}"

	IFS=' '
	for n in $names; do
		echo "Searching ${n} for ${type}..."

		get_package "$type" "$n" &
		(( i++ ))

		if [ "$i" -ge 5 ]; then
			wait
			i=0
		fi
	done
done

# Wait for all processes to finish
wait

# Create list of optdepends
./optlist.awk lists/* | sort > list.txt

# Insert the list into PKGBUILD
sed -i '
	/^optdepends=/,/^)/ {
		/^optdepends=/ {
			r list.txt
			b
		}
		/^)/b

		d
	}
' PKGBUILD

echo "Done!"
