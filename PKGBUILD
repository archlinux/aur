# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-juanchi-game
_pkgname=juanchi
_pkgauthor=runs
pkgver=4.10
_cdbrel=11597
pkgrel=1
pkgdesc="A game just for fun with blocks, animals and a lot of more. "
license=("AGPLv3")
sha256sums=('c675b686da7e11b13073936d3ec4cdae23f931c4c05585005dadfb2189f27633')

arch=("any")
url="https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/"
depends=("minetest-common")
makedepends=("unzip")
source=("${_pkgname}-${pkgver}.zip::https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/releases/${_cdbrel}/download/")
options=(!strip)
noextract=("${_pkgname}-${pkgver}.zip")

package() {
	install -d "${pkgdir}/usr/share/minetest/games/"
	unzip "${_pkgname}-${pkgver}.zip" -d "${pkgdir}/usr/share/minetest/games/"
}
