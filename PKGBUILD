# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-repixture
_pkgname=repixture
_pkgauthor=Wuzzy
pkgver=3.11.0
_cdbrel=22052
pkgrel=1
pkgdesc="Simplistic sandbox survival game that plays in mostly lush biomes in a mostly peaceful world and only simple technologies."
license=("LGPLv2.1")
sha256sums=('b59d43e70ab24d096ec4780c03db0dcb39af29989755c24743e31a8cee6fbf5b')

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
