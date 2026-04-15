# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.4.4
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/anomalyco/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('52787b62507a30c92e1bda804ec7ca9496896da74e9b935e307c1d402077593f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('b94384213047642ba4b39ebb8d2bbba34bddde26840edf67cae59512c0dfc3be')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
