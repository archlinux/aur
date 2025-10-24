# Maintainer: Jett Scythe
pkgname=wifitui-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Fast featureful friendly wifi terminal UI."
arch=('x86_64' 'aarch64')
url="https://github.com/shazow/wifitui"
license=('MIT')
source=("https://github.com/shazow/wifitui/releases/download/v$pkgver/wifitui_${pkgver}_linux_${CARCH}.pkg.tar.zst")
sha256sums=('d72ffa9bec17779e9d9e0c90f91b0981f226a5fd8768cbfe138a25fb')

package() {
  cd "$srcdir"
  install -Dm755 usr/bin/wifitui "$pkgdir/usr/bin/wifitui"
}
