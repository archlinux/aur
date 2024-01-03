# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-exile
_pkgname=exile
_pkgauthor=Mantar
pkgver=0.3.14b
_cdbrel=22070
pkgrel=1
pkgdesc="Challenging, at times brutal, wilderness survival with simple technology. Actively in development!"
license=("LGPLv3")
sha256sums=('616a6d6624cc9f64619527b1a750a1486233a21f7304441d93cedc17f1c85b92')

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
