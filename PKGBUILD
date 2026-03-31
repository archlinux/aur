# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.3.10
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
sha256sums_aarch64=('2d9a3390e978a01306a9b0b66a5e0f2024412405b1920228ba88016fa9320f28')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('ba53196de632142a86b1df77a0777fae313620ac8fe54d11c83c310d4aeeca74')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
