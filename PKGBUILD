# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=pipsi
pkgver=0.8
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

sha256sums=('cc3072a41956e3ce625d80e34c017de051cb5b7197daa1407306d0fe08e42f2c')
