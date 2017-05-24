# Maintainer: Alex Merry <dev@randomguy3.me.uk>

pkgname=python-stdnum
pkgver=1.6
pkgrel=1
pkgdesc='Aims to provide functions to handle, parse and validate standard numbers, e.g. IBAN, EAN, ISBN'
arch=(any)
url="http://arthurdejong.org/python-stdnum/"
license=('LGPL2.1')
depends=('python')
makedepends=('python-distribute')
source=("http://arthurdejong.org/python-stdnum/python-stdnum-${pkgver}.tar.gz")
md5sums=('cf378f5b8eaab5020179d2ac56d4dbd9')

package() {
    cd "$srcdir/python-stdnum-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=4 sw=4 et:
