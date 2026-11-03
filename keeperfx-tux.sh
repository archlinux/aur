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
# Packaged entries INSIDE a merged directory that the user is meant to write into,
# so they must be real directories rather than symlinks to the read-only package.
#
# The merge above fixed this one level up -- linking campgns/ and levels/ whole made
# them root-owned and add-on installs impossible -- but the same trap remained one
# level down. levels/personal is where the launcher installs a standalone workshop
# map, and its own readme calls it "your personal folder to do with as you see fit";
# levels/legacy is the same kind of drop folder. Linked to /usr they are read-only,
# so installing a single map failed on every package install.
USER_DROP_DIRS=(levels/personal levels/legacy)

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

# Make way for the link to a packaged entry. The AppImage deploys its whole payload
# into this same directory as real files, so a player who ran it before installing
# the package already has a copy of every packaged file here. Those copies used to
# count as the player's own and were never replaced: one install played the 1.4.0.6013
# alpha on the AppImage's graphics from August (22 sprite sheets, fonts and textures)
# and an August keeporig.cfg. The package's copy wins, as it does when the AppImage
# updates itself. A byte-identical copy is replaced; anything else is moved aside,
# never deleted. The player's own Dungeon Keeper files are never in the way: the
# package ships none of them (REQUIRED_DATA, REQUIRED_SOUND below).
#
# Someone who alternates between the AppImage and the package gets the AppImage's
# copies back on every switch, so a copy identical to one already moved aside on an
# earlier run is not kept twice.
#
# Never fatal: it runs on every start, and a directory it cannot write to (an
# AppImage run with sudo), a stash path that is not a directory, or a second
# wrapper racing this one must not stop the game from starting. When it cannot
# clear the way it returns 1, the old copy stays in use as it did before this
# existed, and a count goes to stderr at the end.
moved=0
stuck=0
STASH_ROOT="$GAMEDIR/.replaced-by-package"
STASH=""
_same_file() {
    [ -f "$1" ] && [ -f "$2" ] &&
        [ "$(stat -c %s "$1")" = "$(stat -Lc %s "$2")" ] &&
        [ "$({ sha256sum < "$1"; } 2>/dev/null)" = "$({ sha256sum < "$2"; } 2>/dev/null)" ]
}
_clear_for_link() {
    local target=$1 packaged=$2 rel old
    if [ -L "$target" ] || [ ! -e "$target" ]; then
        return 0
    fi
    rel=${target#"$GAMEDIR"/}
    for old in "$packaged" "$STASH_ROOT"/*/"$rel"; do
        if _same_file "$target" "$old"; then
            rm -f "$target" 2>/dev/null
            break
        fi
    done
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        if [ -z "$STASH" ]; then
            STASH="$STASH_ROOT/$(date +%Y%m%d-%H%M%S)"
            mkdir -p "$STASH" 2>/dev/null &&
                printf '%s\n' \
                    "KeeperFX Tux Edition moved these here: an earlier install, usually the" \
                    "AppImage, had left them in the game directory, where they hid the files" \
                    "the package ships. The game no longer reads them. Delete this folder" \
                    "whenever you like." > "$STASH/README.txt" 2>/dev/null
        fi
        mkdir -p "$STASH/$(dirname "$rel")" 2>/dev/null &&
            mv -n "$target" "$STASH/$rel" 2>/dev/null &&
            [ ! -e "$target" ] && [ ! -L "$target" ] &&
            moved=$((moved + 1))
    fi
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        stuck=$((stuck + 1))
        return 1
    fi
    return 0
}

mkdir -p "$GAMEDIR"/{save,scrshots}

for d in "${RO_DIRS[@]}"; do
    src=$(_src_for "$d") || true
    [ -n "$src" ] || continue
    if _clear_for_link "$GAMEDIR/$d" "$src"; then
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
    # them. Whatever stands where a packaged file goes is an earlier install's copy
    # and makes way (_clear_for_link).
    for f in "$src"/*; do
        [ -e "$f" ] || continue
        base=$(basename "$f")
        target="$GAMEDIR/$d/$base"
        # A drop folder must be the user's own directory, not a link into /usr, or
        # nothing can ever be installed into it. Seed it with whatever the package
        # ships (a readme) and never clobber what the user put there afterwards.
        case " ${USER_DROP_DIRS[*]} " in
            *" $d/$base "*)
                if [ -L "$target" ]; then
                    rm -f "$target"          # removing a link never touches /usr
                fi
                mkdir -p "$target"
                cp -rn "$f/." "$target/" 2>/dev/null || true
                continue
                ;;
        esac
        if _clear_for_link "$target" "$f"; then
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

if [ "$moved" -gt 0 ]; then
    echo "keeperfx-tux: moved $moved file(s) or folder(s) that an earlier install left in" \
         "$GAMEDIR, and that differ from the packaged game, to $STASH" >&2
fi
if [ "$stuck" -gt 0 ]; then
    echo "keeperfx-tux: $stuck file(s) or folder(s) in $GAMEDIR hide the packaged game's" \
         "copies and could not be moved out of the way; the game keeps using them" >&2
fi

ln -sfn "$BINDIR/keeperfx" "$GAMEDIR/keeperfx"
[ -e "$PREFIX/version.txt" ] && cp -f "$PREFIX/version.txt" "$GAMEDIR/version.txt"

# The engine will not start without keeperfx.cfg. Seed it once from the packaged
# template and then leave it alone: it holds the user's graphics and sound
# settings, so an upgrade must never overwrite it.
if [ ! -e "$GAMEDIR/keeperfx.cfg" ] && [ -e "$PREFIX/keeperfx.cfg" ]; then
    cp "$PREFIX/keeperfx.cfg" "$GAMEDIR/keeperfx.cfg"
    chmod u+w "$GAMEDIR/keeperfx.cfg"
fi

# The launcher's wrapper (keeperfx-tux-launcher.sh) runs this far and no further.
# It needs the directory assembled -- the engine link above, above all, which is
# how the launcher tells KeeperFX is installed -- but not the checks below:
# copying in the missing Dungeon Keeper files is what the launcher is for.
if [ "${KEEPERFX_TUX_ASSEMBLE_ONLY:-0}" = 1 ]; then
    exit 0
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
