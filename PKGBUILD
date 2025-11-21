# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.89
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
sha256sums_aarch64=('360729005d3b428d1cabc705d4c60fdb843dfff12f63227b3e5fb45852847076')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('ec764b118300c3812d2a63feba65734702fb50ef1ba5d7c2b9c4b51c9adc88ff')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
