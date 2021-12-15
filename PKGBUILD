# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-mineclone5
_pkgname=mineclone5
_pkgauthor=kay27
pkgver=0.71.10
_cdbrel=10033
pkgrel=1
pkgdesc="MineClone 2 with no release milestones, rapid delivery, merges by one approval and no MC target version limitations."
license=("GPLv3")
sha256sums=('dde850deba01492a6d7b0fd4ab6116def967faa7dc837dd96585a68cde110f31')

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
