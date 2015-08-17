# Maintainer: Brandon Invergo <brandon@brandoninvergo.com>
pkgname=python2-pyifbabel
_pythonname=pyifbabel
pkgver=0.4
pkgrel=1
pkgdesc="A pure-Python implementation of the Treaty of Babel for interactive fiction"
arch=('any')
url="http://pyifbabel.invergo.net"
license=('GPL')
depends=('python2')
options=(!emptydirs)
source=("http://pyifbabel.invergo.net/download/${_pythonname}-$pkgver.tar.gz")
md5sums=('1c7af09e4a2ae451fc74aff46037d425')

package() {
  cd "$srcdir/${_pythonname}-$pkgver"
  ./configure --prefix="$pkgdir/" PYTHON=/usr/bin/python2
  make install
}

# vim:set ts=2 sw=2 et:
