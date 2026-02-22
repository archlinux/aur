#!/bin/sh
exec env NEOMOD_EXTERNAL_UPDATE_PROVIDER=1 "$HOME/.local/share/neomod/neomod" "$@"
