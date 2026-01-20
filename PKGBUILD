# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.28
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
sha256sums_aarch64=('de7d70bcf54dd542664e1b965303d2915b0db22db5810a40fc4a08496fca31fb')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('8c707150eb656384ac331f722f8f9fc7de9317db28c72b5a4de0c1243fb0356c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
