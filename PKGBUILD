# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-formspec-editor
_pkgname=formspec_editor
_pkgauthor=Just_Visiting
pkgver=1.1
_cdbrel=8551
pkgrel=1
pkgdesc="A Realtime in-game formspec viewer/editor "
license=("MIT")
sha256sums=('4df0b8d041218ed0bb6a02f59be82d1e1bbdadc96eeedf0f4f329e44ac9b6751')

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
