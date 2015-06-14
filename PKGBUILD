# Maintainer: Alex Merry <dev@randomguy3.me.uk>

pkgname=python2-stdnum
pkgver=1.1
pkgrel=1
pkgdesc='Aims to provide functions to handle, parse and validate standard numbers, e.g. IBAN, EAN, ISBN'
arch=(any)
url="http://arthurdejong.org/python-stdnum/"
license=('LGPL2.1')
depends=('python2')
makedepends=('python2-setuptools')
source=("http://arthurdejong.org/python-stdnum/python-stdnum-${pkgver}.tar.gz")
md5sums=('c799e21f1adc8b0d17715baa871fd598')

package() {
  cd "$srcdir/python-stdnum-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=4 sw=4 et:
