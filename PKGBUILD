# Maintainer: kewl fft <kewl@archlinux.org>

pkgname=nimbus-beacon-node-bin
pkgver=25.5.0
pkgrel=1
_commit=d2f23389
pkgdesc="Nimbus Beacon Node (Ethereum consensus client)"
arch=('x86_64')
url="https://github.com/status-im/nimbus-eth2"
license=('Apache')
depends=()
source=("https://github.com/status-im/nimbus-eth2/releases/download/v${pkgver}/nimbus-eth2_Linux_amd64_${pkgver}_${_commit}.tar.gz")
sha256sums=('73a98cf93cd3356d7d66ab079678cb0b582a50d28799e144a9c441143abb111b')

package() {
  install -Dm755 "${srcdir}/nimbus-eth2_Linux_amd64_${pkgver}_${_commit}/build/nimbus_beacon_node" "${pkgdir}/usr/bin/nimbus_beacon_node"
}
