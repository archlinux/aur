# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.2
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
sha256sums_aarch64=('e9cb0cc8b1ef954b45ee9f2a5d04002582633a0b3a90a68cc63652d766e32095')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('77f7893e5a0ab38d419e9206a36d9f645928645dbde387f4f3514df908def307')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
