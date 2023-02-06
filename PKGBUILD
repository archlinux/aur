# Maintainer: Clément Martinez <me at moverest dot xyz>
pkgname=sway-interactive-screenshot
pkgver=2.0
pkgrel=1
url="https://github.com/moverest/sway-interactive-screenshot"
pkgdesc="Interactively take screenshot within Sway."
arch=('x86_64')
license=('MIT')
depends=('sway' 'fuzzel' 'grim' 'slurp' 'libnotify' 'wl-clipboard' 'python')
optdepends=(
	'swappy: edit screenshots'
	'dragon-drop: drap file to other programs'
	'xdg-utils: open file'
	'wf-recorder: capture screencasts'
)
source=("https://github.com/moverest/sway-interactive-screenshot/archive/$pkgver.tar.gz")
sha256sums=('663e1d956074e0418e52696b15fb1882ba9f6cea2b1b2b7fe9c583d3ec3bf6ab')

package() {
	cd "sway-interactive-screenshot-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	cp sway-interactive-screenshot "$pkgdir/usr/bin/"
}
