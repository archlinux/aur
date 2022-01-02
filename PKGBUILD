# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-nodeverse
_pkgname=nodeverse
_pkgauthor=aerkiaga
pkgver=0.1.5
_cdbrel=10324
pkgrel=1
pkgdesc="A procedurally generated space exploration game"
license=("GPLv3")
sha256sums=('71e4101229b062b4b1ef753d014f5102c3b508190e98d0cf137ea19431abc98b')

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
