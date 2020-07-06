# Maintainer: Platon Pronko <platon7pronko@gmail.com>

pkgname="python-kdtree"
pkgver="0.16"
pkgrel=1
pkgdesc="A Python implementation of a kd-tree"
arch=("any")
url="https://github.com/stefankoegl/kdtree"
license=("ISC")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/stefankoegl/kdtree/archive/v${pkgver}.tar.gz")
sha256sums=('1a51501998f29d04aa6851572c7b59a3923af72b6b72a59c64c8ec6536c04b85')

package() {
    cd "${srcdir}/kdtree-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
