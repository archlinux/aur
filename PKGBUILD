# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-minegistic
_pkgname=minegistic
_pkgauthor=logalog
pkgver=2023.06.08
_cdbrel=19111
pkgrel=1
pkgdesc="Basic game of connecting resource nodes together"
license=("GPLv3")
sha256sums=('c9b8c5bc81e3b64b6c801fef6f03b6430f03d0c50875e446383c0788d08fa030')

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
