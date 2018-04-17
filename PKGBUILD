# Maintainer: Alex Merry <dev@randomguy3.me.uk>

pkgname=python-stdnum
pkgver=1.9
pkgrel=1
pkgdesc='Aims to provide functions to handle, parse and validate standard numbers, e.g. IBAN, EAN, ISBN'
arch=(any)
url="http://arthurdejong.org/python-stdnum/"
license=('LGPL2.1')
depends=('python')
makedepends=('python-distribute')
source=("http://arthurdejong.org/python-stdnum/python-stdnum-${pkgver}.tar.gz")
md5sums=('09c29ef869ef2743305785ce58b6bfd0')

package() {
    cd "$srcdir/python-stdnum-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=4 sw=4 et:
