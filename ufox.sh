#!/bin/bash

_UFOX_PATH="/usr/share/userFirefox"
_UFOX_CFG="$HOME/.local/share/userFirefox"

set -e

if [[ ! -d "$_UFOX_CFG" ]]; then
	mkdir -p "$_UFOX_CFG"
fi

if [[ ! -v "UFOX_CFG" ]]; then
	UFOX_CFG="$_UFOX_CFG/config.yml"
fi

if [[ ! -f "$UFOX_CFG" ]]; then
	cp "$_UFOX_PATH/config.yml" "$UFOX_CFG"
fi

UFOX_CFG="$UFOX_CFG" "$_UFOX_PATH/ufox.py" "$@"
