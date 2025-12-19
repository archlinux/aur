# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.169
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
sha256sums_aarch64=('fa502b80561f791923dc4394892d43553bd20c2f3cc88f8e4f1734c4c4f4e79b')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('3ddeb9a21d3c73112cb6bed5a712c408a70183945beb5aa1d92d7a324fe973bf')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
