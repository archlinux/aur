# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=optar
pkgver=1
pkgrel=1
pkgdesc="OPTical ARchiver - codec for encoding data on paper"
arch=('i686' 'x86_64')
license=('GPL')
url="http://ronja.twibright.com/optar/"
source=("http://ronja.twibright.com/optar.tgz")
depends=('libpng')
md5sums=('aea10e42b36c7d788502f00f5d8a6c81')

build() {
  cd "$srcdir/optar_dist"
  make
}

package() {
  cd "$srcdir/optar_dist"
  install -Dm755 optar ${pkgdir}/usr/bin/optar
  install -Dm755 unoptar ${pkgdir}/usr/bin/unoptar
  install -Dm755 pgm2ps ${pkgdir}/usr/bin/pgm2ps
  install -Dm644 README ${pkgdir}/usr/share/doc/optar/README
}

# vim: ts=2:sw=2:et:nowrap
