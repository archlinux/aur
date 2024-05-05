# Maintainer: Martin Minka <martin dot minka at gmail dot com>

pkgname=hl-log-viewer-bin
pkgver='v0.29.1'
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
sha512sums_x86_64=('65f2b3769c05f1341fc61768ac058f9f4d4c76b2835dabb86d2e2919a735ef8e93787804f66ca4f1f6f37d5d2a95d8d2a00fde27fc1e2ab5c9792fc5774fdd58')
sha512sums_aarch64=('02c0e85e38c343f50923f91ab523c93bd3f45f8eb9d4d5cf4d2d87a2a6df5f5c4279686bf5ed010aa1c19534c7fb072d17b9d9efda12ba9415bb72c89e12c6da')

package() {
  install -Dm0755 "hl" "$pkgdir/usr/bin/hl"
}
