# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-balloonair
_pkgname=balloonair
_pkgauthor=NO11
pkgver=1.0.1
_cdbrel=14625
pkgrel=1
pkgdesc="A hot air balloon game created for the 2021 Minetest GAME JAM."
license=("GPLv3")
sha256sums=('007992c343e30bd5d5935c301b8d57ac7b4fd5d27c253c32d1254d4e58b6bb04')

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
