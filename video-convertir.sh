#!/usr/bin/env bash
#
# video-convertir.sh — Convierte/transforma vídeo (service menu de Dolphin).
#
# Uso: video-convertir.sh <modo> video1 [video2 ...]
#   mp4        -> H.264 + AAC (compatible con casi todo)
#   mp4-1080   -> H.264 reescalado a 1080p (no agranda si ya es menor)
#   mp4-720    -> H.264 reescalado a 720p (no agranda si ya es menor)
#   webm       -> VP9 + Opus (web)
#   gif        -> GIF animado (12 fps, ancho 480 px, paleta optimizada)
#   audio      -> extrae la pista de audio a MP3
#   comprimir  -> MP4 más pequeño (H.264 CRF 28)
# Resultado junto al original, sin sobrescribir. Los vídeos pueden tardar.

set -euo pipefail

TITULO="Convertir vídeo"
err() { kdialog --title "$TITULO" --error "$1"; exit 1; }
ok()  { kdialog --title "$TITULO" --passivepopup "$1" 6 >/dev/null 2>&1 || true; }

command -v ffmpeg >/dev/null \
    || err "Falta «ffmpeg».\n\nInstálalo con:\n    sudo pacman -S ffmpeg"

(( $# >= 2 )) || err "Uso interno incorrecto del conversor de vídeo."
modo="$1"; shift
sufijo=""
case "$modo" in
    mp4)       ext=mp4;  opts=(-c:v libx264 -crf 23 -preset medium -c:a aac -b:a 192k -movflags +faststart) ;;
    mp4-1080)  ext=mp4;  sufijo="-1080p"; opts=(-vf "scale=-2:'min(1080,ih)'" -c:v libx264 -crf 23 -preset medium -c:a aac -b:a 192k -movflags +faststart) ;;
    mp4-720)   ext=mp4;  sufijo="-720p";  opts=(-vf "scale=-2:'min(720,ih)'"  -c:v libx264 -crf 23 -preset medium -c:a aac -b:a 160k -movflags +faststart) ;;
    webm)      ext=webm; opts=(-c:v libvpx-vp9 -crf 32 -b:v 0 -c:a libopus) ;;
    gif)       ext=gif;  opts=(-vf "fps=12,scale=480:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse") ;;
    audio)     ext=mp3;  opts=(-vn -codec:a libmp3lame -q:a 2) ;;
    comprimir) ext=mp4;  sufijo="-comprimido"; opts=(-c:v libx264 -crf 28 -preset medium -c:a aac -b:a 128k -movflags +faststart) ;;
    *) err "Modo de vídeo desconocido: $modo" ;;
esac

errf=$(mktemp)
trap 'rm -f "$errf"' EXIT
ok "Procesando vídeo… esto puede tardar un rato."
hechos=0
for f in "$@"; do
    [[ -f "$f" ]] || continue
    d=$(dirname -- "$f"); s=$(basename -- "$f"); s="${s%.*}"
    out="$d/$s$sufijo.$ext"; n=2
    while [[ -e "$out" ]]; do out="$d/$s$sufijo-$n.$ext"; n=$((n + 1)); done
    if ! ffmpeg -nostdin -loglevel error -i "$f" "${opts[@]}" "$out" 2>"$errf"; then
        rm -f "$out"
        err "No se pudo procesar «$(basename -- "$f")»:\n$(tail -3 "$errf" 2>/dev/null || echo 'error desconocido')"
    fi
    hechos=$((hechos + 1))
done

(( hechos > 0 )) || err "No se seleccionó ningún vídeo válido."
ok "$hechos vídeo(s) procesado(s) ($modo)."
exit 0
