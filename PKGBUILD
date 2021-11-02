# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-lordofthetest
_pkgname=lordofthetest
_pkgauthor=Amaz
pkgver=1.2.4
_cdbrel=4798
pkgrel=1
pkgdesc="Lord of the Test is a game which adds LOTR elements to Minetest "
license=("LGPLv2.1")
sha256sums=('c5eda772acd1f477ce8b9f134d79c2c5ca418780af3ed8ed99ce1be01f8061c2')

arch=("any")
url="https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/"
depends=("minetest-common")
source=("${_pkgname}-${pkgver}.zip::https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/releases/${_cdbrel}/download/")
options=(!strip)
noextract=("${_pkgname}-${pkgver}.zip")

package() {
	# the release zip has the files in the root of the archive
	install -d "${pkgdir}/usr/share/minetest/games/${_pkgname}"
	unzip "${_pkgname}-${pkgver}.zip" -d "${pkgdir}/usr/share/minetest/games/${_pkgname}/"
}
