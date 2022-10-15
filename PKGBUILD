# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-planet-alive
_pkgname=a_planet_alive
_pkgauthor=daret
pkgver=0.8.1
_cdbrel=7402
pkgrel=1
pkgdesc="Living World full of mobs / Work in Progress (WIP) "
license=("LGPLv2.1")
sha256sums=('692f4035234a7b9cb7fac5d63dea9486075fa449ff00063ae7b9f593fbe15b8f')

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
