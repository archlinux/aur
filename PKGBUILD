# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.27
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
sha256sums_aarch64=('bcd91a3ebe9480ffb1702e5c71168d451150421acc99c6d1abf5edc5e2cb39f5')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('6fe3820b145857f7ff507d2826058b7acf1fce8258def1498468dd43809e69e8')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
