# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=minetest-hades-revisited
pkgver=0.9.2
pkgrel=1
pkgdesc="Use your limited supplies to survive and use terraforming to create a beautiful habitable place."
arch=("any")
url="https://content.minetest.net/packages/Wuzzy/hades_revisited/"
license=("LGPL3")
depends=("minetest-common")
source=("hades_revisited-$pkgver.zip::https://repo.or.cz/minetest_hades/hades_revisited.git/snapshot/${pkgver}.zip")
sha256sums=('899141b3718f6fc2fa8f3c2eb8f444ac8b7eef9468f5afb62dbd105b6d89e206')
options=(!strip)

package() {
	cd "hades_revisited-$pkgver-"*

	for f in $(find . -type f); do
		install -Dm644 "$f" "$pkgdir/usr/share/minetest/games/hades_revisited/$f"
	done
}
