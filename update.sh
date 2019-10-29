#! /bin/sh

AUR_NAME=zsh-you-should-use
PROJ_NAME=zsh-you-should-use
DESCRIPTION="ZSH plugin that reminds you to use existing aliases for commands you just typed"
URL="https://github.com/MichaelAquilina/zsh-you-should-use"
DEPENDS=()
LICENSE='GPL3'
ADDITIONAL=

if [[ $# == 0 ]]; then
    echo 'Usage: ./update.sh VERSION_NUMBER'
    exit 1
fi

SRC=https://github.com/MichaelAquilina/${PROJ_NAME}/archive/$1.tar.gz

# Get the sha256sum sum of the package.
mkdir -p dist
pushd dist
wget $SRC
sha=$(sha256sum "$1.tar.gz" | cut -d ' ' -f 1)
echo $sha
popd

echo "# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='${AUR_NAME}'
pkgname=('${AUR_NAME}')
_module='${PROJ_NAME}'
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
makedepends=()
arch=('any')
license=('${LICENSE}')
source=('${SRC}')
install=\"\${pkgname}.install\"
sha256sums=('${sha}')
${ADDITIONAL}

package() {
    install -d \"\${pkgdir}/usr/share/zsh/plugins/\${pkgname}\"
    install -Dm644 \"\${srcdir}/\${pkgname}-\${pkgver}/you-should-use.plugin.zsh\" \\
        \"\${pkgdir}/usr/share/zsh/plugins/\${pkgname}\"

    # License
    install -Dm644 \"\${srcdir}/\${pkgname}-\${pkgver}/LICENSE\" \\
        \"\${pkgdir}/usr/share/licenses/\${pkgname}/LICENSE\"
}" >> PKGBUILD

make

# Test
makepkg -f
