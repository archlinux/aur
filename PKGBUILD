# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.1
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
sha256sums_aarch64=('ba0a33ba77fbde8649b55208f6255cedd9797416d638ba4418fa83c879fc5d08')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('c382005c97e4470596326675b5d6ba5bb9565c618666e9ee44026c163361c7bd')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
