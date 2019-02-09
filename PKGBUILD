# Maintainer: Nathan Monfils <nathan.monfils@hotmail.fr>

pkgname=fortune-mod-parks-and-recreation
pkgver=1.2
pkgrel=1
pkgdesc="Parks and Recreation fortune cookie file"
url="https://en.wikiquote.org/wiki/Parks_and_Recreation_(season_7)"
arch=('any')
license=('unknown')
depends=('fortune-mod')
groups=('fortune-mods')
source=(parks-and-recreation)
md5sums=('afe5beafb90a0ccfdd570f3add836f64')

build() {
  cd "$srcdir"

  strfile parks-and-recreation parks-and-recreation.dat
}

package () {
  install -D -m644 parks-and-recreation $pkgdir/usr/share/fortune/parks-and-recreation
  install -D -m644 parks-and-recreation.dat $pkgdir/usr/share/fortune/parks-and-recreation.dat
}
