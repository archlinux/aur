#!/bin/bash

[ ! -d $HOME/.pgmodeler ] && cp -r /etc/pgmodeler $HOME/.pgmodeler

PGMODELER_ROOT="/opt/pgmodeler"

export PGMODELER_SCHEMAS_DIR="$PGMODELER_ROOT/schemas"
export PGMODELER_LANG_DIR="$PGMODELER_ROOT/lang"
export PGMODELER_PLUGINS_DIR="$PGMODELER_ROOT/plugins"
export PGMODELER_CONF_DIR="$HOME/.pgmodeler"
export PGMODELER_TMP_DIR="/tmp"

export PGMODELER_CHANDLER_PATH="$PGMODELER_ROOT/pgmodeler-ch"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"$PGMODELER_ROOT"

"$PGMODELER_ROOT/pgmodeler-cli" "$@" &
