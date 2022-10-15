# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-alter
_pkgname=alter
_pkgauthor=yaman
pkgver=0.2.1
_cdbrel=12378
pkgrel=1
pkgdesc="A challenging puzzle game in a dystopian future."
license=("AGPLv3")
sha256sums=('9507824982bd497a58471271fd97073a6d2c32b6b6447447969504c20169a40c')

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
