# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.167
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
sha256sums_aarch64=('a8c4c4ff53a151d390025e0eb87df674802e59dd5bd2409af0b5909f2a8b5acf')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('23f5421d40929cad1e3cfb5bd1bf6379a7f5394a4860ab933d83b0355441f627')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
