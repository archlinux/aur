# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=yoda
pkgver=2.0.2
pkgrel=1
pkgdesc="A particle physics package for data analysis (specifically histogramming) classes."
arch=('x86_64' 'i686')
url="http://yoda.hepforge.org"
license=('GPL3')
depends=('python')
makedepends=('cython')
source=(http://www.hepforge.org/archive/yoda/YODA-$pkgver.tar.gz)
md5sums=('643cc4999873431ab4394550bed555a4')

package() {
  cd "$srcdir/YODA-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc
  make DESTDIR="$pkgdir/" install
}
