# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-juanchi-game
_pkgname=juanchi
_pkgauthor=runs
pkgver=4.5
_cdbrel=9184
pkgrel=1
pkgdesc="A game just for fun with blocks, animals and a lot of more. "
license=("AGPLv3")
sha256sums=('da43059d4fd736cc1004deb34d4df46fe1ca9a36dc467c26cbc4bb562fa2e14e')

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
