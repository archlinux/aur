# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-colour-hop
_pkgname=colourhop
_pkgauthor=talas
pkgver=1.1.2
_cdbrel=10402
pkgrel=2
pkgdesc="Help the jumping blobs defeat the evil dragons and bring colour back to the world."
license=("GPLv3")
sha256sums=('d67c01c6e0299d9823e34b79e89661dd28919bbaefc2792981d924e487b54da7')

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
