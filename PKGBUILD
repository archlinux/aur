# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-lazarr
_pkgname=lazarr
_pkgauthor=Wuzzy
pkgver=1.3.1
_cdbrel=11670
pkgrel=1
pkgdesc="Laser puzzle game"
license=("GPLv3")
sha256sums=('bd17518ee01a1c5337dd4d3775d44806aadd668bc95a1600a1491e063376c87a')

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
