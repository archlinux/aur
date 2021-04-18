# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=minetest-nodecore
pkgver=7333
pkgrel=1
pkgdesc="Original, immersive puzzle/adventure game with NO popup GUIs, minimal HUDs."
arch=("any")
url="https://content.minetest.net/packages/Warr1024/nodecore/"
license=("MIT")
depends=("minetest-common")
source=("nodecore-$pkgver.zip::https://content.minetest.net/packages/Warr1024/nodecore/releases/${pkgver}/download/")
sha256sums=('9cf9023fddc3d1e89c4fc8dc85e98cd028a6648058ecc8d9cd21bff8a4edf5ed')
options=(!strip)

package() {
	for f in $(find . -type f); do
		install -Dm644 "$f" "$pkgdir/usr/share/minetest/games/nodecore/$f"
	done
}
