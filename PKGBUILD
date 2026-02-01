# Maintainer: kewl fft <kewl@archlinux.org>

pkgname=nimbus-beacon-node-bin
pkgver=26.1.0
pkgrel=1
_commit=ad142111
pkgdesc="Nimbus Beacon Node (Ethereum consensus client)"
arch=('x86_64')
url="https://github.com/status-im/nimbus-eth2"
license=('Apache')
depends=()
source=("https://github.com/status-im/nimbus-eth2/releases/download/v${pkgver}/nimbus-eth2_Linux_amd64_${pkgver}_${_commit}.tar.gz")
sha256sums=('1f4a376d937622a3a697112b3ec8282cd8d747dc60dc44a20e7eb44b73bd426e')

package() {
  install -Dm755 "${srcdir}/nimbus-eth2_Linux_amd64_${pkgver}_${_commit}/build/nimbus_beacon_node" "${pkgdir}/usr/bin/nimbus_beacon_node"
}
