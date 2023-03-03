#!/bin/bash

if [[ ! -e '{{executable}}' ]]; then
  echo >&2 'Not modifying {{target}} because {{executable}} is not installed.'
  exit 0
fi

if [[ ! -L '{{target}}' ]]; then
  echo >&2 'Not modifying {{target}} because it is not a symlink.'
  exit 0
fi

# Modify symlink so it points to the original executable
echo >&2 'Restoring original {{target}}'
exec ln -fnsv '{{executable}}' '{{target}}'
