# Maintainer: Jett Scythe
pkgname=wifitui-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Fast featureful friendly wifi terminal UI."
arch=('x86_64')
url="https://github.com/shazow/wifitui"
license=('MIT')
source=("https://github.com/shazow/wifitui/releases/download/v${pkgver}/wifitui_${pkgver}_linux_${CARCH}.pkg.tar.zst")
sha256sums=('22a09e6e6d875e906737a80db49acc9fac1301b3da8d065fc1aa44b72ef6ef74')

package() {
  cd "$srcdir"
  install -Dm755 usr/bin/wifitui "$pkgdir/usr/bin/wifitui"
}
