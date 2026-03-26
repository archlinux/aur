# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.3.3
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
sha256sums_aarch64=('a1c571fc9041e1f1db174ac5eec4ff078f1cbab93927d85eda982f1bc93934a4')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('92bb36b16ed1dfb08697fd2b7d8f7d09fdfcbacd5e5bf6a67f4d157a7f533b13')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
