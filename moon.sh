#!/usr/bin/env sh

# Realtime check: if MOON_HOME is not set in the environment, default to ~/.moon
# This allows users to override MOON_HOME before invoking the launcher.
HOME=${HOME:-/root}
MOON_HOME=${MOON_HOME:-"$HOME/.moon"}
export MOON_HOME

# Ensure MOON_HOME exists (best-effort; warn if creation fails)
if [ ! -d "$MOON_HOME" ]; then
	mkdir -p "$MOON_HOME" 2>/dev/null || \
		printf '%s\n' "Warning: could not create MOON_HOME directory '$MOON_HOME'" >&2
fi

# Replace the shell with the runtime so signals are delivered directly and no extra
# wrapper process remains.
exec /usr/lib/moon "$@"
