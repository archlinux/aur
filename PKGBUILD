# Maintainer: Mike Pento <mjpento@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Henrik Tunedal <putte_xvi at tunedal dot nu>

pkgname=wmbattery
pkgver=2.56
pkgrel=1
pkgdesc="Battery monitor dockapp for Window Maker"
arch=('i686' 'x86_64')
url="http://www.dockapps.net/wmbattery"
license=('GPL')
depends=('libxpm' 'upower')
options+=('!debug')
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

md5sums=('1cb7ed9c3b54260ab7ea5337c9782b5c')
sha256sums=('659d7c1a11ab90f8a74f3f465f36665d4802d5f03a4799b49f1fdd15f1b7a188')
