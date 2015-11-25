# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=pipsi
pkgver=0.9
pkgrel=1
pkgdesc='Wraps pip and virtualenv to install scripts'
arch=('any')
url='https://github.com/mitsuhiko/pipsi/'
license=('BSD')
depends=('python2-click')
source=("http://pypi.python.org/packages/source/p/pipsi/pipsi-${pkgver}.tar.gz")


build() {
    cd "${srcdir}/pipsi-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/pipsi-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

sha256sums=('688b688cc8a7a76612c0d4d1839aaef98ece8382d4382b9d8b6f0caa65f0ed34')
