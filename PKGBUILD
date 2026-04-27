# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.27
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
sha256sums_aarch64=('082b35aa7479dda28dc63e3aaa68ad2dfeac69e98d16e922eb99bf06bd3b0c11')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('3943dcda70c53bf1efffddb5dd1da78ce0b9eae6ab2f5a16cd14bd8c873f385c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
