#!/usr/bin/env bash
#
# img-a-pdf.sh — Convierte una o varias imágenes en un único PDF (sin pérdida).
#
# Uso: img-a-pdf.sh imagen1 [imagen2 ...]
# Usa img2pdf, que conserva la calidad original (incrusta los JPEG tal cual).
# Las imágenes se ordenan de forma natural por nombre (img1, img2, … img10).
# Nombre del PDF:  1 imagen -> <nombre>.pdf ;  varias -> <nombre1>_y_otras.pdf.

set -euo pipefail

TITULO="Imágenes a PDF"
err() { kdialog --title "$TITULO" --error "$1"; exit 1; }
ok()  { kdialog --title "$TITULO" --passivepopup "$1" 6 >/dev/null 2>&1 || true; }

command -v img2pdf >/dev/null \
    || err "Falta «img2pdf».\n\nInstálalo con:\n    sudo pacman -S img2pdf"

(( $# >= 1 )) || err "Selecciona al menos una imagen."

# Orden natural por ruta.
mapfile -t imgs < <(printf '%s\n' "$@" | sort -V)

# No confundir un nombre «-algo» con una opción de img2pdf.
for i in "${!imgs[@]}"; do [[ "${imgs[i]}" == -* ]] && imgs[i]="./${imgs[i]}"; done

dir=$(dirname -- "${imgs[0]}")
stem=$(basename -- "${imgs[0]}"); stem="${stem%.*}"
if (( ${#imgs[@]} == 1 )); then base="$stem"; else base="${stem}_y_otras"; fi

out="$dir/$base.pdf"; n=2
while [[ -e "$out" ]]; do out="$dir/$base-$n.pdf"; n=$((n + 1)); done

errf=$(mktemp)
trap 'rm -f "$errf"' EXIT
if ! img2pdf "${imgs[@]}" -o "$out" 2>"$errf"; then
    rm -f "$out"
    err "No se pudo crear el PDF:\n$(tail -3 "$errf" 2>/dev/null || echo 'error desconocido')"
fi

ok "PDF creado a partir de ${#imgs[@]} imagen(es):\n$(basename -- "$out")"
exit 0
