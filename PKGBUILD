# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-proxima-survival
_pkgname=proxima_survival
_pkgauthor=debiankaios
pkgver=0.5.2
_cdbrel=9308
pkgrel=1
pkgdesc="Survival on Proxima Centauri B. Work in Progress! "
license=("GPLv3")
sha256sums=('0ae9da937fd82b2ed4c24f94ddbfbb948374af5dd60f72873fa19888549ba361')

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
