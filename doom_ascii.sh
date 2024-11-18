#!/bin/sh

trap 'printf "\033[0m"' EXIT

cd /usr/lib/doom_ascii || exit 1
/usr/share/bin/doom_ascii.bin "$@"
