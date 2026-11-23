# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=yoda
pkgver=2.1.5
pkgrel=1
pkgdesc="A particle physics package for data analysis (specifically histogramming) classes."
arch=('x86_64' 'i686')
url="http://yoda.hepforge.org"
license=('GPL3')
depends=('python')
makedepends=('cython')
source=(https://cedar-tools.web.cern.ch/downloads/YODA-$pkgver.tar.gz)
md5sums=('4614c3523f8003f96228856e5174dfb1')

package() {
  cd "$srcdir/YODA-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc
  make DESTDIR="$pkgdir/" install
}
