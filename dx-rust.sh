#!/bin/bash
# Launcher for DX RUST (AUR: dx-rust-bin).
#
# DX RUST's Linux build is meant to be unpacked into a folder you own and run
# from there, so it may write settings and saves next to its own programs.
# That can't happen in /opt, so this script keeps a per-user copy of the
# game programs and runs them from there. The copy is refreshed after each
# package upgrade. If you or the game changed one of the shipped files, your
# copy is kept and the new version is put next to it as <name>.new.
#
# Usage:
#   dx-rust [options...]           start dxlauncher (game folder, display mode, Play)
#   dx-rust --dxview [options...]  start the game directly, e.g.
#                                  dx-rust --dxview ~/Games/DeusEx

# --- Paths: change these to move things around ---------------------------
GAME_DIR="/opt/dx-rust"   # packaged game programs (PKGBUILD sets this)
USER_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/dx-rust"   # per-user copy
# --------------------------------------------------------------------------

MANIFEST=".package-manifest"   # sha256sum list of the shipped files

set -euo pipefail

msg() { printf 'dx-rust: %s\n' "$*" >&2; }

# Print the ./relative paths listed in a sha256sum manifest.
manifest_paths() { sed 's/^[0-9a-f]\{64\}  //' "$1"; }

# Bring USER_DIR up to date with GAME_DIR if the package changed.
sync_game_files() {
    if cmp -s "$GAME_DIR/$MANIFEST" "$USER_DIR/$MANIFEST"; then
        return 0
    fi
    msg "copying the game programs to $USER_DIR"
    mkdir -p "$USER_DIR"
    cd "$USER_DIR"

    local f
    local -A changed=()
    if [[ -f "$MANIFEST" ]]; then
        # Shipped files that no longer match what was copied: you or the
        # game changed them, so they won't be overwritten.
        while IFS= read -r f; do
            changed["$f"]=1
        done < <(sha256sum --check --ignore-missing --quiet "$MANIFEST" 2>/dev/null \
                 | sed -n 's/: FAILED$//p')

        # Files the old version shipped and the new one doesn't: remove
        # them, unless they were changed.
        while IFS= read -r f; do
            [[ -n "${changed[$f]:-}" ]] || rm -f -- "$f"
        done < <(comm -23 <(manifest_paths "$MANIFEST" | sort) \
                          <(manifest_paths "$GAME_DIR/$MANIFEST" | sort))
    fi

    while IFS= read -r -d '' f; do
        mkdir -p -- "$(dirname -- "$f")"
        if [[ -n "${changed[$f]:-}" ]]; then
            cp -Pf --preserve=mode --reflink=auto -- "$GAME_DIR/$f" "$f.new"
            msg "kept your changed $f; the new version is $f.new"
        else
            cp -Pf --preserve=mode --reflink=auto -- "$GAME_DIR/$f" "$f"
        fi
    done < <(cd "$GAME_DIR" && find . -mindepth 1 \( -type f -o -type l \) \
                 ! -name "$MANIFEST" -print0)

    # Copied last, so an interrupted copy is redone on the next start.
    cp -f -- "$GAME_DIR/$MANIFEST" "$MANIFEST"
}

# Make relative paths absolute (e.g. a game folder for --dxview) before
# changing directory.
args=()
for a in "$@"; do
    if [[ "$a" != -* && "$a" != /* && -e "$a" ]]; then
        a="$(realpath -- "$a")"
    fi
    args+=("$a")
done

sync_game_files
cd "$USER_DIR"

if [[ "${args[0]:-}" == "--dxview" ]]; then
    exec ./dxview "${args[@]:1}"
fi
exec ./dxlauncher "${args[@]}"
