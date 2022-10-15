# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-xaenvironment
_pkgname=xaenvironment
_pkgauthor=AiTechEye
pkgver=2022.10.15
_cdbrel=14372
pkgrel=1
pkgdesc="A game that aims to contain lots of environments and things."
license=("LGPLv2.1")
sha256sums=('e289c28f5dd642a0066d30e47725941db2966e289df46d7538c30ff97b610037')

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
