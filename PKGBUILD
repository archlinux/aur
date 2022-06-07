# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-minegistic
_pkgname=minegistic
_pkgauthor=logalog
pkgver=2022.02.24
_cdbrel=11420
pkgrel=1
pkgdesc="Basic game of connecting resource nodes together"
license=("GPLv3")
sha256sums=('05a203ea33ff79d59a0cdcc7ff8ac17820e7532b7d94664612d580920b2709eb')

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
