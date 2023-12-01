# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=bsod
pkgver=0.2
pkgrel=1
pkgdesc="Bsod displays the famous windows xp blue screen of death on the console"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/folkertvanheusden/bsod"
license=('public_domain')
depends=('ncurses')
source=(https://github.com/folkertvanheusden/bsod/archive/refs/tags/v${pkgver}.tar.gz)
md5sums=('a58bd957bd98e0f74340d4ab7cee0f48')

build() {
  cd $srcdir/$pkgname
  make
}

package() {
  cd $srcdir/$pkgname
  install -D -m755 ./bsod $pkgdir/usr/bin/bsod
}
