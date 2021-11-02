# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-mesecons-lab
_pkgname=mesecons_lab
_pkgauthor=BuckarooBanzay
pkgver=2021.11.02
_cdbrel=9603
pkgrel=1
pkgdesc="Mesecons laboratory and tutorials"
license=("MIT")
sha256sums=('316e8be13ef8fc383f761e2c1df81901d42bcb29e75f88d23be780b0cb6e5b24')

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
