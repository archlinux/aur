# Maintainer: Martin Minka <martin dot minka at gmail dot com>

pkgname=hl-log-viewer-bin
pkgver='v0.25.2'
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
sha512sums_x86_64=('8000aaac0b209074fc79d1726ff0256bf369201510e3ca41eb3ed2916df535274afadc8311ad42cfc0a34cb7944a045ab6fbe00207dd8c37b31c71d9387c1c3c')
sha512sums_aarch64=('d176061edda4c14f3b48a72f0c26f8f8a8f8bc5c16df7e96e019e56ceacec078aac1e22b5c5efed173654af250eaa8536a64033c08f94dbb00cb382204d2df00')

package() {
  install -Dm0755 "hl" "$pkgdir/usr/bin/hl"
}
