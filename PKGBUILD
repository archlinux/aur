# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-nodecore
_pkgname=nodecore
_pkgauthor=Warr1024
pkgver=01620810
_cdbrel=9805
pkgrel=1
pkgdesc="Original, immersive puzzle/adventure game with NO popup GUIs, minimal HUDs."
license=("MIT")
sha256sums=('7030d0c72775f65432abe92917a9d15f1a09c1e6518067b0a1b1c85706eb24a9')

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
