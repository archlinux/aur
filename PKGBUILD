# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.39
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
sha256sums_aarch64=('f66fffbf512671bf3b921d628880e8b101d22924a55bab0da4b374c7d7b4f3b6')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('f34bda4a81a7e0fe29f63209d3d9a1242899a2269181e2c8e11106558651b878')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
