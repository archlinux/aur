# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=mev-boost-bin
pkgver=1.10.1
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

sha256sums_x86_64=('dc125c1deb3ffe640d5491aac95944c956be041975f6e8af700073ab8e569ef8')
sha256sums_aarch64=('04c9f400ffbdfbd617fa0fe88d7e3dfa4a6307ad0bc14799a65236154ca734f7')
b2sums_x86_64=('65d09521113868ffcb0256e6a68c0a8debfd9fb00e1b35e442fcef06a842e3ae6ef38f192e200ada506073805145060147503fe139e698b07802859ec7d45ea6')
b2sums_aarch64=('0c303e94d17afabf2addc30f340f3130176e825c51b1244a54226c8860dd0415f9a3883bda5a8f0e9d6fd50fa9ea9a9ed4f4834730a516ef96180ffc1bd88b62')

package() {
  install -Dm755 "${srcdir}/mev-boost" "${pkgdir}/usr/bin/mev-boost"
}
