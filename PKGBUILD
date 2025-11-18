# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.71
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
sha256sums_aarch64=('84dc2ffdf84aeb501d574d0191825ea8008fe1a08a647ee6af51f8239cb328b3')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('4be5ca4c9fde4d3f52b46cc51fc9b2d8a8dfdfc7b062f1a64e72e4bc1414c698')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
