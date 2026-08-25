# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.23
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
sha256sums_aarch64=('86d3afaf4e8784f9adab189be2a315c12b27ec40a04b70defbe70595c3cc7c65')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('ab7015cd8113e011a461f30a0c2b77d8299a144ff688cb62e93e8802835d7288')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
