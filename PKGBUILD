# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.3.8
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
sha256sums_aarch64=('3e0f9473bbc4be0f4e2584a7e255b786a3d475d10c6988d20344de12b4aee026')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('f61600033c2f5a1b89416aa17d36ec630d94aa6abe11a234dbeb6df6c052cb99')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
