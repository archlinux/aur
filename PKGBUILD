# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-mineclone5
_pkgname=mineclone5
_pkgauthor=kay27
pkgver=0.71.9
_cdbrel=9953
pkgrel=1
pkgdesc="MineClone 2 with no release milestones, rapid delivery, merges by one approval and no MC target version limitations."
license=("GPLv3")
sha256sums=('8d6b674a09370f57b178bfe2a8e8d2ce113f7b7b7920f0c1654b3fa0dc00c94e')

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
