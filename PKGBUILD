# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-loria
_pkgname=loria
_pkgauthor=siegment
pkgver=23w03a
_cdbrel=16565
pkgrel=1
pkgdesc="Survival in hardcore acid-alien sci-fi themed world"
license=("GPLv3")
sha256sums=('977b3eba8a8c66f68a9b9e69f795767640de6ba34e4808feb9827725aa36d875')

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
