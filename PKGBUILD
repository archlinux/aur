# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.52
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
sha256sums_aarch64=('2468df04dc7725caaab34f3fc794d934c2849830c0a9bb66d200f79009c5254d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('d2f402cf19dd6b0d3248fbc848609345075fbf4956c9b75e5957a930d20aefb8')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
