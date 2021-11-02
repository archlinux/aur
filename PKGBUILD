# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-prang
_pkgname=prang
_pkgauthor=luk3yx
pkgver=2021.10.04
_cdbrel=9434
pkgrel=1
pkgdesc="An unofficial port of PRANG!, a 2D arcade-style game. "
license=("MIT")
sha256sums=('94154638ea3eb015309a671b701cdbb8230b8970faf1a7cb1b40a99b771a312d')

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
