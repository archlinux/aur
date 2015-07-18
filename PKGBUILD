# Maintainer: Tobias Frilling <tobias@frilling-online.de>
# Contributor: Joseph Kern <timetrap AT gmail DOT com>

pkgname=utimer
pkgver=0.4
pkgrel=8
pkgdesc="A command-line multifunction timer tool."
url="http://utimer.codealpha.net/utimer/" 
license=('GPL3') 
makedepends=('intltool')
depends=('glib2')
arch=('x86_64' 'i686')
source=( http://utimer.codealpha.net/files/utimer-$pkgver.tar.gz ) 
sha1sums=('b9590ef4ff6bb8ecf64bb703f50f1bfeddf3fbdd')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix='/usr'
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install prefix="$pkgdir/usr/"
}
