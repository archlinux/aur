#!/bin/sh
export PATH="/opt/ampl:$PATH"
export AMPLKEY_RUNTIME_DIR="${AMPLKEY_RUNTIME_DIR:-$HOME/.ampl}"
export AMPL_LICFILE="${AMPL_LICFILE:-$AMPLKEY_RUNTIME_DIR/ampl.lic}"
mkdir -p "$AMPLKEY_RUNTIME_DIR"
[ -f "$AMPL_LICFILE" ] || cp /opt/ampl/ampl.lic "$AMPL_LICFILE"
exec "/opt/ampl/$(basename "$0")" "$@"