# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.3.0
pkgrel=2
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('2d1222397fa32fb08f05d45a249921af')
sha1sums=('c84b8d0e8d2200db6801e4e1e506a98149bcf7b8')
sha512sums=('e7f81a6ec48f9de29bd6929f4f34f213a431f7ff55d0eb749fa5a567cd0b41f261c3eaadc5e7ecc6870c2df0295161e274c1d053e075f657f920e3a3c4b949b1')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
