# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=minetest-nodecore
pkgver=8128
pkgrel=1
pkgdesc="Original, immersive puzzle/adventure game with NO popup GUIs, minimal HUDs."
arch=("any")
url="https://content.minetest.net/packages/Warr1024/nodecore/"
license=("MIT")
depends=("minetest-common")
source=("nodecore-$pkgver.zip::https://content.minetest.net/packages/Warr1024/nodecore/releases/${pkgver}/download/")
sha256sums=('3efe5b0764b6f34d5c187ad3262481fe0d6987f95e12087cca949beed0ac45b0')
options=(!strip)

package() {
	for f in $(find . -type f); do
		install -Dm644 "$f" "$pkgdir/usr/share/minetest/games/nodecore/$f"
	done
}
