# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.51
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
sha256sums_aarch64=('d06753ec09d34a0978dca9f1bb9d827b001022ca4efafc751822813b643f4ff9')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('9b09b4cd20beed42c3308267f1f663f1f79c76a7e6e0e9bdfc8d05536430628e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
