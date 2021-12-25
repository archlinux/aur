# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-proxima-survival
_pkgname=proxima_survival
_pkgauthor=debiankaios
pkgver=0.7.1
_cdbrel=10242
pkgrel=1
pkgdesc="Survival on Proxima Centauri B. Work in Progress! "
license=("GPLv3")
sha256sums=('68d706c59b85535946dec1e0a9c1ff9da1f960a98a75995e151806b5368af0b9')

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
