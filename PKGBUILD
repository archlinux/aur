# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.50
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
sha256sums_aarch64=('565c56ec17e1f723f94d60d188fb26676786b15fef7b22bb953618c404b38727')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('a76f02bba43447be50bde62ef14a1b6b3add6738cde428fb7b9a7bf5606bc435')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
