# Maintainer: kewl fft <kewl@archlinux.org>

pkgname=nimbus-beacon-node-bin
pkgver=25.7.0
pkgrel=1
_commit=94fb8124
pkgdesc="Nimbus Beacon Node (Ethereum consensus client)"
arch=('x86_64')
url="https://github.com/status-im/nimbus-eth2"
license=('Apache')
depends=()
source=("https://github.com/status-im/nimbus-eth2/releases/download/v${pkgver}/nimbus-eth2_Linux_amd64_${pkgver}_${_commit}.tar.gz")
sha256sums=('89b9060e2f6be11f8fcdc21b1f5dd8e7d01e848b874e7563fa1cc9e2814ce9b1')

package() {
  install -Dm755 "${srcdir}/nimbus-eth2_Linux_amd64_${pkgver}_${_commit}/build/nimbus_beacon_node" "${pkgdir}/usr/bin/nimbus_beacon_node"
}
