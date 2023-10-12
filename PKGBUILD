# Maintainer: Martin Minka <martin dot minka at gmail dot com>

pkgname=hl-log-viewer-bin
pkgver='v0.20.0_beta.14.9'
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
sha512sums_x86_64=('02ca25818d5a8b91adca56918e525783ec8752fcfd52518b69079f838b50b2eed12b294697ebfa19a7aae1d21a7f3f3a2632813d77c29f19b110c38ed01cf857')
sha512sums_aarch64=('02ca25818d5a8b91adca56918e525783ec8752fcfd52518b69079f838b50b2eed12b294697ebfa19a7aae1d21a7f3f3a2632813d77c29f19b110c38ed01cf857')

package() {
  install -Dm0755 "hl" "$pkgdir/usr/bin/hl"
}
