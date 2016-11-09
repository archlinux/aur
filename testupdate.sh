#!/bin/bash

source /usr/share/makepkg/util/message.sh
colorize

download_url="$(curl -s https://addons.mozilla.org/en-us/firefox/addon/https-everywhere/versions/|grep 'downloads/file'|tac|tee /dev/stderr|tail -1)"
file="$(echo "$download_url"|sed -r 's@.*file/([0-9]+)/.*@\1@g')"
version="$(echo "$download_url"|sed -r 's@.*https_everywhere-([0-9.]+)-.*@\1@g')"

msg2 "pkgver=$version"
msg2 "_file=$file"

if echo "$download_url"|grep -qs data-realurl; then
    error "Not yet reviewed"
fi
