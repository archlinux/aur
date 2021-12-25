# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-minegistic
_pkgname=minegistic
_pkgauthor=logalog
pkgver=0.8.1
_cdbrel=10229
pkgrel=1
pkgdesc="Basic game of connecting resource nodes together"
license=("GPLv3")
sha256sums=('979ad1b07302c023b9f8b9862ed62ddbab415ebc79d403dddd984bd5760034dd')

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
