# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.7
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
sha256sums_aarch64=('32d048c3496decc61d3496d74beb272bc73f520ff29e4ed35898c490f1ae66da')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('7e8fc357e032873a9c98547830b56c1936b2a106cfb8b8bdcf07917b6e242d69')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
