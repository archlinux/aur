#!/bin/bash

# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

set -eu

EXPECTED_URL_SCHEME='de.rewe.app'

url="${1:-}"

if [[ -z "${url}" ]]; then
  notify-send -a "$0" -c 'network.error' 'korb' \
    'Expected an URL but got none.'
  exit 1
fi

if [[ "${url}" != "${EXPECTED_URL_SCHEME}:"* ]]; then
  notify-send -a "$0" -c 'network.error' 'korb' \
    "Expected a \`${EXPECTED_URL_SCHEME}:\` URL but got: \`${url}\`"
  exit 1
fi

if ! {
  xclip -selection clipboard || xsel --clipboard || wl-copy;
} 2>/dev/null
then
  tmpfile="$(
    mktemp -p "${XDG_RUNTIME_DIR:-/tmp}" "${EXPECTED_URL_SCHEME}.XXXXXXXX.txt"
  )"
  printf '%s' "${url}" >> "${tmpfile}"
  notify-send -a "$0" 'korb' \
    "Unable to write to clipboard. URL written to: ${tmpfile}"
  exit 1
fi < <(printf '%s' "${url}")

notify-send -a "$0" -c 'network.success' 'korb' \
  "URL copied to clipboard. Paste it into your \`korb\` CLI."
