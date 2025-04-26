# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-exile
_pkgname=exile
_pkgauthor=Mantar
pkgver=0.3.18g
pkgrel=1
pkgdesc="Challenging, at times brutal, wilderness survival with simple technology. Actively in development!"
license=("LGPLv3")
sha256sums=('163883fb2d7d49da004e49995b66b598f0ea0424d95c9dff76a16bb59dc687cc')
arch=("any")
url="https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/"
#depends=("minetest-common")
source=("https://content.luanti.org/uploads/6eb51b6d78.zip")
options=(!strip)

package() {
	install -d "${pkgdir}/usr/share/minetest/games/"
	mv $_pkgname "${pkgdir}/usr/share/minetest/games/"
}
