# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=1.4.0
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-vscode"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('8037416a030fc49591419fcfb4378c2b')
sha1sums=('4f8489efe7c2e58f7fab0890c9c9fa2a33d9b6c7')
sha512sums=('57d5c690d75664fb5c46e741bc73ea649d1413ce019126034132d7557f2b90aec15b2d8483ad3bc3684a393def3ce1c4ff9e3dc5c0910cb8c0e07d606f31732a')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
