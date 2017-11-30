# Maintainer: Tobias Borgert <mail@tobias-borgert.de>:

pkgname=fortune-mod-darkestdungeon
pkgver=20171129
pkgrel=3
pkgdesc="Fortune cookies: Darkest Dungeon (game)."
arch=('any')
license=('CCPL:by-nc-sa')
depends=(fortune-mod)
url="https://darkestdungeon.gamepedia.com/Narrator"

source=('darkestdungeon')
sha256sums=('7123ad0b8e4970cb4d7c2579445fd368bddd596b6b9c34e17c3a8272a6a0795f')

build() {
	strfile "${srcdir}"/darkestdungeon "${srcdir}"/darkestdungeon.dat
}

package() {
	  install -D -m644 "${srcdir}"/darkestdungeon "${pkgdir}"/usr/share/fortune/darkestdungeon
	  install -D -m644 "${srcdir}"/darkestdungeon.dat "${pkgdir}"/usr/share/fortune/darkestdungeon.dat
}
