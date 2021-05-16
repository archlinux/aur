# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.4.0
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('15052ecbf8314bc9691d4f3109c44735')
sha1sums=('3362ca56cdc1fdaae306c07a88c1caab8c8ae0eb')
sha512sums=('6dc696e2c0532b060d2efacb1dd249645108f9dda10330a919c840bfb2bd417bbb79d87b237ae7e14e7f46b664b54ddb8a93af146d8cf23f1f1bb7471d6c4e7d')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
