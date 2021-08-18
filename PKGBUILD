# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-repixture
_pkgname=repixture
_pkgauthor=Wuzzy
pkgver=1.5.1
_cdbrel=8820
pkgrel=1
pkgdesc="Simplistic sandbox survival game that plays in mostly lush biomes in a mostly peaceful world and only simple technologies."
license=("LGPLv2.1")
sha256sums=('0e6c22aa6658c53f3cf9bbdc35e71ef04b0b52f54c4e99f0b2f526a019c7d377')

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
