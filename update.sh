#!/usr/bin/env bash
# Update script for epixnet-git AUR package
# Fetches latest commit version from GitHub (main branch) and checks Firefox ESR version
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

echo "==> Consultando la última versión en el repositorio git..."
tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT

git clone --quiet --bare --filter=tree:0 https://github.com/EpixZone/EpixNet.git "$tmp_dir/repo"

commit_sha=$(git -C "$tmp_dir/repo" rev-parse main)
raw_ver=$(git -C "$tmp_dir/repo" describe --long --tags --abbrev=7 main 2>/dev/null || true)
if [[ -n "$raw_ver" ]]; then
  version=$(printf '%s\n' "$raw_ver" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
else
  version=$(printf "0.0.0.r%s.g%s" "$(git -C "$tmp_dir/repo" rev-list --count main)" "$(git -C "$tmp_dir/repo" rev-parse --short=7 main)")
fi

if [[ -z "$version" ]]; then
  echo "Error: No se pudo determinar la última versión del repositorio git" >&2
  exit 1
fi

current_version=$(grep -E '^pkgver=' PKGBUILD | head -n1 | cut -d'=' -f2 | tr -d " '\"")

echo "  -> Versión actual en PKGBUILD: $current_version"
echo "  -> Última versión disponible:  $version"

# Comprobar versión de Firefox ESR fijada por upstream
ff_ver=$(curl -fsSL "https://raw.githubusercontent.com/EpixZone/EpixNet/${commit_sha}/packaging/fetch-firefox-esr.sh" | grep -E 'VERSION=.*esr' | sed -E 's/.*:-([^}]+)\}.*/\1/' || true)
if [[ -n "$ff_ver" ]]; then
  current_ff=$(grep -E '^_ffver=' PKGBUILD | head -n1 | cut -d'=' -f2 | tr -d " '\"")
  if [[ "$ff_ver" != "$current_ff" ]]; then
    echo "  -> Nueva versión de Firefox ESR detectada: $ff_ver (anterior: $current_ff)"
    ff_hash_x86=$(curl -fsSL "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${ff_ver}/linux-x86_64/en-US/firefox-${ff_ver}.tar.xz" | sha256sum | awk '{print $1}')
    ff_hash_arm=$(curl -fsSL "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${ff_ver}/linux-aarch64/en-US/firefox-${ff_ver}.tar.xz" | sha256sum | awk '{print $1}')
    if [[ -z "$ff_hash_x86" || -z "$ff_hash_arm" ]]; then
      echo "Error: No se pudieron calcular las sumas SHA256 de Firefox ESR ${ff_ver}" >&2
      exit 1
    fi
    sed -i -E "s/^_ffver=.*/_ffver=\"${ff_ver}\"/" PKGBUILD
    sed -i -E "s/^sha256sums_x86_64=\('.*'\)/sha256sums_x86_64=('${ff_hash_x86}')/" PKGBUILD
    sed -i -E "s/^sha256sums_aarch64=\('.*'\)/sha256sums_aarch64=('${ff_hash_arm}')/" PKGBUILD
  fi
fi

# Actualizar PKGBUILD
sed -i -E "s/^pkgver=.*/pkgver=${version}/" PKGBUILD
sed -i -E "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

# Regenerar .SRCINFO
echo "==> Regenerando .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "==> ¡Listo! PKGBUILD y .SRCINFO actualizados a ${version}."
echo "    Puedes verificar con 'git status' y publicar con:"
echo "    git commit -am \"Update to ${version}\" && git push"
