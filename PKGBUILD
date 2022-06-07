# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-repixture
_pkgname=repixture
_pkgauthor=Wuzzy
pkgver=3.2.1
_cdbrel=12467
pkgrel=1
pkgdesc="Simplistic sandbox survival game that plays in mostly lush biomes in a mostly peaceful world and only simple technologies."
license=("LGPLv2.1")
sha256sums=('189f27ebc643a5d66fbdc3dbe653036f7a8a139f8fa8968f5db060d23d9077fc')

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
