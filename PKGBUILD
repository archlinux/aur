# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-colour-hop
_pkgname=colourhop
_pkgauthor=talas
pkgver=1.1.5
_cdbrel=10744
pkgrel=1
pkgdesc="Help the jumping blobs defeat the evil dragons and bring colour back to the world."
license=("GPLv3")
sha256sums=('366a105351d1c7b3facd548ffdff2359967e47031cd260bb85acac5c9886c7aa')

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
