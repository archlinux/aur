# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.0
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
sha256sums_aarch64=('1b023e6d3422032c83b5393eabe43aaca73703095fd273e643f5c3011b98d20e')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('a46af88b710248cc55719abd7f8fb482030494d6c9ed63f37aae7c6d6af4fc90')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
