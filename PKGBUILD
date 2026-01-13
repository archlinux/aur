# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.18
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
sha256sums_aarch64=('70c42be0f52fd7306d94e62ab7a93f9210cb3571f5c522e17527cce944114b8b')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('bc2943fd5cc746ff1123c0a5f41094a98631850425e15b5228b8d14e3d184a53')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
