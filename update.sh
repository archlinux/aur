#!/usr/bin/env bash
# Update script for epixnet-bin AUR package
# Fetches latest release tag and sha256 checksum directly from GitHub releases
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

echo "==> Consultando la última versión en GitHub..."
release_info=$(curl -fsSL https://api.github.com/repos/EpixZone/EpixNet/releases/latest)
tag=$(echo "$release_info" | python3 -c 'import json, sys; print(json.load(sys.stdin)["tag_name"])')
version="${tag#v}"

current_version=$(grep -E '^pkgver=' PKGBUILD | head -n1 | cut -d'=' -f2 | tr -d " '\"")

echo "  -> Versión actual en PKGBUILD: $current_version"
echo "  -> Última versión disponible:  $version"

# Obtener los checksums oficiales de la release
sums_url="https://github.com/EpixZone/EpixNet/releases/download/${tag}/SHA256SUMS"
echo "==> Obteniendo sumas SHA256 desde: $sums_url"
sha256=$(curl -fsSL "$sums_url" | grep -E "EpixNet-.*-x86_64\.AppImage" | awk '{print $1}' | head -n1)

if [[ -z "$sha256" ]]; then
  echo "Error: No se pudo obtener la suma SHA256 de EpixNet-${version}-x86_64.AppImage" >&2
  exit 1
fi

echo "  -> SHA256: $sha256"

# Actualizar PKGBUILD
sed -i -E "s/^pkgver=.*/pkgver=${version}/" PKGBUILD
sed -i -E "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
sed -i -E "s/^sha256sums_x86_64=\('.*'\)/sha256sums_x86_64=('${sha256}')/" PKGBUILD

# Regenerar .SRCINFO
echo "==> Regenerando .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "==> ¡Listo! PKGBUILD y .SRCINFO actualizados a ${version}."
echo "    Puedes verificar con 'git status' y publicar con:"
echo "    git commit -am \"Update to v${version}\" && git push"
