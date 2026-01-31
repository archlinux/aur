# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.48
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
sha256sums_aarch64=('f4c17d49b3dbeca04b9e8eb780259cb12e6a0befe9b8a699816ae00a52161eb5')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('7524880c32215434e08fc2ea1a5acabe3491745c8a8752236830d07fc81e80bc')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
