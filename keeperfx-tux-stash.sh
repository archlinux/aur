#!/usr/bin/env bash
# Keep the outgoing engine binary when KeeperFX is upgraded, so saved games
# written by it stay playable.
#
# Why this is needed: a saved game is a raw dump of the engine's `struct Game`,
# so adding a single field anywhere inside it invalidates every save in
# existence. That is not a rare event -- an upstream merge added one 4-byte
# field to `struct Thing`, and because the engine holds 12288 of them,
# sizeof(struct Game) moved 53269285 -> 53318509 and five saved campaigns
# stopped loading. `packaging/ci/check-save-format.sh` now catches that before a
# release ships, and the engine reports it instead of quitting, but neither
# gives the player their campaign back.
#
# The old engine can: running it against the CURRENT data tree loads its own
# saves correctly (verified -- the 5488 engine read saves from builds 5391, 5452
# and 5488 while using a much newer data tree). So only the ~28MB binary has to
# be kept, not the 1.7GB of game data.
#
# PreTransaction is not a choice: once pacman has replaced the file the old
# binary is gone. This runs while it is still on disk.
#
# Called with no arguments it stashes the installed engine. `--prune-only` and
# `--purge` are the other modes; a fourth argument form exists for testing, see
# the argument handling at the bottom.
set -uo pipefail

# Three generations. One would not be enough: the oldest save this was built for
# came from four releases back, and a player who skips an update would be left
# with nothing to open it. Each generation costs about 28MB.
KEEP=${KEEPERFX_STASH_KEEP:-3}

STASH_DIR=${KEEPERFX_STASH_DIR:-/var/lib/keeperfx-tux/previous}
ENGINE=${KEEPERFX_ENGINE:-/usr/lib/keeperfx-tux/keeperfx}

# The version pacman still has recorded for the package being replaced. pacman
# is by definition present here, which `strings` (binutils) is not.
#
# KEEPERFX_STASH_VERSION overrides it. That exists so this can be exercised
# without a real pacman transaction -- the same reason keeperfx-tux-libcheck.sh
# accepts binaries as arguments.
installed_version() {
    if [ -n "${KEEPERFX_STASH_VERSION-}" ]; then
        printf '%s\n' "$KEEPERFX_STASH_VERSION"
        return 0
    fi
    pacman -Q keeperfx-tux 2>/dev/null | awk '{ print $2 }' | cut -d- -f1
}

prune() {
    local keep=$1 count victim
    # Version sort, newest last, so the oldest fall off the front.
    count=$(find "$STASH_DIR" -maxdepth 1 -name 'keeperfx-*' -type f 2>/dev/null | wc -l)
    [ "$count" -gt "$keep" ] || return 0
    find "$STASH_DIR" -maxdepth 1 -name 'keeperfx-*' -type f -printf '%f\n' 2>/dev/null \
      | sort -V | head -n "$((count - keep))" \
      | while read -r victim; do
            rm -f -- "$STASH_DIR/$victim"
        done
}

stash() {
    local version target

    # Nothing to preserve: a fresh install rather than an upgrade.
    [ -f "$ENGINE" ] || return 0

    version=$(installed_version)
    if [ -z "$version" ]; then
        # Without a version there is no name to file it under, and guessing one
        # risks overwriting a good stash. Say so rather than failing the upgrade.
        printf '  KeeperFX: could not determine the installed version; not keeping a copy of the old engine.\n' >&2
        return 0
    fi

    target="$STASH_DIR/keeperfx-$version"
    # Already stashed -- a reinstall of the same version, not an upgrade.
    [ -e "$target" ] && return 0

    mkdir -p "$STASH_DIR" || return 0
    # Copy rather than move: the file being replaced still belongs to pacman
    # until the transaction completes, and moving it out from under pacman would
    # make the upgrade's own file operations fail.
    if cp -f -- "$ENGINE" "$target.partial" 2>/dev/null && mv -f -- "$target.partial" "$target"; then
        chmod 755 -- "$target" 2>/dev/null
        printf '  KeeperFX: kept version %s, so its saved games stay playable (keeperfx-tux-previous).\n' "$version"
    else
        rm -f -- "$target.partial"
        printf '  KeeperFX: could not keep a copy of the old engine in %s.\n' "$STASH_DIR" >&2
    fi

    prune "$KEEP"
}

case "${1-}" in
    --purge)
        # Package removal: leaving orphaned engine binaries behind after an
        # uninstall would be litter the user never asked for and cannot find.
        rm -rf -- "$STASH_DIR"
        rmdir --ignore-fail-on-non-empty -- "$(dirname "$STASH_DIR")" 2>/dev/null
        ;;
    --prune-only)
        prune "$KEEP"
        ;;
    *)
        stash
        ;;
esac

# Never fail the transaction. Not keeping an old engine is a lost convenience;
# blocking someone's upgrade over it would be worse than the problem.
exit 0
