# Maintainer: Clément Martinez <me at moverest dot xyz>
pkgname=sway-interactive-screenshot
pkgver=2.0.3
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
sha256sums=('44615eb17c69092e549dc04c7c2fa9701cb3faa0228f147e178da3032d20d16c')

package() {
	cd "sway-interactive-screenshot-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	cp sway-interactive-screenshot "$pkgdir/usr/bin/"
}
