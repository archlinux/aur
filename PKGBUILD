# Maintainer: Nathan Monfils <nathan.monfils@hotmail.fr>

pkgname=fortune-mod-brooklyn-nine-nine
pkgver=1.0
pkgrel=1
pkgdesc="Brooklyn Nine-Nine fortune cookie file"
url="https://en.wikiquote.org/wiki/Brooklyn_Nine-Nine"
arch=('any')
license=('unknown')
depends=('fortune-mod')
conflicts=('fortune-mod-brooklyn-nine-nine')
groups=('fortune-mods')
source=(brooklyn-nine-nine)
md5sums=('04c14a2efa262c9b175d0a71dbf41e7d')

build() {
  cd "$srcdir"
  strfile brooklyn-nine-nine brooklyn-nine-nine.dat
}

package () {
  install -D -m644 brooklyn-nine-nine $pkgdir/usr/share/fortune/brooklyn-nine-nine
  install -D -m644 brooklyn-nine-nine.dat $pkgdir/usr/share/fortune/brooklyn-nine-nine.dat
}
