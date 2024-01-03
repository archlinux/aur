# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-xaenvironment
_pkgname=xaenvironment
_pkgauthor=AiTechEye
pkgver=2024.01.03
_cdbrel=22729
pkgrel=1
pkgdesc="A game that aims to contain lots of environments and things."
license=("LGPLv2.1")
sha256sums=('451b12b52750abd3ec72d54e7e24462a0527855a2b9d71381d08256b38a9d685')

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
