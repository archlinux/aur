# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=mev-boost-bin
pkgver=1.12
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

sha256sums_x86_64=('51e24be111c230526f39f4f278fe1b2319a7d81de36fcc3f4a441cd81b8687eb')
sha256sums_aarch64=('78afdb4ba507595b933ec5925f2b565a6f456216c5e8f1f08e40dbe0420fb4c4')
b2sums_x86_64=('850c507eed5a16b206230e2aed2c2fd5885335d82c8400d151bf8abc01d0dfb7eb78506346a301a08b6be9d30b7667401849c35c6cd67189285ce25ba1eb7bc1')
b2sums_aarch64=('9678f9f718ced4c9819c1969bfac45e328008056d9cd0c51b738801e447673e07d2f93c48569e025a579907417444a020596063fb8e42cb2fe4ee1a0d0093317')

package() {
  install -Dm755 "${srcdir}/mev-boost" "${pkgdir}/usr/bin/mev-boost"
}
