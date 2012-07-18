# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=sbxkb
pkgver=0.7.6
pkgrel=1
pkgdesc="Simple tray XKB indicator"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://downloads.sourceforge.net/project/staybox"
depends=('gtk2')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/project/staybox/${pkgname}-${pkgver}.tar.gz)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --sysconfdir=/etc --prefix=/usr
  make
  make DESTDIR=${pkgdir} install
}
