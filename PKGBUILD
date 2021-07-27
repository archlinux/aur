# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pydevicetree
pkgver=0.0.4
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
sha256sums=('eb441c7d97c4c7e92111be33b2a05a5fb09bb992d9d0c18f64182c82174cf273')
#validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname#python-}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname#python-}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
