# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-little-lady
_pkgname=littlelady
_pkgauthor=Just_Visiting
pkgver=10113
_cdbrel=10113
pkgrel=1
pkgdesc="A Little Ladybug in a Big World"
license=("MIT")
sha256sums=('6d396cafd6fedc757fc754251e137c945c68079f91c875a066a1fbe17ce9fda0')

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
