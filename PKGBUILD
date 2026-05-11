# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.48
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
sha256sums_aarch64=('444179de5504ed3d68c55449e2af8ed2c92cd7d5f84ec1e8f306cac0fe49bd50')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('d06125de074af9c17be649137e2bef59b774c7668130b0086f9bd99ba67baf82')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
