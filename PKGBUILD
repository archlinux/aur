# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.21
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
sha256sums_aarch64=('87a4854ac7c06f6b79d539af0f5eb24644881e9b57bc4d46c188fb915ecb68f1')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('4ccd5ee8322ff97f9321349a064ddc4c2b9b59b335336d2d2aa00670af200617')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
