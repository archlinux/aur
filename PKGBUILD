# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.137
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('842c3150002c9d3629a42067a8947ab8077aa4c282b7607c5e19a3923862d77f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('5cc00a29c6c4625dcf278240165660d5de8e73cc2d6b0c36d9d0e6f471069cbe')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
