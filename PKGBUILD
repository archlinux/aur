# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-holiday-horrors
_pkgname=holidayhorrors
_pkgauthor=sunnysideup
pkgver=2021.12.22
_cdbrel=10179
pkgrel=1
pkgdesc="Survive the holidays!"
license=("MIT")
sha256sums=('e5c7de01b11966aae6efc32e4ae8e27c979f592b2ce1d77d44807bcb870d4f1c')

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
