# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.211
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
sha256sums_aarch64=('5b915350b342d0fddbe35499c8f9de00f8bb4b5b155759d48ee0ee30e3f612e7')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('de379197bde3612eacb445eeee16e3c0d64ed10af831abeb6eaa7b11a3e42a51')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
