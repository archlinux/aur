# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmmixer
pkgver=1.8
pkgrel=1
epoch=1
pkgdesc="A mixer application written for the WindowMaker dock."
arch=('i686' 'x86_64')
url="http://www.dockapps.net/wmmixer"
license=('GPL')
depends=('libxpm')
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('6d45ef2645dd8c01d62c6aa44843fb0c')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
