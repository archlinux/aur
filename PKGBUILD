# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-tutorial
_pkgname=tutorial
_pkgauthor=Wuzzy
pkgver=3.2.0
_cdbrel=10973
pkgrel=1
pkgdesc="Learn how to play Minetest."
license=("GPLv2")
sha256sums=('f9adedd42bdf64e14a43b7219570d51473f2f092f558c0ba17329af8832eb004')

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
