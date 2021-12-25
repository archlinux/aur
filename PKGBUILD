# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-builda-city
_pkgname=buildacity
_pkgauthor=Splizard
pkgver=0.3.2
_cdbrel=10209
pkgrel=1
pkgdesc="Your job is to build a city, so that you can supply it with electricity! Press I ingame for help."
license=("AGPLv3")
sha256sums=('1fd094996c4992c6e870478c888fbc46384c8bea0f89c17fd2a39065ee4361cf')

arch=("any")
url="https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/"
depends=("minetest-common")
source=("${_pkgname}-${pkgver}.zip::https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/releases/${_cdbrel}/download/")
options=(!strip)
noextract=("${_pkgname}-${pkgver}.zip")

package() {
	# the release zip has the files in the root of the archive
	install -d "${pkgdir}/usr/share/minetest/games/${_pkgname}"
	unzip "${_pkgname}-${pkgver}.zip" -d "${pkgdir}/usr/share/minetest/games/${_pkgname}/"
}
