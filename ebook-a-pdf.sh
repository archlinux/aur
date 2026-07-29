#!/usr/bin/env bash
#
# ebook-a-pdf.sh — Convierte libros electrónicos a PDF (service menu de Dolphin).
#
# Uso: ebook-a-pdf.sh ebook1 [ebook2 ...]
#   Acepta EPUB, MOBI, AZW/AZW3, FB2… (lo que admita Calibre).
# Usa «ebook-convert» de Calibre. Resultado junto al original, sin sobrescribir.
# Los libros grandes pueden tardar.

set -euo pipefail

TITULO="Convertir libro a PDF"
err() { kdialog --title "$TITULO" --error "$1"; exit 1; }
ok()  { kdialog --title "$TITULO" --passivepopup "$1" 6 >/dev/null 2>&1 || true; }

command -v ebook-convert >/dev/null \
    || err "Falta «ebook-convert» (Calibre).\n\nInstálalo con:\n    sudo pacman -S calibre"

(( $# >= 1 )) || err "Selecciona al menos un libro electrónico."

errf=$(mktemp)
trap 'rm -f "$errf"' EXIT
ok "Convirtiendo a PDF… los libros grandes pueden tardar."
hechos=0
for f in "$@"; do
    [[ -f "$f" ]] || continue
    [[ "$f" == -* ]] && f="./$f"        # no confundir un nombre «-algo» con una opción
    d=$(dirname -- "$f"); s=$(basename -- "$f"); s="${s%.*}"
    out="$d/$s.pdf"; n=2
    while [[ -e "$out" ]]; do out="$d/$s-$n.pdf"; n=$((n + 1)); done
    if ! ebook-convert "$f" "$out" >/dev/null 2>"$errf"; then
        rm -f "$out"
        err "No se pudo convertir «$(basename -- "$f")»:\n$(tail -3 "$errf" 2>/dev/null || echo 'error desconocido')"
    fi
    hechos=$((hechos + 1))
done

(( hechos > 0 )) || err "No se seleccionó ningún libro válido."
ok "$hechos libro(s) convertido(s) a PDF."
exit 0
