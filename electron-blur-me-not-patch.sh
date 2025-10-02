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
ln -fnsv '{{launcher}}' '{{target}}'

# shellcheck disable=SC2288 # that is just a template placeholder
if '{{has_desktop_file_condition}}' && [ -e '{{desktop_file}}' ]; then
  # Modify desktop entry so it points to the launcher script
  sed -i -E -e 's#^(Exec)=\S+#\1={{launcher}}#' '{{desktop_file}}'
fi
