#!/usr/bin/env bash
# Warn when a system library update has left KeeperFX unable to start.
#
# Most of the engine's libraries are declared in the PKGBUILD as sonames, so
# pacman refuses an ABI-breaking upgrade before it can happen. Six of them --
# sdl3, sdl3_mixer, sdl3_image, luajit, minizip, libnatpmp -- publish no soname
# in provides= at all, and the launcher's Qt and OpenSSL are named the same
# way, so for those there is nothing for pacman to compare and nothing to
# refuse.
#
# This cannot prevent the breakage: a binary can only be tested against the new
# libraries once they are installed, which is after the upgrade. What it does
# is turn "the game stopped working at some point last week and I have no idea
# why" into a message at the moment it breaks, naming the fix.
#
# Called with no arguments it checks the installed binaries. Any arguments are
# treated as binaries to check instead, which is how it is tested.
set -uo pipefail

warn_if_broken() {
    local binary=$1 label=$2 missing

    # Not installed, or not something we can inspect.
    [ -x "$binary" ] || return 0

    missing=$(ldd "$binary" 2>/dev/null | awk '/not found/ { print $1 }' | sort -u | paste -sd', ' -)
    [ -n "$missing" ] || return 0

    printf '\n'
    printf '  %s can no longer start: a library it needs has changed.\n' "$label"
    printf '    missing: %s\n' "$missing"
    printf '\n'
    printf '    Rebuild it against the libraries now on your system:\n'
    printf '      paru -S keeperfx-tux        (or: yay -S keeperfx-tux)\n'
    printf '\n'
    printf '    This is normal on a rolling release: the library was replaced by\n'
    printf '    a newer, incompatible one and KeeperFX has to be built again.\n'
}

if [ "$#" -gt 0 ]; then
    for binary in "$@"; do
        warn_if_broken "$binary" "$binary"
    done
else
    warn_if_broken /usr/lib/keeperfx-tux/keeperfx             "KeeperFX"
    warn_if_broken /usr/lib/keeperfx-tux/keeperfx-launcher-qt "The KeeperFX launcher"
fi

# Always succeed. The upgrade has already been applied, so failing here would
# only stack a pacman error on top of a message the user can already act on.
exit 0
