# Maintainer: Martin Minka <martin dot minka at gmail dot com>

pkgname=hl-log-viewer-bin
pkgver='v0.30.3'
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
sha512sums_x86_64=('3931349f629b586cce9f6c7dadc148a4f7bdf550245da583a46506c5e9a5ba0d089d3ef63be339d5d17f74f8b51ee1a8618f86cb7c401196cc273654fa0207a7')
sha512sums_aarch64=('034bf3e2c081aaedd96d8e8fc60850df36cb8b796fe234142bcc646ea4bce02adeffd4a77d23f1f005265d70ed1e1bc79a23e486c29682ff53cabe866c880c29')

package() {
  install -Dm0755 "hl" "$pkgdir/usr/bin/hl"
}
