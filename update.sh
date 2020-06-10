#! /bin/sh

AUR_NAME=python-typing-inspect
PROJ_NAME=typing_inspect
DESCRIPTION="Runtime inspection utilities for Python typing module"
URL=https://github.com/ilevkivskyi/typing_inspect
DEPENDS=(
    python-mypy_extensions
    python-typing_extensions
)
LICENSE='MIT'
ADDITIONAL=

if [[ $# == 0 ]]; then
    echo 'Usage: ./update.sh VERSION_NUMBER'
    exit 1
fi
pkgrel=1
if [[ $# == 2 ]]; then
    pkgrel=$2
fi

SRCS=(
    https://files.pythonhosted.org/packages/source/${PROJ_NAME:0:1}/${PROJ_NAME}/${PROJ_NAME}-$1.tar.gz
)

printf '' > PKGBUILD
echo "# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='${AUR_NAME}'
pkgname=('${AUR_NAME}')
_module='${PROJ_NAME}'
pkgver='$1'
pkgrel=$pkgrel
pkgdesc='${DESCRIPTION}'
url='${URL}'
depends=(
    'python'" >> PKGBUILD

# Include the dependencies.
for d in ${DEPENDS[*]}; do
    echo "    '$d'" >> PKGBUILD
done

echo ")
optdepends=()
makedepends=(
    'python-setuptools'
)
license=('${LICENSE}')
arch=('any')
source=(" >> PKGBUILD

# Include the dependencies.
for s in ${SRCS[*]}; do
    echo "    '$s'" >> PKGBUILD
done

echo ")
md5sums=()
${ADDITIONAL}

build() {
    cd \"\${srcdir}/\${_module}-\${pkgver}\"
    python setup.py build
}

package() {
    pushd \"\${srcdir}/\${_module}-\${pkgver}\"
    python setup.py install --root=\"\${pkgdir}\" --optimize=1 --skip-build
    popd
}" >> PKGBUILD

updpkgsums
makepkg --printsrcinfo > .SRCINFO

# Test
makepkg -f
