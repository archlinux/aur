# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-xaenvironment
_pkgname=xaenvironment
_pkgauthor=AiTechEye
pkgver=2022.02.22
_cdbrel=11378
pkgrel=1
pkgdesc="A game that aims to contain lots of environments and things."
license=("LGPLv2.1")
sha256sums=('e65ec7cf46b3c9c37025005382c11273a189fc82829a87bfd09999c289703ba7')

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
