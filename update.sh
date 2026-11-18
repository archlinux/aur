#!/usr/bin/env bash
# Update script for epixnet AUR package
# Fetches latest release tag and source tarball sha256 checksum from GitHub
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

tarball_url="https://github.com/EpixZone/EpixNet/archive/refs/tags/${tag}.tar.gz"
echo "==> Calculando suma SHA256 desde: $tarball_url"
sha256=$(curl -fsSL "$tarball_url" | sha256sum | awk '{print $1}')

if [[ -z "$sha256" ]]; then
  echo "Error: No se pudo calcular la suma SHA256 del tarball" >&2
  exit 1
fi

echo "  -> SHA256: $sha256"

# Comprobar versión de Firefox ESR fijada por upstream
ff_ver=$(curl -fsSL "https://raw.githubusercontent.com/EpixZone/EpixNet/${tag}/packaging/fetch-firefox-esr.sh" | grep -E 'VERSION=.*esr' | sed -E 's/.*:-([^}]+)\}.*/\1/' || true)
if [[ -n "$ff_ver" ]]; then
  current_ff=$(grep -E '^_ffver=' PKGBUILD | head -n1 | cut -d'=' -f2 | tr -d " '\"")
  if [[ "$ff_ver" != "$current_ff" ]]; then
    echo "  -> Nueva versión de Firefox ESR detectada: $ff_ver (anterior: $current_ff)"
    ff_hash_x86=$(curl -fsSL "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${ff_ver}/linux-x86_64/en-US/firefox-${ff_ver}.tar.xz" | sha256sum | awk '{print $1}')
    ff_hash_arm=$(curl -fsSL "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${ff_ver}/linux-aarch64/en-US/firefox-${ff_ver}.tar.xz" | sha256sum | awk '{print $1}')
    sed -i -E "s/^_ffver=.*/_ffver=\"${ff_ver}\"/" PKGBUILD
    sed -i -E "s/^sha256sums_x86_64=\('.*'\)/sha256sums_x86_64=('${ff_hash_x86}')/" PKGBUILD
    sed -i -E "s/^sha256sums_aarch64=\('.*'\)/sha256sums_aarch64=('${ff_hash_arm}')/" PKGBUILD
  fi
fi

# Actualizar PKGBUILD
sed -i -E "s/^pkgver=.*/pkgver=${version}/" PKGBUILD
sed -i -E "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
sed -i -E "s/^sha256sums=\('.*'\)/sha256sums=('${sha256}')/" PKGBUILD

# Regenerar .SRCINFO
echo "==> Regenerando .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "==> ¡Listo! PKGBUILD y .SRCINFO actualizados a ${version}."
echo "    Puedes verificar con 'git status' y publicar con:"
echo "    git commit -am \"Update to v${version}\" && git push"
