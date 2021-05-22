# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=minetest-cellestial-game
pkgver=r37
_pkgver=6129
pkgrel=1
pkgdesc="Game of Life in three dimensions."
arch=("any")
url="https://content.minetest.net/packages/LMD/cellestial_game/"
license=("GPLv3")
depends=("minetest-common")
source=("cellestial_game-$_pkgver.zip::https://content.minetest.net/packages/LMD/cellestial_game/releases/${_pkgver}/download/")
sha256sums=('1a4b9f2cc56559bd56e1bb1bb3df43dc73b55557bdd3050c59ea31be454c8abf')
options=(!strip)

package() {
	cd cellestial_game
	find . -type f | while read f; do
		install -Dm644 "$f" "${pkgdir}/usr/share/minetest/games/cellestial_game/$f"
	done
}
