# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-loria
_pkgname=loria
_pkgauthor=siegment
pkgver=21w30h
_cdbrel=8599
pkgrel=1
pkgdesc="Survival in hardcore acid-alien sci-fi themed world"
license=("GPLv3")
sha256sums=('e984047236d08289c62eb9ca2deac53ba2ead60b2af05773cf4f9381e22efc8d')

arch=("any")
url="https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/"
depends=("minetest-common")
makedepends=("unzip")
source=("${_pkgname}-${pkgver}.zip::https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/releases/${_cdbrel}/download/")
options=(!strip)
noextract=("${_pkgname}-${pkgver}.zip")

package() {
	# the release zip has the files in the root of the archive
	install -d "${pkgdir}/usr/share/minetest/games/${_pkgname}"
	unzip "${_pkgname}-${pkgver}.zip" -d "${pkgdir}/usr/share/minetest/games/${_pkgname}/"
}
