# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-tutorial
_pkgname=tutorial
_pkgauthor=Wuzzy
pkgver=3.4.0
_cdbrel=23089
pkgrel=1
pkgdesc="Learn how to play Minetest."
license=("GPLv2")
sha256sums=('9cb1154b471eb551dd22387b7e0becb99356f1c1ce30ddc3b03c66b87b1392a0')

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
