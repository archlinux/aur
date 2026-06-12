#!/bin/bash
# Script para actualizar python-mkl-service-bin PKGBUILD automáticamente
# Obtiene la última versión y build string desde el repositorio de Anaconda
set -euo pipefail

PKGBUILD="PKGBUILD"
SRCINFO=".SRCINFO"
REPO_URL="https://repo.anaconda.com/pkgs/main/linux-64/"
PKGNAME="mkl-service"

echo "🔍 Consultando repositorio Anaconda: $REPO_URL"

# Obtener todos los archivos mkl-service disponibles, ordenar por versión
# y quedarse con la última entrada (última versión, último build)
latest_file=$(curl -s "$REPO_URL" | \
  grep -oP "href=\"${PKGNAME}-[^\"]*\.tar\.bz2\"" | \
  sed 's/href="//;s/"//' | \
  sort -V | \
  tail -n1)

if [[ -z "$latest_file" ]]; then
  echo "❌ No se pudo obtener la lista de archivos del repositorio"
  exit 1
fi

echo "📦 Último archivo encontrado: $latest_file"

# Extraer componentes del nombre del archivo
# Formato: mkl-service-<version>-<build>.tar.bz2
filename=$(basename "$latest_file")
_pkgname="${PKGNAME}"
full_version="${filename#${_pkgname}-}"
full_version="${full_version%.tar.bz2}"

# Separar pkgver y _build
# Ejemplo: 2.5.2-py314hacdc0fc_0
pkgver="${full_version%%-*}"
_build="${full_version#*-}"

echo "📋 Versión detectada: pkgver=$pkgver, _build=$_build"

# Obtener la URL completa del source
source_url="${REPO_URL}${latest_file}"
echo "🌐 URL del source: $source_url"

# Descargar y calcular sha256sum
echo "⬇️  Descargando para calcular checksum..."
sha256=$(curl -sL "$source_url" | sha256sum | cut -d' ' -f1)

if [[ -z "$sha256" ]]; then
  echo "❌ No se pudo calcular el checksum"
  exit 1
fi

echo "🔐 SHA256: $sha256"

# Actualizar PKGBUILD
echo "✏️  Actualizando PKGBUILD..."

sed -i "s/^pkgver=.*/pkgver=${pkgver}/" "$PKGBUILD"
sed -i "s/^_build=.*/_build=${_build}/" "$PKGBUILD"
# Nota: source=() ya usa variables ${_pkgname}, ${pkgver}, ${_build}
# No es necesario reemplazar la línea source
sed -i "s/^sha256sums=.*/sha256sums=('${sha256}')/" "$PKGBUILD"

echo "✅ PKGBUILD actualizado correctamente"

# Regenerar .SRCINFO
echo "📝 Regenerando .SRCINFO..."
makepkg --printsrcinfo > "$SRCINFO"

echo "✅ .SRCINFO regenerado correctamente"
echo ""
echo "🎉 ¡Actualización completada!"
echo "   pkgver: $pkgver"
echo "   _build: ${_build}"
echo "   sha256sums: $sha256"
