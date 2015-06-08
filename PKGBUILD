# Maintainer: Jon Bergli Heier <snakebite@jvnv.net>

pkgname='python2-smmap'
pkgver=0.9.0
pkgrel=1
pkgdesc="A pure git implementation of a sliding window memory map manager"
arch=('any')
url="http://pypi.python.org/pypi/smmap"
license=('BSD')
makedepends=('python2' 'python2-distribute')
depends=('python2')
source=("http://pypi.python.org/packages/source/s/smmap/smmap-${pkgver}.tar.gz")

md5sums=('d7932d5ace206bf4ae15198cf36fb6ab')

package() {
  cd "$srcdir/smmap-$pkgver"
  python2 setup.py install --root="$pkgdir/" || return 1
}

# vim:set ts=2 sw=2 et:
