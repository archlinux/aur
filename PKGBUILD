# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-juanchi-game
_pkgname=juanchi
_pkgauthor=runs
pkgver=4.9
_cdbrel=11296
pkgrel=1
pkgdesc="A game just for fun with blocks, animals and a lot of more. "
license=("AGPLv3")
sha256sums=('c77cb75a7e7048cd20ae611f7d6334199181d717d9bf1ac0ee6d33afa0563bdd')

arch=("any")
url="https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/"
depends=("minetest-common")
source=("${_pkgname}-${pkgver}.zip::https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/releases/${_cdbrel}/download/")
options=(!strip)
noextract=("${_pkgname}-${pkgver}.zip")

package() {
	install -d "${pkgdir}/usr/share/minetest/games/"
	unzip "${_pkgname}-${pkgver}.zip" -d "${pkgdir}/usr/share/minetest/games/"
}
