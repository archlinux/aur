# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-mesecons-lab
_pkgname=mesecons_lab
_pkgauthor=BuckarooBanzay
pkgver=2022.01.12
_cdbrel=10581
pkgrel=1
pkgdesc="Mesecons laboratory and tutorials"
license=("MIT")
sha256sums=('c123c8920153034f95eb23229756654062de4f1d852a865d98e7531d0a5d0af8')

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
