# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.4.3
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
sha256sums_aarch64=('4cbf32f4c31da7dae14712b65aadbce6acfa1a7a85bee986a2ce4eaaed4eb5c8')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('34d503ebb029853293be6fd4d441bbb2dbb03919bfa4525e88b1ca55d68f3e17')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
