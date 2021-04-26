# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-vscode
pkgver=1.2.0
pkgrel=1
pkgdesc="Add VSCode workspaces to Gnome search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-vscode"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('4a1b74216e3c26c63a78fabd9e2b4e22')
sha1sums=('079add23ac53ac50d15b6e25fb2e61e9cf206ee0')
sha512sums=('6cfc9df4a9adcb085cfb38e74b3366f14affa7d2dd7a6336350fe2f2e38d5ccbf66d01eaadaa439e16e1f2fb14e631c1ff93ae97c8877cf2d8100f170d176c9f')

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
