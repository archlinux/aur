# Maintainer: Martin Minka <martin dot minka at gmail dot com>

pkgname=hl-log-viewer-bin
pkgver='v0.27.2'
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
sha512sums_x86_64=('452cdca49c32b53917839fefb35a8b2bf5e2d5200308f8cc23a7d0e29dba907cf5937d1791b6a90e3185b44646a34e9b57775864efb009e334970272cd5c411e')
sha512sums_aarch64=('3a60c55a9056b01ab41929401a92b3b8862fb5f00d71343998d1ba67b6232ed46a09b60bdbf9c41b9d886e11946da43b10916196624bcec78ded412d7c58bef2')

package() {
  install -Dm0755 "hl" "$pkgdir/usr/bin/hl"
}
