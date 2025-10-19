#!/usr/bin/env bash
# sync_official.sh
# Clona el repositorio oficial de Arch y copia todos los archivos excepto PKGBUILD
# Argumento: $1 = destino (working directory donde se van a copiar los archivos)

set -euo pipefail

DEST_DIR="${1:-.}"

tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT

echo ">>> Cloning official Arch kwin repository..."
git clone --depth=1 https://gitlab.archlinux.org/archlinux/packaging/packages/kwin.git "$tmpdir" >/dev/null 2>&1

echo ">>> Copying files to working directory (excluding PKGBUILD)..."
rsync -a --exclude='PKGBUILD' "$tmpdir/" "$DEST_DIR/"
