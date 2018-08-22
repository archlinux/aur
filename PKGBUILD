# Maintainer: Tobias Borgert <mail@tobias-borgert.de>:

pkgname=fortune-mod-darkestdungeon
pkgver=20171129
pkgrel=4
pkgdesc="Fortune cookies: Darkest Dungeon (game)."
arch=('any')
license=('CCPL:by-nc-sa')
depends=(fortune-mod)
url="https://darkestdungeon.gamepedia.com/Narrator"

source=('darkestdungeon')
sha256sums=('c829b84e3c03e3c254f439ea13fa4061f98b7fc170fb44924557a0b695fd3e7e')

build() {
	strfile "${srcdir}"/darkestdungeon "${srcdir}"/darkestdungeon.dat
}

package() {
	  install -D -m644 "${srcdir}"/darkestdungeon "${pkgdir}"/usr/share/fortune/darkestdungeon
	  install -D -m644 "${srcdir}"/darkestdungeon.dat "${pkgdir}"/usr/share/fortune/darkestdungeon.dat
}
