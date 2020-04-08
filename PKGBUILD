# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Henrik Tunedal <putte_xvi at tunedal dot nu>
pkgname=wmbattery
pkgver=2.54
pkgrel=1
pkgdesc="Battery monitor dockapp for Window Maker"
arch=('i686' 'x86_64')
url="http://www.dockapps.net/wmbattery"
license=('GPL')
depends=('libxpm' 'upower')
source=("http://www.dockapps.net/download/$pkgname-$pkgver.tar.gz")

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

md5sums=('b9912af07410c1f7697578fdb271bf3b')
sha256sums=('dc7b28c136f193f65a16d465ff73b397868c1e24861e2d6ff0c9d4c92b2a96e4')
