# Maintainer: Jett Scythe
pkgname=wifitui-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Fast featureful friendly wifi terminal UI."
arch=('x86_64')
url="https://github.com/shazow/wifitui"
license=('MIT')
source=("https://github.com/shazow/wifitui/releases/download/v${pkgver}/wifitui-${pkgver}-linux-${CARCH}.pkg.tar.zst")
sha256sums=('e5a0146f31d5f0886e9a6c1cdd6ef546a48837a396ac5a05306ec800295ed379')

package() {
  cd "$srcdir"
  install -Dm755 usr/bin/wifitui "$pkgdir/usr/bin/wifitui"
}
