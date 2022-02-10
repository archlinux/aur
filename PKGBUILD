# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-proxima-survival
_pkgname=proxima_survival
_pkgauthor=debiankaios
epoch=2
pkgver=0.1
_cdbrel=10624
pkgrel=1
pkgdesc="Survival on Proxima Centauri B. Work in Progress! "
license=("GPLv3")
sha256sums=('d46b230e9bfbfdfbf646afbe3ef98988bc969a43872532592b0cbb9c7073fd84')

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
