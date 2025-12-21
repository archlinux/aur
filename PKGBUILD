# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.183
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
sha256sums_aarch64=('e363a8c84f4e6c6279c3ea9ce28ceac8e23c977149a21c8344c5a63149bad287')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('423263996876b5d3dea17071e58503f0f5d5c7c1fe3b1e71ea002ddbe2843dad')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
