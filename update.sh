#! /bin/sh

AUR_NAME=rst2beamer
PROJ_NAME=rst2beamer
DESCRIPTION="msmtp wrapper allowing for offline use"
URL=www.agapow.net/software/rst2beamer
DEPENDS=()
LICENSE='GPL'
ADDITIONAL=""

if [[ $# == 0 ]]; then
    echo 'Usage: ./update.sh VERSION_NUMBER'
    exit 1
fi

src=https://files.pythonhosted.org/packages/source/${PROJ_NAME:0:1}/${PROJ_NAME}/${PROJ_NAME}-$1.tar.gz

# Get the sha256sum sum of the package.
mkdir -p dist
pushd dist
wget $src
sha=$(sha256sum "${PROJ_NAME}-$1.tar.gz" | cut -d ' ' -f 1)
popd

echo "# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase=('${AUR_NAME}')
pkgname=('${AUR_NAME}')
_module='${PROJ_NAME}'
pkgver='$1'
pkgrel=1
pkgdesc='${DESCRIPTION}'
url='${URL}'
depends=(
    'python'" > PKGBUILD

# Include the dependencies.
for d in ${DEPENDS[*]}; do
    echo "    '$d'" >> PKGBUILD
done

echo ")
makedepends=('python-setuptools')
license=('${LICENSE}')
arch=('any')
source=('${src}')
sha256sums=('${sha}')
${ADDITIONAL}

build() {
    cd \"\${srcdir}/\${_module}-\${pkgver}\"
    python setup.py build
}

package() {
    depends+=()
    cd \"\${srcdir}/\${_module}-\${pkgver}\"
    python setup.py install --root=\"\${pkgdir}\" --optimize=1 --skip-build
}" >> PKGBUILD

make

# Test
makepkg -f
