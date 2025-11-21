# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.85
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

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('5e65a4c2f526873e228996c3e9190e65e45e29432c489dcbfe1de3dec180ffb0')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('f893a1b845a3d1b45c190a1998f2af5b691cf780bd31ece56c5f39fa8990264c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
