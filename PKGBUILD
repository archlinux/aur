# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.124
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('44015b7d3ad26c429ee0b22bae2d3868515369bf7cc83f88c42c0ad4b0879f84')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('012723a8431a6819cdb8bb0d33c667b00dc8ee65e4723b551c1c6b430bc3c3e7')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
