# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-colour-hop
_pkgname=colourhop
_pkgauthor=talas
pkgver=1.1.3
_cdbrel=10502
pkgrel=1
pkgdesc="Help the jumping blobs defeat the evil dragons and bring colour back to the world."
license=("GPLv3")
sha256sums=('6d3ae7c57c6c3c3ef0611a0766541d037f29507a06ee300fbed847589ab194ee')

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
