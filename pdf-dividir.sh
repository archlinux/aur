#!/usr/bin/env bash
#
# pdf-dividir.sh — Divide un PDF en varios (service menu de Dolphin / KF6).
#
# Uso: pdf-dividir.sh <modo> archivo.pdf
#   modo = paginas  -> cada página en su propio archivo
#   modo = rango    -> pide un rango (ej. 3-7) y extrae solo esas páginas
#   modo = bloques  -> pide N y parte en trozos de N páginas
#
# Salida: subcarpeta «<original>-dividido/» junto al original, con archivos
#         <original>-1.pdf, <original>-2.pdf, …
#
# Errores: kdialog --error y aborta (limpiando la carpeta a medias).

set -euo pipefail

TITULO="Dividir PDF"
err()    { kdialog --title "$TITULO" --error "$1"; exit 1; }
ok()     { kdialog --title "$TITULO" --passivepopup "$1" 6 >/dev/null 2>&1 || true; }

errf=$(mktemp)
trap 'rm -f "$errf"' EXIT

(( $# == 2 )) || err "Uso interno incorrecto del script de división."
modo="$1"
file="$2"

[[ -f "$file" ]] || err "El archivo no existe:\n$file"
[[ "$file" == -* ]] && file="./$file"   # no confundir un nombre «-algo» con una opción

dir=$(dirname -- "$file")
stem=$(basename -- "$file" .pdf)

# Nº total de páginas (poppler).
total=$(pdfinfo "$file" 2>/dev/null | awk '/^Pages:/ {print $2}') || true
[[ "$total" =~ ^[0-9]+$ ]] || err "No se pudo leer el PDF (¿está dañado o cifrado?):\n$stem.pdf"

# Carpeta de salida sin colisiones.
outdir="$dir/$stem-dividido"
n=2
while [[ -e "$outdir" ]]; do outdir="$dir/$stem-dividido-$n"; n=$((n + 1)); done
mkdir -p "$outdir"

fail()   { rm -rf "$outdir"; err "$1"; }   # limpia la carpeta a medias
cancel() { rm -rf "$outdir"; exit 0; }     # el usuario canceló: sin error

# Recompone las páginas ini..fin (extraídas como tmp-pgN.pdf) en $1, y limpia.
unir_rango() {
    local destino="$1" ini="$2" fin="$3" p partes=()
    for ((p = ini; p <= fin; p++)); do partes+=("$outdir/tmp-pg$p.pdf"); done
    pdfunite "${partes[@]}" "$destino" 2>/dev/null || fail "No se pudo componer el resultado."
    rm -f "${partes[@]}"
}

case "$modo" in
    paginas)
        # pdfseparate nombra cada archivo con el número de página (1..total).
        if ! pdfseparate "$file" "$outdir/$stem-%d.pdf" 2>"$errf"; then
            fail "No se pudo dividir el PDF:\n$(cat "$errf" 2>/dev/null || echo 'error desconocido')"
        fi
        ok "$total archivos creados en:\n$(basename -- "$outdir")/"
        ;;

    rango)
        r=$(kdialog --title "$TITULO" \
            --inputbox "Páginas a extraer (de 1 a $total).\nEjemplos: 3-7  o  5" "") || cancel
        r="${r//[[:space:]]/}"
        if [[ "$r" =~ ^([0-9]+)-([0-9]+)$ ]]; then
            ini=${BASH_REMATCH[1]}; fin=${BASH_REMATCH[2]}
        elif [[ "$r" =~ ^([0-9]+)$ ]]; then
            ini=$r; fin=$r
        else
            fail "Rango no válido: «$r».\nUsa formato 3-7 o un solo número."
        fi
        (( ini >= 1 && fin <= total && ini <= fin )) \
            || fail "Rango fuera de los límites (1-$total): $ini-$fin"
        out="$outdir/$stem-${ini}_a_${fin}.pdf"
        if ! pdfseparate -f "$ini" -l "$fin" "$file" "$outdir/tmp-pg%d.pdf" 2>"$errf"; then
            fail "No se pudo extraer el rango:\n$(cat "$errf" 2>/dev/null || echo 'error desconocido')"
        fi
        unir_rango "$out" "$ini" "$fin"
        ok "Páginas $ini-$fin extraídas en:\n$(basename -- "$outdir")/"
        ;;

    bloques)
        nstr=$(kdialog --title "$TITULO" \
            --inputbox "Número de páginas por bloque (1 a $total):" "") || cancel
        nstr="${nstr//[[:space:]]/}"
        if ! [[ "$nstr" =~ ^[0-9]+$ ]] || (( nstr < 1 || nstr > total )); then
            fail "Número de páginas por bloque no válido: «$nstr»."
        fi
        parte=1
        ini=1
        while (( ini <= total )); do
            fin=$(( ini + nstr - 1 ))
            (( fin > total )) && fin=$total
            pdfseparate -f "$ini" -l "$fin" "$file" "$outdir/tmp-pg%d.pdf" 2>/dev/null \
                || fail "Fallo al generar el bloque $parte."
            unir_rango "$outdir/$stem-$parte.pdf" "$ini" "$fin"
            parte=$((parte + 1))
            ini=$(( fin + 1 ))
        done
        ok "$((parte - 1)) bloques creados en:\n$(basename -- "$outdir")/"
        ;;

    *)
        fail "Modo de división desconocido: $modo"
        ;;
esac

exit 0
