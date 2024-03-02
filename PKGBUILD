# Maintainer: Martin Minka <martin dot minka at gmail dot com>

pkgname=hl-log-viewer-bin
pkgver='v0.26.0'
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
sha512sums_x86_64=('485784b64220998f6d256521157c2aba71f9d6c5671dd67f19798ae7769ae8c4980b516797a6354c3407d9b80e29cdcd742577682c03274ca6c2c0c492e3b403')
sha512sums_aarch64=('26d17c547cfa80f77151afd877f29a654bc30c1b88329a0d8cf527fd484892cc5a969ea857700b803bbf7a1e64629bcadd226897bab3a52f7339dec6d18f47b7')

package() {
  install -Dm0755 "hl" "$pkgdir/usr/bin/hl"
}
