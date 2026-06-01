# Maintainer: Xuepoo <xuepoo@users.noreply.github.com>
pkgname=waywarp
pkgver=0.1.0
pkgrel=1
pkgdesc="A high-performance keyboard-driven mouse control tool for Wayland compositors"
arch=('x86_64')
url="https://github.com/Xuepoo/waywarp"
license=('MIT')
depends=('gcc-libs')
source=("${url}/releases/download/v${pkgver}/waywarp-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 "waywarp" "${pkgdir}/usr/bin/waywarp"
}
