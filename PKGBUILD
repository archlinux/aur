# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Feufochmar <feufochmar@d-20.fr>
pkgname=wmwifi
pkgver=0.6
pkgrel=4
pkgdesc="A wireless network interface monitor dockapp for Window Maker"
arch=('i686' 'x86_64')
url="http://dockapps.org/file.php/id/222"
license=('GPL')
depends=('libxpm')
source=(http://gd.tuwien.ac.at/opsys/linux/gentoo/distfiles/$pkgname-$pkgver.tar.gz)
md5sums=('b170d4a6c4fc42774b9798cf98af1c27')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
