# Maintainer: Clément Martinez <clementmartinezdev at gmail dot com>
pkgname=sway-interactive-screenshot
pkgver=1.2.1
pkgrel=1
url="https://github.com/moverest/sway-interactive-screenshot"
pkgdesc="Take screenshot easly on Sway"
arch=('x86_64')
license=('MIT')
depends=('jq' 'fuzzel' 'grim' 'slurp' 'libnotify' 'wl-clipboard')
optdepends=('swappy: edit screenshots')
source=("https://github.com/moverest/sway-interactive-screenshot/archive/$pkgver.tar.gz")
sha256sums=('d96706f16b053527d5637454e55fbf0f67e2fc06e34e40236a3eb96997ea4306')

package() {
	cd "sway-interactive-screenshot-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	cp sway-interactive-screenshot "$pkgdir/usr/bin/"
}
