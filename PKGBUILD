# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.15.0
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/anomalyco/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('6ec553a7803783dfc824080d03aaab20dfad701f9ae7e8c8ab250e6215dd4539')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('daa8b8b59d96cf3b0ce72285c1c3b39e06e996331ba7f162a2991cfbfe2116b4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
