# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.61
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
sha256sums_aarch64=('6b4dad4c893dcbc62583c9a5eaf28ecb814942eaab7033c1fa4c08c5df796b7f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('dc5efd3b95243b9831d62a6f7cc0d6fe8c6416107cb2e640e8558ba866b9a193')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
