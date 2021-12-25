# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-lazarr
_pkgname=lazarr
_pkgauthor=Wuzzy
pkgver=1.2
_cdbrel=10174
pkgrel=1
pkgdesc="Laser puzzle game"
license=("GPLv3")
sha256sums=('650c293155d33050c07d982b2f906902fe5d409aaadfb3f53956edfdbfca2dbf')

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
