# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=python-unp
pkgver=0.3
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

sha256sums=('234807c6db6f802cf25509dd495f7978516f1d04eecd6f0acfef0ac76cba6009')
