# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=yoda
pkgver=2.1.2
pkgrel=1
pkgdesc="A particle physics package for data analysis (specifically histogramming) classes."
arch=('x86_64' 'i686')
url="http://yoda.hepforge.org"
license=('GPL3')
depends=('python')
makedepends=('cython')
source=(http://www.hepforge.org/archive/yoda/YODA-$pkgver.tar.gz)
md5sums=('1716d84f880f67953fe2f2517cac0b20')

package() {
  cd "$srcdir/YODA-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc
  make DESTDIR="$pkgdir/" install
}
