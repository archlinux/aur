# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.168
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
sha256sums_aarch64=('ba86fce0ce49ef1344f3aca1ee9746e88047e7a00b57102fe14b65e69bde3385')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('e752c6db2a048cd884d90b5aa25096389a56c21ca424f3ff809ef4c91ce10799')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
