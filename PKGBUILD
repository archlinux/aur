# Maintainer: Clément Martinez <clementmartinezdev at gmail dot com>
pkgname=sway-interactive-screenshot
pkgver=1.2.0
pkgrel=1
url="https://github.com/moverest/sway-interactive-screenshot"
pkgdesc="Take screenshot easly on Sway"
arch=('x86_64')
license=('MIT')
depends=('jq' 'fuzzel' 'grim' 'slurp' 'libnotify' 'wl-clipboard')
optdepends=('swappy: edit screenshots')
source=("https://github.com/moverest/sway-interactive-screenshot/archive/$pkgver.tar.gz")
sha256sums=('cdfe3c54d296dc05da4bc151ce962f1214e66a0e3fc6c48f40a757462e382b32')

package() {
	cd "sway-interactive-screenshot-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	cp sway-interactive-screenshot "$pkgdir/usr/bin/"
}
