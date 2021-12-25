# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-jail-escape
_pkgname=jail_escape
_pkgauthor=StarNinjas
pkgver=1.1
_cdbrel=10205
pkgrel=1
pkgdesc="Escape the Jail! Don't get caught!"
license=("CC0")
sha256sums=('d9f906ef68c0c85b17e7924856862793f8a667cd06df500c266590ae5680e9a9')

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
