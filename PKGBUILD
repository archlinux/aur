# Maintainer: Clément Martinez <clementmartinezdev at gmail dot com>
pkgname=sway-interactive-screenshot
pkgver=1.1.0
pkgrel=1
url="https://github.com/moverest/sway-interactive-screenshot"
pkgdesc="Take screenshot easly on Sway"
arch=('x86_64')
license=('MIT')
depends=('jq' 'rofi' 'grim' 'slurp' 'libnotify' 'wl-clipboard')
optdepends=('swappy: edit screenshots')
source=("https://github.com/moverest/sway-interactive-screenshot/archive/$pkgver.tar.gz")
sha256sums=('2b9497d5710db40f0af1c1ce0ca4055b8be827aa2ee2b7644790b640dd81d98b')

package() {
	cd "sway-interactive-screenshot-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	cp sway-interactive-screenshot "$pkgdir/usr/bin/"
}
