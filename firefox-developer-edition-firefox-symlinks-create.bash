#!/bin/bash

if [[ ! -d /usr/lib/firefox ]]; then
  exit 0
fi

# Walk the /usr/lib/firefox hierarchy and symlink everything
exec find /usr/lib/firefox -type f \
  -exec bash -c '
    set -eu
    link="/usr/lib/firefox-developer-edition/${1#/usr/lib/firefox/}"
    mkdir -pv "$(dirname "${link}")"
    ln -s -v -T "$1" "${link}"
    ' _ '{}' ';'
