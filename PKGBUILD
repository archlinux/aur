# Maintainer: Shahriyar <shahriyardx@github.com>

pkgname=brightctrl
pkgver=0.0.8
pkgrel=1
pkgdesc="Terminal UI for external monitor brightness control via DDC/CI"
arch=("x86_64")
url="https://github.com/shahriyardx/brightctrl"
license=("MIT")
depends=("ddcutil")
source_x86_64=("brightctrl::https://github.com/shahriyardx/brightctrl/releases/download/v$pkgver/brightctrl-x86_64")
sha256sums_x86_64=("9eb71733811c19c251767ae086baf22897b446d67638c19cd25621a70811f8f2")

package() {
  install -Dm755 "$srcdir/brightctrl" "$pkgdir/usr/bin/brightctrl"
  install -Dm755 "$srcdir/brightctrl" "$pkgdir/usr/bin/bctrl"
}
