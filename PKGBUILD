# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-xaenvironment
_pkgname=xaenvironment
_pkgauthor=AiTechEye
pkgver=2024.03.12
_cdbrel=24115
pkgrel=1
pkgdesc="A game that aims to contain lots of environments and things."
license=("LGPLv2.1")
sha256sums=('19b40a6fcb61a644f2b7b006e30bfed1f9b42e2e912f98e2d95965028e09ab9c')

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
