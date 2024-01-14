# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-cellestial-game
_pkgname=cellestial_game
_pkgauthor=LMD
pkgver=r41
_cdbrel=18356
pkgrel=1
pkgdesc="Game of Life in three dimensions."
license=("GPLv3")
sha256sums=('8fd2653badfbac1d1f9fcff14a979e930b0eda2021fe2c3940ec608014581d82')

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
