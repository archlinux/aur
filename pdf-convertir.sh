#!/usr/bin/env bash
#
# pdf-convertir.sh — Convierte un PDF a otros formatos (service menu de Dolphin).
#
# Uso: pdf-convertir.sh <modo> archivo.pdf
#   imagenes  -> una imagen (PNG/JPG) por página, en una subcarpeta
#   texto     -> extrae el texto a un .txt
#   comprimir -> reduce el tamaño con ghostscript
#   ocr       -> añade una capa de texto buscable (OCR) con ocrmypdf
#
# Errores: kdialog --error. Avisos de éxito con popup pasivo (no intrusivo).

set -euo pipefail

TITULO="Convertir PDF"
err()  { kdialog --title "$TITULO" --error "$1"; exit 1; }
ok()   { kdialog --title "$TITULO" --passivepopup "$1" 6 >/dev/null 2>&1 || true; }
need() { command -v "$1" >/dev/null || err "Falta la herramienta «$1».\n\nInstálala con:\n    sudo pacman -S $2"; }

errf=$(mktemp)
trap 'rm -f "$errf"' EXIT

(( $# == 2 )) || err "Uso interno incorrecto del script de conversión."
modo="$1"
file="$2"
[[ -f "$file" ]] || err "El archivo no existe:\n$file"
[[ "$file" == -* ]] && file="./$file"   # no confundir un nombre «-algo» con una opción

dir=$(dirname -- "$file")
stem=$(basename -- "$file" .pdf)

# Imprime una ruta libre «<base>.<ext>», añadiendo -2, -3… si ya existe.
salida_libre() {
    local base="$1" ext="$2" out="$1.$2" n=2
    while [[ -e "$out" ]]; do out="${base}-${n}.${ext}"; n=$((n + 1)); done
    printf '%s' "$out"
}

case "$modo" in
    imagenes)
        total=$(pdfinfo "$file" 2>/dev/null | awk '/^Pages:/ {print $2}') || true
        [[ "$total" =~ ^[0-9]+$ ]] || err "No se pudo leer el PDF (¿dañado o cifrado?):\n$stem.pdf"
        sel=$(kdialog --title "$TITULO" --combobox "Formato y resolución de salida:" \
            "PNG · 150 ppp (calidad media)" \
            "PNG · 300 ppp (alta calidad)" \
            "JPG · 150 ppp (más ligero)" \
            "JPG · 300 ppp") || exit 0
        case "$sel" in
            PNG*150*) flag=-png;  fmt=png; dpi=150 ;;
            PNG*300*) flag=-png;  fmt=png; dpi=300 ;;
            JPG*150*) flag=-jpeg; fmt=jpg; dpi=150 ;;
            JPG*300*) flag=-jpeg; fmt=jpg; dpi=300 ;;
            *) exit 0 ;;
        esac
        outdir="$dir/$stem-imagenes"; n=2
        while [[ -e "$outdir" ]]; do outdir="$dir/$stem-imagenes-$n"; n=$((n + 1)); done
        mkdir -p "$outdir"
        if ! pdftoppm "$flag" -r "$dpi" "$file" "$outdir/$stem" 2>"$errf"; then
            rm -rf "$outdir"
            err "No se pudo convertir a imágenes:\n$(cat "$errf" 2>/dev/null || echo 'error desconocido')"
        fi
        num=$(find "$outdir" -maxdepth 1 -type f -name "*.$fmt" | wc -l)
        ok "$num imágenes ($fmt) creadas en:\n$(basename -- "$outdir")/"
        ;;

    texto)
        out=$(salida_libre "$dir/$stem" txt)
        if ! pdftotext "$file" "$out" 2>"$errf"; then
            err "No se pudo extraer el texto:\n$(cat "$errf" 2>/dev/null || echo 'error desconocido')"
        fi
        ok "Texto extraído en:\n$(basename -- "$out")"
        ;;

    comprimir)
        need gs ghostscript
        sel=$(kdialog --title "$TITULO" --combobox "Nivel de compresión:" \
            "ebook · equilibrado (recomendado)" \
            "screen · máxima compresión" \
            "printer · alta calidad") || exit 0
        case "$sel" in
            ebook*)   nivel=/ebook ;;
            screen*)  nivel=/screen ;;
            printer*) nivel=/printer ;;
            *) exit 0 ;;
        esac
        out=$(salida_libre "$dir/$stem-comprimido" pdf)
        if ! gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS="$nivel" \
                -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$out" "$file" 2>"$errf"; then
            rm -f "$out"
            err "No se pudo comprimir el PDF:\n$(cat "$errf" 2>/dev/null || echo 'error desconocido')"
        fi
        antes=$(stat -c%s "$file"); despues=$(stat -c%s "$out")
        if (( despues < antes )); then
            ok "PDF comprimido ($(( 100 - despues * 100 / antes ))% más pequeño):\n$(basename -- "$out")"
        else
            rm -f "$out"
            ok "El PDF ya estaba optimizado; no se generó ninguna copia."
        fi
        ;;

    ocr)
        command -v ocrmypdf >/dev/null \
            || err "Falta «ocrmypdf» (está en AUR, no en los repos oficiales).\n\nInstálalo con:\n    yay -S ocrmypdf"
        # Idioma por defecto: español (tesseract-data-spa). Para otros idiomas,
        # instala tesseract-data-<idioma> y cambia «-l spa» abajo (p. ej. spa+eng).
        out=$(salida_libre "$dir/$stem-ocr" pdf)
        if ! ocrmypdf --skip-text -l spa "$file" "$out" 2>"$errf"; then
            rm -f "$out"
            err "No se pudo aplicar OCR:\n$(tail -3 "$errf" 2>/dev/null || echo 'error desconocido')"
        fi
        ok "OCR aplicado (texto buscable):\n$(basename -- "$out")"
        ;;

    *)
        err "Modo de conversión desconocido: $modo"
        ;;
esac

exit 0
