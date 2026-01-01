# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.222
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
sha256sums_aarch64=('18c787a618b77049cb914de66305ab6be5c3f98e40e309eb100bfcc5f9aae3c0')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('7aed32c1c983cf023c0831eb0ee6c8d8fdee7c4d07e05344a13af29da38b320b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
