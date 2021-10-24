#!/bin/bash

if [[ ! -d /usr/lib/firefox-developer-edition ]]; then
  exit 0
fi

# Remove all existing symlinks that point to /usr/lib/firefox
exec find /usr/lib/firefox-developer-edition -type l \
  -exec bash -c '
    set -eu
    target="$(readlink -m "$1")"
    if [[ "${target}" == /usr/lib/firefox/* ]]; then
      rm -v "$1"
    fi
    ' _ '{}' ';'
