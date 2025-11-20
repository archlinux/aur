#!/bin/sh

NAME=@appname@
ELECTRON=electron@electronversion@
ELECTRON_RUN=@runname@
USER_FLAGS_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/@cfgdirname@-flags.conf"

if [ -f "${USER_FLAGS_FILE}" ]; then
  USER_FLAGS="$(cat "${USER_FLAGS_FILE}" | sed 's/#.*//' | tr '\n' ' ')"
fi

exec ${ELECTRON} /usr/lib/${NAME}/${ELECTRON_RUN} @options@ ${USER_FLAGS} "$@"
