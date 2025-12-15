# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.159
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
sha256sums_aarch64=('025a8b01b7169cdb19acb145651e1f7aac87ede26c638ffc5101a185c8b5121c')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('0287fd8937df1926b5113d5b5fc8d3c312beb323d7ba5404a4042cd329bf3581')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
