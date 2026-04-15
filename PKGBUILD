# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.4.6
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
sha256sums_aarch64=('4cbab9cf91280b9443daa27e54bcb8a030ef579857ef2cdd3a8e6521422c3d0d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('8ebadcc751be642208257d3de4e4574199ab66e8ebe3f9983e63d784896afc26')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
