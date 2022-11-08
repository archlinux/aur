# Maintainer: Gustavo Parreira <gustavotcparreira at gmail dot com>
pkgname=hyprland-interactive-screenshot
pkgver=1.0.0
pkgrel=1
url="https://github.com/Gustash/hyprland-interactive-screenshot"
pkgdesc="Take screenshot easly on Hyprland"
arch=('x86_64')
license=('MIT')
depends=('jq' 'rofi' 'grim' 'slurp' 'libnotify' 'wl-clipboard')
optdepends=('swappy: edit screenshots')
source=("https://github.com/Gustash/hyprland-interactive-screenshot/archive/$pkgver.tar.gz")
sha256sums=('0f315db0ee54381daaa400e3d19b3cbee294cc035c7b918807abd7eb097c205d')

package() {
	cd "hyprland-interactive-screenshot-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	cp hyprland-interactive-screenshot "$pkgdir/usr/bin/"
}
