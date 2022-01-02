# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-mineclone5
_pkgname=mineclone5
_pkgauthor=kay27
pkgver=0.71.12
_cdbrel=10395
pkgrel=1
pkgdesc="MineClone 2 with no release milestones, rapid delivery, merges by one approval and no MC target version limitations."
license=("GPLv3")
sha256sums=('41f3f1c943089c0500cf698d46301ce156821c15ffbd54ce2f33478e39d2c7df')

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
