# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.6
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
sha256sums_aarch64=('16c8aa9d34f7ccccf28b7b0779ecafc32b02b8250131a8b1ab09ebadde5f3459')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('7b3437f7c2a61ff6aba688854c2e16f24826437ca3a2065b4b348770fac6c996')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
