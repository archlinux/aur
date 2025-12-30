# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.213
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
sha256sums_aarch64=('9eb86f949bdc0de7421fc216ad3737e840dbdfcac768febf67643e172aef1e18')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('599b7df9c8957d919f8f937a81e487fa7c0d135f749a09a31b0d934df6be9a59')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
