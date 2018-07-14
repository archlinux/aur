#! /bin/sh

PROJECT_NAME=tracktime
DESCRIPTION="Time tracking library with command line interface."
URL=https://gitlab.com/sumner/tracktime
DEPENDS=(python-pdfkit python-tabulate python-docutils python-requests python-yaml)
LICENSE='GPL3'

if [[ $# == 0 ]]; then
    echo 'Usage: ./update.sh VERSION_NUMBER'
    exit 1
fi

src=https://files.pythonhosted.org/packages/source/${PROJECT_NAME:0:1}/${PROJECT_NAME}/${PROJECT_NAME}-$1.tar.gz

# Get the sha256sum sum of the package.
mkdir -p dist
pushd dist
wget $src
sha=$(sha256sum "${PROJECT_NAME}-$1.tar.gz" | cut -d ' ' -f 1)
popd

echo "# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase=('${PROJECT_NAME}')
pkgname=('${PROJECT_NAME}')
_module='${PROJECT_NAME}'
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
makepkg
