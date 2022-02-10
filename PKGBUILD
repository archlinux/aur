# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-minegistic
_pkgname=minegistic
_pkgauthor=logalog
pkgver=2022.02.05
_cdbrel=11103
pkgrel=1
pkgdesc="Basic game of connecting resource nodes together"
license=("GPLv3")
sha256sums=('045c5f2268864281221cfbb7d3effa2d98a539dc1cecc2f707293932f39545f1')

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
