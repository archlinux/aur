# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.4.1
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('46336ac3b2b1b6d96941e654ce6d258b')
sha1sums=('6080bc03df0ec35feb57a165bc2095dbc78e1676')
sha512sums=('56a01f8d3d4c741bed999da9e24acc7b9289cf29844312e2b483e6fb2f11b03b1d850725bd6b8624788eb475b702596db752ef4803895fb7afc79141addd8963')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
