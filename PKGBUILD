# Maintainer: Tobias Borgert <mail@tobias-borgert.de>:

pkgname=fortune-mod-darkestdungeon
pkgver=20171129
pkgrel=1
pkgdesc="Fortune cookies: Darkest Dungeon (game)."
arch=('any')
license=('CC BY-NC-SA 3.0')
depends=(fortune-mod)
url="https://darkestdungeon.gamepedia.com/Narrator"

source=('darkestdungeon')
sha256sums=('de7394863ebc9285cbc5f2ad948ff765c3f4496407ac9676d347725348454320')

build() {
	strfile "${srcdir}"/darkestdungeon "${srcdir}"/darkestdungeon.dat
}

package() {
	  install -D -m644 "${srcdir}"/darkestdungeon "${pkgdir}"/usr/share/fortune/darkestdungeon
	  install -D -m644 "${srcdir}"/darkestdungeon.dat "${pkgdir}"/usr/share/fortune/darkestdungeon.dat
}
