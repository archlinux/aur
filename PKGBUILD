# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=yoda
pkgver=2.1.3
pkgrel=1
pkgdesc="A particle physics package for data analysis (specifically histogramming) classes."
arch=('x86_64' 'i686')
url="http://yoda.hepforge.org"
license=('GPL3')
depends=('python')
makedepends=('cython')
source=(https://yoda.hepforge.org/downloads?f=YODA-$pkgver.tar.gz)
md5sums=('0ca731f9fbadd7f81b9ce035b4251659')

package() {
  cd "$srcdir/YODA-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc
  make DESTDIR="$pkgdir/" install
}
