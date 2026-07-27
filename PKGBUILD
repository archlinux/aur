# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.7
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
sha256sums_aarch64=('6c791e453c2ca03ee3dea09ebd16bfdfac4837e45d344a1487cd196b80090fc7')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('cb5d9d6d2f8fbef0a9c975ed4494f73b2a62f4e4ffd508bcc3212da4fa76c3da')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
