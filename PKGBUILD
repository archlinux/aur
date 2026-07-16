# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.3
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
sha256sums_aarch64=('da0a631174eba380b2a1d51f9d364fa3812da433e72743c72471d4b5da59c69d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('60f27b2679f00a511b6539f97e02448afaf58d9c66e2448285ea0c517ca84583')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
