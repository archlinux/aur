# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-xaenvironment
_pkgname=xaenvironment
_pkgauthor=AiTechEye
pkgver=2021.04.02
_cdbrel=7314
pkgrel=1
pkgdesc="A game that aims to contain lots of environments and things."
license=("LGPLv2.1")
sha256sums=('0c1b19016e43e65f73513b4912eca301fa2aca343d662909e6e9ef9188eaa6e8')

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
