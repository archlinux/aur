# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.4.0
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
sha256sums_aarch64=('2f5728ed47d8147da9163e4c10a83914131bf849bfc0f17590ab6d58b7d03ba3')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('5117eb08aa542d49b0149ba837d01c7ebc1d79ba332e8518859edc33c4eff2cf')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
