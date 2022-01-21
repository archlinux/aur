#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-${HOME}/.config}

if [[ -r "$XDG_CONFIG_HOME/whale-flags.conf" ]]; then
   WHALE_USER_FLAGS="$(cat "$XDG_CONFIG_HOME/whale-flags.conf")"
fi

exec /opt/naver/whale/naver-whale $WHALE_USER_FLAGS "$@"
