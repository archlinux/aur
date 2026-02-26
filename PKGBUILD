# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.15
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
sha256sums_aarch64=('dd4ca5764a093f92d8515833d5c58eabc657e72cdc3ef2ba3ac11e0db749b80d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('78b01946464e935c9b79261eda4a48f406621b0787a358fe607b6c71305f320e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
