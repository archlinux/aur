# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-nodecore
_pkgname=nodecore
_pkgauthor=Warr1024
pkgver=01561373
_cdbrel=9761
pkgrel=1
pkgdesc="Original, immersive puzzle/adventure game with NO popup GUIs, minimal HUDs."
license=("MIT")
sha256sums=('eeff0708fb219aa47539b0702e443e5e879ce565429b69470a0d678db5810e84')

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
