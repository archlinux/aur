# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=mev-boost-bin
pkgver=1.7
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

sha256sums_x86_64=('92b435d200451e190000c4f8d82eef0b3ce72d2759153357883e81261ffe98e3')
sha256sums_aarch64=('f9a7c07103628fc1cc5483315dddb1071a0daaed0128b97f0caf206439bc4df8')
b2sums_x86_64=('aabd85e76a1871552c5a0a19b247b8091e792005c847deded9b1d289302bb2e8921cccd4c0f29b9284223cd7bcf63bbba64205b9c6069f29dfc36a5092830df4')
b2sums_aarch64=('2bd65045b924b9f460b920d5e0664071942ff1226f633d80cbbcfe3e9034c25491535071f0a012d4634de785bc2f5deaecf19412ac6e33a5e6e1c99d663354ce')

package() {
  install -Dm755 "${srcdir}/mev-boost" "${pkgdir}/usr/bin/mev-boost"
}
