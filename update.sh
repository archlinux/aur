#! /bin/sh

AUR_NAME=eslint-plugin-snakecasejs
PROJ_NAME=eslint-plugin-snakecasejs
DESCRIPTION="ESLint Plugin: enforce snake_case syntax on variables and function names"
URL=https://github.com/ptkdev/eslint-plugin-snakecasejs
DEPENDS=(
    'nodejs'
    'eslint'
)
LICENSE='MIT'
ADDITIONAL='noextract=($pkgname-$pkgver.tgz)'

if [[ $# == 0 ]]; then
    echo 'Usage: ./update.sh VERSION_NUMBER'
    exit 1
fi

src=http://registry.npmjs.org/${PROJ_NAME}/-/${PROJ_NAME}-$1.tgz

# Get the sha256sum sum of the package.
mkdir -p dist
pushd dist
wget $src
sha=$(sha256sum "${PROJ_NAME}-$1.tgz" | cut -d ' ' -f 1)
popd

echo "# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase=${AUR_NAME}
pkgname=${AUR_NAME}
pkgver='$1'
pkgrel=1
pkgdesc='${DESCRIPTION}'
url='${URL}'
depends=(" > PKGBUILD

# Include the dependencies.
for d in ${DEPENDS[*]}; do
    echo "    '$d'" >> PKGBUILD
done

echo ")
makedepends=('npm')
license=('${LICENSE}')
arch=('any')
source=('${src}')
sha256sums=('${sha}')
${ADDITIONAL}

package() {
  npm install -g --user root --prefix \"\$pkgdir/usr\" \"\$srcdir/\$pkgname-\$pkgver.tgz\"

  # Fix permissions
  find \"\$pkgdir/usr\" -type d -exec chmod 755 '{}' +

  install -dm755 \"\${pkgdir}/usr/share/licenses/\${pkgname}\"
  ln -s \"../../../lib/node_modules/\$pkgname/LICENSE\" \"\${pkgdir}/usr/share/licenses/\${pkgname}/LICENSE\"
}" >> PKGBUILD

make

# Test
makepkg -f
