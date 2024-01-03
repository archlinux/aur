# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-nodeverse
_pkgname=nodeverse
_pkgauthor=aerkiaga
pkgver=0.4.1
_cdbrel=22625
pkgrel=1
pkgdesc="A procedurally generated space exploration game"
license=("GPLv3")
sha256sums=('2b8257fd370c1b2bad7bf0959ec3db31d68275ce3e238355a2abd41b325e45c1')

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
