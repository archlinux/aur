# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.43
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
sha256sums_aarch64=('28d0f8914be7302502e0d8582ef55c0cb4dc293180730921ea1a291d82ae143f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('81f751779760fa5813ace8933cc2407cd777d084fe31c6e22695f5d4300e8388')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
