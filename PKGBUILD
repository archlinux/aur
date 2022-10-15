# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-nodecore
_pkgname=nodecore
_pkgauthor=Warr1024
pkgver=02068428
_cdbrel=14244
pkgrel=1
pkgdesc="Original, immersive puzzle/adventure game with NO popup GUIs, minimal HUDs."
license=("MIT")
sha256sums=('fdad2d3154f901ad8d8188b844b1450dbb4dad66b6b2be43bbbe15b543e17228')

arch=("any")
url="https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/"
depends=("minetest-common")
makedepends=("unzip")
source=("${_pkgname}-${pkgver}.zip::https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/releases/${_cdbrel}/download/")
options=(!strip)
noextract=("${_pkgname}-${pkgver}.zip")

package() {
	# the release zip has the files in the root of the archive
	install -d "${pkgdir}/usr/share/minetest/games/${_pkgname}"
	unzip "${_pkgname}-${pkgver}.zip" -d "${pkgdir}/usr/share/minetest/games/${_pkgname}/"
}
