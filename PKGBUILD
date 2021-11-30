# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-mesecons-lab
_pkgname=mesecons_lab
_pkgauthor=BuckarooBanzay
pkgver=2021.11.30
_cdbrel=9820
pkgrel=1
pkgdesc="Mesecons laboratory and tutorials"
license=("MIT")
sha256sums=('1ea313dad4415439a248bbf915bbf2f2aee19ad61e3ac687de930399bc961da7')

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
