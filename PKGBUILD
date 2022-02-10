# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-mineclone5
_pkgname=mineclone5
_pkgauthor=kay27
pkgver=5.1.5
_cdbrel=11126
pkgrel=1
pkgdesc="MineClone 2 with no release milestones, rapid delivery, merges by one approval and no MC target version limitations."
license=("GPLv3")
sha256sums=('919fa878196465dfa785fac4896e430fd1cfce09ddb217ec903fbcfb75ee6db9')

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
