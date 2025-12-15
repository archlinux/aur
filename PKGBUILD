# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.154
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('a29b5bd42c3e114b7e8a0d139298f04b9ad27d3074dca0817032e39e708c65cd')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('dd132abb92f216f9cadf57618a2aaf1f14364d39d51248311b47c3fc12201fc3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
