# Contributor: Thomas Dahms <thdahms@gmx.de>

pkgname=python-pydelay
pkgver=0.1.1
pkgrel=2
pkgdesc="A Python tool for solving delay differential equations"
arch=('any')
url="http://pydelay.sf.net"
license=('MIT')
depends=('python-numpy' 'python-scipy' 'gcc')
optdepends=('python-matplotlib: To plot the solutions and run the examples')
source=(http://dl.sourceforge.net/project/pydelay/pydelay-${pkgver}.tar.gz)
md5sums=('6163145919477596bb4ea15edb922c5d')

build() {
  cd "$srcdir/pydelay-$pkgver"

  python2 setup.py install --root="$pkgdir" || return 1
}
