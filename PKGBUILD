# Maintainer: blueray
# Contributor: Mike Redd <mredd@0tue0.com>

pkgname=fortune-mod-archer
pkgver=4.1
pkgrel=1
pkgdesc="Archer FXNetwork fortune cookie file"
url="http://www.tvfanatic.com/quotes/shows/archer/"
arch=('any')
license=('unknown')
depends=('fortune-mod')
groups=('fortune-mods')
source=(archer)
md5sums=('4208b03f67ac8f2d2272f67882f21b49')

build() {
  cd "$srcdir"
  strfile archer archer.dat
}

package () {
  install -D -m644 archer $pkgdir/usr/share/fortune/archer
  install -D -m644 archer.dat $pkgdir/usr/share/fortune/archer.dat
}
