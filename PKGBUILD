# Maintainer: David Danier <david.danier@team23.de>
pkgname=python2-pysolr
pkgver=3.2.0
pkgrel=1
pkgdesc="Lightweight python wrapper for Apache Solr."
arch=('any')
url="https://pypi.python.org/pypi/pysolr"
license=('BSD')
groups=()
depends=('python2' 'python2-requests')
makedepends=('python2-distribute')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/p/pysolr/pysolr-$pkgver.tar.gz)
sha256sums=('33d8c9ec3a0b5379f2d679e9a5d835d9bbbe4f89ca236b720fdc919c32c89029')

package() {
  cd "$srcdir/pysolr-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
