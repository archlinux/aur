# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.19
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
sha256sums_aarch64=('6eb0749227d199595cb30eac6b63a64af9d404493f03dd0022f42bfeb875dca4')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('208a21ee4f86d604c4666aa4ae4b4a566214f540767817a53d37dc1f9c67a3a4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
