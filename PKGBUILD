# Maintainer: kewl fft <kewl@archlinux.org>

pkgname=nimbus-beacon-node-bin
pkgver=25.12.0
pkgrel=1
_commit=ce4689f7
pkgdesc="Nimbus Beacon Node (Ethereum consensus client)"
arch=('x86_64')
url="https://github.com/status-im/nimbus-eth2"
license=('Apache')
depends=()
source=("https://github.com/status-im/nimbus-eth2/releases/download/v${pkgver}/nimbus-eth2_Linux_amd64_${pkgver}_${_commit}.tar.gz")
sha256sums=('9942b9c77b1ba134c16fe450d979b3fa2315d0c6ce74138ad8e751bf55b2e072')

package() {
  install -Dm755 "${srcdir}/nimbus-eth2_Linux_amd64_${pkgver}_${_commit}/build/nimbus_beacon_node" "${pkgdir}/usr/bin/nimbus_beacon_node"
}
