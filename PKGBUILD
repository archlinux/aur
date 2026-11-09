# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Rime input method init and update tool with Wanxiang, Ice, Frost, and Mint support"
arch=('x86_64' 'aarch64')
url="https://github.com/ca-x/snout"
license=('MIT')
depends=()
provides=('snout')
conflicts=('snout')
source_x86_64=("snout-${pkgver}-linux-x86_64::${url}/releases/download/v${pkgver}/snout-v${pkgver}-linux-x86_64")
source_aarch64=("snout-${pkgver}-linux-aarch64::${url}/releases/download/v${pkgver}/snout-v${pkgver}-linux-aarch64")
sha256sums_x86_64=('8cd1ccbf1bd747d6631f136fb61c03bee8335047b4b5ae62d6524560f1211fa9')
sha256sums_aarch64=('f65dcfb9947e170dd40b2b0b9520c897f904896d699bdc2c1289dd41e8a802ed')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
