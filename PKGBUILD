# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.19
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
sha256sums_aarch64=('506f98a1f618551f1f6fc5dcf591f824bef9d6819d40b27928ad7febcb7c363b')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('7bb35487c55f9957f5d91ae60be6fa49fc8f74629c210c1719ed75fdbf7e2bd9')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
