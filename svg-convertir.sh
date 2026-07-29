#!/usr/bin/env bash
#
# svg-convertir.sh — Rasteriza/convierte SVG (service menu de Dolphin).
#
# Uso: svg-convertir.sh <formato> svg1 [svg2 ...]
#   png  -> PNG (rasterizado al tamaño intrínseco del SVG)
#   pdf  -> PDF (vectorial, sin pérdida)
# Usa rsvg-convert (librsvg). Resultado junto al original, sin sobrescribir.

set -euo pipefail

TITULO="Convertir SVG"
err() { kdialog --title "$TITULO" --error "$1"; exit 1; }
ok()  { kdialog --title "$TITULO" --passivepopup "$1" 6 >/dev/null 2>&1 || true; }

command -v rsvg-convert >/dev/null \
    || err "Falta «rsvg-convert».\n\nInstálalo con:\n    sudo pacman -S librsvg"

(( $# >= 2 )) || err "Uso interno incorrecto del conversor de SVG."
fmt="$1"; shift
case "$fmt" in
    png) ext=png ;;
    pdf) ext=pdf ;;
    *) err "Formato de SVG desconocido: $fmt" ;;
esac

errf=$(mktemp)
trap 'rm -f "$errf"' EXIT
hechos=0
for f in "$@"; do
    [[ -f "$f" ]] || continue
    [[ "$f" == -* ]] && f="./$f"        # no confundir un nombre «-algo» con una opción
    d=$(dirname -- "$f"); s=$(basename -- "$f"); s="${s%.*}"
    out="$d/$s.$ext"; n=2
    while [[ -e "$out" ]]; do out="$d/$s-$n.$ext"; n=$((n + 1)); done
    if ! rsvg-convert -f "$fmt" -o "$out" "$f" 2>"$errf"; then
        rm -f "$out"
        err "No se pudo convertir «$(basename -- "$f")»:\n$(tail -2 "$errf" 2>/dev/null || echo 'error desconocido')"
    fi
    hechos=$((hechos + 1))
done

(( hechos > 0 )) || err "No se seleccionó ningún SVG válido."
ok "$hechos SVG convertido(s) a $fmt."
exit 0
