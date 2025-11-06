# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.32
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

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('11d3e57f3aa4af1da2832837b68d8ecc2bdac81eae46ccda7f0647e9e968e740')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('2abca837b2d538f79f9fbce06ed8775b9949f35f0d92c6b6c93e9f95e4acd1ee')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
