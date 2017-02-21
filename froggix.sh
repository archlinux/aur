#!/bin/bash

GAMEDIR="/usr/share/froggix"
HOME_GAMEDIR="${HOME}/.froggix"

if [[ -d "${HOME_GAMEDIR}" ]]; then
  cd /usr/share/froggix
  python2 froggix.py "$@"
else
  mkdir "${HOME_GAMEDIR}"
  cp /usr/share/froggix/data/highscores.dat "${HOME_GAMEDIR}"
  cd /usr/share/froggix
  python2 froggix.py "$@"
fi
