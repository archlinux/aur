#!/bin/bash

GAMEDIR="/usr/share/sdlpop"
HOME_GAMEDIR="${HOME}/.SDLPoP"

if [[ -d "${HOME_GAMEDIR}" ]]; then
  cd "${HOME_GAMEDIR}"
  /usr/lib/sdlpop/prince "$@"
else
  mkdir "${HOME_GAMEDIR}"
  cd "${HOME_GAMEDIR}"
  ln -s "${GAMEDIR}/data"
  ln -s "${GAMEDIR}/doc"
  ln -s "${GAMEDIR}/mods"
  ln -s "${GAMEDIR}/SDLPoP.ini"
  /usr/lib/sdlpop/prince "$@"
fi
