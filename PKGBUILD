# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.40
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
sha256sums_aarch64=('2a6d0853e2c66ab913386f4598b5251e629070a098e08c8582ec4f55636b2542')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('d5314507b964bc98b52c8117a0b9d2cb0190eae04fb334bf5448762a5042968d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
