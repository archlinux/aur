#!/bin/sh
# Launcher for ico-pc-bin.
#
# ico-pc keeps ico-pc.ini and its logs folder beside the program, and looks
# there for a disc image (Ico_PAL.iso, Ico_USA.chd, ...). /opt is read-only for
# normal users, so this builds a per-user program folder instead: a copy of the
# ico_pc binary (the game finds "its" folder from the real path of the running
# binary, so a symlink would not do) plus symlinks to everything else in /opt.
# Saves and settings still go to ~/.local/share/ico-pc/ico-pc/ as upstream
# intends. Set ICO_PC_HOME to use a different program folder.

INSTALL_DIR="/opt/ico-pc"
GAME_DIR="${ICO_PC_HOME:-${XDG_DATA_HOME:-$HOME/.local/share}/ico-pc/game}"

set -e

mkdir -p "$GAME_DIR"

# Refresh the binary copy only when the packaged one has changed. Copy to a
# temporary name and rename, so a copy that is still running is not disturbed.
if ! cmp -s "$INSTALL_DIR/ico_pc" "$GAME_DIR/ico_pc"; then
    cp -f "$INSTALL_DIR/ico_pc" "$GAME_DIR/.ico_pc.new"
    chmod 755 "$GAME_DIR/.ico_pc.new"
    mv -f "$GAME_DIR/.ico_pc.new" "$GAME_DIR/ico_pc"
fi

# Remove links to files that a newer release no longer ships.
find "$GAME_DIR" -maxdepth 1 -xtype l -lname "$INSTALL_DIR/*" -delete

for src in "$INSTALL_DIR"/*; do
    [ -e "$src" ] || continue
    name=${src##*/}
    dst="$GAME_DIR/$name"
    case $name in
        ico_pc|logs|userdata)
            continue
            ;;
        ico-pc.ini)
            # The user's own settings file: copy it once, never overwrite it.
            [ -e "$dst" ] || cp "$src" "$dst"
            continue
            ;;
    esac
    # Never replace a real file or folder that the game or the user made.
    if [ -L "$dst" ] || [ ! -e "$dst" ]; then
        ln -sfn "$src" "$dst"
    fi
done

cd "$GAME_DIR"
exec "$GAME_DIR/ico_pc" "$@"
