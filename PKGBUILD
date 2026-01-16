# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.24
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
sha256sums_aarch64=('909e20c0ba7a5862a2d2e84f7f9b5d886ac5b4a0e0dbd13565856e4362d3e6e2')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('0a30dc3cf849b3fc307fca198a47cf977c3abb67890d3be883fb7f38b6f477ce')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
