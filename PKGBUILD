# Maintainer: Martin Minka <martin dot minka at gmail dot com>

pkgname=hl-log-viewer-bin
pkgver='v0.24.2'
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
sha512sums_x86_64=('f4c1e496289f68d80c48e4a704ec71e223f987f05cb4fbde07d8ec945141af6e4fb90030eff23502d04265386fefac8bd3746b1e59e5a3b49d9b02ca889a38d5')
sha512sums_aarch64=('63763bf24326ff2e0d1edb080e1af2c6c0386398586963cb47f1379caac3cc8d9f7433ca48ed2b5e4ec4141e6b6528efb69fe91f7be70e0477bf4d81f83b20f3')

package() {
  install -Dm0755 "hl" "$pkgdir/usr/bin/hl"
}
