# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-exile
_pkgname=exile
_pkgauthor=Mantar
pkgver=0.3.4
_cdbrel=9596
pkgrel=1
pkgdesc="Challenging, at times brutal, wilderness survival with simple technology. Actively in development!"
license=("LGPLv3")
sha256sums=('5113d32c95c6000e8a977c00401fbde3e0c6a3581dfb29dff603e189aeb1b348')

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
