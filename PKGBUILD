# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.32
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
sha256sums_aarch64=('2129e45224321a97e8d07ccc5ba692c39c4711b1890ac2c2111bd59d8f7ba366')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('8adbda38d2fc21aba23657350a99e4a22ecf0de8390a0f0db419ca83b66ca72f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
