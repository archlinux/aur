# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.54
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
sha256sums_aarch64=('1a993f67d7e02993a52392835d7b8e30953803109232c9b09067e3c5af59a96b')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('7917b3faad46b0dd8164ec9ad10358bb79be2fa6395904e15ac580e52a76782f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
