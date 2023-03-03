#!/bin/bash

set -eu -o pipefail

basename='{{basename}}'
flags_file="${XDG_CONFIG_HOME:-${HOME}/.config}/${basename}-flags.conf"
flags=()

if [[ ! -e "${flags_file}" ]]; then
  flags_file="/etc/${basename}-flags.conf"
fi

if [[ -e "${flags_file}" ]]; then
  while read -r flag; do
    if [[ "${flag}" != *(' ')'#'* ]]; then
      flags+=("${flag}")
    fi
  done < "${flags_file}"
fi

exec '{{executable}}' "${flags[@]}" "$@"
