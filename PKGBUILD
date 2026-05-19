# Maintainer: Shahriyar <shahriyardx@github.com>

pkgname=brightctrl
pkgver=0.0.9
pkgrel=1
pkgdesc="Terminal UI for external monitor brightness control via DDC/CI"
arch=("any")
url="https://github.com/shahriyardx/brightctrl"
license=("MIT")
depends=("nodejs" "ddcutil")
source=("brightctrl::https://github.com/shahriyardx/brightctrl/releases/download/v$pkgver/brightctrl")
sha256sums=("SKIP")

package() {
  install -Dm755 "$srcdir/brightctrl" "$pkgdir/usr/bin/brightctrl"
  install -Dm755 "$srcdir/brightctrl" "$pkgdir/usr/bin/bctrl"
}
