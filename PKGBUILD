# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-exile
_pkgname=exile
_pkgauthor=Mantar
pkgver=0.3.8d
_cdbrel=13402
pkgrel=1
pkgdesc="Challenging, at times brutal, wilderness survival with simple technology. Actively in development!"
license=("LGPLv3")
sha256sums=('3eadd726314aec6e716fb8180c6077448b7b0a3e17aed055df65c889f2a6bea0')

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
