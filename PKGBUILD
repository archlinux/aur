# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.28
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
sha256sums_aarch64=('3c26ac279049b1343296f127c56b77e70178186d21bba003610d493ee8209f15')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('3f9a7139612d4421a46408d46eeed27bd958bdbe7f43514cd5e5a10ad1540e5b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
