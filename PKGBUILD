# Maintainer: Martin Minka <martin dot minka at gmail dot com>

pkgname=hl-log-viewer-bin
pkgver='v0.20.0_beta.14.7.1'
pkgrel=1
pkgdesc='Log viewer which translates JSON logs into pretty human-readable representation'
url='https://github.com/pamburus/hl'
conflicts=('hl-log-viewer')
depends=()
makedepends=()
arch=('x86_64' 'aarch64')
license=('MIT')

source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/pamburus/hl/releases/download/${pkgver//_/-}/hl-linux-x86_64-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/pamburus/hl/releases/download/${pkgver//_/-}/hl-linux-arm64-gnu.tar.gz")
sha512sums_x86_64=('ff7194ebfe57466945ad48dfb1b339eb388bdacfdb3c8532ba2992f3c2f29908be79f9b7c133bdce06b5a5575a68ca2afd034b261a07c92c8d0c8dc457df9a78')
sha512sums_aarch64=('b318e6ed0cd11d71e1cdb1c16bd10702226e8ceb513fe182b6e44f6f33c29cc5ba272e91bb02d26156edf0d70567e4d4ea88f4b4c062b078821bf6c84a5be371')

package() {
  install -Dm0755 "hl" "$pkgdir/usr/bin/hl"
}
