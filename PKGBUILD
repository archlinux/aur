# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=python-unp
pkgver=0.2
pkgrel=1
pkgdesc='Command line tool that can unpack archives easily'
arch=('any')
url='https://github.com/mitsuhiko/unp'
license=('BSD')
depends=('python-click')
source=("http://pypi.python.org/packages/source/u/unp/unp-${pkgver}.tar.gz")


build() {
    cd "${srcdir}/unp-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/unp-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

sha256sums=('e0f4b4512ff4e4bfa2655a3625f18f7a52ec84f5cc99a2501ba6a981edd35b39')
