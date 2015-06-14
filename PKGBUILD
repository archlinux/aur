# Maintainer: Maximilian Bräutigam <max-braeu@gmx.de>

pkgname=python2-stdnum
pkgver=0.8.1
pkgrel=1
pkgdesc='Aims to provide functions to handle, parse and validate standard numbers, e.g. IBAN, EAN, ISBN'
arch=(any)
url="http://arthurdejong.org/python-stdnum/"
license=('LGPL2.1')
depends=('python2')
makedepends=('python2-setuptools')
source=("http://arthurdejong.org/python-stdnum/python-stdnum-${pkgver}.tar.gz")
md5sums=('fd2d8f12055d4a133fe480ec7f20fa94')

package() {
  cd "$srcdir/python-stdnum-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

