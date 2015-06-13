# Contributor: Zerial <fernando@zerial.org>
# Maintainer: SanskritFritz (gmail)

pkgname=wmnd
pkgver=0.4.17
pkgrel=1
pkgdesc="Dockapp for monitoring network interfaces."
url="http://www.thregr.org/~wavexx/software/wmnd/"
license="GPL"
depends=('libxpm' 'net-snmp')
arch=('i686' 'x86_64')
source=(http://www.thregr.org/~wavexx/software/wmnd/releases/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

md5sums=('dbf6d6c42ab3e036388d261d2e7bea16')
