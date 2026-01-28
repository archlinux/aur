# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.40
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
sha256sums_aarch64=('a5f6478bbfcb96257e195e290b36c6a75ffbc258948afee5ab9e1594d7c78573')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('13f6c35fc5c0d3243e2d29beaf52c566645cfdea2c7d82267aba898230697cac')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
