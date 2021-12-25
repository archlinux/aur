# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-snake-3d
_pkgname=snake_3d
_pkgauthor=cx384
pkgver=1.1
_cdbrel=10140
pkgrel=1
pkgdesc="The classical Snake game extended to 3 dimensions."
license=("LGPLv2.1")
sha256sums=('d25d81192f7140a73196affe4d052ec8d47d7228d1cdc3be3d678f06a07f7673')

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
