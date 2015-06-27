# Maintainer: Robert Schwarz <mail@rschwarz.net>
# Contributor: OK100 <ok100.ok100.ok100@gmail.com>
pkgname=pynomo
pkgver=0.2.2
pkgrel=2
pkgdesc="a package for creating nomographs"
arch=(i686 x86_64)
url="http://pynomo.org"
license=('GPL')
groups=()
depends=(python2 python2-pillow python2-pyx python2-numpy python2-scipy)
source=(http://downloads.sourceforge.net/project/pynomo/pynomo/$pkgver/PyNomo-$pkgver.tar.gz)
noextract=()
md5sums=('d7a61e58dbbb8f256cd2808de02746f2')

build() {
  cd "$srcdir/PyNomo-$pkgver"
  python2 setup.py install --root "${pkgdir}" || return 1
}
