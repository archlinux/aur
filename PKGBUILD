# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-colour-hop
_pkgname=colourhop
_pkgauthor=talas
pkgver=1.2.4
_cdbrel=21713
pkgrel=1
pkgdesc="Help the jumping blobs defeat the evil dragons and bring colour back to the world."
license=("GPLv3")
sha256sums=('b91071148fa7aa02aa7dabeb0d8c8fcf85c0bb90e0344bd72bd6926c473aff08')

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
