# Maintainer: Martin Minka <martin dot minka at gmail dot com>

pkgname=hl-log-viewer-bin
pkgver='v0.26.2'
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
sha512sums_x86_64=('24e41b8704c0217b2c6bd76f209caee34991b11cdbd4df64ddb42b3641f91c300d702b5fcc48db45afaf9b8f7a9ba46bf01a4aedd0088dba934e88b329384734')
sha512sums_aarch64=('def1ccff778ec289881aaa1404054a01f59467f77d4672d8fd82d4103a4e4a66ebb3734e3b1a5bfd0c0ec25a6594e0a27b37fba4fa6b16f055fe7a6768716f62')

package() {
  install -Dm0755 "hl" "$pkgdir/usr/bin/hl"
}
