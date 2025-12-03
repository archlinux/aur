# Maintainer: kewl fft <kewl@archlinux.org>

pkgname=nimbus-beacon-node-bin
pkgver=25.11.1
pkgrel=1
_commit=2053090b
pkgdesc="Nimbus Beacon Node (Ethereum consensus client)"
arch=('x86_64')
url="https://github.com/status-im/nimbus-eth2"
license=('Apache')
depends=()
source=("https://github.com/status-im/nimbus-eth2/releases/download/v${pkgver}/nimbus-eth2_Linux_amd64_${pkgver}_${_commit}.tar.gz")
sha256sums=('30601a935705f6ccae47d1ab09b53b126ef0ab5c62bffcf42502f8d6706041ac')

package() {
  install -Dm755 "${srcdir}/nimbus-eth2_Linux_amd64_${pkgver}_${_commit}/build/nimbus_beacon_node" "${pkgdir}/usr/bin/nimbus_beacon_node"
}
