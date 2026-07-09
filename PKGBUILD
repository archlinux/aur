# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.18
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
sha256sums_aarch64=('db9b53eae485da969a0a855bca465f9901dd84676384f724f320e3ccc5a9b107')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('e149d32ee5667c0cd5fb84d0bf8393b312e93782eeb4d74d29bbb0392de7133c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
