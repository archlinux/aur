# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.149
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
sha256sums_aarch64=('0bd434dab0fc45127b48d398a25fe533921380868ba5e7e2e893ac5fa8289649')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('4640598a85fe34b2370c7cc90e7f334b896352715b4fd68f5274779620602f0a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
