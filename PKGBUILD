# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.59
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
sha256sums_aarch64=('2a03bd93c488105912f9faf64624b1b311453ca647a694649e48a7f723d3f3cf')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('65234b1328824906d0f27c53df2ba08e348083df3db036cc104cceb419bd7443')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
