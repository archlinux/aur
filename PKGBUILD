# Maintainer: Jett Scythe
pkgname=wifitui-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Fast featureful friendly wifi terminal UI."
arch=('x86_64')
url="https://github.com/shazow/wifitui"
license=('MIT')
source=("https://github.com/shazow/wifitui/releases/download/v${pkgver}/wifitui-${pkgver}-linux-${CARCH}.pkg.tar.zst")
sha256sums=('48d84a61f0897692e20ec3aafe456cedaefe39ed110387afda2855a6acb1311d')

package() {
  cd "$srcdir"
  install -Dm755 usr/bin/wifitui "$pkgdir/usr/bin/wifitui"
}
