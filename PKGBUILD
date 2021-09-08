# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.7.1
pkgrel=1
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('e968ff6ab25bdb1f430c1305d7299b11')
sha1sums=('ebd7e4842115e308caa8b43d2e24a10ad0076afb')
sha512sums=('d76594c8e6449d35b15f34cb89e01ff7ace295cf6947312e7f27c6ae9129121eec525f68ce50cece6cc1dbe094efbbbaf0179342ed7bcbc7dd59e9c48a28e478')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
