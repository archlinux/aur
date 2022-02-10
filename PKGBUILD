# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-exile
_pkgname=exile
_pkgauthor=Mantar
pkgver=0.3.5
_cdbrel=10746
pkgrel=1
pkgdesc="Challenging, at times brutal, wilderness survival with simple technology. Actively in development!"
license=("LGPLv3")
sha256sums=('c90fdd9a3341ebf8d29c6480c21658465d97fb784eb117a76589f2195b4a0173')

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
