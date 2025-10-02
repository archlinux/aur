#!/bin/bash

# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

if [[ ! -e '{{executable}}' ]]; then
  echo >&2 'Not modifying {{target}} because {{executable}} is not installed.'
  exit 0
fi

if [[ ! -L '{{target}}' ]]; then
  echo >&2 'Not modifying {{target}} because it is not a symlink.'
  exit 0
fi

# shellcheck disable=SC2193 # these are just template placeholders
if [[ '{{executable}}' == *'/{{pkgname}}/'* ]]; then
  # Move original executable back into place
  mv -fv '{{executable}}' '{{target}}'
  rmdir -pv --ignore-fail-on-non-empty "$(dirname '{{executable}}')"
else
  # Modify symlink so it points to the original executable
  echo >&2 'Restoring original {{target}}'
  ln -fnsv '{{executable}}' '{{target}}'
fi

# shellcheck disable=SC2288 # that is just a template placeholder
if '{{has_desktop_file_condition}}' && [ -e '{{desktop_file}}' ]; then
  # Modify desktop entry so it points to the original executable
  sed -i -E -e 's#^(Exec)=\S+#\1={{executable}}#' '{{desktop_file}}'
fi
