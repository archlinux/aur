# Maintainer: Clément Martinez <clementmartinezdev at gmail dot com>
pkgname=sway-interactive-screenshot
pkgver=1.0.1
pkgrel=1
url="https://github.com/moverest/sway-interactive-screenshot"
pkgdesc="Take screenshot easly on Sway"
arch=('x86_64')
license=('MIT')
depends=('jq' 'rofi' 'grim' 'slurp' 'libnotify' 'wl-clipboard')
source=("https://github.com/moverest/sway-interactive-screenshot/archive/$pkgver.tar.gz")
sha256sums=('26fc19910a7fd2692ffe6a73e52a681f35578364e63d230fd45934d581d66f14')

package() {
	cd "sway-interactive-screenshot-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	cp sway-interactive-screenshot "$pkgdir/usr/bin/"
}
