#!/bin/bash

# Ruta al archivo de frases
archivo="/usr/share/redondo/frases.pr"

if [[ ! -f "$archivo" ]]; then
  echo "Error: No se encontró el archivo de frases en $archivo"
  exit 1
fi

lineas=$(wc -l < "$archivo")
numero_random=$((RANDOM % lineas + 1))


sed -n "${numero_random}p" "$archivo"
