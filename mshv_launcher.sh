#!/bin/sh

# This is a launcher script provided by the `mshv` package. 
# Copying the files is necessary, because MSHV can only work 
# with configs and files in the same directory as the executable.

pkgname="mshv"
WORKDIR="${WORKDIR:-"$HOME/.local/share/$pkgname"}"

if [ ! -d "$WORKDIR" ]; then
	cp -r "/usr/share/$pkgname" "$WORKDIR"
fi

# There was an update.
if ! cmp -s "/usr/bin/${pkgname}_bin" "$WORKDIR/mshv"; then
	cp "/usr/bin/${pkgname}_bin" "$WORKDIR/mshv"
fi

"$WORKDIR/mshv" "$@"
