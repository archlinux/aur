#!/usr/bin/env bash
#
# audio-convertir.sh — Convierte audio a otro formato (service menu de Dolphin).
#
# Uso: audio-convertir.sh <formato> audio1 [audio2 ...]
#   formato: mp3 | flac | wav | ogg | opus | m4a
# Convierte cada archivo y deja el resultado junto al original, sin sobrescribir.

set -euo pipefail

TITULO="Convertir audio"
err() { kdialog --title "$TITULO" --error "$1"; exit 1; }
ok()  { kdialog --title "$TITULO" --passivepopup "$1" 6 >/dev/null 2>&1 || true; }

command -v ffmpeg >/dev/null \
    || err "Falta «ffmpeg».\n\nInstálalo con:\n    sudo pacman -S ffmpeg"

(( $# >= 2 )) || err "Uso interno incorrecto del conversor de audio."
fmt="$1"; shift
case "$fmt" in
    mp3)  ext=mp3;  opts=(-codec:a libmp3lame -q:a 2) ;;
    flac) ext=flac; opts=(-codec:a flac) ;;
    wav)  ext=wav;  opts=(-codec:a pcm_s16le) ;;
    ogg)  ext=ogg;  opts=(-codec:a libvorbis -q:a 5) ;;
    opus) ext=opus; opts=(-codec:a libopus -b:a 128k) ;;
    m4a)  ext=m4a;  opts=(-codec:a aac -b:a 192k) ;;
    *) err "Formato de audio desconocido: $fmt" ;;
esac

errf=$(mktemp)
trap 'rm -f "$errf"' EXIT
hechos=0
for f in "$@"; do
    [[ -f "$f" ]] || continue
    d=$(dirname -- "$f"); s=$(basename -- "$f"); s="${s%.*}"
    out="$d/$s.$ext"; n=2
    while [[ -e "$out" ]]; do out="$d/$s-$n.$ext"; n=$((n + 1)); done
    if ! ffmpeg -nostdin -loglevel error -i "$f" "${opts[@]}" "$out" 2>"$errf"; then
        rm -f "$out"
        err "No se pudo convertir «$(basename -- "$f")»:\n$(tail -2 "$errf" 2>/dev/null || echo 'error desconocido')"
    fi
    hechos=$((hechos + 1))
done

(( hechos > 0 )) || err "No se seleccionó ningún audio válido."
ok "$hechos archivo(s) convertido(s) a $fmt."
exit 0
