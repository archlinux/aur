# Maintainer: Jurica Bradaric <jbradaric@gmail.com>
pkgname=python2-pyxb
pkgver=1.2.4
pkgrel=1
pkgdesc="Generates Python code for classes that correspond to data structures defined by XMLSchema"
arch=(any)
url="http://pyxb.sourceforge.net/"
license=('Apache')
depends=('python2')
makedepends=('python2' 'python2-setuptools')

source=("https://pypi.python.org/packages/source/P/PyXB/PyXB-$pkgver.tar.gz")
sha256sums=('024f9d4740fde187cde469dbe8e3c277fe522a3420458c4ba428085c090afa69')

build() {
    cd "$srcdir/PyXB-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/PyXB-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
