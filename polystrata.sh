#!/bin/sh
# Launcher for the polystrata AUR package.
#
# PolyStrata builds its engine, keeps its venv and stores its models (tens of
# GB) next to its own source files, all without root, so the read-only tree
# under /opt is copied into the user's home on the first run (and refreshed
# when the package is updated). Everything after that is upstream's own
# setup.sh: first run installs and starts the server, later runs just start.
SRC=/opt/polystrata
DEST="${POLYSTRATA_HOME:-$HOME/PolyStrata}"
VERSION='@@PKGVER@@-@@PKGREL@@'

if [ "$(cat "$DEST/.aur-version" 2>/dev/null)" != "$VERSION" ]; then
	if [ -e "$DEST" ] && [ ! -f "$DEST/.aur-version" ]; then
		echo "warning: $DEST exists but was not created by the polystrata" >&2
		echo "warning: package; it is left alone. Remove it or set POLYSTRATA_HOME." >&2
	elif [ -e "$DEST" ] && [ ! -e "$DEST/setup.sh" ]; then
		echo "error: $DEST exists and does not look like a PolyStrata directory." >&2
		exit 1
	else
		mkdir -p "$DEST"
		cp -a "$SRC/." "$DEST/"
		printf '%s\n' "$VERSION" > "$DEST/.aur-version"
	fi
fi

cd "$DEST" || exit 1
if [ "${0##*/}" = polystrata-update ]; then
	exec ./setup.sh --update "$@"
fi
exec ./setup.sh "$@"
