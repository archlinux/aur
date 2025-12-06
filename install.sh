#!/usr/bin/env bash
set -e

PREFIX="${PREFIX:-/usr/local}"
DESTDIR="${DESTDIR:-}"

install -Dm755 kanshi-menu.sh "${DESTDIR}${PREFIX}/bin/kanshi-menu"
install -Dm644 waybar.include "${DESTDIR}${PREFIX}/share/kanshi-menu/waybar.include"

echo "Installed kanshi-menu to ${DESTDIR}${PREFIX}/bin/kanshi-menu"
echo "Waybar config snippet available at ${DESTDIR}${PREFIX}/share/kanshi-menu/waybar.include"
