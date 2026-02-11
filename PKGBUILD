# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.57
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
sha256sums_aarch64=('00da233f4345b89460ef7735ec4c3524b16c97854a11af7ca2020a70600e4e52')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('d55adda21c012227471c23f291f7900939b4691dd1b46982f5f83619c850b1cd')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
