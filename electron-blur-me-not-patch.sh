#!/bin/bash

# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

if [[ ! -e '{{launcher}}' ]]; then
  echo >&2 'Not modifying {{target}} because {{launcher}} is not installed.'
  exit 0
fi

if [[ ! -L '{{target}}' ]]; then
  echo >&2 'Moving {{target}} out of the way so we can create a symlink.'
  mkdir -pv "$(dirname '{{backup}}')"
  mv -fv '{{target}}' '{{backup}}'
fi

# Create or modify symlink so it points to the launcher script
exec ln -fnsv '{{launcher}}' '{{target}}'
