# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-nodeverse
_pkgname=nodeverse
_pkgauthor=aerkiaga
pkgver=0.1.4
_cdbrel=9172
pkgrel=1
pkgdesc="A procedurally generated space exploration game"
license=("GPLv3")
sha256sums=('94059613ae1926bff44e5a29dc94ff71186ca7e8ee10b77fe23667082b32a13d')

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
