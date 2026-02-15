# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.3
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
sha256sums_aarch64=('30534fe23e61d91877cea19878726d67fec32f17f65e79142c0b85c7e7d98614')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('526b97436ae93a28001b9a63f9ce7bf69d4c492ef59dd0a8ae8447ec3e79cfe6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
