# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-proxima-survival
_pkgname=proxima_survival
_pkgauthor=debiankaios
pkgver=0.6
_cdbrel=9809
pkgrel=1
pkgdesc="Survival on Proxima Centauri B. Work in Progress! "
license=("GPLv3")
sha256sums=('0af12d592f2fbc5373fe5255e01fc4c95ad3768ae1886114194c8aab73e861a9')

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
