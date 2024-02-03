# Maintainer: Martin Minka <martin dot minka at gmail dot com>

pkgname=hl-log-viewer-bin
pkgver='v0.25.1'
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
sha512sums_x86_64=('c83c00ef531d0661c885c66462feb1f9f64cc408819d4d1e96548b49d00909daf642da43a6f1fecf421b4b13a67cc4c821209c1370ba3b3b891339af56836af0')
sha512sums_aarch64=('58f4a63a1830b75f3215e2aa053d4a71a7b14b43986a90421ec40d6568d268dcfcd029ff2f6545b63852614549dae67c73e30c170b4972ff18c19b5088f81d72')

package() {
  install -Dm0755 "hl" "$pkgdir/usr/bin/hl"
}
