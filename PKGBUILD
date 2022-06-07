# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-mesecons-lab
_pkgname=mesecons_lab
_pkgauthor=BuckarooBanzay
pkgver=2022.04.27
_cdbrel=11990
pkgrel=1
pkgdesc="Mesecons laboratory and tutorials"
license=("MIT")
sha256sums=('55dfa53c20cab07cd72a5220d76858060bd404720282cba6d980cd3316809dc2')

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
