# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pydevicetree
pkgver=0.0.7
pkgrel=1
epoch=
pkgdesc="This is a Python 3 library for parsing, querying, and modifying Devicetree Source v1 files as described in the Devicetree Specification v0.2."
arch=('any')
url="https://github.com/sifive/pydevicetree"
license=('Apache')
groups=()
depends=('python')
makedepends=("python-setuptools")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('36c22bab01051dd4ffbdc9c938f58f8df599ab9865907594ff17c4ae74955e66')
#validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname#python-}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname#python-}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
