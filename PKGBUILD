# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-exile
_pkgname=exile
_pkgauthor=Mantar
pkgver=0.3.7
_cdbrel=12399
pkgrel=1
pkgdesc="Challenging, at times brutal, wilderness survival with simple technology. Actively in development!"
license=("LGPLv3")
sha256sums=('ba86406d91e2b354b2b8a018065f6886b352e6b8175d62eb4241d00384e549d3')

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
