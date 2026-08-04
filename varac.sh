#!/bin/bash
set -e

INST_DIR="/usr/share/varac"
USER_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/varac"

mkdir -p "$USER_DIR"

sync_file() {
    local name="$1"
    local src="$INST_DIR/$name"
    local dst="$USER_DIR/$name"

    if [[ ! -f "$dst" ]] || [[ "$src" -nt "$dst" ]]; then
        cp -a "$src" "$dst"
    fi
}

for f in License.txt PSKReporter.dll VarAC.exe VarAC_cat_commands.ini VarAC_templates.ini VarAC_UI_languages.ini; do
    sync_file "$f"
done

cd "$USER_DIR"
exec wine VarAC.exe "$@"
