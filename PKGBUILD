# Maintainer: Jett Scythe
pkgname=wifitui-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Fast featureful friendly wifi terminal UI."
arch=('x86_64')
url="https://github.com/shazow/wifitui"
license=('MIT')
source=("https://github.com/shazow/wifitui/releases/download/v${pkgver}/wifitui-${pkgver}-linux-${CARCH}.pkg.tar.zst")
sha256sums=('8639b7f7135b38a4c3c5738d442213fd7bf8a8cc66ecf712364ef30689cfaa72')

package() {
  cd "$srcdir"
  install -Dm755 usr/bin/wifitui "$pkgdir/usr/bin/wifitui"
}
