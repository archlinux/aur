#!/usr/bin/env bash
#
# pdf-unir.sh — Une varios PDF en uno solo (service menu de Dolphin / KF6).
#
# Uso: pdf-unir.sh archivo1.pdf archivo2.pdf [archivo3.pdf ...]
#
# Flujo:
#   1. Diálogo de ordenación (textinputbox) con la lista numerada; el usuario
#      reordena las líneas si quiere cambiar el orden de fusión.
#   2. Fusiona con pdfunite en el orden indicado.
#   3. Nombra el resultado:  2 archivos -> a_b.pdf ;  3 o más -> a_y_otros.pdf.
#      Si ya existe, añade sufijo -2, -3, …
#   4. Avisa con un popup pasivo (no intrusivo) de dónde quedó el resultado.
#
# Errores: kdialog --error y aborta.

set -euo pipefail

TITULO="Unir PDF"
err() { kdialog --title "$TITULO" --error "$1"; exit 1; }
ok()  { kdialog --title "$TITULO" --passivepopup "$1" 6 >/dev/null 2>&1 || true; }

# --- Validación de entrada ---
(( $# >= 2 )) || err "Selecciona al menos dos archivos PDF para unir."

files=("$@")
# No confundir un nombre «-algo» con una opción de pdfunite.
for i in "${!files[@]}"; do [[ "${files[i]}" == -* ]] && files[i]="./${files[i]}"; done
dir=$(dirname -- "${files[0]}")

# --- Diálogo de ordenación: lista numerada y editable ---
listado=""
for i in "${!files[@]}"; do
    listado+="$((i + 1)). $(basename -- "${files[i]}")"$'\n'
done

orden=$(kdialog --title "$TITULO" \
    --textinputbox "Reordena las líneas si quieres cambiar el orden de fusión.\nNo cambies los números del principio (1., 2., …): indican qué archivo es." \
    "$listado") || exit 0   # Cancelar = salir sin error

# --- Interpretar el nuevo orden ---
# Leemos el número inicial de cada línea no vacía -> índice en el array original.
ordered=()
seen=","
while IFS= read -r line; do
    [[ -z "${line//[[:space:]]/}" ]] && continue
    num=$(grep -oE '^[[:space:]]*[0-9]+' <<<"$line" | tr -d '[:space:]') || true
    [[ -n "$num" ]] || err "Línea sin número de orden válido:\n$line"
    idx=$((num - 1))
    (( idx >= 0 && idx < ${#files[@]} )) || err "Número fuera de rango: $num"
    [[ "$seen" == *",$idx,"* ]] && err "Has repetido el archivo número $num."
    seen+="$idx,"
    ordered+=("${files[idx]}")
done <<<"$orden"

(( ${#ordered[@]} >= 2 )) || err "Necesitas al menos dos archivos en el orden final."

# --- Nombre del resultado ---
name1=$(basename -- "${ordered[0]}" .pdf)
if (( ${#ordered[@]} == 2 )); then
    base="${name1}_$(basename -- "${ordered[1]}" .pdf)"
else
    base="${name1}_y_otros"
fi

out="$dir/$base.pdf"
n=2
while [[ -e "$out" ]]; do
    out="$dir/$base-$n.pdf"
    n=$((n + 1))
done

# --- Fusionar ---
errf=$(mktemp)
trap 'rm -f "$errf"' EXIT
if ! pdfunite "${ordered[@]}" "$out" 2>"$errf"; then
    err "No se pudo unir los PDF:\n$(cat "$errf" 2>/dev/null || echo 'error desconocido')"
fi

ok "PDF creado:\n$(basename -- "$out")"
exit 0
