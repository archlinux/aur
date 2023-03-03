#!/bin/bash

if [[ ! -e '{{launcher}}' ]]; then
  echo >&2 'Not modifying {{target}} because {{launcher}} is not installed.'
  exit 0
fi

if [[ ! -L '{{target}}' ]]; then
  echo >&2 'Not modifying {{target}} because it is not a symlink.'
  exit 0
fi

# Modify symlink so it points to the launcher script
exec ln -fnsv '{{launcher}}' '{{target}}'
