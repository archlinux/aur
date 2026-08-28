# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.24
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
sha256sums_aarch64=('36da48300e502a562ff0d1f2621f9225a5c547955f0fddb411ec8585594b1d1c')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('573e48cd095670bf87dd834442077800b4bc979d0ad7d8b19802ec2b73e90c54')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
