# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.2.0
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
sha256sums_x86_64=('d04c443c6f30fc5fb8d1ad10caf32ca25e4be48bd110ffdee2de497b161e3f5f')
sha256sums_aarch64=('5f083992087c7841f29174b744866b09dbe33e2b5805678e3b66f332181508b7')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
