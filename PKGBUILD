# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmmixer
pkgver=1.7
pkgrel=1
epoch=1
pkgdesc="A mixer application written for the WindowMaker dock."
arch=('i686' 'x86_64')
url="http://www.dockapps.net/wmmixer"
license=('GPL')
depends=('libxpm')
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('28512c03896f726fd72625956492d2c4')

build() {
  cd ${pkgname}
  make prefix=/usr
}

package() {
  cd ${pkgname}
  make prefix=/usr DESTDIR="$pkgdir" install
}
