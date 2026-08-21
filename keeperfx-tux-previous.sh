#!/usr/bin/env bash
# Play a saved game that the current KeeperFX can no longer open.
#
# A saved game is a raw dump of the engine's `struct Game`, so any field added
# anywhere inside it makes every earlier save unreadable -- the bytes are
# intact, they simply mean something different to the newer engine. When that
# happens the game says so instead of quitting, but the campaign still needs the
# engine that wrote it. The upgrade hook keeps the last few engines for exactly
# this; this command runs one.
#
# It builds a completely separate game directory per version. That is the whole
# safety property: the old engine writes old-format files, so it must never be
# pointed at the live install. Nothing here writes anywhere under
# $KEEPERFX_HOME -- data is copied out of it, never into it.
#
#   keeperfx-tux-previous              list the versions available
#   keeperfx-tux-previous <version>    set it up if needed, then play
#   keeperfx-tux-previous --forget <v> delete a prepared directory
set -uo pipefail

STASH_DIR=${KEEPERFX_STASH_DIR:-/var/lib/keeperfx-tux/previous}
LIVE=${KEEPERFX_HOME:-$HOME/.local/share/keeperfx-alpha}
PREV_HOME=${KEEPERFX_PREV_HOME:-$HOME/.local/share/keeperfx-previous}

die() { printf '%s\n' "$*" >&2; exit 1; }

list_versions() {
    find "$STASH_DIR" -maxdepth 1 -name 'keeperfx-*' -type f -printf '%f\n' 2>/dev/null \
      | sed 's/^keeperfx-//' | sort -V
}

# The build number recorded inside a save file. The version fields sit in the
# INFO chunk as four little-endian shorts: major, minor, release, build. Major/
# minor/release are 1/4/0, so that six-byte run locates them, and the build is
# the two bytes after it. Reading the file beats trusting a filename.
save_build() {
    local file=$1 off
    off=$(head -c 4096 -- "$file" 2>/dev/null \
          | grep -aboP '\x01\x00\x04\x00\x00\x00' 2>/dev/null | head -1 | cut -d: -f1)
    [ -n "$off" ] || return 1
    od -An -tu2 -j "$((off + 6))" -N 2 -- "$file" 2>/dev/null | tr -d ' \n'
}

prepare() {
    local version=$1 engine=$2 dest=$3 count=0 build name

    printf 'Preparing KeeperFX %s ...\n' "$version"
    mkdir -p -- "$dest" || die "cannot create $dest"

    # Copy the game tree without the save directory or logs. --copy-links
    # matters: since the move to a pacman package most of the live directory is
    # symlinks into /usr, and without dereferencing them this would write
    # through the links into the installed package rather than into a copy.
    #
    # The WHOLE save directory is excluded, not just *.sav. It also holds
    # fx1contn.sav -- the "Continue" pointer, which names a campaign and level
    # from the current game. Carried over, Continue here would try to resume a
    # save this engine cannot read, which is precisely the confusion this
    # command exists to end. Everything this install should have in save/ is put
    # there deliberately below.
    rsync -a --copy-links --exclude '/save/' --exclude 'keeperfx.log' \
          -- "$LIVE/" "$dest/" || die "could not copy the game directory"

    rm -f -- "$dest/keeperfx"
    cp -- "$engine" "$dest/keeperfx" || die "could not install the $version engine"
    chmod 755 -- "$dest/keeperfx"

    mkdir -p -- "$dest/save"
    # Only saves this engine could plausibly read. A save written by a LATER
    # build is never readable by an earlier engine, and listing ones that cannot
    # open is how this gets confusing -- the point of coming here is the
    # campaign that would not load. Older saves may still be refused, and the
    # engine says so clearly if they are.
    shopt -s nullglob
    for save in "$LIVE"/save/fx1g*.sav; do
        build=$(save_build "$save") || continue
        [ -n "$build" ] || continue
        [ "$build" -le "${version##*.}" ] 2>/dev/null || continue
        # Renumber into contiguous slots. Copying slot numbers across would leave
        # UNUSED gaps at the top of the list for every save left behind.
        name=$(printf 'fx1g%04d.sav' "$count")
        cp -- "$save" "$dest/save/$name" || continue
        count=$((count + 1))
    done
    shopt -u nullglob

    if [ "$count" -eq 0 ]; then
        printf '  No saved games predate this version, so its list will be empty.\n'
    else
        printf '  Copied %d saved game(s) this version can read.\n' "$count"
    fi
    printf '  Its saves live in %s/save and are separate from your current game.\n' "$dest"
}

case "${1-}" in
  --forget)
      [ -n "${2-}" ] || die "usage: keeperfx-tux-previous --forget <version>"
      rm -rf -- "${PREV_HOME:?}/${2:?}"
      printf 'Removed %s/%s\n' "$PREV_HOME" "$2"
      exit 0
      ;;
  -h|--help)
      sed -n '2,20p' "$0" | sed 's/^# \{0,1\}//'
      exit 0
      ;;
esac

versions=$(list_versions)
[ -n "$versions" ] || die "No previous KeeperFX versions are kept yet.
One is preserved automatically each time the game is upgraded."

if [ "$#" -eq 0 ]; then
    printf 'Previous KeeperFX versions available:\n'
    printf '  %s\n' $versions
    printf '\nPlay one with:  keeperfx-tux-previous <version>\n'
    exit 0
fi

version=$1
engine="$STASH_DIR/keeperfx-$version"
[ -f "$engine" ] || die "KeeperFX $version is not among the kept versions:
$(printf '  %s\n' $versions)"

[ -d "$LIVE" ] || die "cannot find the current game directory: $LIVE"

dest="$PREV_HOME/$version"
[ -x "$dest/keeperfx" ] || prepare "$version" "$engine" "$dest"

cd -- "$dest" || die "cannot enter $dest"
exec ./keeperfx "${@:2}"
