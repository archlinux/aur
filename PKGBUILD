# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-prang
_pkgname=prang
_pkgauthor=luk3yx
pkgver=2021.11.14
_cdbrel=9660
pkgrel=1
pkgdesc="An unofficial port of PRANG!, a 2D arcade-style game. "
license=("MIT")
sha256sums=('ce70dc7a330e652ca5b9ab4657c676327d6c5680c35c8c077629b78c303b20ce')

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
