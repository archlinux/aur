# Contributor: Zerial <fernando@zerial.org>
# Maintainer: SanskritFritz (gmail)

pkgname=wmnd
pkgver=0.4.18
pkgrel=1
pkgdesc="Dockapp for monitoring network interfaces."
url="http://www.thregr.org/~wavexx/software/wmnd/"
license=("GPL")
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

md5sums=('729d0208a7acc5ff185735f51020eefe')
