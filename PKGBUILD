# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-nodecore
_pkgname=nodecore
_pkgauthor=Warr1024
pkgver=02683559
_cdbrel=22238
pkgrel=1
pkgdesc="Original, immersive puzzle/adventure game with NO popup GUIs, minimal HUDs."
license=("MIT")
sha256sums=('56e89207f6ce9af4863398f8e90372ee5d14b427c3e2269a87cd835ac438023c')

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
