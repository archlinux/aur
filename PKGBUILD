# Maintainer: Martin Minka <martin dot minka at gmail dot com>

pkgname=hl-log-viewer-bin
pkgver='v0.29.9'
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
sha512sums_x86_64=('c6e60f40233ee3fe5057e45bfe254568dbb6b14bea6bbff62efdab7d35aa686c48b09c87752e3ffab85ea06defd70047248db0a22732c76f59c9a4b841d9a04e')
sha512sums_aarch64=('0954f8a6413da306a254d4aaaab75cc5aad64cceeec8b3d7e2591e22fc108c2a2475ae7bf4bfdbc2507ec34c70a5af0b545b8176a89bc5f188cb1e9f1aaeca14')

package() {
  install -Dm0755 "hl" "$pkgdir/usr/bin/hl"
}
