# Maintainer: Martin Minka <martin dot minka at gmail dot com>

pkgname=hl-log-viewer-bin
pkgver='v0.29.3'
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
sha512sums_x86_64=('b3f8d3c40716f89d6bed5136a3cf52df1cc6a9a98cf77ae747d3301ea87953c1af81e50da5a601618bef6b7d47c5ef011eda5d4a0cda4274d1eb087c54146cfd')
sha512sums_aarch64=('0b39d77e935e242c4e33462b5630ea1be87110459bedd316961909df5a32f7ad16b44059b159fc56a28355ab89ba7856b48f205a6fb7f8f8e8aa60e26c3c9872')

package() {
  install -Dm0755 "hl" "$pkgdir/usr/bin/hl"
}
