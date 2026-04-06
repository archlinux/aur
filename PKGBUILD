# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.3.16
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
sha256sums_aarch64=('c0f9f8a87a2c976ca28556891976f6b38c8187f53c5ad910d8a9a4d2663c717e')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('01ffc5ff20ff087e3b8171ac9fb230c884591bc9dfebe8339cb965204d9eb00d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
