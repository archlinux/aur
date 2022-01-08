# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-juanchi-game
_pkgname=juanchi
_pkgauthor=runs
pkgver=4.8
_cdbrel=10437
pkgrel=1
pkgdesc="A game just for fun with blocks, animals and a lot of more. "
license=("AGPLv3")
sha256sums=('3e7cbe10775d9b79318d43052bd23079ab9089afc39807b925be9eaf5c1b8d2b')

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
