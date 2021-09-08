# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.7.0
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('f2d8da34778d4db86728c8014c3ec5d2')
sha1sums=('bd44479f1ca1b209655c9c314802d2c5898c6769')
sha512sums=('e79c298db1a56d1ac6ec62b1a6b886a107fafa467f7f531f827a28f6d7c07b7f9a3fdb8c96a70010eb163b53755a1e11f6f0e87486a85411b33286a830eb1edf')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
