# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=mev-boost-bin
pkgver=1.9
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

sha256sums_x86_64=('2056f87e1b0f100c8d6ef9c85abe0e2d5dfb520cb1819237861b0cfa4394736f')
sha256sums_aarch64=('384acb7c84770f05d6dd93ba69c8fa7c8e054f1360f09a35195f7e1871adec29')
b2sums_x86_64=('e5ea40ece369b7a138fcc7e6929b65ed235a2e251d3fa1bf83ea66b0d09576f60881553c7e19fd003bd602662a408869cd7af49c8781ae43c9e4f2c3c2ee8f27')
b2sums_aarch64=('2f067df549ea6ba215a6bf2ab7cc7017b85d03f297f402e311a07e8b2255191bf34a49497cb2e876dc1f6f8e4002f5e01b573016997c8eac2e78b48bf811254d')

package() {
  install -Dm755 "${srcdir}/mev-boost" "${pkgdir}/usr/bin/mev-boost"
}
