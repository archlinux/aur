# Maintainer: Jett Scythe
pkgname=wifitui-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Fast featureful friendly wifi terminal UI."
arch=('x86_64')
url="https://github.com/shazow/wifitui"
license=('MIT')
source=("https://github.com/shazow/wifitui/releases/download/v${pkgver}/wifitui-${pkgver}-linux-${CARCH}.pkg.tar.zst")
sha256sums=('c21b0232917f463806565a7446048f049c19fa037fcb40314a8d2b5f2e9c9cfe')

package() {
  cd "$srcdir"
  install -Dm755 usr/bin/wifitui "$pkgdir/usr/bin/wifitui"
}
