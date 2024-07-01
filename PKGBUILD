# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-repixture
_pkgname=repixture
_pkgauthor=Wuzzy
pkgver=3.16.0
_cdbrel=25362
pkgrel=1
pkgdesc="Simplistic sandbox survival game that plays in mostly lush biomes in a mostly peaceful world and only simple technologies."
license=("LGPLv2.1")
sha256sums=('329519eabc025e3fb507f68176983a5e4fa912fd2035344996005fcbe41aa9ef')

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
