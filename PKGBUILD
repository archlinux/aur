# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-hades-revisited
_pkgname=hades_revisited
_pkgauthor=Wuzzy
pkgver=0.15.5
_cdbrel=23418
pkgrel=1
pkgdesc="Use your limited supplies to survive and use terraforming to create a beautiful habitable place."
license=("LGPL2.1")
sha256sums=('d7d3fb2661ae28b5d9d804d0cc1ca78e53ac81b8d35e7acdb0eef0aaa8778b71')

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
