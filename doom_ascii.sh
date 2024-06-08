#!/bin/sh

trap 'printf "\033[0m"' EXIT

cd /opt/doom_ascii || exit 1
./doom_ascii "$@"
