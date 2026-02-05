# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=mev-boost-bin
pkgver=1.11
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

sha256sums_x86_64=('bb78fbfee36aaa73e4c6348bd0a0bb0bb25493cd6d9863eb4ed8a88b8dbcc47b')
sha256sums_aarch64=('64c39962e036fc226190889720ab0c302767d20f940a91c8f9d6e1cdbb8e3851')
b2sums_x86_64=('215c1fbb7c23554fd5ea75fc487d0e96bcc9008d9dd06a771accb9c8b9733561b38b5b7ae33b26e448b87ebbb35a622ae5d86236981b95d35b16d67fdafd6214')
b2sums_aarch64=('0a0af181023e02418ae5388dea591f6e290c612f93f5d85c01dbcb667a3eb6ea25994847afa9b1b5bdf5b8d8368c8b10f0f6b94adf061a9b66f6985e7a229fb2')

package() {
  install -Dm755 "${srcdir}/mev-boost" "${pkgdir}/usr/bin/mev-boost"
}
