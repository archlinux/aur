# Maintainer: Jett Scythe
pkgname=wifitui-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Fast featureful friendly wifi terminal UI."
arch=('x86_64')
url="https://github.com/shazow/wifitui"
license=('MIT')
source=("https://github.com/shazow/wifitui/releases/download/v${pkgver}/wifitui-${pkgver}-linux-${CARCH}.pkg.tar.zst")
sha256sums=('057d81bd265af117ef38057c8d4d7c8895b677d6dddd4d3c593634ae4546e700')

package() {
  cd "$srcdir"
  install -Dm755 usr/bin/wifitui "$pkgdir/usr/bin/wifitui"
}
