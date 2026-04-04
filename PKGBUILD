# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.3.14
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
sha256sums_aarch64=('b23a6c1b6616c48d8e69f9bd080cc4447e8c77d59a747a5207b10098f0e1fb8c')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('50c2c5200035d1b2095987bef2edb85e6a98c67e8b14ca3f2c34cd98755c0016')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
