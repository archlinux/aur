# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-minegistic
_pkgname=minegistic
_pkgauthor=logalog
pkgver=0.9.1
_cdbrel=10373
pkgrel=1
pkgdesc="Basic game of connecting resource nodes together"
license=("GPLv3")
sha256sums=('d3bb113c27447b403f48b2d62389f7612b14eb0a7d2069cb848a0dc1fa9c559b')

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
