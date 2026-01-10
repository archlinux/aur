# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.12
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
sha256sums_aarch64=('6ce5cbd4d3d2f98bbacb54aa7fd243ffab249311e2ac4d41ff3e9163039bba15')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('7a216e05b4f51abcf5501ac67e0db6cf601d0af13feb8e35bcb5430fa2fd0e01')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
