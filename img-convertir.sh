#!/usr/bin/env bash
#
# img-convertir.sh — Convierte imágenes a otro formato (service menu de Dolphin).
#
# Uso: img-convertir.sh <formato> imagen1 [imagen2 ...]
#   formato: jpg | png | webp | avif | tiff
# Convierte cada imagen seleccionada y deja el resultado junto al original sin
# sobrescribir (añade -2, -3…). Admite HEIC/HEIF de entrada (fotos de móvil;
# requiere el delegado libheif en ImageMagick).

set -euo pipefail

TITULO="Convertir imagen"
err() { kdialog --title "$TITULO" --error "$1"; exit 1; }
ok()  { kdialog --title "$TITULO" --passivepopup "$1" 6 >/dev/null 2>&1 || true; }

IM=$(command -v magick || command -v convert || true)
[[ -n "$IM" ]] || err "Falta ImageMagick.\n\nInstálalo con:\n    sudo pacman -S imagemagick"

(( $# >= 2 )) || err "Uso interno incorrecto del conversor de imágenes."
fmt="$1"; shift
case "$fmt" in
    jpg)  ext=jpg;  opts=(-background white -flatten -quality 92) ;;
    png)  ext=png;  opts=() ;;
    webp) ext=webp; opts=(-quality 90) ;;
    avif) ext=avif; opts=(-quality 55) ;;
    tiff) ext=tiff; opts=(-compress zip) ;;
    *) err "Formato de imagen desconocido: $fmt" ;;
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
    # «[0]»: si la entrada tiene varios fotogramas/páginas (GIF animado, TIFF
    # multipágina) toma solo el primero, para no generar salida-0, salida-1…
    if ! "$IM" "${f}[0]" "${opts[@]}" "$out" 2>"$errf"; then
        rm -f "$out"
        err "No se pudo convertir «$(basename -- "$f")»:\n$(tail -2 "$errf" 2>/dev/null || echo 'error desconocido')"
    fi
    hechos=$((hechos + 1))
done

(( hechos > 0 )) || err "No se seleccionó ninguna imagen válida."
ok "$hechos imagen(es) convertida(s) a $fmt."
exit 0
