# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-mesecons-lab
_pkgname=mesecons_lab
_pkgauthor=BuckarooBanzay
pkgver=2021.12.02
_cdbrel=9847
pkgrel=1
pkgdesc="Mesecons laboratory and tutorials"
license=("MIT")
sha256sums=('184d80f23a2ee5318dd41b314ee1c98a606b3883339f42ff9ac638ee0acd25a9')

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
