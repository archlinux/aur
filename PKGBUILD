# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-lordofthetest
_pkgname=lordofthetest
_pkgauthor=Amaz
pkgver=1.2.5
_cdbrel=10555
pkgrel=1
pkgdesc="Lord of the Test is a game which adds LOTR elements to Minetest "
license=("LGPLv2.1")
sha256sums=('b0b83783f2693e3416afb9b99730dad16b35562020b40b5b523d7ff9bcdd866c')

arch=("any")
url="https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/"
depends=("minetest-common")
source=("${_pkgname}-${pkgver}.zip::https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/releases/${_cdbrel}/download/")
options=(!strip)
noextract=("${_pkgname}-${pkgver}.zip")

package() {
	# the release zip has the files in the root of the archive
	install -d "${pkgdir}/usr/share/minetest/games/${_pkgname}"
	unzip "${_pkgname}-${pkgver}.zip" -d "${pkgdir}/usr/share/minetest/games/${_pkgname}/"
}
