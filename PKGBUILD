# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-alter
_pkgname=alter
_pkgauthor=yaman
pkgver=0.1.3
_cdbrel=10376
pkgrel=1
pkgdesc="A challenging puzzle game in a dystopian future."
license=("AGPLv3")
sha256sums=('1e762a15054562e24af1b5d7eacefea86bcc7314569c5247ec549ca148609a15')

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
