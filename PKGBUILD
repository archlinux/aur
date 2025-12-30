# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.210
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
sha256sums_aarch64=('c746a29c15fde2563b31c62f7c58c2bb16de2252e099cb374a57a2929188a31a')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('82e81db03a717c4fd54320cb7678b393fb9193715ae9955f4717e878256fc953')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
