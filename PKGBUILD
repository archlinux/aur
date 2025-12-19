# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.170
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('01d07546da85fcb49ceeef0b0abf68b09b5c56f4bff2868c15797bbcd16c1b0e')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('0e5879a5cba9daddc924e6a7b9c755b08358378fb93d3043cf9b43d01127f1dd')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
