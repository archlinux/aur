# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-colour-hop
_pkgname=colourhop
_pkgauthor=talas
pkgver=1.2.1
_cdbrel=11925
pkgrel=1
pkgdesc="Help the jumping blobs defeat the evil dragons and bring colour back to the world."
license=("GPLv3")
sha256sums=('e202610082c403c69f4f95319e2b535e8f758a33a07c0f8075ccaa8c53427fd6')

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
