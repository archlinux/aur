#!/usr/bin/env bash
# Launcher shim for the packaged KeeperFX Tux Edition.
#
# The engine roots every path it touches at the directory of argv[0] (see
# process_command_line() in src/main.cpp), and it writes save games, screenshots,
# keeperfx.cfg and keeperfx.log into that same directory. A read-only /usr prefix
# therefore cannot be the runtime directory. This shim assembles a per-user game
# directory that links back to the packaged payload, then execs the engine through
# a path inside it so the engine roots itself there.
set -euo pipefail

BINDIR=/usr/lib/keeperfx-tux                # the engine ELF
PREFIX=/usr/share/keeperfx-tux              # engine package's config trees
DATA_PREFIX=/usr/share/keeperfx-tux-data    # data package (a dependency)
GAMEDIR="${KEEPERFX_HOME:-${XDG_DATA_HOME:-$HOME/.local/share}/keeperfx-alpha}"

# Read-only trees, linked wholesale. The data package's copies are preferred: they
# are supersets of the engine package's (which ships only the text config), and
# since 1.4.0.5273 the release archive carries freshly-overlaid config, so there is
# no staleness to work around -- the two are byte-identical at the same tag.
RO_DIRS=(lang fxdata creatrs ldata multiplayer)
# The user drops their own Dungeon Keeper files into these alongside ours, so they
# must be real directories. Packaged files are linked in individually.
#
# campgns and levels are here rather than in RO_DIRS because add-ons land in them.
# Linked as whole directories they resolved to root-owned /usr trees, so the
# launcher's Workshop and Mod Manager could not write a campaign or map pack into
# them at all -- "Install" failed on a package install and could never succeed.
# Merged, the directory itself is the user's and each packaged campaign is a
# symlink inside it, so downloaded content simply sits alongside.
MERGE_DIRS=(data sound campgns levels)
# User-owned: seeded once, never clobbered afterwards.
RW_DIRS=(mods music)

# Files the user must supply from their own Dungeon Keeper installation.
# Kept in step with docs/files_required_from_original_dk.txt.
REQUIRED_DATA=(bluepal.dat bluepall.dat dogpal.pal hitpall.dat lightng.pal
               redpal.col redpall.dat slab0-0.dat slab0-1.dat vampal.pal whitepal.col)
REQUIRED_SOUND=(atmos1.sbk atmos2.sbk bullfrog.sbk)

# Resolve a tree to whichever prefix provides it, data package winning.
_src_for() {
    local d=$1
    if [ -d "$DATA_PREFIX/$d" ]; then echo "$DATA_PREFIX/$d"
    elif [ -d "$PREFIX/$d" ];  then echo "$PREFIX/$d"
    fi
}

mkdir -p "$GAMEDIR"/{save,scrshots}

for d in "${RO_DIRS[@]}"; do
    src=$(_src_for "$d") || true
    [ -n "$src" ] || continue
    # Only replace our own symlink; never delete a real directory the user made.
    if [ -L "$GAMEDIR/$d" ] || [ ! -e "$GAMEDIR/$d" ]; then
        ln -sfn "$src" "$GAMEDIR/$d"
    fi
done

for d in "${MERGE_DIRS[@]}"; do
    src=$(_src_for "$d") || true
    [ -n "$src" ] || continue
    # Migration: campgns and levels used to be linked as whole directories, which
    # made them read-only /usr trees. Replace such a link with a real directory --
    # removing a symlink never touches what it points at, and the loop below links
    # the packaged content straight back in.
    if [ -L "$GAMEDIR/$d" ]; then
        rm -f "$GAMEDIR/$d"
    fi
    mkdir -p "$GAMEDIR/$d"
    # Link each packaged file individually so the user's own files can sit beside
    # them. A real file already in place always wins and is left untouched.
    for f in "$src"/*; do
        [ -e "$f" ] || continue
        target="$GAMEDIR/$d/$(basename "$f")"
        if [ -L "$target" ] || [ ! -e "$target" ]; then
            ln -sfn "$f" "$target"
        fi
    done
done

for d in "${RW_DIRS[@]}"; do
    src=$(_src_for "$d") || true
    [ -n "$src" ] || continue
    mkdir -p "$GAMEDIR/$d"
    cp -rn "$src/." "$GAMEDIR/$d/" 2>/dev/null || true
done

ln -sfn "$BINDIR/keeperfx" "$GAMEDIR/keeperfx"
[ -e "$PREFIX/version.txt" ] && cp -f "$PREFIX/version.txt" "$GAMEDIR/version.txt"

# The engine will not start without keeperfx.cfg. Seed it once from the packaged
# template and then leave it alone: it holds the user's graphics and sound
# settings, so an upgrade must never overwrite it.
if [ ! -e "$GAMEDIR/keeperfx.cfg" ] && [ -e "$PREFIX/keeperfx.cfg" ]; then
    cp "$PREFIX/keeperfx.cfg" "$GAMEDIR/keeperfx.cfg"
    chmod u+w "$GAMEDIR/keeperfx.cfg"
fi

# Report what is missing in terms of what the user has to do about it, rather than
# as an empty directory.
missing_data=(); missing_sound=()
for f in "${REQUIRED_DATA[@]}";  do [ -e "$GAMEDIR/data/$f" ]  || missing_data+=("$f");  done
for f in "${REQUIRED_SOUND[@]}"; do [ -e "$GAMEDIR/sound/$f" ] || missing_sound+=("$f"); done
have_base=1
[ -e "$GAMEDIR/data/creature.jty" ] || have_base=0

if [ "$have_base" = 0 ]; then
    cat >&2 <<EOF
KeeperFX cannot start: the game data is missing.

  Game directory: $GAMEDIR

The keeperfx-tux-data package normally provides this and is installed
automatically; if it was removed, reinstall it:

  yay -S keeperfx-tux-data

Or supply a data tree yourself — the launcher will fetch and assemble one:
  https://github.com/ForkedInTime/keeperfx-launcher-qt-linux

Or point at an existing installation:
  ln -s /path/to/install/data  "$GAMEDIR/data"
  ln -s /path/to/install/sound "$GAMEDIR/sound"
EOF
    exit 1
fi

if [ ${#missing_data[@]} -gt 0 ] || [ ${#missing_sound[@]} -gt 0 ]; then
    cat >&2 <<EOF
KeeperFX cannot start: files from the original Dungeon Keeper are missing.

  Game directory: $GAMEDIR

These come from your own copy of the game (GOG, Steam, EA or the original CD) and
cannot be distributed with KeeperFX. Copy them in, preserving the names:

EOF
    for f in ${missing_data[@]+"${missing_data[@]}"};  do echo "  $GAMEDIR/data/$f"  >&2; done
    for f in ${missing_sound[@]+"${missing_sound[@]}"}; do echo "  $GAMEDIR/sound/$f" >&2; done
    cat >&2 <<EOF

The Qt launcher can locate a Dungeon Keeper installation and copy these for you:
  https://github.com/ForkedInTime/keeperfx-launcher-qt-linux
EOF
    exit 1
fi

# exec through the game directory so argv[0] -- and therefore the engine's
# runtime directory -- is the game directory rather than a read-only prefix.
cd "$GAMEDIR"
exec "$GAMEDIR/keeperfx" "$@"
