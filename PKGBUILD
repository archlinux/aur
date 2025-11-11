# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=mev-boost-bin
pkgver=1.10.0
pkgrel=1
pkgdesc="MEV-Boost allows Ethereum validators to source high-MEV blocks from a competitive builder marketplace. Binary distribution."
arch=('x86_64' 'aarch64')
url="https://vega.xyz"
license=('MIT')
depends=()
provides=('mev-boost')
conflicts=('mev-boost')

source_x86_64=(
  "https://github.com/flashbots/mev-boost/releases/download/v${pkgver}/mev-boost_${pkgver}_linux_amd64.tar.gz"
)

source_aarch64=(
  "https://github.com/flashbots/mev-boost/releases/download/v${pkgver}/mev-boost_${pkgver}_linux_arm64.tar.gz"
)

sha256sums_x86_64=('63ada9b5f41cad01973c6e2a732d6e3a3fe1bffa0d3d61b173a1f46ca9567976')
sha256sums_aarch64=('619c32f28a4e065e5a0dcb1001e8891a38eeed52a34931fca7fcf825d78efdbf')
b2sums_x86_64=('775e42615b533e2f6f2f2cd4aaa728119b2950d02c9ad0660d16c19c29ed75b551af832d3f29a416c2968cd6690d62303f7af5c2c9f8834e6db0832662028162')
b2sums_aarch64=('1b2775a6e3b964f0ec6ca4ce52f676190898c73655413b088c4e50cc24bcf5169356ff8cbe8283987b40ce05c70c54a528a4e0f98217cbff333bce0642d83df0')

package() {
  install -Dm755 "${srcdir}/mev-boost" "${pkgdir}/usr/bin/mev-boost"
}
