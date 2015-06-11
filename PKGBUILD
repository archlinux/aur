# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=vncproto
pkgver=1.1
pkgrel=1
pkgdesc="X11 extention protocol headers for the VNC extension"
arch=('any')
license=('GPL')
url=("https://github.com/bbidulock/vncproto")
source=("https://github.com/bbidulock/vncproto/releases/download/vncproto-1.1/vncproto-1.1.tar.bz2")
md5sums=('ea7a451d43bd6f0c43c5ac0c33b72b29')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
