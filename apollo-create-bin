#!/bin/sh
set -e

[ -z "$1" ] && {
	echo "Error: broker name is required"
	exit 1
}

echo $1 | grep -q '/' && {
	echo "Error: invalid broker name"
	exit 1
}

TARGET="$(realpath -m "/var/lib/apollo/$1" )"

[ "${TARGET:0:16}" != "/var/lib/apollo/" ] && {
	echo "Error: invalid broker name"
	exit 1
}

[ -d "$TARGET" -o -d "/etc/apollo/$1" ] && {
	echo "Error: directory already exists"
	exit 1
}

apollo create "$TARGET" > /dev/null

rm -rf "$TARGET/bin" "$TARGET/log"

[ ! -d /etc/apollo ] && install -dm0755 /etc/apollo

mv "$TARGET/etc" "/etc/apollo/$1"
ln -s "/etc/apollo/$1" "$TARGET/etc"

[ ! -d "/var/log/apollo/$1" ] && install -dm0755 "/var/log/apollo/$1"

ln -s "/var/log/apollo/$1" "$TARGET/log"
