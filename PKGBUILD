# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-box-world-3d
_pkgname=boxworld3d
_pkgauthor=Hume2
pkgver=1
_cdbrel=7435
pkgrel=1
pkgdesc="A puzzle game where you push boxes into marbles, whilst avoiding obstacles "
license=("AGPLv3")
sha256sums=('14443f0b859a93825144dd0c2db1ee1c5eb441d6d92e5aa8cccee63677e0a180')

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
