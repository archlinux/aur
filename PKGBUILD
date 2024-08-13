# Maintainer: Martin Minka <martin dot minka at gmail dot com>

pkgname=hl-log-viewer-bin
pkgver='v0.29.8'
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
sha512sums_x86_64=('47865f2d9bfe1e09febae216cf1daaaad69f6d287d3d0bd54650d0387df7352bc5cf836e0c1b2dd1c8d47c36b75c8f7b99fd58f19a3b892ce3378a92cf9908ba')
sha512sums_aarch64=('642473d0177f25b3314c249d104386f3c9425cf51e8c5e30d90afb92a1c219a548e8c254376ad2ead0992c9fe048b2f965cc22565ef4ffb2853f319928f3bc94')

package() {
  install -Dm0755 "hl" "$pkgdir/usr/bin/hl"
}
