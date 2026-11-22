#!/bin/sh
# Proton runs inside a container that does not see the host's /usr, so the
# .exe has to live somewhere under the user's home before it is handed over.
src=/usr/lib/ed-up/ed-up-launcher.exe
dst=${XDG_CACHE_HOME:-$HOME/.cache}/ed-up/ed-up-launcher.exe
if ! cmp -s "$src" "$dst"; then
    mkdir -p "${dst%/*}" && cp --reflink=auto "$src" "$dst.tmp" && mv "$dst.tmp" "$dst" || exit 1
fi
exec python3 /usr/lib/ed-up/ed-up-launcher-linux.py --launcher-exe "$dst" "$@"
