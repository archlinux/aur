
# Maintainer: Ghibranalj <ghibranraljaur@gmail.com>
pkgname=rgb-tui-bin
pkgver=1.1
pkgrel=1
_name="rgb-tui-1.0.0-Linux"
pkgdesc="Create and get colors code from the terminal using a nice interface."
arch=('x86_64')
url="https://github.com/ArthurSonzogni/rgb-tui"
license=('MIT')
provides=(rgb-tui)
conflicts=(rgb-tui-git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ArthurSonzogni/rgb-tui/releases/download/v${pkgver}/${_name}.tar.gz")
sha256sums=('9a0f0d04b2ce257ecb8e4b38e1edd3a1a5a643538cf4bca2a242c0c933e866bc')

package() {
	cd "$srcdir"/$_name/bin
	install -D rgb-tui $pkgdir/usr/bin/rgb-tui
}
