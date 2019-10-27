# Maintainer: Clément Martinez <clementmartinezdev at gmail dot com>
pkgname=sway-interactive-screenshot
pkgver=1.0
pkgrel=1
url="https://github.com/moverest/sway-interactive-screenshot"
pkgdesc="Take screenshot easly on Sway"
arch=('x86_64')
license=('MIT')
depends=('jq' 'rofi' 'grim' 'slurp' 'libnotify' 'wl-clipboard')
source=("https://github.com/moverest/sway-interactive-screenshot/archive/$pkgver.tar.gz")
md5sums=('1d63968ac60f3fb2b269e1bd64f163ae')

package() {
	cd "sway-interactive-screenshot-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	cp sway-interactive-screenshot "$pkgdir/usr/bin/"
}
