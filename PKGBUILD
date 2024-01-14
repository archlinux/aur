# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-proxima-survival
_pkgname=proxima_survival
_pkgauthor=debiankaios
epoch=2
pkgver=0.1.1
_cdbrel=16508
pkgrel=1
pkgdesc="Survival on Proxima Centauri B. Work in Progress! "
license=("GPLv3")
sha256sums=('563107f50b7403f7d312fcb58eb5d58457de95cd36c7b29714b9a5a1954c73ce')

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
