# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Contributor: Jean Azzopardi 'LordIllidan' <aragorn@waldonet.net.mt>

pkgname=netwmpager
pkgver=2.05
pkgrel=2
pkgdesc="A NetWM/EWMH compatible pager"
arch=('i686' 'x86_64')
url="http://onion.dynserv.net/~timo/?page=Projects/netwmpager"
license=('GPL')
depends=('libxft')
source=(http://sourceforge.net/projects/sf-xpaint/files/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('622485be511d3258c892c68ccccc87a6')
install=netwmpager.install

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make 
}
package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install

}
