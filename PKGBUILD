# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-cellestial-game
_pkgname=cellestial_game
_pkgauthor=LMD
pkgver=r40
_cdbrel=6129
pkgrel=1
pkgdesc="Game of Life in three dimensions."
license=("GPLv3")
sha256sums=('1a4b9f2cc56559bd56e1bb1bb3df43dc73b55557bdd3050c59ea31be454c8abf')

arch=("any")
url="https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/"
depends=("minetest-common")
makedepends=("unzip")
source=("${_pkgname}-${pkgver}.zip::https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/releases/${_cdbrel}/download/")
options=(!strip)
noextract=("${_pkgname}-${pkgver}.zip")

package() {
	install -d "${pkgdir}/usr/share/minetest/games/"
	unzip "${_pkgname}-${pkgver}.zip" -d "${pkgdir}/usr/share/minetest/games/"
}
