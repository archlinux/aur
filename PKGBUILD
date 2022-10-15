# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-mineclone5
_pkgname=mineclone5
_pkgauthor=kay27
pkgver=5.1.11
_cdbrel=12904
pkgrel=1
pkgdesc="MineClone 2 with no release milestones, rapid delivery, merges by one approval and no MC target version limitations."
license=("GPLv3")
sha256sums=('3ce2a52cc1543176a112bc19e2e9abac71784a4a3bba1c0abcf7af64a1136997')

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
